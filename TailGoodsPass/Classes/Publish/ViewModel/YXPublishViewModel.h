//
//  YXPublishViewModel.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/23.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "BaseViewModel.h"

@interface YXPublishViewModel : BaseViewModel



/**
 请求发布列表接口

 @param list        我要开店数据
 @param failure     失败回调
 */
+ (void)requestDataPublishNetWorking:(void (^)(NSArray *shops))list Failure:(void (^)(NSError *))failure;
@end
