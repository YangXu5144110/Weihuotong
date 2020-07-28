//
//  UIBarButtonItem+Extension.h
//  DDAPP
//
//  Created by 赵士军 on 2018/3/19.
//  Copyright © 2018年 赵士军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
//左侧返回
+(instancetype)barBtnItemWithNmlImg:(NSString *)nmlImg target:(id)target action:(SEL)action;

//左右图片
+(instancetype)rightImage:(NSString*)rightImage and:(NSString*)rightThtlerightThtle target:(id)target action:(SEL)action;
//左右图片
+(instancetype)barBtnItemWithOnlyNmlImg:(NSString *)nmlImg withFlag:(NSString*)flag target:(id)target action:(SEL)action;
@end
