//
//  YXHomeReleaseTableView.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/18.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeReleaseTableView.h"
#import "YXHomePublicCell.h"
#import "YXReleaseModel.h"
@interface YXHomeReleaseTableView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UIView *headerView;
@property (nonatomic ,strong) UIView *footerView;

@property (nonatomic ,strong) NSArray *titleArr;
@property (nonatomic ,strong) NSMutableArray *contentArr;
@property (nonatomic ,strong) NSArray *headerContentArr;
@end

@implementation YXHomeReleaseTableView


- (NSArray *)headerContentArr {
    if (!_headerContentArr) {
        _headerContentArr = @[@"·录音完成后如需试听，再次按住图标即可！",@"·右上角'模板管理'可预设发布模板！",@"·已发布的信息可使用'临近提现功能'，让3千米内买家人人皆知！"];
    }
    return _headerContentArr;
}

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"类别",@"处理方式",@"有效期",@"地址"];
    }
    return _titleArr;
}

- (UIView *)headerView {
    if (!_headerView) {
        _headerView =[[UIView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 150))];
        _headerView.backgroundColor = color_backColor;
        [self createHeaderView];
    }
    return _headerView;
}

- (UIView *)footerView {
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 250))];
        _footerView.backgroundColor = color_backColor;
        [self createFooterView];
    }
    return _footerView;
}

- (void)createHeaderView {
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:(CGRectMake(15, 15, kScreenWidth - 30, 40))];
    titleLab.text = @"清货的卖家除'发布批发''发布零售'在线销售外，还可'一键发布'快速发布货源，让买家主动联系您。";
    titleLab.textColor = [UIColor blackColor];
    [titleLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    titleLab.numberOfLines = 2;
    [self.headerView addSubview:titleLab];
    
    for (int i = 0; i < self.headerContentArr.count; i ++) {
        UILabel *contentLab = [UILabel setLabelWithText:self.headerContentArr[i] fontSize:12 color:color_textTwo];
        contentLab.frame = CGRectMake(15, titleLab.H + titleLab.Y + 10 + 12 * i, kScreenWidth - 30, 16);
        [self.headerView addSubview:contentLab];
    }
    
    UILabel *lab = [[UILabel alloc] initWithFrame:(CGRectMake(15, 120, 100, 16))];
    lab.textColor = [UIColor blackColor];
    lab.text = @"必填";
    [lab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
    [self.headerView addSubview:lab];
}

- (void)createFooterView {
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:(CGRectMake(0, 10, kScreenWidth, 14))];
    titleLab.text = @"长按图标说话进行录音";
    titleLab.textColor = [UIColor blackColor];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [titleLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
    [self.footerView addSubview:titleLab];
    
    UIButton *recordingBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    recordingBtn.frame = CGRectMake((kScreenWidth - 100) / 2, titleLab.H + titleLab.Y + 20, 100, 100);
    [recordingBtn setImage:[UIImage imageNamed:@"write_playvoice_100x100_"] forState:(UIControlStateNormal)];
    recordingBtn.tag = 1004;
    [recordingBtn addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.footerView addSubview:recordingBtn];
    
    UILabel *contentLab = [[UILabel alloc] initWithFrame:(CGRectMake(0, recordingBtn.H +recordingBtn.Y + 20, kScreenWidth, 14))];
    contentLab.textAlignment = NSTextAlignmentCenter;
    contentLab.text = @"录音内容尽量包含价格、数量等信息";
    contentLab.textColor = color_peachColor;
    contentLab.font = [UIFont systemFontOfSize:14];
    [self.footerView addSubview:contentLab];
    
    UIButton *releaseBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    releaseBtn.frame = CGRectMake((kScreenWidth - 200) / 2, contentLab.H + contentLab.Y + 30, 200, 30);
    [releaseBtn setBackgroundColor:color_peachColor];
    [releaseBtn setTitle:@"同意规则确认发布" forState:(UIControlStateNormal)];
    [releaseBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    releaseBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    releaseBtn.layer.masksToBounds = YES;
    releaseBtn.layer.cornerRadius = 5.0f;
    releaseBtn.tag = 1005;
    [releaseBtn addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.footerView addSubview:releaseBtn];
    
    UIButton *rulesBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    rulesBtn.frame = CGRectMake(CGRectGetMaxX(releaseBtn.frame) + 10,  contentLab.H + contentLab.Y + 40, 60, 12);
    [rulesBtn setTitle:@"查看规则" forState:(UIControlStateNormal)];
    [rulesBtn setTitleColor:[UIColor py_colorWithHexString:@"#1767A3"] forState:(UIControlStateNormal)];
    rulesBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    rulesBtn.tag = 1006;
    [rulesBtn addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.footerView addSubview:rulesBtn];
    
}

- (void)click:(UIButton *)sender {
    
    self.selectClick(sender.tag - 1000);
}


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.tableHeaderView = self.headerView;
        self.tableFooterView = self.footerView;
        
        
        [self registerClass:[YXHomePublicCell5 class] forCellReuseIdentifier:@"YXHomePublicCell5"];
    }
    return self;
}


- (void)setDataDic:(NSDictionary *)dataDic {
    _dataDic = dataDic;
    YXReleaseModel *model = [YXReleaseModel mj_objectWithKeyValues:_dataDic];
    self.contentArr = [NSMutableArray arrayWithObjects:model.INVENTORYTYPENAME,model.DEALMODENAME,model.ENDDATENAME,model.ADDRESS, nil];
    
    [self reloadData];
}
#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YXHomePublicCell5 *cell = [tableView dequeueReusableCellWithIdentifier:@"YXHomePublicCell5" forIndexPath:indexPath];
    cell.titleLab.text = self.titleArr[indexPath.row];
    cell.contentLab.text = self.contentArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectClick(indexPath.row);
}

@end
