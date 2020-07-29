//
//  ShoppingViewController.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/2.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXShoppingViewController.h"
#import "YXShoppingCell.h"
#import "YXShoppingSectionView.h"
#import "YXShoppingViewModel.h"
#import "YXShoppingModel.h"
#import "YXShoppingSettlementView.h"
#import "YXStoreDetailsViewController.h"
#import "YXLoginViewController.h"
@interface YXShoppingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) YXShoppingSectionView *sectionView;
@property (nonatomic ,strong) YXShoppingSettlementView *sltView;
@property (nonatomic ,strong) NSMutableArray *shopsArr;
@property (nonatomic ,strong) NSMutableArray *detailsArr;
@end

@implementation YXShoppingViewController

- (NSMutableArray *)shopsArr {
    if (!_shopsArr) {
        _shopsArr = [NSMutableArray array];
    }
    return _shopsArr;
}

- (NSMutableArray *)detailsArr {
    if (!_detailsArr) {
        _detailsArr = [NSMutableArray array];
    }
    return _detailsArr;
}

- (YXShoppingSettlementView *)sltView {
    if (!_sltView) {
        _sltView = [[YXShoppingSettlementView alloc] initWithFrame:(CGRectMake(0, kScreenHeight - 40 - TabBarHeight - NarBarHeight, kScreenWidth, 40))];
    }
    return _sltView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 40 - TabBarHeight - NarBarHeight) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[YXShoppingCell class] forCellReuseIdentifier:@"YXShoppingcell"];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"购物车";
    
    if (![BXUserInfoManager isLoad] ) {
        YXLoginViewController *loginVC = [[YXLoginViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
        [self presentViewController:nav animated:YES completion:nil];
    }
    
    [self requestDataShoppingCart];
    [self setNarBarUI];
    [self.view addSubview:self.sltView];
    [self.view addSubview:self.tableView];

  
}

- (void)requestDataShoppingCart {
    
    [YXShoppingViewModel requestDataShoppingCartNetWorking:@"4" List:^(NSArray *shops,NSArray *details) {
        self.shopsArr = [NSMutableArray arrayWithArray:shops];
        self.detailsArr = [NSMutableArray arrayWithArray:details];
        [self.tableView reloadData];
    } Failure:^(NSError *error) {
        
    }];

}

- (void)setNarBarUI {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edits:)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
}

- (void)edits:(UIBarButtonItem *)sender {
    
    
}

#pragma mark - UITableView Delegate 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.shopsArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    YXShoppingModel *model = [self.shopsArr objectAtIndex:section];
    NSLog(@"%ld",model.DETAILS.count);
    return model.DETAILS.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YXShoppingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YXShoppingcell" forIndexPath:indexPath];
    YXShoppingModel *model = [self.shopsArr objectAtIndex:indexPath.section];
    cell.model = model.DETAILS[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    _sectionView = [[YXShoppingSectionView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 40))];
    _sectionView.backgroundColor = [UIColor whiteColor];
    YXShoppingModel *model = [self.shopsArr objectAtIndex:section];
    [_sectionView.storeBtn setTitle:model.SHOPNAME forState:(UIControlStateNormal)];
    [_sectionView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
    return self.sectionView;
}

- (void)tap:(UITapGestureRecognizer *)sender {
    YXStoreDetailsViewController *storeVC = [[YXStoreDetailsViewController alloc] init];
    storeVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:storeVC animated:YES];
    
}






@end
