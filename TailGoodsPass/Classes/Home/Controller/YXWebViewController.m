//
//  YXWebViewController.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/7.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXWebViewController.h"

@interface YXWebViewController ()
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation YXWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadSubViews];
}

- (void)loadSubViews {
    
    self.webView = [[UIWebView alloc] init];
    [UIView animateKeyframesWithDuration:2.0 delay:1.0 options:(UIViewKeyframeAnimationOptionOverrideInheritedDuration) animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.5 animations:^{
            self.webView.frame = CGRectMake(0, 200, 0,0);
            
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:1.0 animations:^{
            self.webView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        }];
        
        // 自动对页面进行缩放以适应屏幕
        _webView.scalesPageToFit = YES;
        
        [self.view addSubview:_webView];
        
        // 创建url
        NSURL *url = [NSURL URLWithString:self.url];
        
        // 请求url
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        // webview加载url
        [_webView loadRequest:request];
        
    } completion:^(BOOL finished) {
        //NSLog(@"完成");
        
    }];
    
}


@end
