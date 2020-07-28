//
//  YXHomeBannerCollectionViewCell.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2020/7/24.
//  Copyright © 2020 杨旭. All rights reserved.
//

#import "YXHomeBannerCollectionViewCell.h"
#import "YXWebViewController.h"
#import <SDCycleScrollView.h>
#import "YXHomeModel.h"
@interface YXHomeBannerCollectionViewCell ()<SDCycleScrollViewDelegate>
@property (nonatomic , strong) SDCycleScrollView *scrollerView;
@end
@implementation YXHomeBannerCollectionViewCell

- (void)setModel:(YXHomeModel *)model {
    _model = model;
}

- (void)setType:(NSInteger)type {
    _type = type;
    if (_type == 0) {
        NSMutableArray *imageArr = [NSMutableArray array];
        for (YXBalanceModel *balanceModel in _model.AD_TOP) {
            [imageArr addObject:balanceModel.IMAGEURL];
        }
        _scrollerView.imageURLStringsGroup = imageArr;
    }else {
        NSMutableArray *imageArr = [NSMutableArray array];
        for (YXBalanceModel *balanceModel in _model.AD_MIDDLE) {
            [imageArr addObject:balanceModel.IMAGEURL];
        }
        _scrollerView.imageURLStringsGroup = imageArr;
    }
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.scrollerView];
        [self addLayout];
    }
    return self;
}

- (void)addLayout {
    [self.scrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
//  YXWebViewController *vc = [YXWebViewController new];
//   
//       [] pushViewController:vc animated:YES];
}
- (SDCycleScrollView *)scrollerView {
    if (!_scrollerView) {
        _scrollerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:nil];
        _scrollerView.backgroundColor = [UIColor whiteColor];
        _scrollerView.autoScrollTimeInterval = 5.f;
        _scrollerView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        _scrollerView.localizationImageNamesGroup = @[@"banner1",@"banner2",@"banner3"];
        _scrollerView.layer.masksToBounds = YES;
        _scrollerView.layer.cornerRadius = 4.0f;
        _scrollerView.showPageControl = YES;
        _scrollerView.currentPageDotColor = [UIColor whiteColor];
        _scrollerView.pageDotColor = [UIColor py_colorWithHexString:@"#ffffff" alpha:0.45];
    }
    return _scrollerView;
}


@end
