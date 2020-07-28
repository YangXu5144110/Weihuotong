//
//  YXHomeMenuCollectionViewCell.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2020/7/24.
//  Copyright © 2020 杨旭. All rights reserved.
//

#import "YXHomeMenuCollectionViewCell.h"
@interface YXHomeMenuCollectionViewCell()

/**
 背景图
 */
@property (nonatomic ,strong) UIView *backView;
/**
 标题
 */
@property (nonatomic ,strong) UIImageView *iconImageView;
/**
 详细
 */
@property (nonatomic ,strong) UILabel *detailLab;


@end
@implementation YXHomeMenuCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpLayout];
    }
    return self;
}

- (void)setIndex:(NSIndexPath *)index{
    _index = index;
    NSArray *titleArr= @[@"最后疯抢",@"在线批发",@"零售卖场",@"一键发布",@"货源信息",@"求购信息",@"商家",@"地图找货"];
    NSArray *imageArr = @[@"fengqiangBtn_33x33_",@"pifaBtn_33x33_",@"lingshouBtn_33x33_",@"yijianBtn_33x33_",@"huoyuanBtn_33x33_",@"qiugouBtn_33x33_",@"shangjiaBtn_33x33_",@"dituBtn_33x33_"];
    
    _iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArr[index.row]]];
    _detailLab.text = titleArr[index.row];
}
/**
 页面布局
 */
- (void)setUpLayout{
    [self addSubview:self.backView];
    [self.backView addSubview:self.iconImageView];
    [self.backView addSubview:self.detailLab];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView.mas_centerX);
        make.top.equalTo(self.backView.mas_top).offset(13);
    }];
    [_detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView.mas_centerX);
        make.bottom.equalTo(self.backView.mas_bottom).offset(-15);
    }];
    
}
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.image = [UIImage imageNamed:@"marketing_coupons"];
    }
    return _iconImageView;
}
- (UILabel *)detailLab {
    if (!_detailLab) {
        _detailLab = [[UILabel alloc] init];
        _detailLab.text = @"店铺";
        _detailLab.textColor = color_textOne;
        _detailLab.font = [UIFont systemFontOfSize:12.0f];
    }
    return _detailLab;
}

- (UIView *)backView{
    if (!_backView) {
        _backView = [UIView new];
        //        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}


@end
