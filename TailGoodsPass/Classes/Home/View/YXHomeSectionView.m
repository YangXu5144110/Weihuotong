//
//  YXHomeSectionView.m
//  TailGoodsPass
//
//  Created by 李小朋 on 2017/9/4.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeSectionView.h"
@interface YXHomeSectionView ()

@property (nonatomic ,strong) UIButton *titleBtn;
@property (nonatomic ,strong) UIButton *moreBtn;
@end
@implementation YXHomeSectionView

- (UIButton *)titleBtn {
    if (!_titleBtn) {
        _titleBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _titleBtn.frame = CGRectMake((kScreenWidth - 100) / 2, 5, 100, 20);
        [_titleBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        _titleBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _titleBtn;
}

- (UIButton *)moreBtn {
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _moreBtn.frame = CGRectMake(kScreenWidth - 90, 5, 80, 20);
        [_moreBtn setTitle:@"更多" forState:(UIControlStateNormal)];
        [_moreBtn setTitleColor:color_textTwo forState:(UIControlStateNormal)];
        _moreBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_moreBtn addTarget:self action:@selector(moreBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _moreBtn;
}

- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title Image:(NSString *)image {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = color_backColor;
        [self.titleBtn setTitle:title forState:(UIControlStateNormal)];
        [self.titleBtn setImage:[UIImage imageNamed:image] forState:(UIControlStateNormal)];
        [self addSubview:self.titleBtn];
        [self addSubview:self.moreBtn];
    }
    return self;
}


#pragma - mark 更多
- (void)moreBtnAction:(UIButton *)sender{

}





@end
