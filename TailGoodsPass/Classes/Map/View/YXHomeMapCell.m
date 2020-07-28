//
//  YXHomeMapCell.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/15.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeMapCell.h"
#import "YXMapModel.h"
@interface YXHomeMapCell ()

@property (nonatomic ,strong) UILabel *titleLab;
@property (nonatomic ,strong) UILabel *subTitleLab;
@property (nonatomic ,strong) UILabel *distanceLab;

@end
@implementation YXHomeMapCell

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel setLabelWithText:@"111" fontSize:16 color:[UIColor blackColor]];
    }
    return _titleLab;
}
- (UILabel *)subTitleLab {
    if (!_subTitleLab) {
        _subTitleLab = [UILabel setLabelWithText:@"111" fontSize:14 color:color_textOne];
    }
    return _subTitleLab;
}
- (UILabel *)distanceLab {
    if (!_distanceLab) {
        _distanceLab = [UILabel setLabelWithText:@"111" fontSize:12 color:color_textTwo];
    }
    return _distanceLab;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.subTitleLab];
        [self.contentView addSubview:self.distanceLab];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.top.equalTo(weakSelf.mas_top).offset(15);
        [_titleLab sizeToFit];
    }];
    
    [_subTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.top.equalTo(_titleLab.mas_bottom).offset(10);
        [_subTitleLab sizeToFit];
    }];
    
    [_distanceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).offset(-35);
        [_distanceLab sizeToFit];
    }];
}

- (void)setModel:(YXMapModel *)model {
    _model = model;
    _titleLab.text = _model.TITLE;
    _subTitleLab.text = _model.ADDRESSNAME;
    _distanceLab.text = [NSString stringWithFormat:@"距离%@",_model.DISTANCENAME];
}

@end
