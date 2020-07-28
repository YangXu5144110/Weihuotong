//
//  YXShoppingViewModel.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/20.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXShoppingViewModel.h"
#import "YXShoppingModel.h"
#import "YXShoppingDetailsModel.h"

@interface YXShoppingViewModel ()
@end

@implementation YXShoppingViewModel


+ (void)requestDataShoppingCartNetWorking:(NSString *)OperType List:(void (^)(NSArray *,NSArray *))list Failure:(void (^)(NSError *))failure {
    
    //    http://www.4008000114.com:8099/Other/ShoppingCart.ashx?OperType=4
    NSString *urlStr = @"Other/ShoppingCart.ashx";
    NSDictionary *parameter = @{@"OperType" : OperType};
    [NetWorkManager requestForPOSTWithUrl:urlStr parameter:parameter success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
        if (SUCCESS) {
            NSDictionary *dataDic = [responseObject objectForKey:@"DATA"];
            NSMutableArray *shopArr = [NSMutableArray array];
            NSMutableArray *detailsArr = [NSMutableArray array];
          
            for (NSDictionary *dic in dataDic[@"SHOP"]) {
                YXShoppingModel *model = [YXShoppingModel mj_objectWithKeyValues:dic];
                [shopArr addObject:model];
                
                detailsArr = [YXShoppingDetailsModel mj_objectArrayWithKeyValuesArray:model.DETAILS];
//                NSLog(@"%@",detailsArr);
            }
            
            if (list) {
                list(shopArr,detailsArr);
            }
            
        }else {
        
            
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];

}

@end
