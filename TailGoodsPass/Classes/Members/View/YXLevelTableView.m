//
//  YXLevelTableView.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/19.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXLevelTableView.h"
#import "YXLevelCell.h"
#import "YXLevelModel.h"
@interface YXLevelTableView ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic ,strong) UIView *headerView;
@property (nonatomic ,strong) UIImageView *hXImage;
@property (nonatomic ,strong) UILabel *nameLab;
@property (nonatomic ,strong) UILabel *levelLab;
@property (nonatomic ,strong) UIImageView *starImage;
@property (nonatomic ,strong) UILabel *integralLab;
@property (nonatomic ,strong) YXLevelCell *cell;
@property (nonatomic ,strong) YXLevelModel *model;
@property (nonatomic ,strong) NSMutableArray *listArr;

@end
@implementation YXLevelTableView

- (NSMutableArray *)listArr {
    if (!_listArr) {
        _listArr = [NSMutableArray array];
    }
    return _listArr;
}

- (UIImageView *)hXImage {
    if (!_hXImage) {
        _hXImage = [UIImageView new];
        _hXImage.frame = CGRectMake((kScreenWidth - 65)/2, 10, 65, 65);
        _hXImage.layer.masksToBounds = YES;
        _hXImage.layer.cornerRadius = _hXImage.size.width / 2;
        _hXImage.layer.borderColor = [UIColor whiteColor].CGColor;
        _hXImage.layer.borderWidth = 2;
    }
    return _hXImage;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel setLabelWithText:@"" fontSize:16 color:[UIColor whiteColor]];
        _nameLab.frame = CGRectMake(0, _hXImage.H + _hXImage.Y + 10, kScreenWidth, 16);
    }
    return _nameLab;
}

- (UILabel *)levelLab {
    if (!_levelLab) {
        _levelLab = [UILabel setLabelWithText:@"" fontSize:14 color:[UIColor blackColor]];
        _levelLab.layer.masksToBounds = YES;
        _levelLab.layer.cornerRadius = 2;
        _levelLab.backgroundColor = [UIColor orangeColor];
    }
    return _levelLab;
}

- (UILabel *)integralLab {
    if (!_integralLab) {
        _integralLab = [UILabel setLabelWithText:@"" fontSize:12 color:[UIColor whiteColor]];
    }
    return _integralLab;
}

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 200))];
        // 添加背景渐变色
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = _headerView.bounds;
        gradient.colors = [NSArray arrayWithObjects:
                           (id)[UIColor colorWithRed:0 green:143/255.0 blue:234/255.0 alpha:1.0].CGColor,
                           (id)[UIColor colorWithRed:0 green:173/255.0 blue:234/255.0 alpha:1.0].CGColor,
                           (id)[UIColor cyanColor].CGColor, nil];
        [_headerView.layer addSublayer:gradient];
        [_headerView addSubview:self.hXImage];
        [_headerView addSubview:self.nameLab];
        [_headerView addSubview:self.levelLab];
        [_headerView addSubview:self.starImage];
        [_headerView addSubview:self.integralLab];
    }
    return _headerView;
}

- (void)setDataDic:(NSDictionary *)dataDic {
    _dataDic = dataDic;
    self.model = [YXLevelModel mj_objectWithKeyValues:self.dataDic];
    self.listArr = [YXLevelListModel mj_objectArrayWithKeyValuesArray:self.model.LIST];
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        self.delegate = self;
        self.tableHeaderView = self.headerView;
        [self registerClass:[YXLevelCell class] forCellReuseIdentifier:@"YXLevelCell"];
    }
    return self;
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.cell = [tableView dequeueReusableCellWithIdentifier:@"YXLevelCell" forIndexPath:indexPath];
    self.cell.model = self.listArr[indexPath.row];    
    if (indexPath.row == 4) {
        [self.cell.leftImage setImage:[UIImage imageNamed:@"shopcarselect_17x17_"]];
        [self.cell.uplevelImage setImage:[UIImage imageNamed:@"uplevel_66x66_"]];
    }
    return self.cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self btnActionForUserSetting:self];

   
}
- (void)btnActionForUserSetting:(id) sender {
    [self.cell.leftImage setImage:[UIImage imageNamed:@"shopcarselect_n_17x17_"]];
    [self.cell.uplevelImage setImage:[UIImage imageNamed:@""]];
    NSIndexPath *indexPath = [self indexPathForSelectedRow];
    self.cell = [self cellForRowAtIndexPath:indexPath];
    if (self.cell.selected == YES) {
        [self.cell.leftImage setImage:[UIImage imageNamed:@"shopcarselect_17x17_"]];
        [self.cell.uplevelImage setImage:[UIImage imageNamed:@"uplevel_66x66_"]];

    }
}

@end
