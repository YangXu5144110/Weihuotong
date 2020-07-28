//
//  BaseView.h
//  MushroomTakeOut
//
//  Created by 杨旭 on 2017/5/27.
//  Copyright © 2017年 Yang Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

// 弹出提醒用户
-(void)showAlertWith:(NSString *)messge;
// 弹出提醒用户
-(void)showAlertWithTitle:(NSString *)title;

/**
 * 获取UIView对象所属的ViewController
 */
- (UIViewController *)viewController;


@end
