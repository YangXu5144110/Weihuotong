//
//  YXHomeTypeViewController.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/5.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeTypeViewController.h"
#import "YXHomeDetailsViewController.h"
#import "YXPiFaCollectionView.h"
#import "YXHomeModel.h"

@interface YXHomeTypeViewController ()

@property (nonatomic ,strong) YXPiFaCollectionView *collectionView;

@property (nonatomic ,strong) NSMutableArray *dataArr;

@property (nonatomic ,assign) NSInteger page;

@end

@implementation YXHomeTypeViewController

- (YXPiFaCollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake((kScreenWidth - 30)/2, 270);
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[YXPiFaCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = color_backColor;
        YXWeakSelf
        [_collectionView setPushSelectItemClick:^(NSIndexPath *indexPath) {
            if (weakSelf.typeView == Home_PiFaView || weakSelf.typeView == Home_LingShouView) {
                YXPiFaModel *pifaModel = weakSelf.dataArr[indexPath.row];
                YXHomeDetailsViewController *vc = [YXHomeDetailsViewController new];
                vc.ProductNo = pifaModel.PRODUCTNO;
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }
           
        }];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.page = 1;
    
    switch (self.typeView) {
        case Home_SnapView:
            self.title = @"最后疯抢";
            break;
        case Home_PiFaView:
            self.title = @"在线批发";
            self.collectionView.type = 0;
            [self requestDataSelectProduct:@"PF"];
            [self createView];
            break;
        case Home_LingShouView:
            self.title = @"零售卖场";
            self.collectionView.type = 0;
            [self requestDataSelectProduct:@"LS"];
            [self createView];
            break;
        case Home_HuoYuanView:
            self.title = @"货源信息";
            self.collectionView.type = 1;
            [self requestDataSelectInventory];
            [self createView];
            break;
        case Home_QiuGouView:
            self.title = @"求购信息";
            self.collectionView.type = 2;
            [self requestDataSelectBuy];
            [self createView];
            break;
        case Home_ShopView:
            self.title = @"商家";
            self.collectionView.type = 3;
            [self requestDataSelectShop];
            [self createView];
            break;
        default:
            break;
    }
}

- (void)createView {

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

- (void)requestData {
    
    if ([self.title isEqualToString:@"最后疯抢"]) {
        
    }else if ([self.title isEqualToString:@"在线批发"]) {
    
    }else if ([self.title isEqualToString:@"零售卖场"]) {
        
    }else if ([self.title isEqualToString:@"货源信息"]) {
    
    }else if ([self.title isEqualToString:@"求购信息"]) {
    
    }else if ([self.title isEqualToString:@"商家"]) {
            
    }
    
}

#pragma mark - 请求在批发和零售卖场
- (void)requestDataSelectProduct:(NSString *)OperType {

    YXWeakSelf
//    http://www.4008000114.com:8099/MallSell/Product/SelectProduct.ashx?OperType=PF&OrderBy=Default&PageNo=1
    NSString *urlStr = @"MallSell/Product/SelectProduct.ashx";
    NSDictionary *parameter = @{@"OperType":OperType,@"OrderBy":@"Default",@"PageNo":@"1"};
    [NetWorkManager requestForPOSTWithUrl:urlStr parameter:parameter success:^(id responseObject) {
        
//        NSLog(@"%@",responseObject);
        if (SUCCESS) {
            weakSelf.dataArr = [YXPiFaModel mj_objectArrayWithKeyValuesArray:responseObject[@"DATA"]];
            weakSelf.collectionView.dataArr = weakSelf.dataArr;
        }else {
        
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error);

    }];
    
}



#pragma mark - 请求货源信息
- (void)requestDataSelectInventory {
    
    YXWeakSelf
//    http://www.4008000114.com:8099/MallSell/Inventory/SelectInventory.ashx?OrderBy=Default&PageNo=1
    NSString *urlStr = @"MallSell/Inventory/SelectInventory.ashx";
    NSDictionary *parameter = @{@"OrderBy":@"Default",@"PageNo":@"1"};
    [NetWorkManager requestForPOSTWithUrl:urlStr parameter:parameter success:^(id responseObject) {
        if (SUCCESS) {
            weakSelf.dataArr = [YXHuoYuanModel mj_objectArrayWithKeyValuesArray:[responseObject objectForKey:@"DATA"]];
            weakSelf.collectionView.dataArr = weakSelf.dataArr;
        }else {
        
        }
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - 请求求购信息
- (void)requestDataSelectBuy {
    
    YXWeakSelf
//    http://www.4008000114.com:8099/MallBuy/SelectBuy.ashx?OrderBy=Default&PageNo=1
    NSString *urlStr = @"MallBuy/SelectBuy.ashx";
    NSDictionary *parameter = @{@"OrderBy":@"Default",@"PageNo":@"1"};
    [NetWorkManager requestForPOSTWithUrl:urlStr parameter:parameter success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
        if (SUCCESS) {
            weakSelf.dataArr = [YXBuyModel mj_objectArrayWithKeyValuesArray:[responseObject objectForKey:@"DATA"]];
            weakSelf.collectionView.dataArr = weakSelf.dataArr;

        }else {
            
        }
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - 请求商家 
- (void)requestDataSelectShop  {
    YXWeakSelf
//    http://www.4008000114.com:8099/MallShop/SelectShop.ashx?OrderBy=Default&PageNo=1
    NSString *urlStr = @"MallShop/SelectShop.ashx";
    NSDictionary *parameter = @{@"OrderBy":@"Default",@"PageNo":@"1"};
    [NetWorkManager requestForPOSTWithUrl:urlStr parameter:parameter success:^(id responseObject) {
        if (SUCCESS) {
            weakSelf.dataArr = [YXShopModel mj_objectArrayWithKeyValuesArray:[responseObject objectForKey:@"DATA"]];
            weakSelf.collectionView.dataArr = weakSelf.dataArr;
        }else {
            
        }
    } failure:^(NSError *error) {
        
    }];
}


@end
