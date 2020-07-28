//
//  YXHomeDetailsHeaderView.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/12.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeDetailsHeaderView.h"

@interface YXHomeDetailsHeaderView ()<UIScrollViewDelegate>

@property (nonatomic ,strong) UIScrollView *scrollView;
@property (nonatomic ,strong) UIPageControl *pageControl;
@property (nonatomic ,strong) NSMutableArray *dataSource;

@end

@implementation YXHomeDetailsHeaderView

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)setDataDic:(NSDictionary *)dataDic {
    _dataDic = dataDic;
    
    // 获取顶部轮播图
    self.dataSource = _dataDic[@"INFO"][@"IMAGEURL"];

    [self setup];
}



- (void)setup {
    UIView *backView = [[UIView alloc] initWithFrame:self.bounds];
    backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:backView];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 300))];
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(kScreenWidth * self.dataSource.count, 300);
    _scrollView.delegate = self;
    
    for (int i = 0; i < self.dataSource.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRectMake(kScreenWidth * i, 0, kScreenWidth, 300))];
        NSString *urlStr = [NSString stringWithFormat:@"%@",self.dataSource[i]];
        [imageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@""]];
        
        [_scrollView addSubview:imageView];
    }
    _pageControl = [[UIPageControl alloc] initWithFrame:(CGRectMake(kScreenWidth / 3, 250, kScreenWidth / 3, kScreenHeight / 16))];
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.numberOfPages = self.dataSource.count;
    _pageControl.currentPage = 0;

    UILabel *titleLab = [[UILabel alloc] initWithFrame:(CGRectMake(15, 300, kScreenWidth - 65, 50))];
    titleLab.textColor = [UIColor blackColor];
    titleLab.font = [UIFont boldSystemFontOfSize:16];
    titleLab.text = _dataDic[@"INFO"][@"TITLE"];
    titleLab.numberOfLines = 2;
    [backView addSubview:titleLab];
    
    UIView *lineView = [[UIView alloc] initWithFrame:(CGRectMake(kScreenWidth - 50, 310, 1, 40))];
    lineView.backgroundColor = color_backColor;
    [backView addSubview:lineView];
    
    UIButton *shareBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    shareBtn.frame = CGRectMake(kScreenWidth - 50, 300, 50, 50);
    [shareBtn setImage:[UIImage imageNamed:@"fenxiang_15x15_"] forState:(UIControlStateNormal)];
    [shareBtn setTitle:@"分享" forState:(UIControlStateNormal)];
    [shareBtn setTitleColor:color_textTwo forState:(UIControlStateNormal)];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [shareBtn setImgViewStyle:(ButtonImgViewStyleBottom) imageSize:(CGSizeMake(15, 15)) space:5];
    [backView addSubview:shareBtn];
    
    [backView addSubview:self.scrollView];
    [backView addSubview:self.pageControl];
    
    UIView *priceView = [[UIView alloc] initWithFrame:(CGRectMake(0, lineView.H + lineView.Y + 10, kScreenWidth, 80))];
    priceView.backgroundColor = [UIColor py_colorWithHexString:@"#FCF5E5"];
    [backView addSubview:priceView];
    
    // 运费
    UILabel *freightLab = [UILabel setLabelWithText:_dataDic[@"INFO"][@"LOGISTICSSETNAME"] fontSize:12 color:color_textOne];
    freightLab.frame = CGRectMake(15, priceView.H + priceView.Y + 15, 100, 12);
    [backView addSubview:freightLab];
    
    // 销量
    UILabel *numberLab = [UILabel setLabelWithText:_dataDic[@"INFO"][@"SALENUMNAME"] fontSize:12 color:color_textOne];
    numberLab.frame = CGRectMake((kScreenWidth - 100) /2, priceView.H + priceView.Y + 15, 100, 12);
    numberLab.textAlignment = NSTextAlignmentCenter;
    [backView addSubview:numberLab];
    
    // 地址
    UILabel *addressLab = [UILabel setLabelWithText:_dataDic[@"INFO"][@"ADDRESSNAME"] fontSize:12 color:color_textOne];
    addressLab.frame = CGRectMake(kScreenWidth - 115,priceView.H + priceView.Y + 15 , 100, 12);
    addressLab.textAlignment = NSTextAlignmentRight;
    [backView addSubview:addressLab];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 计算当前在第几页
    _pageControl.currentPage = (NSInteger)(scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width);
}

@end
