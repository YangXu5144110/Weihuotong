//
//  CustomAlertActionView.h
//  SameWorld
//
//  Created by 杨旭 on 2017/3/20.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>
#define k_AlertTypeNotButtonTime 1.8

typedef NS_ENUM(NSInteger,AlertViewType) {
    AlertTypes, //提示框带按钮
    ActionSheetType, //上拉框必带按钮
    AlertTypeNotButton, //提示文字
};

typedef void(^AlertResult)(NSInteger index);

@interface CustomAlertActionView : UIView


#pragma mark - 选择弹框-
@property (nonatomic ,copy) AlertResult resultIndex;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle;

- (void)showCostomAlertView;


#pragma mark - 提示弹框 -
@property (nonatomic,strong)NSString *title;

//初始化设置样式
- (instancetype)initWithViewType:(AlertViewType)type;
//显示
- (void)show;


@end
