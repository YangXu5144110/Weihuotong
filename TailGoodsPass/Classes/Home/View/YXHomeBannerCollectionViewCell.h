//
//  YXHomeBannerCollectionViewCell.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2020/7/24.
//  Copyright © 2020 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class YXHomeModel;
@interface YXHomeBannerCollectionViewCell : UICollectionViewCell
@property (nonatomic ,strong) YXHomeModel *model;
@property (nonatomic ,assign) NSInteger type;

@end

NS_ASSUME_NONNULL_END
