//
//  YXPiFaCollectionView.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/5.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXPiFaCollectionView : UICollectionView

// type 0:在线批发/零售卖场  1：货源 2：求购 3：商家
@property (nonatomic ,assign) NSInteger type;

@property (nonatomic ,strong) NSMutableArray *dataArr;

@property (nonatomic ,copy) void (^pushSelectItemClick)(NSIndexPath *indexPath);

@end
