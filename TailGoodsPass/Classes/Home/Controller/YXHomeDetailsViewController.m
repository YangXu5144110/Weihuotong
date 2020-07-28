//
//  YXHomeDetailsViewController.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/12.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXHomeDetailsViewController.h"
#import "YXHomeDetailsHeaderView.h"
#import "YXHomeDetailsBottomView.h"
#import "YXHomePublicCell.h"
#import "ChoseView.h"
#import "YXStoreDetailsViewController.h"
@interface YXHomeDetailsViewController ()<UITableViewDelegate,UITableViewDataSource,TypeSeleteDelegete>
{
    ChoseView *choseView;
    UIView *bgview;
    CGPoint center;
    NSArray *sizearr;//型号数组
    NSArray *colorarr;//分类数组
    NSDictionary *stockarr;//商品库存量
    int goodsStock;
}
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) YXHomeDetailsHeaderView *headerView;
@property (nonatomic ,strong) YXHomeDetailsBottomView *bootomView;

@property (nonatomic ,strong) NSDictionary *dataDic;
@end

@implementation YXHomeDetailsViewController


- (YXHomeDetailsBottomView *)bootomView {
    if (!_bootomView) {
        _bootomView = [[YXHomeDetailsBottomView alloc] initWithFrame:(CGRectMake(0, kScreenHeight - 50 - 64, kScreenWidth, 50))];
        _bootomView.backgroundColor = [UIColor whiteColor];
        
        YXWeakSelf
        _bootomView.selectBtnClick = ^(NSInteger index) {
            switch (index) {
                case 0: {  // 客服
                
                }
                    break;
                case 1: {  // 店铺
                    YXStoreDetailsViewController *storeVC = [[YXStoreDetailsViewController alloc] init];
                    [weakSelf.navigationController pushViewController:storeVC animated:YES];
                }
                    break;
                case 2: {  // 收藏
                    
                }
                    break;
                case 3: {  // 加入购物车
                    
                    [weakSelf btnselete];
                    
                }
                    break;
                case 4: { // 立即购买
                    
                }
                    break;
                default:
                    break;
            }
        };
    }
    return _bootomView;
}

- (YXHomeDetailsHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[YXHomeDetailsHeaderView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 480))];
        _headerView.backgroundColor = [UIColor whiteColor];
    }
    return _headerView;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, -64, kScreenWidth, kScreenHeight-50)) style:(UITableViewStylePlain)];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = color_backColor;
        _tableView.tableHeaderView = self.headerView;
        
        [_tableView registerClass:[YXHomePublicCell4 class] forCellReuseIdentifier:@"YXHomePublicCell4"];
    }
    return _tableView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = YES;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.translucent = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    bgview = [[UIView alloc] initWithFrame:self.view.bounds];
    bgview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgview];
    
    [self requestDataQuery];
    [bgview addSubview:self.tableView];
    [bgview addSubview:self.bootomView];
   

    [self initChoseView];
    
}

/**
 *  初始化弹出视图
 */
-(void)initChoseView
{
    
    //选择尺码颜色的视图
    choseView = [[ChoseView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:choseView];
    
    //尺码
    choseView.sizeView = [[TypeView alloc] initWithFrame:CGRectMake(0, 0, choseView.frame.size.width, 50) andDatasource:sizearr :@"尺码"];
    choseView.sizeView.delegate = self;
    [choseView.mainscrollview addSubview:choseView.sizeView];
    choseView.sizeView.frame = CGRectMake(0, 0, choseView.frame.size.width, choseView.sizeView.height);
    //颜色分类
    choseView.colorView = [[TypeView alloc] initWithFrame:CGRectMake(0, choseView.sizeView.frame.size.height, choseView.frame.size.width, 50) andDatasource:colorarr :@"颜色分类"];
    choseView.colorView.delegate = self;
    [choseView.mainscrollview addSubview:choseView.colorView];
    choseView.colorView.frame = CGRectMake(0, choseView.sizeView.frame.size.height, choseView.frame.size.width, choseView.colorView.height);
    //购买数量
    choseView.countView.frame = CGRectMake(0, choseView.colorView.frame.size.height+choseView.colorView.frame.origin.y, choseView.frame.size.width, 50);
    choseView.mainscrollview.contentSize = CGSizeMake(self.view.frame.size.width, choseView.countView.frame.size.height+choseView.countView.frame.origin.y);
    
    choseView.lb_price.text = @"¥100";
    choseView.lb_stock.text = @"库存100000件";
    choseView.lb_detail.text = @"请选择 尺码 颜色分类";
    [choseView.bt_cancle addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [choseView.bt_sure addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
    //点击黑色透明视图choseView会消失
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [choseView.alphaiView addGestureRecognizer:tap];
  
}

/**
 *  点击按钮弹出
 */
-(void)btnselete
{
    [self.navigationController setNavigationBarHidden:YES];

    [UIView animateWithDuration: 0.35 animations: ^{
        bgview.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
        bgview.center = CGPointMake(self.view.center.x, self.view.center.y-50);
        choseView.center = self.view.center;
        choseView.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    } completion: nil];
    
}
/**
 *  点击半透明部分或者取消按钮，弹出视图消失
 */
-(void)dismiss
{
    [self.navigationController setNavigationBarHidden:NO];

    center.y = center.y+self.view.frame.size.height;
    [UIView animateWithDuration: 0.35 animations: ^{
        choseView.frame =CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
        
        bgview.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        bgview.center = self.view.center;
        bgview.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    } completion: nil];
    
}

#pragma mark - 请求首页详情接口
- (void)requestDataQuery {

//    http://www.4008000114.com:8099/Mall/Query.ashx?OperType=Product&ProductNo=2017082100009
    NSString *urlStr = @"Mall/Query.ashx";
    NSDictionary *parameter = @{@"OperType":self.OperType,@"ProductNo":self.ProductNo};
    [NetWorkManager requestForPOSTWithUrl:urlStr parameter:parameter success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
        if (SUCCESS) {
            self.dataDic = [responseObject objectForKey:@"DATA"];
            
            self.headerView.dataDic = self.dataDic;

        }else {
        
        
        }
     
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);

    }];
    
    
}


#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: {
            return 1;
        }
            break;
            
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        YXHomePublicCell4 *cell = [tableView dequeueReusableCellWithIdentifier:@"YXHomePublicCell4"];
        cell.dataArr = self.dataDic[@"COMMENT_TOTAL"];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 120;

    }
    return 0;
}


@end
