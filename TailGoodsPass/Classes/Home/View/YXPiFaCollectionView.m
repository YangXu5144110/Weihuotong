//
//  YXPiFaCollectionView.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/5.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXPiFaCollectionView.h"
#import "YXHomeGoodsCollectionViewCell.h"
#import "YXHomePublicCell.h"
#import "YXHomeModel.h"
@interface YXPiFaCollectionView ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>


@end
@implementation YXPiFaCollectionView

- (void)setType:(NSInteger)type {
    _type = type;
}

- (void)setDataArr:(NSMutableArray *)dataArr {
    _dataArr = dataArr;
    
    [self reloadData];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = color_backColor;
        self.dataSource = self;
        self.delegate = self;
        // 注册cell
        [self registerClass:[YXHomeGoodsCollectionViewCell class] forCellWithReuseIdentifier:@"YXHomeGoodsCollectionViewCell"];
        [self registerClass:[YXHomePublicCell1 class] forCellWithReuseIdentifier:@"YXHomePublicCell1"];
        [self registerClass:[YXHomePublicCell2 class] forCellWithReuseIdentifier:@"YXHomePublicCell2"];
        [self registerClass:[YXHomePublicCell3 class] forCellWithReuseIdentifier:@"YXHomePublicCell3"];
    }
    return self;
}

#pragma mark - UICollectionView的数据源代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.type == 0) {
        YXHomeGoodsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomeGoodsCollectionViewCell" forIndexPath:indexPath];
        cell.model = self.dataArr[indexPath.row];
        return cell;
    }else if (self.type == 1) {
        YXHomePublicCell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomePublicCell1" forIndexPath:indexPath];
        cell.model = self.dataArr[indexPath.row];
        return cell;
    }else if (self.type == 2) {
        YXHomePublicCell2 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomePublicCell2" forIndexPath:indexPath];
        cell.model = self.dataArr[indexPath.row];
        return cell;
    }else if (self.type == 3) {
        YXHomePublicCell3 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomePublicCell3" forIndexPath:indexPath];
        cell.model = self.dataArr[indexPath.row];
        return cell;
    }
    return [UICollectionViewCell new];

}

/** 每个cell的尺寸*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.type == 0) {
        return CGSizeMake((kScreenWidth - 30)/2, 270);
    }else if (self.type == 1) {
        return CGSizeMake(kScreenWidth, 100);
    }else if (self.type == 2) {
        return CGSizeMake(kScreenWidth, 80);
    }else if (self.type == 3) {
        return CGSizeMake(kScreenWidth, 140);
    }
    return CGSizeZero;
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (self.type == 0 ) {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.pushSelectItemClick) {
        self.pushSelectItemClick(indexPath);
    }
    
}

@end
