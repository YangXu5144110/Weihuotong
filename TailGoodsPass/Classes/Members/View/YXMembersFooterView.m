//
//  YXMembersFooterView.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/6.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXMembersFooterView.h"
#import "YXMeButton.h"

@interface YXMembersFooterView ()
@property (nonatomic ,strong) NSArray *imageArr;
@property (nonatomic ,strong) NSArray *titleArr;
@end

@implementation YXMembersFooterView

- (NSArray *)imageArr {
    if (!_imageArr) {
        _imageArr = @[@"shoucangjia_24x24_",@"zuji_24x24_",@"tuijian_24x24_",@"qianbao_24x24_",@"huanhao_24x24_",@"xiaoxi_24x24_",@"pinglun_24x24_",@"setpwd_24x24_",@"bangzhu_24x24_",@"share_24x24_",@"empty_48x48_",@"tuichu_24x24_"];
    }
    return _imageArr;
}

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"收藏夹",@"足迹",@"我的推荐",@"我的钱包",@"换手机号",@"消息设置",@"投诉及建议",@"密码设置",@"帮助",@"分享",@"清空缓存",@"退出登录"];
    }
    return _titleArr;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSquares:self.titleArr];
    }
    return self;
}

/**
 *  根据模型数据创建对应的控件
 */
- (void)createSquares:(NSArray *)squares
{
    // 方块个数
    NSUInteger count = squares.count;
    
    // 方块的尺寸
    NSUInteger maxColsCount = 4; // 一行的最大列数
    CGFloat buttonW = self.W / maxColsCount;
    CGFloat buttonH = buttonW;
    
    // 创建所有的方块
    for (NSUInteger i = 0; i < count; i++) {
        // 创建按钮
        YXMeButton *button = [YXMeButton buttonWithType:UIButtonTypeCustom];
        button.tag = 2000 + i;
        button.layer.borderColor = color_backColor.CGColor;
        button.layer.borderWidth = 0.5;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        // 设置frame
        button.X = (i % maxColsCount) * buttonW;
        button.Y = (i / maxColsCount) * buttonH;
        button.W = buttonW;
        button.H = buttonH;
        
        // 设置数据
        [button setTitle:self.titleArr[i] forState:(UIControlStateNormal)];
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imageArr[i]]] forState:(UIControlStateNormal)];
    }
    
    // 设置footer的高度 == 最后一个按钮的bottom(最大Y值)
    self.H = self.subviews.lastObject.bottom;
    
    // 设置tableView的contentSize
    UITableView *tableView = (UITableView *)self.superview;
    tableView.tableFooterView = self;
    [tableView reloadData]; // 重新刷新数据(会重新计算contentSize)

}
- (void)buttonClick:(UIButton *)sender {
    
    self.buttonClicked(sender.tag - 2000);
}

@end
