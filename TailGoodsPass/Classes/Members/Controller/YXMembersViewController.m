//
//  MembersViewController.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/2.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXMembersViewController.h"
#import "YXMembersFooterView.h"
#import "YXMembersPublicCell.h"
#import "YXUserInfoModel.h"
#import "YXMembersDetailsViewController.h"
#import "YXMembersLevelViewController.h"
#import "YXLoginViewController.h"
@interface YXMembersViewController ()<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) YXMembersFooterView *footView;
@property (nonatomic ,strong) YXUserInfoModel *model;

@end

@implementation YXMembersViewController

- (YXMembersFooterView *)footView {
    if (!_footView) {
        _footView = [[YXMembersFooterView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 300))];
        YXWeakSelf
        _footView.buttonClicked = ^(NSInteger index) {
            NSLog(@"%ld",index);
            
            switch (index) {
                case 11: {
              
                        //提示框
                        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"退出后您将不能查看相关信息" message:@"确定退出吗" preferredStyle:(UIAlertControllerStyleAlert)];
                        
                        // 取消按钮
                        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
                            //取消的内容
                        }];
                        // 确定按钮
                        UIAlertAction *sendAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                            //清空用户信息
                            [BXUserInfoManager cleanUserInfo];
#pragma mark -- 退出登录接口
                            //确定的内容
                            YXLoginViewController *loginVC = [[YXLoginViewController alloc] init];
//                            UIWindow *rootWindow = [UIApplication sharedApplication].keyWindow;
//                            
//                            rootWindow.rootViewController = loginVC;
                            
                            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
                            [weakSelf presentViewController:nav animated:YES completion:nil];
                        }];
                        //将事件添加到提示框上
                        [alertVC addAction:cancelAction];
                        [alertVC addAction:sendAction];
                        //弹出提示框(C层)
                        [weakSelf presentViewController:alertVC animated:YES completion:nil];
                   
                    
                }
            
                    break;
                    
                default:
                    break;
            }
            
        };
    }
    return _footView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        UIView *headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 10))];
        headerView.backgroundColor = color_backColor;
        _tableView.tableHeaderView = headerView;
        _tableView.tableFooterView = self.footView;
        [self.tableView registerClass:[YXMembersPublicCell class] forCellReuseIdentifier:@"YXMembersPublicCell"];
        [self.tableView registerClass:[YXMembersPublicCell1 class] forCellReuseIdentifier:@"YXMembersPublicCell1"];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"会员中心";
    
    if (![BXUserInfoManager isLoad] ) {
        YXLoginViewController *loginVC = [[YXLoginViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
        [self presentViewController:nav animated:YES completion:nil];

    }
    
    [self requestDataUserHeader];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0,*)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        }else{
            make.edges.equalTo(self.view);
        }
    }];
   
}


#pragma mark - 请求会员中心接口
- (void)requestDataUserHeader {

//    http://www.4008000114.com:8099/UserInfo/UserHeader.ashx
    NSString *urlStr = @"UserInfo/UserHeader.ashx";
    [NetWorkManager requestForPOSTWithUrl:urlStr parameter:nil success:^(id responseObject) {
        
        if (SUCCESS) {
            NSDictionary *dic = [responseObject objectForKey:@"DATA"];
            self.model = [YXUserInfoModel mj_objectWithKeyValues:dic];
        }else {
        
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
}


#pragma mark - UITableView Delegate 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        YXMembersPublicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YXMembersPublicCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = self.model;
        
        // 升级
        [cell setUpgradeBtnClick:^{
            YXMembersLevelViewController *levelVC = [[YXMembersLevelViewController alloc] init];
            levelVC.title = @"会员等级";
            levelVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:levelVC animated:YES];
        }];
        return cell;
    }else if (indexPath.section == 1){
        YXMembersPublicCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"YXMembersPublicCell1"];
        cell.buttonClicked = ^(NSInteger index) {
            NSLog(@"%ld",index);
        };
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 70;
    }else {
        return 100;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        YXMembersDetailsViewController *mdVC = [[YXMembersDetailsViewController alloc] init];
        mdVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:mdVC animated:YES];
    }
}

@end
