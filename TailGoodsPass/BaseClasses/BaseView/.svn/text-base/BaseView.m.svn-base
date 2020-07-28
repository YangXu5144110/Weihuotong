//
//  BaseView.m
//  MushroomTakeOut
//
//  Created by 李小朋 on 2017/5/27.
//  Copyright © 2017年 Yang Xu. All rights reserved.
//

#import "BaseView.h"
//#import "CustomAlertActionView.h"
#import <SVProgressHUD.h>
@interface BaseView ()

//@property (nonatomic ,strong) MBProgressHUD *hud;
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



@end
