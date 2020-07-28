//
//  YXHomeReleaseTableView.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/18.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXHomeReleaseTableView : UITableView

@property (nonatomic ,strong) NSDictionary *dataDic;


@property (nonatomic ,copy)void(^selectClick)(NSInteger index);

@end
