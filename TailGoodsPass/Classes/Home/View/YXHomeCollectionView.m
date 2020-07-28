//
//  YXHomeCollectionView.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2020/7/24.
//  Copyright © 2020 杨旭. All rights reserved.
//

#import "YXHomeCollectionView.h"
#import "YXHomeSectionHeaderView.h"
#import "YXHomeBannerCollectionViewCell.h"
#import "YXHomeMenuCollectionViewCell.h"
#import "YXHomeGoodsCollectionViewCell.h"
#import "YXHomePublicCell.h"

#import "YXHomeModel.h"
@interface YXHomeCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation YXHomeCollectionView

- (void)setHomeModel:(YXHomeModel *)homeModel {
    _homeModel = homeModel;
    [self reloadData];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = color_backColor;
        self.dataSource = self;
        self.delegate = self;
        
        [self registerClass:[YXHomeSectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
        [self registerClass:[YXHomeBannerCollectionViewCell class] forCellWithReuseIdentifier:@"YXHomeBannerCollectionViewCell"];
        [self registerClass:[YXHomeMenuCollectionViewCell class] forCellWithReuseIdentifier:@"YXHomeMenuCollectionViewCell"];
        [self registerClass:[YXHomeGoodsCollectionViewCell class] forCellWithReuseIdentifier:@"YXHomeGoodsCollectionViewCell"];
        [self registerClass:[YXHomePublicCell1 class] forCellWithReuseIdentifier:@"YXHomePublicCell1"];
        [self registerClass:[YXHomePublicCell2 class] forCellWithReuseIdentifier:@"YXHomePublicCell2"];
        [self registerClass:[YXHomePublicCell3 class] forCellWithReuseIdentifier:@"YXHomePublicCell3"];

    }
    return self;
}

#pragma mark - UICollectionView Detagte
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 9;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return 8;
    }else if (section == 2) {
        return 1;
    }else if (section == 3) {
        return 0;
    }else if (section == 4) {
        return self.homeModel.PIFA.count;
    }else if (section == 5) {
        return self.homeModel.LINGSHOU.count;
    }else if (section == 6) {
        return self.homeModel.HUOYUAN.count;
    }else if (section == 7) {
        return self.homeModel.BUY.count;
    }else if (section == 8) {
        return self.homeModel.SHOP.count;
    }
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        YXHomeBannerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomeBannerCollectionViewCell" forIndexPath:indexPath];
        cell.model = self.homeModel;
        cell.type = 0;
        return cell;
    }else if (indexPath.section == 1) {
        YXHomeMenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomeMenuCollectionViewCell" forIndexPath:indexPath];
        cell.index = indexPath;
        return cell;
    }else if (indexPath.section == 2) {
        YXHomeBannerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomeBannerCollectionViewCell" forIndexPath:indexPath];
        cell.model = self.homeModel;
        cell.type = 1;
        return cell;
    }else if (indexPath.section == 3) {
        YXHomeGoodsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomeGoodsCollectionViewCell" forIndexPath:indexPath];
        YXPiFaModel *pifaModel = self.homeModel.PIFA[indexPath.row];
        cell.model = pifaModel;
        return cell;
    }else if (indexPath.section == 4) {
        YXHomeGoodsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomeGoodsCollectionViewCell" forIndexPath:indexPath];
        YXPiFaModel *pifaModel = self.homeModel.PIFA[indexPath.row];
        cell.model = pifaModel;
        return cell;
    }else if (indexPath.section == 5) {
        YXHomeGoodsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomeGoodsCollectionViewCell" forIndexPath:indexPath];
        YXPiFaModel *pifaModel = self.homeModel.LINGSHOU[indexPath.row];
        cell.model = pifaModel;
        return cell;
    }else if (indexPath.section == 6) {
        YXHomePublicCell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomePublicCell1" forIndexPath:indexPath];
        YXHuoYuanModel *huoyuanModel = self.homeModel.HUOYUAN[indexPath.row];
        cell.model = huoyuanModel;
        return cell;
    }else if (indexPath.section == 7) {
        YXHomePublicCell2 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomePublicCell2" forIndexPath:indexPath];
        YXBuyModel *buyModel = self.homeModel.BUY[indexPath.row];
        cell.model = buyModel;
        return cell;
    }else if (indexPath.section == 8) {
        YXHomePublicCell3 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomePublicCell3" forIndexPath:indexPath];
        cell.indexPath = indexPath;
        YXShopModel *shopModel = self.homeModel.SHOP[indexPath.row];
        cell.model = shopModel;
        YXWeakSelf
        [cell setClickSotreBtnBlock:^(NSIndexPath *indexPath) {
            if (weakSelf.didSelectSotreAtIndexPath) {
                weakSelf.didSelectSotreAtIndexPath(indexPath);
            }
        }];
        
        return cell;
    }
 
    return [[UICollectionViewCell alloc] init];

}
/** 每个cell的尺寸*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(kScreenWidth, 150);
    }else if (indexPath.section == 1) {
        return CGSizeMake(kScreenWidth/4, 80);
    }else if (indexPath.section == 2) {
        return CGSizeMake(kScreenWidth, 50);
    }else if (indexPath.section == 3) {
        return CGSizeMake((kScreenWidth - 30)/2, 270);
    }else if (indexPath.section == 4) {
        return CGSizeMake((kScreenWidth - 30)/2, 270);
    }else if (indexPath.section == 5) {
        return CGSizeMake((kScreenWidth - 30)/2, 270);
    }else if (indexPath.section == 6) {
        return CGSizeMake(kScreenWidth, 100);
    }else if (indexPath.section == 7) {
        return CGSizeMake(kScreenWidth, 80);
    }else if (indexPath.section == 8) {
        return CGSizeMake(kScreenWidth, 140);
    }
 
    return CGSizeZero;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 1) {
        return UIEdgeInsetsMake(0, 0, 10, 0);
    }else if (section == 2) {
        return UIEdgeInsetsMake(0, 0, 10, 0);
    }else if (section == 3) {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }else if (section == 4) {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }else if (section == 5) {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }else if (section == 6) {
        return UIEdgeInsetsMake(0, 0, 10, 0);
    }else if (section == 7) {
        return UIEdgeInsetsMake(0, 0, 10, 0);
    }else if (section == 8) {
        return UIEdgeInsetsMake(0, 0, 10, 0);
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 3) {
        return 10;
    }else if (section == 4){
        return 10;
    }else if (section == 5){
        return 10;
    }else if (section == 6) {
        return 10;
    }else if (section == 7) {
        return 10;
    }else if (section == 8) {
        return 10;
    }
    return 0;
}

// 返回区头视图方法
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]) {

        YXHomeSectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.3];
        headerView.indexPath = indexPath;
        YXWeakSelf
        [headerView setClickMoreBtnBlock:^(NSIndexPath *indexPath) {
            if (weakSelf.didSelectSectionAtIndexPath) {
                weakSelf.didSelectSectionAtIndexPath(indexPath);
            }
        }];
        return headerView;
    }
    
    return [[UICollectionReusableView alloc] init];
    
}


// 动态返回页眉大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 3) {
        return CGSizeMake(kScreenWidth, 40);
    }else if (section == 4) {
        return CGSizeMake(kScreenWidth, 40);
    }else if (section == 5) {
        return CGSizeMake(kScreenWidth, 40);
    }else if (section == 6) {
        return CGSizeMake(kScreenWidth, 40);
    }else if (section == 7) {
        return CGSizeMake(kScreenWidth, 40);
    }else if (section == 8) {
        return CGSizeMake(kScreenWidth, 40);
    }
    return CGSizeMake(0, 0);

}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectItemAtIndexPath) {
        self.didSelectItemAtIndexPath(indexPath);
    }
}



@end
