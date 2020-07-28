//
//  HomeClassifyMenuView.m
//  SameWorld
//
//  Created by 杨旭 on 2017/3/31.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeClassifyMenuView.h"

@interface YXHomeClassifyMenuView ()
@property (nonatomic ,strong) NSArray *titleArray;
@property (nonatomic ,strong) NSArray *imageArray;
@end

@implementation YXHomeClassifyMenuView

- (instancetype)initWithFrame:(CGRect)frame  withTitle:(NSArray *)title withImage:(NSArray *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleArray = title;
        self.imageArray = image;
        [self setup];
    }
    return self;
}

//static CGFloat btnh = 80;

static CGFloat btnwi;

- (void)setup {

    int totalloc = 4;
    
    CGFloat btnw = kScreenWidth/4;
    btnwi = btnw;
    CGFloat btnh = 80;
    
    
    for (int i = 0; i < self.titleArray.count; i ++) {
        int row = i/totalloc;
        int loc = i%totalloc;
        
        CGFloat btnx = btnw*loc;
        CGFloat btny = btnh*row;
        
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame = CGRectMake(btnx, btny, btnw, btnh);
        btn.backgroundColor = [UIColor whiteColor];
        btn.tag = 1000 + i;
        [btn addTarget:self action:@selector(Click:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:btn];
        
        UIImageView *btnImageView = [[UIImageView alloc] initWithFrame:(CGRectMake((btnw - 40)/2, 10, 40, 40))];
        UIImage *btnImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imageArray[i]]];
        btnImageView.image = btnImage;
        [btnImageView setContentMode:(UIViewContentModeScaleToFill)];
        [btn addSubview:btnImageView];
//        [btnImageView sizeToFit];
        
        
        UILabel *btnText = [[UILabel alloc] initWithFrame:(CGRectMake((btnw -80)/2 , 60, 80, 10))];
        [btnText setText:self.titleArray[i]];
        [btnText setTextAlignment:(NSTextAlignmentCenter)];
        [btnText setFont:[UIFont systemFontOfSize:14]];
        [btnText setTextColor:color_textOne];
        [btn addSubview:btnText];
        
    }
    
}
- (void)Click:(UIButton *)sender {
    
    self.buttonClicked(sender.tag);
}




@end
