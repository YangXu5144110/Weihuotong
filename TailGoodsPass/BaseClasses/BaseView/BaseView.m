//
//  BaseView.m
//  MushroomTakeOut
//
//  Created by 杨旭 on 2017/5/27.
//  Copyright © 2017年 Yang Xu. All rights reserved.
//

#import "BaseView.h"
#import <SVProgressHUD.h>
@interface BaseView ()

@end

@implementation BaseView


-(void)showAlertWith:(NSString *)messge {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:messge message:@"" preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:alert];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    
}


-(void)showAlertWithTitle:(NSString *)title {
    
//    CustomAlertActionView *alertView = [[CustomAlertActionView alloc] initWithViewType:(AlertTypeNotButton)];
//    alertView.title = title;
//    [alertView show];
    
}

/**
 * 获取UIView对象所属的ViewController
 */
- (UIViewController *)viewController {
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *) nextResponder;
        }
    }
    return nil;
}


@end
