//
//  YXMerchantTableView.m
//  TailGoodsPass
//
//  Created by 李小朋 on 2017/9/5.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXMerchantMessageTableView.h"
#import "YXPublicCell.h"
#import "YXHuoYuanModel.h"
#import "YXBuyModel.h"
#import "YXShopModel.h"
@interface YXMerchantMessageTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation YXMerchantMessageTableView

- (void)setTitleStr:(NSString *)titleStr {
    _titleStr = titleStr;
}

- (void)setDataArr:(NSMutableArray *)dataArr{
    _dataArr = dataArr;
    if ([_titleStr isEqualToString:@"货源信息"]) {
        _dataArr = [YXHuoYuanModel mj_objectArrayWithKeyValuesArray:_dataArr];
    }else if ([_titleStr isEqualToString:@"求购信息"]) {
        _dataArr = [YXBuyModel mj_objectArrayWithKeyValuesArray:_dataArr];
    }else {
        _dataArr = [YXShopModel mj_objectArrayWithKeyValuesArray:_dataArr];
        
    }
    [self reloadData];
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = color_backColor;
        self.dataSource = self;
        self.delegate =self;
        [self registerClass:[YXPublicCell1 class] forCellReuseIdentifier:@"YXPublicCell1"];
        [self registerClass:[YXPublicCell2 class] forCellReuseIdentifier:@"YXPublicCell2"];
        [self registerClass:[YXPublicCell3 class] forCellReuseIdentifier:@"YXPublicCell3"];

    }
    return self;
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.titleStr isEqualToString:@"货源信息"]) {
        YXPublicCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"YXPublicCell1"];
        cell.model = self.dataArr[indexPath.row];
        return cell;
    }else if ([_titleStr isEqualToString:@"求购信息"]) {
        YXPublicCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"YXPublicCell2"];
        cell.model = self.dataArr[indexPath.row];
        return cell;
    }else {
        YXPublicCell3 *cell = [tableView dequeueReusableCellWithIdentifier:@"YXPublicCell3"];
        cell.model = self.dataArr[indexPath.row];
        return cell;
    }
    return [[UITableViewCell alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_titleStr isEqualToString:@"货源信息"]) {
        return 120;
    }else if ([_titleStr isEqualToString:@"求购信息"]) {
        return 80;
    }else {
        return 140;
    }
}

@end
