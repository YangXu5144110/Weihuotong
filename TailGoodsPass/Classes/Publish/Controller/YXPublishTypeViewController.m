//
//  YXPublishTypeViewController.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/25.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXPublishTypeViewController.h"
#import "YXPublishBottomView.h"
#import "YXPublishWholesaleTableView.h"
#import "YXPublishRetailTableView.h"
#import "YXPublishGoodsTableView.h"
#import "YXPublishAskToBuyTableView.h"
#import "YXMyOpenShopTableView.h"
@interface YXPublishTypeViewController ()
@property (nonatomic ,strong) YXPublishBottomView *bottomView;
@property (nonatomic ,strong) YXPublishWholesaleTableView *wholesaleTableView;
@property (nonatomic ,strong) YXPublishRetailTableView *retailTableView;
@property (nonatomic ,strong) YXPublishGoodsTableView *goodsTableView;
@property (nonatomic ,strong) YXPublishAskToBuyTableView *buyTableView;
@property (nonatomic ,strong) YXMyOpenShopTableView *shopTableView;
@end

@implementation YXPublishTypeViewController

- (YXMyOpenShopTableView *)shopTableView {
    if (!_shopTableView) {
        _shopTableView = [[YXMyOpenShopTableView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, kScreenHeight - 50 - NarBarHeight)) style:(UITableViewStylePlain)];
    }
    return _shopTableView;
}

- (YXPublishAskToBuyTableView *)buyTableView {
    if (!_buyTableView) {
        _buyTableView = [[YXPublishAskToBuyTableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 50 - NarBarHeight) style:(UITableViewStylePlain)];
    }
    return _buyTableView;
}
- (YXPublishGoodsTableView *)goodsTableView {
    if (!_goodsTableView) {
        _goodsTableView = [[YXPublishGoodsTableView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth , kScreenHeight - 50 - NarBarHeight) style:(UITableViewStylePlain)];
    }
    return _goodsTableView;
}

- (YXPublishRetailTableView *)retailTableView {
    if (!_retailTableView) {
        _retailTableView = [[YXPublishRetailTableView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, kScreenHeight - 50 - NarBarHeight)) style:(UITableViewStylePlain)];
    }
    return _retailTableView
    ;
}

- (YXPublishWholesaleTableView *)wholesaleTableView {
    if (!_wholesaleTableView) {
        _wholesaleTableView = [[YXPublishWholesaleTableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 50 - NarBarHeight) style:(UITableViewStylePlain)];
    }
    return _wholesaleTableView;
}

- (YXPublishBottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[YXPublishBottomView alloc] initWithFrame:(CGRectMake(0, kScreenHeight - 50 - NarBarHeight, kScreenWidth, 50))];
    }
    return _bottomView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNarBarUI];
    switch (self.typeView) {
        case Publish_WholesaleView:
            [self.view addSubview:self.wholesaleTableView];
            break;
        case Publish_RetailView:
            [self.view addSubview:self.retailTableView];
            break;
        case Publish_GoodsView:
            [self.view addSubview:self.goodsTableView];
            break;
        case Publish_BuyView:
            [self.view addSubview:self.buyTableView];
            break;
        case Publish_OpenShopView:
            [self.view addSubview:self.shopTableView];
            break;
        default:
            break;
    }

    [self.view addSubview:self.bottomView];
}

- (void)setNarBarUI {
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"查看规则" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
}

- (void)rightItemClick {
    
}

@end
