//
//  YXHomeGoodsCollectionViewCell.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2020/7/27.
//  Copyright © 2020 杨旭. All rights reserved.
//

#import "YXHomeGoodsCollectionViewCell.h"
#import "YXHomeModel.h"
@interface YXHomeGoodsCollectionViewCell ()

@property (strong, nonatomic)  UIView *bgView;

@property (strong, nonatomic)  UIImageView *pictureImage;

@property (strong, nonatomic)  UILabel *contentLabel;

@property (strong, nonatomic)  UILabel *priceLabel;

@property (strong, nonatomic)  UILabel *numberLabel;

@end

@implementation YXHomeGoodsCollectionViewCell

- (void)setModel:(YXPiFaModel *)model {
    _model = model;
    
    [_pictureImage sd_setImageWithURL:[NSURL URLWithString:_model.FIRSTIMAGE] placeholderImage:[UIImage imageNamed:@""]];
    _contentLabel.text = _model.TITLE;
    _priceLabel.text = _model.PRICENAME;
    _numberLabel.text = _model.NUMNAME;
    
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addLayout];
    }
    return self;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
}
- (UIImageView *)pictureImage {
    if (!_pictureImage) {
        _pictureImage = [UIImageView new];
    }
    return _pictureImage;
}
- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.font = [UIFont systemFontOfSize:14.0];
        _contentLabel.textColor = color_textOne;
        _contentLabel.numberOfLines = 2;
    }
    return _contentLabel;
}
- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = [UIFont systemFontOfSize:14.0];
        _priceLabel.textColor = [UIColor redColor];
    }
    return _priceLabel;
}
- (UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [UILabel new];
        _numberLabel.font = [UIFont systemFontOfSize:12.0];
        _numberLabel.textColor = color_textOne;
    }
    return _numberLabel;
}

- (void)addLayout {
    
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.pictureImage];
    [self.bgView addSubview:self.contentLabel];
    [self.bgView addSubview:self.priceLabel];
    [self.bgView addSubview:self.numberLabel];
    YXWeakSelf
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    [self.pictureImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf.bgView);
        make.height.equalTo(@200);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgView.mas_left).offset(10);
        make.top.equalTo(weakSelf.pictureImage.mas_bottom).offset(10);
        make.right.equalTo(weakSelf.bgView.mas_right).offset(-10);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgView.mas_left).offset(10);
        make.bottom.equalTo(weakSelf.bgView.mas_bottom).offset(-5);
    }];
    
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.bgView.mas_right).offset(-10);
        make.bottom.equalTo(weakSelf.bgView.mas_bottom).offset(-5);
    }];
}

@end
