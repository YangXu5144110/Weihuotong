//
//  YXHomeSectionHeaderView.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/11.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeSectionHeaderView.h"

@interface YXHomeSectionHeaderView ()
@property (nonatomic ,strong) UIButton *titleBtn;
@property (nonatomic ,strong) UIButton *moreBtn;
@end

@implementation YXHomeSectionHeaderView


- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
    
    if (indexPath.section == 3) {
        [self.titleBtn setTitle:@"最后疯抢" forState:(UIControlStateNormal)];
        [self.titleBtn setImage:[UIImage imageNamed:@"fengqiang_25x25_"] forState:(UIControlStateNormal)];
    }else if (indexPath.section == 4) {
        [self.titleBtn setTitle:@"在线批发" forState:(UIControlStateNormal)];
        [self.titleBtn setImage:[UIImage imageNamed:@"pifa_25x25_"] forState:(UIControlStateNormal)];
    }else if (indexPath.section == 5){
        [self.titleBtn setTitle:@"零售卖场" forState:(UIControlStateNormal)];
        [self.titleBtn setImage:[UIImage imageNamed:@"lingshou_25x25_"] forState:(UIControlStateNormal)];
    }else if (indexPath.section == 6) {
        [self.titleBtn setTitle:@"货源信息" forState:(UIControlStateNormal)];
        [self.titleBtn setImage:[UIImage imageNamed:@"huoyuan_25x25_"] forState:(UIControlStateNormal)];
    }else if (indexPath.section == 7){
        [self.titleBtn setTitle:@"求购信息" forState:(UIControlStateNormal)];
        [self.titleBtn setImage:[UIImage imageNamed:@"qiugou_25x25_"] forState:(UIControlStateNormal)];
    }else if (indexPath.section == 8){
        [self.titleBtn setTitle:@"商家" forState:(UIControlStateNormal)];
        [self.titleBtn setImage:[UIImage imageNamed:@"shangjia_25x25_"] forState:(UIControlStateNormal)];
    }
    [self.titleBtn setImgViewStyle:(ButtonImgViewStyleLeft) imageSize:(CGSizeMake(25, 25)) space:5];

}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleBtn];
        [self addSubview:self.moreBtn];
        [self addLayout];
    
    }
    return self;
}

- (UIButton *)titleBtn {
    if (!_titleBtn) {
        _titleBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_titleBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        _titleBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _titleBtn;
}

- (UIButton *)moreBtn {
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_moreBtn setTitle:@"更多" forState:(UIControlStateNormal)];
        [_moreBtn setTitleColor:color_textTwo forState:(UIControlStateNormal)];
        _moreBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_moreBtn setImage:[UIImage imageNamed:@"headerMoreBtn_12x12_"] forState:(UIControlStateNormal)];
        [_moreBtn setImgViewStyle:(ButtonImgViewStyleRight) imageSize:(CGSizeMake(12, 12)) space:5];
        [_moreBtn addTarget:self action:@selector(moreBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _moreBtn;
}

- (void)addLayout {
    

    [self.titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.centerY.equalTo(self.mas_centerY);
        [self.titleBtn sizeToFit];
    }];
    
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.centerY.equalTo(self.mas_centerY);
        [self.moreBtn sizeToFit];
    }];
    
}


#pragma - mark 更多
- (void)moreBtnAction:(UIButton *)sender{
    if (self.clickMoreBtnBlock) {
        self.clickMoreBtnBlock(self.indexPath);
    }
}


@end
