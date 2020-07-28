//
//  YXShoppingSectionView.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/20.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXShoppingSectionView.h"

@interface YXShoppingSectionView ()

@property (nonatomic ,strong) UIButton *selectBtn;
@property (nonatomic ,strong) UIImageView *pirtureImage;

@property (nonatomic ,strong) UIButton *editorBtn;
@end

@implementation YXShoppingSectionView

- (UIButton *)selectBtn {
    if (!_selectBtn) {
        _selectBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_selectBtn setImage:[UIImage imageNamed:@"weixuanzhong_19x19_"] forState:(UIControlStateNormal)];
        [_selectBtn setImage:[UIImage imageNamed:@"shopcarselect_17x17_"] forState:(UIControlStateSelected)];
        [_selectBtn addTarget:self action:@selector(selectBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _selectBtn;
}

- (void)selectBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (UIImageView *)pirtureImage {
    if (!_pirtureImage) {
        _pirtureImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myshop_23x23_"]];
    }
    return _pirtureImage;
}

- (UIButton *)storeBtn {
    if (!_storeBtn) {
        _storeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_storeBtn setTitleColor:color_textOne forState:(UIControlStateNormal)];
        [_storeBtn setImage:[UIImage imageNamed:@"youjiantou_10x10_"] forState:(UIControlStateNormal)];
        _storeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_storeBtn setImgViewStyle:(ButtonImgViewStyleRight) imageSize:(CGSizeMake(10, 10)) space:10];
    }
    return _storeBtn;
}

- (UIButton *)editorBtn {
    if (!_editorBtn) {
        _editorBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_editorBtn setTitle:@"编辑" forState:(UIControlStateNormal)];
        [_editorBtn setTitleColor:color_textOne forState:(UIControlStateNormal)];
        _editorBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _editorBtn;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.selectBtn];
        [self addSubview:self.pirtureImage];
        [self addSubview:self.storeBtn];
        [self addSubview:self.editorBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.height.width.offset(19);
    }];
    
    [_pirtureImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_selectBtn.mas_right).offset(20);
        make.centerY.equalTo(_selectBtn.mas_centerY);
         [_pirtureImage sizeToFit];
    }];
    
    [_storeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_pirtureImage.mas_right).offset(10);
        make.centerY.equalTo(_pirtureImage.mas_centerY);
        [_storeBtn sizeToFit];
    }];
    
    [_editorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        [_editorBtn sizeToFit];
    }];
}

@end
