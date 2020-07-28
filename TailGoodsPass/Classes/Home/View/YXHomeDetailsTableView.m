


//
//  YXHomeDetailsTableView.m
//  TailGoodsPass
//
//  Created by 李小朋 on 2017/9/12.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeDetailsTableView.h"

@interface YXHomeDetailsTableView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UIView *headerView;

@end

@implementation YXHomeDetailsTableView

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 300))];
        _headerView.backgroundColor = [UIColor whiteColor];
    }
    return _headerView;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = color_backColor;
        self.tableHeaderView = self.headerView;
    }
    return self;
}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [[UITableViewCell alloc] init];
}

@end
