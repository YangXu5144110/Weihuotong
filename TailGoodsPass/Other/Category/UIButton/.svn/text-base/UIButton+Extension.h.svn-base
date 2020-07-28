//
//  UIButton+Extension.h
//  SameWorld
//
//  Created by 杨旭 on 2017/3/18.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    ButtonImgViewStyleTop,
    ButtonImgViewStyleLeft,
    ButtonImgViewStyleBottom,
    ButtonImgViewStyleRight,
} ButtonImgViewStyle;


@interface UIButton (Extension)
/**  扩大buuton点击范围  */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

+ (instancetype)setButtonWithTitlte:(NSString *)title fontName:(UIFont *)fontName fontSize:(CGFloat )fontSize image:(UIImage *)image color:(UIColor *)color;


/**
 设置 按钮 图片所在的位置
 
 @param style   图片位置类型（上、左、下、右）
 @param size    图片的大小
 @param space 图片跟文字间的间距
 */
- (void)setImgViewStyle:(ButtonImgViewStyle)style imageSize:(CGSize)size space:(CGFloat)space;

@end
