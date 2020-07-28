//
//  YXHomeViewModel.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2020/7/24.
//  Copyright © 2020 杨旭. All rights reserved.
//

#import "YXHomeViewModel.h"

@implementation YXHomeViewModel


+ (void)queryHomePageWithSuccess:(SuccessBlock)success
                         failure:(ErrorBlock)failure {

    //    http://www.4008000114.com:8099/HomePage/Index.ashx
    NSString *urlStr = @"HomePage/Index.ashx";
    [NetWorkManager requestForPOSTWithUrl:urlStr parameter:nil success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
    
}


@end
