//
//  BasedViewController.m
//  ShangPinJiaZu
//
//  Created by macbook on 16/10/26.
//  Copyright © 2016年 yangzhihao. All rights reserved.
//

#import "BaseViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "CustomAlertActionView.h"
#import "UIView+Toast.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
        //        self.content.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setBarTintColor:color_globalColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor] ,NSForegroundColorAttributeName :[UIFont systemFontOfSize:18.0f]}];
    
    [self createLeftBarButtonItem];

}


// 拦截手势触发，每次触发手势之前都会询问下代理方法，是否触发
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    //  当前控制器是根控制器时，不可以侧滑返回，所以不能使其触发手势
    if(self.navigationController.childViewControllers.count == 1)
    {
        return NO;
    }
    return YES;
}

- (void)createLeftBarButtonItem {
    
    if (self.navigationController.childViewControllers.count > 1) {
        UIBarButtonItem *leftBarButtonItem = [UIBarButtonItem barBtnItemWithNmlImg:@"nav_back" target:self action:@selector(backItem)];
        leftBarButtonItem.tintColor=[UIColor whiteColor];
        self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    }
}

/** 左侧按钮调用 */
- (void)backItem
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)showAlertWith:(NSString *)messge {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:messge message:@"" preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:alert];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

-(void)showAlertWithTitle:(NSString *)title {
    
    CustomAlertActionView *alertView = [[CustomAlertActionView alloc] initWithViewType:(AlertTypeNotButton)];
    alertView.title = title;
    [alertView show];
    
}

- (void)showTostMessage:(NSString *)tost{
    [self.view makeToast:tost duration:1.5 position:@"center"];
}

- (YXLoadingView *)loadingView {
    if (!_loadingView) {
        _loadingView = [[YXLoadingView alloc] initWithFrame:self.view.bounds];
    }
    return _loadingView;
}

/** 请求数据 */
- (void)requestData{
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
- (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor {
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];     [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}




@end
