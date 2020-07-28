//
//  HomeTableView.m
//  TailGoodsPass
//
//  Created by 李小朋 on 2017/9/2.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeTableView.h"
#import "YXHuoYuanModel.h"
#import "YXBuyModel.h"
#import "YXShopModel.h"
#import "YXBalanceModel.h"
#import "YXPiFaModel.h"
#import "YXPIFACellCell.h"
#import "YXHomeSectionHeaderView.h"
#import "YXHomePublicCell.h"
@interface YXHomeTableView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UITableViewDelegate, UITableViewDataSource>

@property (nonatomic ,strong) NSMutableArray *middleArr;
@property (nonatomic ,strong) NSMutableArray *pifaArr;
@property (nonatomic ,strong) NSMutableArray *lingshouArr;
@property (nonatomic ,strong) NSMutableArray *huoyuanArr;
@property (nonatomic ,strong) NSMutableArray *buyArr;
@property (nonatomic ,strong) NSMutableArray *shopArr;

@property (nonatomic ,strong) UIView *footerView;

@property (nonatomic ,strong) UICollectionView *collectionView;

@end

@implementation YXHomeTableView

- (NSMutableArray *)pifaArr {
    if (!_pifaArr) {
        _pifaArr = [NSMutableArray array];
    }
    return _pifaArr;
}

- (NSMutableArray *)lingshouArr {
    if (!_lingshouArr) {
        _lingshouArr = [NSMutableArray array];
    }
    return _lingshouArr;
}

- (NSMutableArray *)shopArr {
    if (!_shopArr) {
        _shopArr = [NSMutableArray array];
    }
    return _shopArr;
}

- (NSMutableArray *)buyArr {
    if (!_buyArr) {
        _buyArr = [NSMutableArray array];
    }
    return _buyArr;
}

- (NSMutableArray *)huoyuanArr {
    if (!_huoyuanArr) {
        _huoyuanArr = [NSMutableArray array];
    }
    return _huoyuanArr;
}

- (NSMutableArray *)middleArr {
    if (!_middleArr) {
        _middleArr = [NSMutableArray array];
    }
    return _middleArr;
}


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//        flowLayout.itemSize = CGSizeMake((kScreenWidth - 45)/2, 150);
//        flowLayout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.footerView.bounds collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = NO;
        
        
        //注册headerView
        [_collectionView registerClass:[YXHomeSectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
        
        //注册cell        
        [_collectionView registerClass:[YXHomePublicCell class] forCellWithReuseIdentifier:@"YXHomePublicCell"];
        [_collectionView registerClass:[YXHomePublicCell1 class] forCellWithReuseIdentifier:@"YXHomePublicCell1"];
        [_collectionView registerClass:[YXHomePublicCell2 class] forCellWithReuseIdentifier:@"YXHomePublicCell2"];
        [_collectionView registerClass:[YXHomePublicCell3 class] forCellWithReuseIdentifier:@"YXHomePublicCell3"];

        
        
        [_collectionView registerNib:[UINib nibWithNibName:@"YXPIFACellCell" bundle:nil] forCellWithReuseIdentifier:@"YXPIFACellCell"];
        

    }
    return _collectionView;
}

- (UIView *)footerView {
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, kScreenHeight*8 + 30))];
    }
    return _footerView;
}


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.dataSource = self;
        self.delegate = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableFooterView = self.footerView;
        [self.footerView addSubview:self.collectionView];
        
    }
    return self;
}

