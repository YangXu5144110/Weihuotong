//
//  YXMembersLevelViewController.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/19.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXMembersLevelViewController.h"
#import "YXLevelTableView.h"
@interface YXMembersLevelViewController ()

@property (nonatomic ,strong) YXLevelTableView *tableView;

@property (nonatomic ,strong) UIView *bottomView;
@property (nonatomic ,strong) UIButton *upgradeBtn;
@end

@implementation YXMembersLevelViewController

- (UIButton *)upgradeBtn {
    if (!_upgradeBtn) {
        _upgradeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _upgradeBtn.frame = CGRectMake((kScreenWidth - 80)/ 2, 10, 80, 30);
        [_upgradeBtn setBackgroundColor:color_peachColor];
        [_upgradeBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_upgradeBtn setTitle:@"升级" forState:(UIControlStateNormal)];
        _upgradeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _upgradeBtn.layer.masksToBounds = YES;
        _upgradeBtn.layer.cornerRadius = 5;
        [_upgradeBtn addTarget:self action:@selector(upgradeBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _upgradeBtn;
}


- (void)upgradeBtnClick:(UIButton *)sender {
    
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:(CGRectMake(0, kScreenHeight - 50 - NarBarHeight, kScreenWidth, 50))];
        _bottomView.backgroundColor = color_backColor;
    }
    return _bottomView;
}

- (YXLevelTableView *)tableView {
    if (!_tableView) {
        _tableView = [[YXLevelTableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 50) style:(UITableViewStylePlain)];
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self requestDataLevel];
    [self setNarBarUI];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    [self.bottomView addSubview:self.upgradeBtn];
}

- (void)setNarBarUI {

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"查看规则" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick:)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
}
- (void)rightItemClick:(UIBarButtonItem *)sender {
    
}

#pragma mark - 请求会员等级接口
- (void)requestDataLevel {
//    http://www.4008000114.com:8099/UserInfo/Level.ashx?METHOD=SELECT
    NSString *urlStr = @"UserInfo/Level.ashx";
    NSDictionary *paramter = @{@"METHOD":@"SELECT"};
    [NetWorkManager requestForPOSTWithUrl:urlStr parameter:paramter success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
        NSDictionary *data = [responseObject objectForKey:@"DATA"];
        self.tableView.dataDic = data;
        
        
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);

    }];
}



@end
