//
//  HomeViewController.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/2.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeViewController.h"
#import "YXHomeTypeViewController.h"
#import "YXWebViewController.h"
#import "YXHomeDetailsViewController.h"
#import "YXStoreDetailsViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "YXCityListViewController.h"
#import "YXSearchViewController.h"
#import "YXHomeMapViewController.h"
#import "YXHomeReleaseViewController.h"
#import "YXHomeCollectionView.h"
#import "YXHomeViewModel.h"
#import "YXHomeModel.h"
@interface YXHomeViewController ()<CLLocationManagerDelegate,UISearchBarDelegate>

// 定位管理对象
@property (nonatomic, strong) CLLocationManager *manager;
// 地理编码和反编码对象
@property (nonatomic, strong) CLGeocoder *geocoder;

@property (nonatomic ,strong) UIButton *cityBtn;
@property (nonatomic ,strong) UIButton *searchBan;
@property (nonatomic ,strong) UIButton *messageBtn;

@property (nonatomic ,strong) YXHomeCollectionView *collectionView;

@property (nonatomic ,strong) YXHomeModel *homeModel;

@end

@implementation YXHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navBarUI];
    [self locationAction];
    [self requestDataHomeList];
    [self loadSubViews];
  
}
#pragma mark - 请求首页列表接口
- (void)requestDataHomeList {
    
    YXWeakSelf
    [YXHomeViewModel queryHomePageWithSuccess:^(id responseObject) {
        weakSelf.homeModel = [YXHomeModel mj_objectWithKeyValues:responseObject[@"DATA"]];
        weakSelf.collectionView.homeModel = weakSelf.homeModel;
    } failure:^(id errorCode) {
        
    }];
    
}


- (void)navBarUI {

    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:self.cityBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:self.messageBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.titleView = self.searchBan;
    
}

- (void)loadSubViews {
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0,*)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        }else{
            make.edges.equalTo(self.view);
        }
    }];
}

#pragma mark -- 定位权限
- (void)locationAction {
    
    //1.创建定位管理对象
    self.manager = [[CLLocationManager alloc] init];
    
    self.manager.delegate = self;
    
    //2.判断手机设置中的定位服务和用户授权的状态
    if ([CLLocationManager locationServicesEnabled]) {
        
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
            [self.manager requestWhenInUseAuthorization];
        }
        //开始定位,(定位服务非常耗电,越精准越耗电)
        self.manager.desiredAccuracy = kCLLocationAccuracyBest;  //最精准(状态自选)
        //设置最小更新距离, 超过一百米后就重新定位(自己设定)
        self.manager.distanceFilter = 100;
        //开启定位
        [self.manager startUpdatingLocation];
    } else {
        //跳转到设置界面
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    }
    
}

#pragma mark - CLLocationManagerDelegate的代理方法 -
// 1. 每次定位都会执行, 多次执行的方法
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    // 最新的位置总是存放在第一位
    CLLocation *location = locations.firstObject;
    
    NSLog(@"维度: %f, 经度: %f", location.coordinate.latitude, location.coordinate.longitude);
    
    // 真机方法
    [self getAddressWithLatitude:location.coordinate.latitude withLongitude:location.coordinate.longitude];
    
    // 模拟器方法
    [self getAddressWithLatitude:34.274222 withLongitude:117.210043];
    
}
// 2. 定位失败的时候会执行的方法
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    // NSLog(@"定位失败");
}
#pragma mark - 地理反编码 -
- (void)getAddressWithLatitude: (CLLocationDegrees )latitude withLongitude: (CLLocationDegrees )longitude{
    // 反编码
    // 通过经度封装一个location对象
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    
//     NSLog(@"%@", location);
    YXWeakSelf
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error || placemarks.count == 0) {
            [SVProgressHUD showErrorWithStatus:@"地址没找到，可能在月球上!"];
        }else {
            CLPlacemark *placemark = [placemarks firstObject];
            NSDictionary *dic = [placemark addressDictionary];
            NSLog(@"dic %@",dic);//根据你的需要选取所需要的地址
            [weakSelf.cityBtn setTitle:dic[@"City"] forState:(UIControlStateNormal)];
        }
        
    }];
    
    [self.manager stopUpdatingLocation];

    
}

