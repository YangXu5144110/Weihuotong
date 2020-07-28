//
//  YXLevelCell.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/19.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXLevelCell.h"
#import "YXLevelModel.h"
@interface  YXLevelCell ()
@property (nonatomic ,strong) UILabel *integralLab;
@property (nonatomic ,strong) UIView *lineView;
@end

@implementation YXLevelCell

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = color_lineColor;
    }
    return _lineView;
}


- (UIImageView *)leftImage {
    if (!_leftImage) {
        _leftImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shopcarselect_n_17x17_"]];
    }
    return _leftImage;
}

- (UIImageView *)uplevelImage {
    if (!_uplevelImage) {
        _uplevelImage = [UIImageView new];
    }
    return _uplevelImage;
}

- (UILabel *)integralLab {
    if (!_integralLab) {
        _integralLab = [UILabel setLabelWithText:@"" fontSize:12 color:[UIColor orangeColor]];
    }
    return _integralLab;
}

- (UIImageView *)starImage {
    if (!_starImage) {
        _starImage = [UIImageView new];
    }
    return _starImage;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.leftImage];
        [self.contentView addSubview:self.integralLab];
        [self.contentView addSubview:self.uplevelImage];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.starImage];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.width.height.offset(17);
    }];
    
    [_integralLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        [_integralLab sizeToFit];
    }];
    
    [_uplevelImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_integralLab.mas_centerY);
        make.right.equalTo(_integralLab.mas_left).offset(-2);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];

    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.mas_bottom).offset(0);
        make.left.equalTo(_leftImage.mas_right).offset(50);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1));
    }];
    
}

- (void)setModel:(YXLevelListModel *)model {
    _model = model;
    _integralLab.text = [NSString stringWithFormat:@"消耗积分:%@",_model.NEEDSCORE];
    
    
    NSLog(@"%@",_model.LEVELID);
    NSInteger numberf = [_model.LEVELID integerValue] == 888888 ? 0 : [_model.LEVELID integerValue] ;
    if (numberf == 0) {
        self.starImage.image = [UIImage imageNamed:@"zuanshi_15x15_"];
        self.starImage.frame = CGRectMake(80 , 15, 15, 15);

    }
    for (int i = 0; i < numberf;  i++) {
        UIImageView *starImage = [UIImageView new];
        starImage.image = [UIImage imageNamed:@"xingxing_15x15_"];
        starImage.frame = CGRectMake(80 + i * 17, 15, 15, 15);
        [self.contentView addSubview:starImage];

    }
    
}


@end
