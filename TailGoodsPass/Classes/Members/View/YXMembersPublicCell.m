//
//  YXMembersPublicCell.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/7.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXMembersPublicCell.h"
#import "UIButton+Extension.h"
#import "YXUserInfoModel.h"
#import "YXMeButton.h"
@interface YXMembersPublicCell ()
@property (nonatomic ,strong) UIImageView *headerImage;
@property (nonatomic ,strong) UILabel *nameLab;
@property (nonatomic ,strong) UILabel *levelLab;
@property (nonatomic ,strong) UILabel *creditLab;
@property (nonatomic ,strong) UIImageView *starImage;
@property (nonatomic ,strong) UIImageView *badgeImage;
@property (nonatomic ,strong) UIButton *upgradeBtn;
@property (nonatomic ,strong) UILabel *rddCode;
@property (nonatomic ,strong) UILabel *balanceLab;
@property (nonatomic ,strong) UILabel *integralLab;
@end
@implementation YXMembersPublicCell

- (UIImageView *)headerImage {
    if (!_headerImage) {
        _headerImage = [UIImageView new];
        _headerImage.backgroundColor = color_backColor;
        _headerImage.layer.masksToBounds = YES;
        _headerImage.layer.cornerRadius = _headerImage.frame.size.width / 2;
    }
    return _headerImage;
}
- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel setLabelWithText:@"" fontSize:14 color:[UIColor blackColor]];
    }
    return _nameLab;
}
- (UILabel *)levelLab {
    if (!_levelLab) {
        _levelLab = [UILabel setLabelWithText:@"等级" fontSize:12 color:color_textTwo];
    }
    return _levelLab;
}
- (UILabel *)creditLab {
    if (!_creditLab) {
        _creditLab = [UILabel setLabelWithText:@"信用" fontSize:12 color:color_textTwo];
    }
    return _creditLab;
}

- (UIImageView *)starImage {
    if (!_starImage) {
        _starImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"huixing@1x_15x15_@1x"]];
    }
    return _starImage;
}

- (UIImageView *)badgeImage {
    if (!_badgeImage) {
        _badgeImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"huizhang_n_14x14_"]];
    }
    return _badgeImage;
}

- (UIButton *)upgradeBtn {
    if (!_upgradeBtn) {
        _upgradeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_upgradeBtn setBackgroundImage:[UIImage imageNamed:@"levelUp_43x18_"] forState:(UIControlStateNormal)];
        [_upgradeBtn addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _upgradeBtn;
}

- (void)click:(UIButton *)sender {

    self.upgradeBtnClick();
}

- (UILabel *)rddCode {
    if (!_rddCode) {
        _rddCode = [UILabel setLabelWithText:@"" fontSize:12 color:[UIColor blackColor]];
    }
    return _rddCode;
}
- (UILabel *)balanceLab {
    if (!_balanceLab) {
        _balanceLab = [UILabel setLabelWithText:@"" fontSize:12 color:[UIColor blackColor]];
    }
    return _balanceLab;
}
- (UILabel *)integralLab {
    if (!_integralLab) {
        _integralLab = [UILabel setLabelWithText:@"" fontSize:12 color:[UIColor blackColor]];
    }
    return _integralLab;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.headerImage];
        [self.contentView addSubview:self.levelLab];
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.creditLab];
        [self.contentView addSubview:self.upgradeBtn];
        [self.contentView addSubview:self.rddCode];
        [self.contentView addSubview:self.balanceLab];
        [self.contentView addSubview:self.integralLab];

        [self setup];

    }
    return self;
}

- (void)setup {
    for (int i = 0; i < 5; i ++) {
        UIImageView *starImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"huixing@1x_15x15_@1x"]];
        starImage.frame = CGRectMake(100 + 12 * i, 25, 12, 12);
        if (i == 0) {
            starImage.image = [UIImage imageNamed:@"xingxing_15x15_"];
        }
        [self.contentView addSubview:starImage];
        self.starImage = starImage;
        
        UIImageView *badgeImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"huizhang_n_14x14_"]];
        badgeImage.frame = CGRectMake(100 + 12 * i, 45, 12, 12);
        if (i==0 || i== 1 || i==2) {
            badgeImage.image = [UIImage imageNamed:@"huizhang_14x14_"];
        }
        [self.contentView addSubview:badgeImage];
        self.badgeImage = badgeImage;
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    YXWeakSelf
    [_headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(5);
        make.left.equalTo(self.headerImage.mas_right).offset(10);
        [_nameLab sizeToFit];
    }];
    
    [_levelLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameLab.mas_bottom).offset(5);
        make.left.equalTo(self.headerImage.mas_right).offset(10);
        [_levelLab sizeToFit];
    }];
    
    [_creditLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_levelLab.mas_bottom).offset(5);
        make.left.equalTo(self.headerImage.mas_right).offset(10);
        [_creditLab sizeToFit];
    }];
    
    [_rddCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_nameLab.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        [_rddCode sizeToFit];
    }];
    
    [_balanceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_levelLab.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        [_balanceLab sizeToFit];
    }];
    
    [_integralLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_creditLab.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        [_integralLab sizeToFit];
    }];
    
    
    [_upgradeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_starImage.mas_right).offset(10);
        make.top.equalTo(_nameLab.mas_bottom).offset(5);
        make.width.offset(25);
        make.height.offset(12);
    }];
    
    
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
        make.bottom.mas_equalTo(_integralLab).offset(10);
    }];
    
}

- (void)setModel:(YXUserInfoModel *)model {
    _model = model;
    
    NSString *urlStr = [NSString stringWithFormat:@"%@",_model.PHOTOURL];
    [_headerImage sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"zhanweitu_65x65_"]];
    _nameLab.text = _model.USERNAME;
    _rddCode.text = [NSString stringWithFormat:@"推荐码:%@",_model.YQCODE];
    _balanceLab.text = [NSString stringWithFormat:@"余额%@",_model.BALANCE];
    _integralLab.text = [NSString stringWithFormat:@"积分%@",_model.INTEGRAL];
}


@end

@interface YXMembersPublicCell1 ()

@property (nonatomic ,strong) YXMeButton *twoBtn;
@property (nonatomic ,strong) NSArray *titleArr;
@property (nonatomic ,strong) NSArray *imageArr;
@end
@implementation YXMembersPublicCell1

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"我是卖家",@"我是买家"];
    }
    return _titleArr;
}

- (NSArray *)imageArr {
    if (!_imageArr) {
        _imageArr = @[@"myshop_23x23_",@"buyerCenter_23x23_"];
    }
    return _imageArr;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    for (int i = 0; i < self.titleArr.count; i ++) {
        _twoBtn = [YXMeButton buttonWithType:(UIButtonTypeCustom)];
        CGFloat maxX = (kScreenWidth / 2) * i;
        CGFloat maxY = 0;
        CGFloat width = (kScreenWidth / 2);
        CGFloat height = 100;
        
        _twoBtn.frame = CGRectMake(maxX, maxY, width, height);
     
        [_twoBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        _twoBtn.layer.borderColor = color_backColor.CGColor;
        _twoBtn.layer.borderWidth = 0.5;
        _twoBtn.tag = 200 + i;
        _twoBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_twoBtn setTitle:self.titleArr[i] forState:(UIControlStateNormal)];
        [_twoBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imageArr[i]]] forState:(UIControlStateNormal)];
        [_twoBtn addTarget:self action:@selector(twoBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.contentView addSubview:self.twoBtn];
    }
}

- (void)twoBtnClick:(UIButton *)sender {
    self.buttonClicked(sender.tag - 200);
}

@end