#pragma mark - 跳转模块页面
- (void)sectionWithPushVC:(NSIndexPath *)indexPath {
    YXHomeTypeViewController *typeVC = [[YXHomeTypeViewController alloc] init];
    typeVC.hidesBottomBarWhenPushed = YES;
    if (indexPath.section == 3) {
        typeVC.typeView = Home_SnapView;
    }else if (indexPath.section == 4) {
        typeVC.typeView = Home_PiFaView;
    }else if (indexPath.section == 5) {
        typeVC.typeView = Home_LingShouView;
    }else if (indexPath.section == 6) {
        typeVC.typeView = Home_HuoYuanView;
    }else if (indexPath.section == 7) {
        typeVC.typeView = Home_QiuGouView;
    }else if (indexPath.section == 8) {
        typeVC.typeView = Home_ShopView;
    }
    [self.navigationController pushViewController:typeVC animated:YES];

    
}

- (void)itemWithPushVC:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1) {
        YXHomeTypeViewController *typeVC = [[YXHomeTypeViewController alloc] init];          typeVC.hidesBottomBarWhenPushed = YES;
        switch (indexPath.row) {
            case 0: {
                typeVC.typeView = Home_SnapView;
                [self.navigationController pushViewController:typeVC animated:YES];
            }
                break;
            case 1: {
                typeVC.typeView = Home_PiFaView;
                [self.navigationController pushViewController:typeVC animated:YES];
            }
                break;
            case 2: {
                typeVC.typeView = Home_LingShouView;
                [self.navigationController pushViewController:typeVC animated:YES];
            }
                break;
            case 3: {
                YXHomeReleaseViewController *releaseVC = [[YXHomeReleaseViewController alloc] init];
                releaseVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:releaseVC animated:YES];
            }
                break;
            case 4: {
                typeVC.typeView = Home_HuoYuanView;
                [self.navigationController pushViewController:typeVC animated:YES];
            }
                break;
            case 5: {
                typeVC.typeView = Home_QiuGouView;
                [self.navigationController pushViewController:typeVC animated:YES];
            }
                break;
            case 6: {
                typeVC.typeView = Home_ShopView;
                [self.navigationController pushViewController:typeVC animated:YES];
            }
                break;
            case 7: {
                YXHomeMapViewController *mapVC = [[YXHomeMapViewController alloc] init];
                mapVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:mapVC animated:YES];
            }
                break;
            default:
                break;
        }
    }

    
    if (indexPath.section == 4 || indexPath.section == 5) {
        YXPiFaModel *pifaModel = self.homeModel.PIFA[indexPath.row];
        YXHomeDetailsViewController *detailsVC = [[YXHomeDetailsViewController alloc] init];
        detailsVC.OperType = @"Product";
        detailsVC.ProductNo = pifaModel.PRODUCTNO;
        detailsVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:detailsVC animated:YES];
    }
    
    if (indexPath.section == 6 ) {
        YXHuoYuanModel *huoyuanModel = self.homeModel.HUOYUAN[indexPath.row];
        YXHomeDetailsViewController *detailsVC = [[YXHomeDetailsViewController alloc] init];
        detailsVC.OperType = @"Inventory";
        detailsVC.ProductNo = huoyuanModel.INVENTORYNO;
        detailsVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:detailsVC animated:YES];
     }
    
    if (indexPath.section == 7) {
         YXBuyModel *buyModel = self.homeModel.BUY[indexPath.row];
         YXHomeDetailsViewController *detailsVC = [[YXHomeDetailsViewController alloc] init];
         detailsVC.ProductNo = buyModel.BUYNO;
         detailsVC.hidesBottomBarWhenPushed = YES;
         [self.navigationController pushViewController:detailsVC animated:YES];
     }
    
    if (indexPath.section == 8) {
         YXShopModel *shopModel = self.homeModel.SHOP[indexPath.row];
         YXHomeDetailsViewController *detailsVC = [[YXHomeDetailsViewController alloc] init];
         detailsVC.ProductNo = shopModel.SHOPNO;
         detailsVC.OperType = @"Shop";
         detailsVC.hidesBottomBarWhenPushed = YES;
         [self.navigationController pushViewController:detailsVC animated:YES];
     }
   
}

