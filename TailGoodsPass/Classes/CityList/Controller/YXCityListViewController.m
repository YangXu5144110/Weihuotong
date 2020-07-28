//
//  YXCityListViewController.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/13.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXCityListViewController.h"
#import "CityCollectionCell.h"
#import "CityListSectionHeaderView.h"
#import "YXCityListModel.h"
@interface YXCityListViewController ()<UISearchBarDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic ,strong) UICollectionView *collectionView;


/** 数据源*/
@property (nonatomic ,strong) NSMutableArray *dataArr;
/** 存储索引字母数据*/
@property (nonatomic ,strong) NSMutableArray *alphabetArr;
/** 存储省份数据*/
@property (nonatomic ,strong) NSMutableArray *dataSource;
/** 存储历史访问目的地数据*/
@property (nonatomic ,strong) NSMutableArray *citysArr;

@property (nonatomic ,strong) NSMutableArray *tempArr;
@end

@implementation YXCityListViewController

- (NSMutableArray *)citysArr {
    if (!_citysArr) {
        _citysArr = [NSMutableArray array];
    }
    return _citysArr;
}

- (NSMutableArray *)tempArr {
    if (!_tempArr) {
        _tempArr = [NSMutableArray array];
    }
    return _tempArr;
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (NSMutableArray *)alphabetArr {
    if (!_alphabetArr) {
        _alphabetArr = [NSMutableArray array];
    }
    return _alphabetArr;
}


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake((kScreenWidth - 10 * 5) /4 , 30);
        flowLayout.minimumLineSpacing = 10 ;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.headerReferenceSize = CGSizeMake(0, 30);// 宽度默认会给CollectionView的宽度
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        // 注册item
        [self.collectionView registerNib:[UINib nibWithNibName:@"CityCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"CityCollectionCell"];
        
        // 注册header
        [self.collectionView registerNib:[UINib nibWithNibName:@"CityListSectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CityListSectionHeaderView"];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"城市列表";
    
    [self requestDataCityList];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
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

- (void)requestDataCityList {
        
    //城市列表
//    http://www.4008000114.com:8099/HomePage/Citys.ashx?Method=ONEKEY
    NSString *urlStr = @"HomePage/Citys.ashx";
    NSDictionary *parameter = @{@"Method":@"ONEKEY"};
    [NetWorkManager requestForPOSTWithUrl:urlStr parameter:parameter success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
        if (SUCCESS) {
             self.dataArr = [responseObject objectForKey:@"DATA"];
            // 获取索引字母
            for (NSDictionary *dic in  self.dataArr) {
                NSString *alphabet = dic[@"ALPHABET"];
                [self.alphabetArr addObject:alphabet];
            }
    
            for (NSDictionary *dic in  self.dataArr) {
//                NSLog(@"%ld",[dic[@"CITYS"] count]);
                [self.dataSource addObject:dic[@"CITYS"]];
                
//                self.tempArr = [YXCityListModel mj_objectArrayWithKeyValuesArray:dic[@"CITYS"]];
//                NSLog(@"%@",self.tempArr);
                
            }
            
        
        }else {
            
        }
        
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);

    }];
    
}

#pragma mark - UICollectionViewDataSource -
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 3  + self.dataArr.count;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return self.citysArr.count;
    }else if (section == 2){
        return self.alphabetArr.count;
    }else {
//        NSLog(@"%lu",(unsigned long)[self.dataArr[section - 3] count]);
        return [self.dataSource[section - 3] count];
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CityCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CityCollectionCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    

    if (indexPath.section == 0) {
        
        cell.cityNameLabel.text = self.currentCity;
        
    }else if (indexPath.section == 1){
        cell.cityNameLabel.text = self.citysArr[indexPath.row];
    }else if (indexPath.section == 2){
        cell.cityNameLabel.text = self.alphabetArr[indexPath.row];
    }else{
     
        NSArray *list = self.dataSource[indexPath.section - 3];
//        NSLog(@"%@",list);
        list = [YXCityListModel mj_objectArrayWithKeyValuesArray:list];
        cell.model = list[indexPath.row];
        
    }
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){// 页眉
        
        CityListSectionHeaderView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CityListSectionHeaderView" forIndexPath:indexPath];
        
        NSString *name;
        
        if (indexPath.section == 0) {
            name = @"您所在的地区";
        }else if (indexPath.section == 1){
            name = @"历史访问目的地";
        }else if(indexPath.section == 2){
            name = @"快速定位";
        }else{
            name = self.alphabetArr[indexPath.section - 3];
        }
        
        headerView.headerNameLabel.text = name;
        
        return headerView;
    }
    return nil;
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) { // 当前城市
        [self.navigationController popViewControllerAnimated:YES];
    }else if(indexPath.section == 1){
        [self.navigationController popViewControllerAnimated:YES];
    }else if(indexPath.section == 2){ // 快速定位
        
        [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:(indexPath.row + 3)] atScrollPosition:(UICollectionViewScrollPositionTop) animated:YES];
        
    }else{ // 选择城市
        
        NSArray *list = self.dataSource[indexPath.section - 3];
        list = [YXCityListModel mj_objectArrayWithKeyValuesArray:list];
        YXCityListModel *model = list[indexPath.row];
        self.selectCityBlock(model.CODENAME);
        [self.citysArr addObject:model.CODENAME];
        NSLog(@"%@",self.citysArr);
        [self.collectionView reloadData];
//        [self.navigationController popViewControllerAnimated:YES];

    }
    
    
}


@end
