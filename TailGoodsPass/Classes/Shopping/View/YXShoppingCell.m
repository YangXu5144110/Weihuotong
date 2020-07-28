//
//  YXShoppingCell.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/20.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXShoppingCell.h"
#import "YXShoppingDetailsModel.h"
@interface YXShoppingCell ()
@property (nonatomic ,strong) UIButton *selectBtn;
@property (nonatomic ,strong) UIImageView *pictureImage;
@property (nonatomic ,strong) UILabel *titleLab;
@property (nonatomic ,strong) UILabel *colorLab;
@property (nonatomic ,strong) UILabel *sizeLab;
@property (nonatomic ,strong) UILabel *priceLab;
@property (nonatomic ,strong) UILabel *numberLab;
@end

@implementation YXShoppingCell

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

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel setLabelWithText:@"" fontSize:14 color:[UIColor orangeColor]];
    }
    return _priceLab;
}

- (UIImageView *)pictureImage {
    if (!_pictureImage) {
        _pictureImage = [UIImageView new];
    }
    return _pictureImage;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel setLabelWithText:@"" fontSize:14 color:color_titleColor];
        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
}

- (UILabel *)colorLab {
    if (!_colorLab) {
        _colorLab = [UILabel setLabelWithText:@"" fontSize:10 color:color_textTwo];
    }
    return _colorLab;
}

- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [UILabel setLabelWithText:@"" fontSize:14 color:[UIColor blackColor]];
    }
    return _numberLab;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = color_backColor;
        [self.contentView addSubview:self.selectBtn];
        [self.contentView addSubview:self.pictureImage];
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.colorLab];
        [self.contentView addSubview:self.priceLab];
        [self.contentView addSubview:self.numberLab];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.width.height.offset(19);
    }];
    
    [_pictureImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_selectBtn.mas_right).offset(15);
        make.top.equalTo(weakSelf.mas_top).offset(5);
        make.size.mas_equalTo(CGSizeMake(90, 90));
    }];
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_pictureImage.mas_right).offset(10);
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        [_titleLab sizeToFit];
    }];
    
    [_colorLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_pictureImage.mas_right).offset(10);
        make.top.equalTo(_titleLab.mas_bottom).offset(10);
        [_colorLab sizeToFit];
    }];
    
    
    [_priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_pictureImage.mas_right).offset(10);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-10);
        [_priceLab sizeToFit];
    }];
    
    [_numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.centerY.equalTo(_priceLab.mas_centerY);
        [_numberLab sizeToFit];
    }];
}

- (void)setModel:(YXShoppingDetailsModel *)model {
    _model = model;
    
    NSString *urlStr = [NSString stringWithFormat:@"%@",_model.FIRSTIMAGE];
    [_pictureImage sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@""]];
    _titleLab.text = _model.TITLE;
    _colorLab.text = _model.NOTE;
    _priceLab.text = [NSString stringWithFormat:@"¥%@",_model.PRICE];
    _numberLab.text = [NSString stringWithFormat:@"x%@",_model.NUM];
    
}

@end
