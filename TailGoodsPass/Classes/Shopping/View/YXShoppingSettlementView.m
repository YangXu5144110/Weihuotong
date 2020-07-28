//
//  YXShoppingSettlementView.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/21.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXShoppingSettlementView.h"

@interface YXShoppingSettlementView ()
@property (nonatomic ,strong) UIButton *selectBtn;
@property (nonatomic ,strong) UILabel *combinedLab;
@property (nonatomic ,strong) UILabel *freight;
@property (nonatomic ,strong) UIButton *settlementBtn;
@property (nonatomic ,strong) UIView *lineView1;
@property (nonatomic ,strong) UIView *lineView2;
@end

@implementation YXShoppingSettlementView

- (UIButton *)selectBtn {
    if (!_selectBtn) {
        _selectBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_selectBtn setImage:[UIImage imageNamed:@"weixuanzhong_19x19_"] forState:(UIControlStateNormal)];
        [_selectBtn setImage:[UIImage imageNamed:@"shopcarselect_17x17_"] forState:(UIControlStateSelected)];
        [_selectBtn setTitle:@"全选" forState:(UIControlStateNormal)];
        [_selectBtn setTitleColor:color_textOne forState:(UIControlStateNormal)];
        _selectBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_selectBtn addTarget:self action:@selector(selectBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _selectBtn;
}

- (void)selectBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (UILabel *)combinedLab {
    if (!_combinedLab) {
        _combinedLab = [UILabel setLabelWithText:@"合计：" fontSize:14 color:color_textOne];
    }
    return _combinedLab;
}

- (UILabel *)freight {
    if (!_freight) {
        _freight = [UILabel setLabelWithText:@"不含运费" fontSize:14 color:color_textTwo];
    }
    return _freight;
}

- (UIButton *)settlementBtn {
    if (!_settlementBtn) {
        _settlementBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_settlementBtn setTitle:@"结算(0)" forState:(UIControlStateNormal)];
        [_settlementBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _settlementBtn.backgroundColor = [UIColor py_colorWithHexString:@"#BD0A00"];
        _settlementBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_settlementBtn addTarget:self action:@selector(settlementBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _settlementBtn;
}

- (void)settlementBtnClick:(UIButton *)sender {
    
}

- (UIView *)lineView1 {
    if (!_lineView1) {
        _lineView1 = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth - 100, 1))];
        _lineView1.backgroundColor = color_lineColor;
    }
    return _lineView1;
}

- (UIView *)lineView2 {
    if (!_lineView2) {
        _lineView2 = [[UIView alloc] initWithFrame:(CGRectMake(0, 39, kScreenWidth - 100, 1))];
        _lineView2.backgroundColor = color_lineColor;
    }
    return _lineView2;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.selectBtn];
        [self addSubview:self.combinedLab];
        [self addSubview:self.freight];
        [self addSubview:self.settlementBtn];
        [self addSubview:self.lineView1];
        [self addSubview:self.lineView2];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.centerY.equalTo(weakSelf.mas_centerY);
        [_selectBtn sizeToFit];
    }];

    [_combinedLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_selectBtn.mas_centerY);
        make.left.equalTo(_selectBtn.mas_right).offset(20);
        [_combinedLab sizeToFit];
    }];
    
    [_settlementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(0);
        make.top.equalTo(weakSelf.mas_top).offset(0);
        make.height.offset(weakSelf.H);
        make.width.offset(100);
    }];
    
    [_freight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_settlementBtn.mas_left).offset(-15);
        make.centerY.equalTo(_settlementBtn.mas_centerY);
        [_freight sizeToFit];
    }];
}

@end
