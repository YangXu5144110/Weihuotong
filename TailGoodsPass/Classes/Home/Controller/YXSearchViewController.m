//
//  YXSearchViewController.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/14.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXSearchViewController.h"

@interface YXSearchViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UISearchBar *search;/**搜索框*/
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) UIView *footerView;
@property (nonatomic ,strong) NSMutableArray *dataSource;
@end

@implementation YXSearchViewController

- (UIView *)footerView {
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, 44))];
        UIButton *removeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [removeBtn setTitle:@"清除搜索历史" forState:(UIControlStateNormal)];
        [removeBtn setTitleColor:color_textTwo forState:(UIControlStateNormal)];
        removeBtn.frame = _footerView.bounds;
        removeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [removeBtn addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
        [_footerView addSubview:removeBtn];
    }
    return _footerView;
}

- (void)click:(UIButton *)sender {
    [self.dataSource removeAllObjects];
    self.footerView.hidden = YES;
    [self.tableView reloadData];
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = self.footerView;
       
    }
    return _tableView;
}

- (UISearchBar *)search{
    if (!_search) {
        _search = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth-40, 25)];
        _search.placeholder = @"请输入搜索内容";
        [_search becomeFirstResponder];
        _search.showsCancelButton = YES;
        _search.returnKeyType = UIReturnKeySearch;
        _search.delegate = self;
        for (id cc in  [self.search.subviews[0] subviews]) {
            if([cc isKindOfClass:[UIButton class]]) {
                UIButton *btn = (UIButton *)cc;
                [btn setTitle:@"取消"  forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
                btn.titleLabel.font =[UIFont systemFontOfSize:14];
            }
        }
    }
    return _search;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_search becomeFirstResponder];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = self.search;
    [self.view addSubview:self.tableView];
}
- (void)backItem{
    UIButton *back = [UIButton buttonWithType:(UIButtonTypeCustom)];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
}

#pragma mark - UISearchBar Delegate
/**
 点击取消搜索的代理方法

 @param searchBar 取消按钮
 */
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}


/**
 点击搜索框的代理方法
 
 @param searchBar 搜索按钮
 */
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
   
    // 添加搜索内容
    [self.dataSource addObject:searchBar.text];
//    NSLog(@"%@",self.dataSource);
    
#pragma mark - 请求搜索结果
    //    http://www.4008000114.com:8099/MallSell/Product/SelectProduct.ashx?OperType=FQ&OrderBy=Default&PageNo=1&SubType=FQPF&TITLE=衣服
    NSString *urlStr = @"MallSell/Product/SelectProduct.ashx";
    NSDictionary *parameter = @{@"OperType":@"FQ",@"OrderBy":@"Default",@"PageNo":@"1",@"SubType":@"FQPF",@"TITLE":searchBar.text};
    [NetWorkManager requestForPOSTWithUrl:urlStr parameter:parameter success:^(id responseObject) {
        if (SUCCESS) {
            NSLog(@"%@",responseObject);
            if (self.dataSource.count == 0) {
                self.footerView.hidden = YES;
            }else {
                self.footerView.hidden = NO;
            }
        }else {
            
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1 + self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"历史搜索";
        return cell;
    }else {
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        cell.textLabel.textColor = color_textTwo;
        cell.textLabel.text = self.dataSource[indexPath.row - 1];
        return cell;
    }

    return [[UITableViewCell alloc] init];
}



@end
