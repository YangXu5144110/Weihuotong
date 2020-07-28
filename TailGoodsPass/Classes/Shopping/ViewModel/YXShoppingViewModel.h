//
//  YXShoppingViewModel.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/20.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "BaseViewModel.h"

@interface YXShoppingViewModel : BaseViewModel


/**
 获取购物车列表接口

 @param OperType    参数
 @param list        成功回调
 @param failure     失败回调
 */
+ (void)requestDataShoppingCartNetWorking:(NSString *)OperType List:(void (^)(NSArray *shops,NSArray *details))list Failure:(void (^)(NSError *))failure;

@end
