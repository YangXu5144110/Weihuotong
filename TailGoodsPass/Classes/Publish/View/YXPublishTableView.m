//
//  YXPublishTableView.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/25.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXPublishTableView.h"
#import "YXPublishListTopButtonView.h"
@interface YXPublishTableView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) YXPublishListTopButtonView *topView;

@end

@implementation YXPublishTableView

-(YXPublishListTopButtonView *)topView {
    if (!_topView) {
        _topView = [[YXPublishListTopButtonView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 30))];
        _topView.backgroundColor = color_globalColor;
    }
    return _topView;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.delegate = self;
        self.dataSource = self;

    }
    return self;
}

#pragma markf - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.topView;
}


@end
