//
//  YXStoreCell.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/22.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXStoreCell.h"
#import "YXHomeModel.h"
@interface YXStoreCell ()

@property (nonatomic ,strong) UIImageView *pictureImage;
@property (nonatomic ,strong) UILabel *titleLab;
@property (nonatomic ,strong) UIImageView *xzImage;
@property (nonatomic ,strong) UIButton *collectionBtn;
@property (nonatomic ,strong) UILabel *footNumberLab;
@property (nonatomic ,strong) UILabel *numberLab;

@end

@implementation YXStoreCell

- (UIImageView *)pictureImage {
    if (!_pictureImage) {
        _pictureImage = [UIImageView new];
    }
    return _pictureImage;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel setLabelWithText:@"" fontSize:14 color:[UIColor blackColor]];
    }
    return _titleLab;
}

- (UIImageView *)xzImage {
    if (!_xzImage) {
        _xzImage = [UIImageView new];
    }
    return _xzImage;
}

- (UIButton *)collectionBtn {
    if (!_collectionBtn) {
        _collectionBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_collectionBtn setTitle:@"收藏" forState:(UIControlStateNormal)];
        [_collectionBtn setTitle:@"已收藏" forState:(UIControlStateSelected)];
        [_collectionBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _collectionBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_collectionBtn setImage:[UIImage imageNamed:@"shoucang_n_19x19_"] forState:(UIControlStateNormal)];
        [_collectionBtn setImage:[UIImage imageNamed:@"shoucang_19x19_"] forState:(UIControlStateSelected)];
        [_collectionBtn setBackgroundColor:[UIColor orangeColor]];
        [_collectionBtn addTarget:self action:@selector(collectionBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [_collectionBtn setImgViewStyle:(ButtonImgViewStyleTop) imageSize:(CGSizeMake(15, 15)) space:2];
    }
    return _collectionBtn;
}

- (void)collectionBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (UILabel *)footNumberLab {
    if (!_footNumberLab) {
        _footNumberLab = [UILabel setLabelWithText:@"" fontSize:12 color:color_textOne];
    }
    return _footNumberLab;
}

- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [UILabel setLabelWithText:@"" fontSize:12 color:color_textOne];
    }
    return _numberLab;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.pictureImage];
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.xzImage];
        [self.contentView addSubview:self.collectionBtn];
        [self.contentView addSubview:self.footNumberLab];
        [self.contentView addSubview:self.numberLab];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_pictureImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.width.height.offset(50);
    }];
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_pictureImage.mas_right).offset(5);
        make.top.equalTo(_pictureImage.mas_top);
        [_titleLab sizeToFit];
    }];
    
    [_xzImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_pictureImage.mas_right).offset(5);
        make.top.equalTo(_titleLab.mas_bottom).offset(5);
        [_xzImage sizeToFit];
    }];
    
    [_footNumberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_pictureImage.mas_right).offset(5);
        make.bottom.equalTo(_pictureImage.mas_bottom);
        [_footNumberLab sizeToFit];
    }];
    
    [_numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_footNumberLab.mas_right).offset(50);
        make.centerY.equalTo(_footNumberLab.mas_centerY);
        [_numberLab sizeToFit];
    }];
    
    [_collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.size.mas_equalTo(CGSizeMake(60, 40));
    }];
}


- (void)setModel:(YXShopModel *)model {
    _model = model;
    NSString *urlStr = [NSString stringWithFormat:@"%@",_model.LOGONAME];
    [_pictureImage sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage  imageNamed:@""]];
    
    _titleLab.text = _model.SHOPNAME;
    _footNumberLab.text = _model.PRODUCTNUMNAME;
    _numberLab.text = _model.SALENUMNAME;
    
    
}

@end


@interface YXStoreCell1 ()

@property (nonatomic ,strong) UILabel *contentLab;

@end

@implementation YXStoreCell1

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel setLabelWithText:@"" fontSize:14 color:[UIColor blackColor]];
        _contentLab.numberOfLines = 0;
        _contentLab.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _contentLab;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.contentLab];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    YXWeakSelf
    [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        [_contentLab sizeToFit];
    }];
}

- (void)setModel:(YXShopModel *)model {
    _model = model;
    _contentLab.text = _model.SHOPRUNTYPE;
}
@end



