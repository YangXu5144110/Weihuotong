//
//  YXErrorView.m
//  MushroomRider
//
//  Created by 杨旭 on 2017/7/5.
//  Copyright © 2017年 Yang Xu. All rights reserved.
//

#import "YXErrorView.h"

@interface YXErrorView ()
@property (weak, nonatomic) UIImageView *imageView;
@property (weak, nonatomic) UILabel *titleLb;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) UIButton *btn;
@property (assign, nonatomic) BOOL isRefresh;
@end

@implementation YXErrorView

- (instancetype)initWithFrame:(CGRect)frame ImageName:(NSString *)imageName Title:(NSString *)title {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.imageName = imageName;
        self.title = title;
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame ImageName:(NSString *)imageName Title:(NSString *)title Refresh:(BOOL)refresh{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.imageName = imageName;
        self.title = title;
        self.isRefresh = refresh;
        [self setup];
    }
    return self;
}

- (void)setup
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageName]];
    [self addSubview:imageView];
    self.imageView = imageView;
    
    UILabel *titleLb = [[UILabel alloc] init];
    titleLb.text = self.title;
    titleLb.textAlignment = NSTextAlignmentCenter;
    titleLb.textColor = color_textOne;
    titleLb.font = [UIFont systemFontOfSize:13];
    [self addSubview:titleLb];
    self.titleLb = titleLb;
    
    if (_isRefresh) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [btn setTitle:@"重新加载" forState:(UIControlStateNormal)];
        [btn setTitleColor:color_globalColor forState:(UIControlStateNormal)];
        btn.layer.borderWidth = 2.0f;
        btn.layer.borderColor = color_globalColor.CGColor;
        [btn addTarget:self action:@selector(refreshClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:btn];
        self.btn = btn;
    }
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.centerX = self.W / 2;
    self.imageView.centerY = self.H / 2;
    
    self.titleLb.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame) + 10, self.W, 15);
    self.btn.frame = CGRectMake( (kScreenWidth - 100) / 2, CGRectGetMaxY(self.titleLb.frame) + 10, 100, 25);
    
}

- (void)refreshClick:(UIButton *)sender {
    self.refreshClickBlock();
}


@end
