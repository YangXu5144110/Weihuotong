//
//  BXUserInfoManager.h
//  MushroomTake_out
//
//  Created by 同城天下 on 2017/5/5.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXUserInfoModel.h"

@interface BXUserInfoManager : NSObject

+ (BXUserInfoManager *) shareUserInfoManager;

/**  修改用户信息 */
+ (void)resetUserInfoMessageWithDic:(NSDictionary *)dic;
/** 保存用户信息 */
+ (void)saveUserInfoWithModel:(YXUserInfoModel *)entity;
/** 清空用户信息 */
+ (void)cleanUserInfo;
/** 获取用户信息 */
+ (YXUserInfoModel *)getUserInfo;
/** 判断用户登录状态 */
+ (BOOL)isLoad;

@end
