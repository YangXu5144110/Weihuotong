//
//  YXMyOpenShopTableView.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/25.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXMyOpenShopTableView.h"
#import "YXPublishTypeCell.h"
#import "ZZYPhotoHelper.h"

@interface YXMyOpenShopTableView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) NSArray *titleArr;
@property (nonatomic ,strong) NSArray *contentArr;

@end

@implementation YXMyOpenShopTableView

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"店主姓名",@"手机号",@"身份证号"];
    }
    return _titleArr;
}
- (NSArray *)contentArr {
    if (!_contentArr) {
        _contentArr = @[@"必须与身份证姓名保存一致",@"请填写手机号",@"请填写正确的身份证号"];
    }
    return _contentArr;
}


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        self.delegate = self;
        
        [self registerClass:[YXPublishTypeCell1 class] forCellReuseIdentifier:@"YXPublishTypeCell1"];
        [self registerClass:[YXPublishTypeCell3 class] forCellReuseIdentifier:@"YXPublishTypeCell3"];
        [self registerClass:[YXPublishTypeCell4 class] forCellReuseIdentifier:@"YXPublishTypeCell4"];
    }
    return self;
}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return self.titleArr.count + 1;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 ) {
        if (indexPath.row == 0) {
            YXPublishTypeCell3 *cell = [tableView dequeueReusableCellWithIdentifier:@"YXPublishTypeCell3" forIndexPath:indexPath];
            cell.titleLab.text = @"店铺LOGO";
            cell.imageBtn2.hidden = YES;
            
           YXWeakCell
           cell.selectImageBlock = ^(NSInteger index) {
                [[ZZYPhotoHelper shareHelper] showImageViewSelcteWithResultBlock:^(id data) {
//                       self.imageView.image = (UIImage *)data;
                    [weakCell.imageBtn1 setBackgroundImage:(UIImage *)data forState:(UIControlStateNormal)];
                    [self reloadData];
                }];
            };
            
            return cell;
        }else {
            YXPublishTypeCell4 *cell = [tableView dequeueReusableCellWithIdentifier:@"YXPublishTypeCell4" forIndexPath:indexPath];
            cell.titleLab.text = @"经营范围";
            return cell;
        }
        
    }else {
        if (indexPath.row == 3) {
            YXPublishTypeCell3 *cell = [tableView dequeueReusableCellWithIdentifier:@"YXPublishTypeCell3" forIndexPath:indexPath];
            cell.titleLab.text = @"身份证";
            
            YXWeakCell
            [cell setSelectImageBlock:^(NSInteger index){
                [[ZZYPhotoHelper shareHelper] showImageViewSelcteWithResultBlock:^(id data) {
                    if (index == 0) {
                        
                        [weakCell.imageBtn1 setBackgroundImage:(UIImage *)data forState:(UIControlStateNormal)];
                        
                    }else {
                        
                        [weakCell.imageBtn2 setBackgroundImage:(UIImage *)data forState:(UIControlStateNormal)];
                    }
                    
                }];
                
            }];
            
            return cell;
        }
        YXPublishTypeCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"YXPublishTypeCell1" forIndexPath:indexPath];
        cell.titleLab.text = self.titleArr[indexPath.row];
        cell.contentTF.placeholder = self.contentArr[indexPath.row];
        return cell;
    }

    return [[UITableViewCell alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return indexPath.row == 1 ? 70 : 80;
    }else {
         return indexPath.row == 3 ? 70 : 30 ;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *title =  @[@"店铺信息",@"个人信息"];
    return title[section];
}

@end
