//
//  YXPublishViewModel.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/23.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXPublishViewModel.h"

@implementation YXPublishViewModel

+ (void)requestDataPublishNetWorking:(void (^)(NSArray *shops))list Failure:(void (^)(NSError *))failure {
    
//    http://www.4008000114.com:8099/Mall/Publish.ashx?OperType=All
    NSString *urlStr = @"Mall/Publish.ashx";
    NSDictionary *partemter = @{@"OperType":@"All"};
    [NetWorkManager requestForPOSTWithUrl:urlStr parameter:partemter success:^(id responseObject) {
        if (SUCCESS) {
            
            
            
        }else {
        
        }
        
    } failure:^(NSError *error) {
        
    }];
}


@end