//
//  YXHomePublicCell.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/11.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YXBalanceModel;
@interface YXHomePublicCell : UICollectionViewCell

@property (nonatomic ,strong) YXBalanceModel *model;

@end

@class YXHuoYuanModel;
@interface YXHomePublicCell1 : UICollectionViewCell

@property (nonatomic ,strong) YXHuoYuanModel *model;

@end

@class YXBuyModel;
@interface YXHomePublicCell2 : UICollectionViewCell

@property (nonatomic ,strong) YXBuyModel *model;

@end

@class YXShopModel;
@interface YXHomePublicCell3 : UICollectionViewCell

@property (nonatomic ,copy)void(^clickSotreBtnBlock)(NSIndexPath *indexPath);
@property (nonatomic ,strong) NSIndexPath *indexPath;
@property (nonatomic ,strong) YXShopModel *model;


@end

@interface YXHomePublicCell4 : UITableViewCell

@property (nonatomic ,strong) NSArray *dataArr;

@end


@interface YXHomePublicCell5 : UITableViewCell

@property (nonatomic ,strong) UILabel *titleLab;
@property (nonatomic ,strong) UILabel *contentLab;
@end



