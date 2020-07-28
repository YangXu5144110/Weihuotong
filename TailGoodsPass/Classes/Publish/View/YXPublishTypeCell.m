//
//  YXPublishTypeCell.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/25.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXPublishTypeCell.h"

@interface YXPublishTypeCell ()

@end
@implementation YXPublishTypeCell

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel setLabelWithText:@"" fontSize:12 color:[UIColor blackColor]];
    }
    return _titleLab;
}
- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel setLabelWithText:@"" fontSize:12 color:color_textTwo];
    }
    return _contentLab;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = color_lineColor;
    }
    return _lineView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.contentLab];
        [self.contentView addSubview:self.lineView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        [_titleLab sizeToFit];
    }];
    
    [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_titleLab.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(100);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        [_contentLab sizeToFit];
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-0.5);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1));
    }];
}


@end


@implementation YXPublishTypeCell1

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel setLabelWithText:@"" fontSize:12 color:[UIColor blackColor]];
    }
    return _titleLab;
}


- (UITextField *)contentTF {
    if (!_contentTF) {
        _contentTF = [[UITextField alloc] init];
//        NSNumber * value = [NSNumber numberWithInteger:NSTextAlignmentCenter];
//        [_contentTF setValue:value forKeyPath:@"_placeholderLabel.textAlignment"];
//        [_contentTF setValue:[UIFont systemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
        _contentTF.font = [UIFont systemFontOfSize:12];
    }
    return _contentTF;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = color_lineColor;
    }
    return _lineView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.contentTF];
        [self.contentView addSubview:self.lineView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        [_titleLab sizeToFit];
    }];
    
    [_contentTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_titleLab.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(100);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        [_contentTF sizeToFit];
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-0.5);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1));
    }];
}

@end

@implementation YXPublishTypeCell2

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel setLabelWithText:@"" fontSize:12 color:[UIColor blackColor]];
    }
    return _titleLab;
}


- (UITextField *)contentTF {
    if (!_contentTF) {
        _contentTF = [[UITextField alloc] init];
//        NSNumber * value = [NSNumber numberWithInteger:NSTextAlignmentCenter];
//        [_contentTF setValue:value forKeyPath:@"_placeholderLabel.textAlignment"];
//        [_contentTF setValue:[UIFont systemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
        _contentTF.font = [UIFont systemFontOfSize:12];
    }
    return _contentTF;
}

- (UILabel *)unitLab {
    if (!_unitLab) {
        _unitLab = [UILabel setLabelWithText:@"" fontSize:12 color:[UIColor blackColor]];
    }
    return _unitLab;
}

- (UILabel *)unitContentLab {
    if (!_unitContentLab) {
        _unitContentLab = [UILabel setLabelWithText:@"" fontSize:12 color:color_textTwo];
    }
    return _unitContentLab;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = color_lineColor;
    }
    return _lineView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.contentTF];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.unitLab];
        [self.contentView addSubview:self.unitContentLab];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        [_titleLab sizeToFit];
    }];
    
    [_contentTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_titleLab.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(100);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        [_contentTF sizeToFit];
    }];
    
    [_unitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(200);
        [_unitLab sizeToFit];
    }];
    
    [_unitContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(250);
        [_unitContentLab sizeToFit];
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-0.5);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1));
    }];
}

@end


@implementation YXPublishTypeCell3
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel setLabelWithText:@"" fontSize:12 color:[UIColor blackColor]];
    }
    return _titleLab;
}
- (UIButton *)imageBtn1 {
    if (!_imageBtn1) {
        _imageBtn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _imageBtn1.tag = 600;
        [_imageBtn1 setBackgroundImage:[UIImage imageNamed:@"addPhoto_57x57_"] forState:(UIControlStateNormal)];
        [_imageBtn1 addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _imageBtn1;
}

- (UIButton *)imageBtn2 {
    if (!_imageBtn2) {
        _imageBtn2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _imageBtn2.tag = 601;
        [_imageBtn2 setBackgroundImage:[UIImage imageNamed:@"addPhoto_57x57_"] forState:(UIControlStateNormal)];
        [_imageBtn2 addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _imageBtn2;
}

- (void)click:(UIButton *)sender {
    
    self.selectImageBlock(sender.tag - 600);
    
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = color_lineColor;
    }
    return _lineView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.imageBtn1];
        [self.contentView addSubview:self.imageBtn2];
        [self.contentView addSubview:self.lineView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        [_titleLab sizeToFit];
    }];
    
    [_imageBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_titleLab.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(100);
        make.size.mas_equalTo(CGSizeMake(57, 57));
    }];
    
    [_imageBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_imageBtn1.mas_centerY);
        make.left.equalTo(_imageBtn1.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(57, 57));
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-0.5);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1));
    }];
}


@end

@implementation YXPublishTypeCell4

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel setLabelWithText:@"" fontSize:12 color:[UIColor blackColor]];
    }
    return _titleLab;
}


- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] init];
    }
    return _textView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = color_lineColor;
    }
    return _lineView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.textView];
        [self.contentView addSubview:self.lineView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    YXWeakSelf
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        [_titleLab sizeToFit];
    }];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(100);
        make.top.equalTo(weakSelf.mas_top).offset(0);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(- 10);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-0.5);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1));
    }];
}

@end



































































