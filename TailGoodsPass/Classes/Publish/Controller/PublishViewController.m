//
//  PublishViewController.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/2.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "PublishViewController.h"
#import "YXLoginViewController.h"
#import "YXPublishTableView.h"
#import "YXPublishHeaderView.h"
#import "YXPublishTypeViewController.h"
@interface PublishViewController ()
@property (nonatomic ,strong) YXPublishTableView *tableView;
@property (nonatomic ,strong) YXPublishHeaderView *headerView;
@end

@implementation PublishViewController
- (YXPublishHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[YXPublishHeaderView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 170))];
        YXWeakSelf
        [_headerView setSelectBtnClick:^(NSInteger index){
            YXPublishTypeViewController *typeVC = [[YXPublishTypeViewController alloc] init];
            typeVC.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:typeVC animated:YES];
            switch (index) {
                case 0: {
                    typeVC.title = @"发布批发";
                    typeVC.typeView = Publish_WholesaleView;
                }
                    break;
                case 1: {
                    typeVC.title = @"发布零售";
                    typeVC.typeView = Publish_RetailView;

                }
                    break;
                case 2: {
                    typeVC.title = @"发布货源";
                    typeVC.typeView = Publish_GoodsView;

                }
                    break;
                case 3: {
                    typeVC.title = @"发布求购";
                    typeVC.typeView = Publish_BuyView;

                }
                    break;
                case 4: {
                    typeVC.title = @"我要开店";
                    typeVC.typeView = Publish_OpenShopView;
                }
                    break;
                default:
                    break;
            }
        }];
    }
    return _headerView;
}
- (YXPublishTableView *)tableView {
    if (!_tableView) {
        _tableView = [[YXPublishTableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        _tableView.tableHeaderView = self.headerView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"发布";
    
    
    if (![BXUserInfoManager isLoad] ) {
        YXLoginViewController *loginVC = [[YXLoginViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
        [self presentViewController:nav animated:YES completion:nil];
    }
    
    [self.view addSubview:self.tableView];
}



@end
