//
//  YXPublishBottomView.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/25.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXPublishBottomView.h"

@interface YXPublishBottomView ()
@property (nonatomic ,strong) UIButton *agreeBtn;
@end

@implementation YXPublishBottomView

- (UIButton *)agreeBtn {
    if (!_agreeBtn) {
        _agreeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _agreeBtn.frame = CGRectMake((kScreenWidth - 200)/2, 10, 200, 30);
        [_agreeBtn setTitle:@"同意规则确认发布" forState:(UIControlStateNormal)];
        [_agreeBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_agreeBtn setBackgroundColor:color_blue];
        _agreeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _agreeBtn.layer.masksToBounds = YES;
        _agreeBtn.layer.cornerRadius = 5;
        [_agreeBtn addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _agreeBtn;
}

- (void)click:(UIButton *)sender {
    self.selectAgreeBtnBlock();
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = color_backColor;
        [self addSubview:self.agreeBtn];
    }
    return self;
}

@end