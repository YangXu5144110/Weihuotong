//
//  YXHomeSectionHeaderView.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/11.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXHomeSectionHeaderView : UICollectionReusableView



@property (nonatomic ,strong) NSIndexPath *indexPath;

@property (nonatomic ,copy)void(^clickMoreBtnBlock)(NSIndexPath *indexPath);

@end
