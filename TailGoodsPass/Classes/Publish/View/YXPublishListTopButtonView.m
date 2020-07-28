//
//  YXPublishListTopButtonView.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/25.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXPublishListTopButtonView.h"

@interface YXPublishListTopButtonView ()

@property (nonatomic ,strong) UIButton *pifaBtn;
@property (nonatomic ,strong) UIButton *lingshouBtn;
@property (nonatomic ,strong) UIButton *huoyuanBtn;
@property (nonatomic ,strong) UIButton *qiugouBtn;
@property (nonatomic ,strong) UILabel  *lineLabel;
@property (nonatomic ,strong) UIButton *oldBtn;
@end

@implementation YXPublishListTopButtonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.pifaBtn];
        [self addSubview:self.lingshouBtn];
        [self addSubview:self.huoyuanBtn];
        [self addSubview:self.qiugouBtn];
        [self addSubview:self.lineLabel];
        self.oldBtn = _pifaBtn;
        [self addLayout];
    }
    return self;
}

- (void)addLayout {
    YXWeakSelf
    [_pifaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(weakSelf);
        make.width.mas_equalTo(kScreenWidth/4);
    }];
    
    [_lingshouBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(weakSelf);
        make.width.mas_equalTo(kScreenWidth/4);
        make.left.equalTo(weakSelf.pifaBtn.mas_right);
    }];
    
    [_huoyuanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(weakSelf);
        make.width.mas_equalTo(kScreenWidth/4);
        make.left.equalTo(weakSelf.lingshouBtn.mas_right);
    }];
    
    [_qiugouBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(weakSelf);
        make.width.mas_equalTo(kScreenWidth/4);
        make.left.equalTo(weakSelf.huoyuanBtn.mas_right);
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(60, 2));
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.centerX.equalTo(weakSelf.pifaBtn.mas_centerX);
    }];

}

- (void)fourBtnTouchMethod:(UIButton *)selectBtn{
    selectBtn.selected = YES;
    _oldBtn.selected = NO;
    _oldBtn = selectBtn;
    __weak typeof (self) weakSelf = self;
    [_lineLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(60, 2));
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.centerX.equalTo(selectBtn.mas_centerX);
    }];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
    }];
    
}


- (UIButton *)pifaBtn{
    if (!_pifaBtn) {
        _pifaBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_pifaBtn setTitle:@"我的批发" forState:(UIControlStateNormal)];
        _pifaBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        [_pifaBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_pifaBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateSelected)];
        [_pifaBtn addTarget:self action:@selector(fourBtnTouchMethod:) forControlEvents:(UIControlEventTouchUpInside)];
        _pifaBtn.selected = YES;
    }
    return _pifaBtn;
}

- (UIButton *)lingshouBtn{
    if (!_lingshouBtn) {
        _lingshouBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_lingshouBtn setTitle:@"我的零售" forState:(UIControlStateNormal)];
        _lingshouBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        [_lingshouBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_lingshouBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateSelected)];
        [_lingshouBtn addTarget:self action:@selector(fourBtnTouchMethod:) forControlEvents:(UIControlEventTouchUpInside)];
        _lingshouBtn.selected = NO;
    }
    return _lingshouBtn;
}

- (UIButton *)huoyuanBtn{
    if (!_huoyuanBtn) {
        _huoyuanBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_huoyuanBtn setTitle:@"我的货源" forState:(UIControlStateNormal)];
        _huoyuanBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        [_huoyuanBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_huoyuanBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateSelected)];
        [_huoyuanBtn addTarget:self action:@selector(fourBtnTouchMethod:) forControlEvents:(UIControlEventTouchUpInside)];
        _huoyuanBtn.selected = NO;
    }
    return _huoyuanBtn;
}

- (UIButton *)qiugouBtn{
    if (!_qiugouBtn) {
        _qiugouBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_qiugouBtn setTitle:@"我的求购" forState:(UIControlStateNormal)];
        _qiugouBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        [_qiugouBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_qiugouBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateSelected)];
        [_qiugouBtn addTarget:self action:@selector(fourBtnTouchMethod:) forControlEvents:(UIControlEventTouchUpInside)];
        _qiugouBtn.selected = NO;
    }
    return _qiugouBtn;
}

- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor blackColor];
    }
    return _lineLabel;
}


@end