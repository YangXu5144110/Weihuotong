//
//  YXMerchantMessageCollectionView.m
//  TailGoodsPass
//
//  Created by 李小朋 on 2017/9/12.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXMerchantMessageCollectionView.h"
#import "YXHomePublicCell.h"
#import "YXHuoYuanModel.h"
#import "YXBuyModel.h"
#import "YXShopModel.h"
@interface YXMerchantMessageCollectionView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation YXMerchantMessageCollectionView

- (void)setTitleStr:(NSString *)titleStr {
    _titleStr = titleStr;
}

- (void)setDataArr:(NSMutableArray *)dataArr{
    _dataArr = dataArr;
    if ([_titleStr isEqualToString:@"货源信息"]) {
        _dataArr = [YXHuoYuanModel mj_objectArrayWithKeyValuesArray:_dataArr];
    }else if ([_titleStr isEqualToString:@"求购信息"]) {
        _dataArr = [YXBuyModel mj_objectArrayWithKeyValuesArray:_dataArr];
    }else {
        _dataArr = [YXShopModel mj_objectArrayWithKeyValuesArray:_dataArr];
        
    }
    [self reloadData];
}


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = color_backColor;
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[YXHomePublicCell1 class] forCellWithReuseIdentifier:@"YXHomePublicCell1"];
        [self registerClass:[YXHomePublicCell2 class] forCellWithReuseIdentifier:@"YXHomePublicCell2"];
        [self registerClass:[YXHomePublicCell3 class] forCellWithReuseIdentifier:@"YXHomePublicCell3"];

    }
    return self;
}

#pragma mark - UICollectionView Detagte
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.titleStr isEqualToString:@"货源信息"]) {
        YXHomePublicCell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomePublicCell1" forIndexPath:indexPath];
        cell.model = self.dataArr[indexPath.row];
        return cell;
    }else if ([_titleStr isEqualToString:@"求购信息"]) {
        YXHomePublicCell2 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomePublicCell2" forIndexPath:indexPath];
        cell.model = self.dataArr[indexPath.row];
        return cell;
    }else {
        YXHomePublicCell3 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXHomePublicCell3" forIndexPath:indexPath];
        cell.model = self.dataArr[indexPath.row];
        return cell;
    }
    return [[UICollectionViewCell alloc] init];

}
/** 每个cell的尺寸*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([_titleStr isEqualToString:@"货源信息"]) {
        return CGSizeMake(kScreenWidth, 120);
    }else if ([_titleStr isEqualToString:@"求购信息"]) {
        return CGSizeMake(kScreenWidth, 80);
    }else {
        return CGSizeMake(kScreenWidth, 140);
    }
    
}
@end
