//
//  YXHomeSectionView.h
//  TailGoodsPass
//
//  Created by 李小朋 on 2017/9/4.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXHomeSectionView : UIView


@property (nonatomic ,copy) void(^moreBtnClick)();

- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title Image:(NSString *)image;


@end
