//
//  YXHomeCollectionView.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2020/7/24.
//  Copyright © 2020 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class YXHomeModel;
@interface YXHomeCollectionView : UICollectionView

@property (nonatomic ,strong) YXHomeModel *homeModel;

@property (nonatomic ,copy) void(^didSelectItemAtIndexPath)(NSIndexPath *indexPath);

@property (nonatomic ,copy) void(^didSelectSectionAtIndexPath)(NSIndexPath *indexPath);

@property (nonatomic ,copy) void(^didSelectSotreAtIndexPath)(NSIndexPath *indexPath);


@end

NS_ASSUME_NONNULL_END
