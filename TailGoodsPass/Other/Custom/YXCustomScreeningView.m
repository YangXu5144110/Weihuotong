//
//  YXCustomScreeningView.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/23.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXCustomScreeningView.h"
#import "YXScreeningButton.h"
#import "UIColor+RandomColor.h"
@interface YXCustomScreeningView ()
@property (nonatomic ,strong) NSArray *titleArr;
@property (nonatomic ,strong) YXScreeningButton *btn;
// 记录选中的button
@property (nonatomic ,assign) NSInteger lastSelectButtonTag;
@end

@implementation YXCustomScreeningView

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"综合",@"有效期",@"价格",@"筛选"];
    }
    return _titleArr;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setup];
    }
    return self;
}

- (void)setup {
    
    for (int i = 0; i < self.titleArr.count; i ++) {
        YXScreeningButton *btn = [[YXScreeningButton alloc] init];
        btn.frame = (CGRectMake((kScreenWidth / 4) * i, 0, kScreenWidth / 4, 30));
//        btn.backgroundColor = [UIColor randomColor];
        [btn setTitle:self.titleArr[i] forState:(UIControlStateNormal)];
        [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.tag  = 800 + i;
        [btn addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
        if (i == 0) {
            btn.selected = YES;
            [btn setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
        }
        
        if (i == 1 || i == 2) {
            [btn setShang:@"daosanjiao_6x6_"];
            [btn setXia:@"daosanjiao_6x6_"];
        }
        if (i == 3) {
            [btn setXia_L:@"downmenu_20x20_"];
        }
        
        [self addSubview:btn];
        self.btn = btn;
        self.lastSelectButtonTag = 800;

    }
}

- (void)click:(UIButton *)sender {
    NSInteger tag = sender.tag;
    UIButton *lastSelectButton = [self viewWithTag:self.lastSelectButtonTag];
    [lastSelectButton setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
    lastSelectButton.selected = !lastSelectButton.selected;
    [sender setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
    sender.selected = !sender.selected;
    self.lastSelectButtonTag = tag;
}


@end
