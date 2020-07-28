//
//  YXLoadingView.m
//  MushroomRider
//
//  Created by 杨旭 on 2017/8/8.
//  Copyright © 2017年 Yang Xu. All rights reserved.
//

#import "YXLoadingView.h"
#import "UIImage+GIF.h"
@interface YXLoadingView ()
@property (nonatomic ,strong) UIView *contentView;
@property (nonatomic ,strong) UIImageView *imageView;
@property (nonatomic ,strong) UILabel *titleLab;
@end

@implementation YXLoadingView

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 5;
        _contentView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.65];
        _contentView.W = 110;
        _contentView.H = 110;
        [self addSubview:_contentView];
    }
    return _contentView;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        NSMutableArray *array = [NSMutableArray array];
        NSArray *images = @[@"timg.jpg",@"timg1.jpg",@"timg2.jpg",@"timg3.jpg"];
        for (int i = 0; i < images.count; i++) {
            [array addObject:[UIImage imageNamed:images[i]]];
        }
        _imageView.animationImages = array;
        _imageView.animationDuration = 0.3;
        _imageView.W = 60;
        _imageView.H = 60;
        [_imageView startAnimating];
    }
    
    return _imageView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel setLabelWithText:@"努力加载中..." fontSize:12 color:[UIColor whiteColor]];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.X = 0;
        _titleLab.W = _contentView.W;
        _titleLab.H = 15;
    }
    return _titleLab;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.titleLab];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentView.centerX = self.W / 2;
    self.contentView.centerY = self.H / 2 - 100;
    self.imageView.centerX = self.contentView.W / 2;
    self.imageView.centerY = self.contentView.H / 2 - 10;
    self.titleLab.Y = CGRectGetMaxY(self.imageView.frame) + 5;
}



@end
