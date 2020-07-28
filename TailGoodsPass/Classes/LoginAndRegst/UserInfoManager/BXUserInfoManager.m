//
//  BXUserInfoManager.m
//  MushroomTake_out
//
//  Created by 同城天下 on 2017/5/5.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "BXUserInfoManager.h"

#define KEY @"USERINFO"

static YXUserInfoModel *userInfoModel = nil;

@implementation BXUserInfoManager

+ (BXUserInfoManager *)shareUserInfoManager {
    static BXUserInfoManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[BXUserInfoManager alloc] init];
    });
    return manager;
}


/** 保存用户信息 */
+ (void)saveUserInfoWithModel:(YXUserInfoModel *)entity {
    //NSUserDefaults 继承于NSObject, 单例模式设计, 存储信息采用键值对的形式
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:entity];
    //存数据
    [userDefault setObject:data forKey:KEY];
    //NSUserDefaults, 不是立即写入,写完之后需要同步一下
    [userDefault synchronize];
    
}
/** 清空用户信息 */
+ (void)cleanUserInfo {
    
    //创建对象
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    //移除数据
    [userDefault removeObjectForKey:KEY];
    //同步
    [userDefault synchronize];
    
    userInfoModel = nil;
    
}
/** 获取用户信息 */
+ (YXUserInfoModel *)getUserInfo {
    
    //判断之前是否去过,如果去过,直接返回,如果没有,从沙盒中读取
    if (!userInfoModel) {
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        //获取用户信息
        NSData *data = [userDefault objectForKey:KEY];
        //判断是否有值
        if (data) {
            
            userInfoModel = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        } else {
            
            userInfoModel = nil;
        }
        
    }
    
    return userInfoModel;
    
    
}
/** 判断用户登录状态 */
+ (BOOL)isLoad {
    
    if ([BXUserInfoManager  getUserInfo] == nil) {
        return NO;
    } else {
        return YES;
    }
  
}

/**  修改用户信息 */
+ (void)resetUserInfoMessageWithDic:(NSDictionary *)dic {
    
    YXUserInfoModel *model = [BXUserInfoManager getUserInfo];
    NSString *key = [dic allKeys].firstObject;
//    if ([key isEqualToString:kHeaderPic]) {
//        model.pic = dic[@"pic"];
//        
//    }
//    if ([key isEqualToString:kRealName]) {
//        model.realName = dic[@"realName"];
//        
//    }
//    if ([key isEqualToString:kPASSWOED]) {
//        model.loginPwd = dic[@"loginPwd"];
//        
//    }
//    if ([key isEqualToString:kUserAddress]) {
//        model.address = dic[@"address"];
//        
//    }
//    if ([key isEqualToString:kPHONE]) {
//        model.phone = dic[@"phone"];
//
//    }
//    if ([key isEqualToString:kBalance]) {
//        model.balance = dic[@"balance"];
//        
//    }
//    if ([key isEqualToString:kRiderWorkState]) {
//        model.workState = dic[@"riderWorkState"];
//        
//    }
    
    [BXUserInfoManager saveUserInfoWithModel:model];
    
//    NSLog(@"%@------%@", model.workState, [self getUserInfo].workState);
    
}
@end