#pragma mark - Lozy Loading
- (YXHomeCollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        _collectionView = [[YXHomeCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        YXWeakSelf
        [_collectionView setDidSelectSectionAtIndexPath:^(NSIndexPath * _Nonnull indexPath) {
            [weakSelf sectionWithPushVC:indexPath];
        }];
        
        [_collectionView setDidSelectItemAtIndexPath:^(NSIndexPath * _Nonnull indexPath) {
            [weakSelf itemWithPushVC:indexPath];
        }];
        
        [_collectionView setDidSelectSotreAtIndexPath:^(NSIndexPath * _Nonnull indexPath) {
            YXShopModel *shopModel = weakSelf.homeModel.SHOP[indexPath.row];
            YXStoreDetailsViewController *vc = [YXStoreDetailsViewController new];
            vc.ShopNo = shopModel.SHOPNO;
            vc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }];
        
    }
    return _collectionView;
}


- (CLGeocoder *)geocoder{
    if (!_geocoder) {
        self.geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

- (UIButton *)cityBtn {
    if (!_cityBtn) {
        _cityBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_cityBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_cityBtn setTitle:@"全国" forState:(UIControlStateNormal)];
        [_cityBtn setImage:[UIImage imageNamed:@"xiala_9x9_"] forState:(UIControlStateNormal)];
        _cityBtn.frame = CGRectMake(0, 0, 50, 40);
        _cityBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_cityBtn setImgViewStyle:(ButtonImgViewStyleRight) imageSize:(CGSizeMake(9, 9)) space:5];
        [self.cityBtn addTarget:self action:@selector(selectCityBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _cityBtn;
}

- (UIButton *)messageBtn {
    if (!_messageBtn) {
        _messageBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _messageBtn.frame = CGRectMake(0, 0, 40, 40);
        [_messageBtn setImage:[UIImage imageNamed:@"pushMsg_n_23x23_"] forState:(UIControlStateNormal)];
        [_messageBtn addTarget:self action:@selector(messageBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _messageBtn;
}

- (UIButton *)searchBan {
    if (!_searchBan) {
        _searchBan = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _searchBan.frame = CGRectMake(0, 0, 300, 30);
        _searchBan.backgroundColor = [UIColor whiteColor];
        _searchBan.layer.masksToBounds = YES;
        _searchBan.layer.cornerRadius = 5;
        _searchBan.titleLabel.font = [UIFont systemFontOfSize:12];
        [_searchBan setTitle:@"输入类别或关键字" forState:(UIControlStateNormal)];
        [_searchBan setTitleColor:color_textTwo forState:(UIControlStateNormal)];
        [_searchBan setImage:[UIImage imageNamed:@"search_crm_20x20_"] forState:(UIControlStateNormal)];
        [_searchBan addTarget:self action:@selector(searchBanClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _searchBan;
}

- (void)selectCityBtnClick:(UIButton *)sender {
    YXCityListViewController *cityVC = [[YXCityListViewController alloc] init];
    cityVC.currentCity = self.cityBtn.titleLabel.text;
    cityVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cityVC animated:YES];
    
    [cityVC setSelectCityBlock:^(NSString *cityName){
        [self.cityBtn setTitle:cityName forState:(UIControlStateNormal)];
    }];
    
}

- (void)searchBanClick:(UIButton *)sender {
    
    YXSearchViewController *searchVC = [[YXSearchViewController alloc] init];
    searchVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:searchVC animated:YES];
    
}

- (void)messageBtnClick:(UIButton *)sender {

    
}



@end