- (void)setDic:(NSMutableDictionary *)dic {
    _dic = dic;
    
    
    // 最后疯抢
    NSArray *middleArr = [_dic objectForKey:@"AD_MIDDLE"];
    for (NSDictionary *dic in middleArr) {
        YXBalanceModel *model = [[YXBalanceModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.middleArr addObject:model];
    }
    
    // 在线批发
    NSArray *pifaArr = [_dic objectForKey:@"PIFA"];
    self.pifaArr = [YXPiFaModel mj_objectArrayWithKeyValuesArray:pifaArr];
    
    
    // 零售卖场
    NSArray *lingshouArr = [_dic objectForKey:@"LINGSHOU"];
    self.lingshouArr = [YXPiFaModel mj_objectArrayWithKeyValuesArray:lingshouArr];
    
    // 货源信息
    NSArray *huoyuanArr = [_dic objectForKey:@"HUOYUAN"];
    for (NSDictionary *dic in huoyuanArr) {
        YXHuoYuanModel *model = [[YXHuoYuanModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.huoyuanArr addObject:model];
    }
    
    // 求购信息
    NSArray *buyArr = [_dic objectForKey:@"BUY"];
    for (NSDictionary *dic in buyArr) {
        YXBuyModel *model = [[YXBuyModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.buyArr addObject:model];
    }
    
    // 商家
    NSArray *shopArr = [_dic objectForKey:@"SHOP"];
    for (NSDictionary *dic in shopArr) {
        YXShopModel *model = [[YXShopModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.shopArr addObject:model];
    }
    [self reloadData];
    [self.collectionView reloadData];
}

#pragma mark - CollectionView Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 6;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        return self.middleArr.count;
    }else if (section == 1) {
        return self.pifaArr.count;
    }else if (section == 2) {
        return self.lingshouArr.count;
    }else if (section == 3) {
        return self.huoyuanArr.count;
    }else if (section == 4) {
        return self.buyArr.count;
    }else if (section == 5) {
        return self.shopArr.count;
    }
    return 0;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
    if (indexPath.section == 0) {
        YXHomePublicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomePublicCell" forIndexPath:indexPath];
        cell.model = self.middleArr[indexPath.row];
        return cell;
    }else if (indexPath.section == 1){
        YXPIFACellCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXPIFACellCell" forIndexPath:indexPath];
        cell.model = self.pifaArr[indexPath.row];
        return cell;
    }else if (indexPath.section == 2) {
        YXPIFACellCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXPIFACellCell" forIndexPath:indexPath];
        cell.model = self.lingshouArr[indexPath.row];
        return cell;
    }else if (indexPath.section == 3) {
        YXHomePublicCell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomePublicCell1" forIndexPath:indexPath];
        cell.model = self.huoyuanArr[indexPath.row];
        return cell;
    }else if (indexPath.section == 4) {
        YXHomePublicCell2 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomePublicCell2" forIndexPath:indexPath];
        cell.model = self.buyArr[indexPath.row];
        return cell;
    }else {
        YXHomePublicCell3 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomePublicCell3" forIndexPath:indexPath];
        cell.model = self.shopArr[indexPath.row];
        return cell;
    }
    
    
    return [[UICollectionViewCell alloc] init];
}

// 返回区头视图方法
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]) {

        YXHomeSectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        
        headerView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.3];
        
        if (indexPath.section == 0) {
            [headerView.titleBtn setTitle:@"最后疯抢" forState:(UIControlStateNormal)];
            [headerView.titleBtn setImage:[UIImage imageNamed:@"fengqiang_25x25_"] forState:(UIControlStateNormal)];
            
            return headerView;
            
        }else if (indexPath.section == 1) {
            [headerView.titleBtn setTitle:@"在线批发" forState:(UIControlStateNormal)];
            [headerView.titleBtn setImage:[UIImage imageNamed:@"pifa_25x25_"] forState:(UIControlStateNormal)];

            return headerView;
        }else if (indexPath.section == 2){
            [headerView.titleBtn setTitle:@"零售卖场" forState:(UIControlStateNormal)];
            [headerView.titleBtn setImage:[UIImage imageNamed:@"lingshou_25x25_"] forState:(UIControlStateNormal)];
            
            return headerView;
        }else if (indexPath.section == 3) {
            [headerView.titleBtn setTitle:@"货源信息" forState:(UIControlStateNormal)];
            [headerView.titleBtn setImage:[UIImage imageNamed:@"huoyuan_25x25_"] forState:(UIControlStateNormal)];
            
            return headerView;
        }else if (indexPath.section == 4){
            [headerView.titleBtn setTitle:@"求购信息" forState:(UIControlStateNormal)];
            [headerView.titleBtn setImage:[UIImage imageNamed:@"qiugou_25x25_"] forState:(UIControlStateNormal)];
            
            return headerView;
        }else if (indexPath.section == 5){
            [headerView.titleBtn setTitle:@"商家" forState:(UIControlStateNormal)];
            [headerView.titleBtn setImage:[UIImage imageNamed:@"shangjia_25x25_"] forState:(UIControlStateNormal)];
            
            return headerView;
        }
    }
    
    return [[UICollectionReusableView alloc] init];
    
}


// 动态返回页眉大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (_collectionView == collectionView) {
        if (section == 0) {
            return CGSizeMake(kScreenWidth, 40);
        }else if (section == 1) {
            return CGSizeMake(kScreenWidth, 40);
        }else if (section == 2) {
            return CGSizeMake(kScreenWidth, 40);
        }else if (section == 3) {
            return CGSizeMake(kScreenWidth, 40);
        }else if (section == 4) {
            return CGSizeMake(kScreenWidth, 40);
        }else if (section == 5) {
            return CGSizeMake(kScreenWidth, 40);
        }

    }
    return CGSizeMake(0, 0);

}

/** 每个cell的尺寸*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(kScreenWidth, 100);
    }else if (indexPath.section == 1) {
        return CGSizeMake((kScreenWidth - 45)/2, 250);
    }else if (indexPath.section == 2) {
        return CGSizeMake((kScreenWidth - 45)/2, 250);
    }else if (indexPath.section == 3) {
        return CGSizeMake(kScreenWidth, 100);
    }else if (indexPath.section == 4) {
        return CGSizeMake(kScreenWidth, 80);
    }else if (indexPath.section == 5) {
        return CGSizeMake(kScreenWidth, 140);
    }
    return CGSizeMake(0, 0);
    
}

/** section的margin*/
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if (section == 1 || section == 2) {
        return UIEdgeInsetsMake(15, 15, 15, 15);
    }else {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    YXPiFaModel *model = self.pifaArr[indexPath.row];
    NSLog(@"%@",model.PRODUCTNO);
    self.didSelectItemAtIndexPath(indexPath.section, indexPath.row,model.PRODUCTNO);
}


#pragma mark - TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [[UITableViewCell alloc] init];
}

@end
