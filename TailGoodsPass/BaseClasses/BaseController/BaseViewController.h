//
//  BasedViewController.h
//  ShangPinJiaZu
//
//  Created by macbook on 16/10/26.
//  Copyright © 2016年 yangzhihao. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BaseViewController : UIViewController
/** 请求数据 */
- (void)requestData;

/** 左侧按钮调用 */
- (void)backItem;
/**
 加载数据
 */
@property (strong, nonatomic) YXLoadingView *loadingView;


// 弹出提醒用户
-(void)showAlertWith:(NSString *)messge;
// 弹出提醒用户
-(void)showAlertWithTitle:(NSString *)title;
// 弹出提醒用户
- (void)showTostMessage:(NSString *)tost;


/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
- (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;





@end
