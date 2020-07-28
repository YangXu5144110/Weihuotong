//
//  YXStoreDetailsViewController.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/22.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXStoreDetailsViewController.h"
#import "YXStoreCell.h"
#import "YXHomeModel.h"
#import "YXPiFaCollectionView.h"
#import "YXCustomScreeningView.h"
#import "YXChatViewController.h"
#import "ChatViewController.h"
#import "EaseConversationListViewController.h"
#import "ChatDemoHelper.h"
@interface YXStoreDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) YXPiFaCollectionView *collectionView;
@property (nonatomic ,strong) YXCustomScreeningView *screeningView;
@property (nonatomic ,strong) UIButton *callBtn;
@property (nonatomic ,strong) UIButton *shareBtn;

@property (nonatomic ,strong) YXShopModel *model;
@end

@implementation YXStoreDetailsViewController

- (YXCustomScreeningView *)screeningView {
    if (!_screeningView) {
        _screeningView = [[YXCustomScreeningView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 30))];
    }
    return _screeningView;
}


- (YXPiFaCollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake((kScreenWidth - 45)/2, 260);
        flowLayout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[YXPiFaCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 40 - NarBarHeight) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor py_colorWithHexString:@"#ffffff"];
//        _collectionView.scrollEnabled = NO;

    }
    return _collectionView;
}


- (UIButton *)shareBtn {
    if (!_shareBtn) {
        _shareBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _shareBtn.frame = CGRectMake(0, 0, 20, 20);
        [_shareBtn setImage:[UIImage imageNamed:@"fenxiang_15x15_"] forState:(UIControlStateNormal)];
    }
    return _shareBtn;
}

- (UIButton *)callBtn {
    if (!_callBtn) {
        _callBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_callBtn setTitle:@"联系卖家" forState:(UIControlStateNormal)];
        [_callBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [_callBtn setImage:[UIImage imageNamed:@"kefuliaotian_19x19_"] forState:(UIControlStateNormal)];
        _callBtn.backgroundColor = color_backColor;
        _callBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _callBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [_callBtn addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];

    }
    return _callBtn;
}

- (void)click:(UIButton *)sender {
    
    ChatViewController *vc = [[ChatViewController alloc] initWithConversationChatter:@"yuancan002" conversationType:(EMConversationTypeChat)];
    vc.title = @"yuancan002";
    [self.navigationController pushViewController:vc animated:YES];
    [ChatDemoHelper shareHelper].mainVC = (EaseConversationListViewController *)vc;
    [[ChatDemoHelper shareHelper] asyncPushOptions];

}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = color_backColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.tableFooterView = self.collectionView;
        
        [_tableView registerClass:[YXStoreCell class] forCellReuseIdentifier:@"YXStoreCell"];
        [_tableView registerClass:[YXStoreCell1 class] forCellReuseIdentifier:@"YXStoreCell1"];
    }
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"店铺详情";
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:self.shareBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    [self requestDataQuery];
    [self.view addSubview:self.callBtn];
    [self.view addSubview:self.tableView];
    [self.callBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0,*)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
        }else{
            make.left.and.bottom.and.right.equalTo(self.view);
        }
        make.height.equalTo(@40);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.callBtn.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    
}

- (void)requestDataQuery {

//    http://www.4008000114.com:8099/Mall/Query.ashx?OperType=Shop&ShopNo=2017010900001
    NSString *urlStr = @"Mall/Query.ashx";
    NSDictionary *parameter = @{@"OperType":@"Shop",@"ShopNo":@"2017010900001"};
    [NetWorkManager requestForPOSTWithUrl:urlStr parameter:parameter success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
        if (SUCCESS) {
            NSDictionary *data = [responseObject objectForKey:@"DATA"];
            self.model = [YXShopModel mj_objectWithKeyValues:data[@"BASE_INFO"]];
//            self.collectionView.dataArr = data[@"DETAIL"];
            
        }else {
            
        }
        [self.tableView reloadData];
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}


#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        YXStoreCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YXStoreCell" forIndexPath:indexPath];
        cell.model = self.model;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 1){
        YXStoreCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"YXStoreCell1" forIndexPath:indexPath];
        cell.model = self.model;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }

    return [[UITableViewCell alloc] init];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        return 0;
    }
    return 70;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return 30;
    }
    return 5;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    return self.screeningView;

}

@end
