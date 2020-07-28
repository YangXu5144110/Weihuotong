//
//  BaseModel.m
//  ShangPinJiaZu
//
//  Created by macbook on 16/10/26.
//  Copyright © 2016年 yangzhihao. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
- (void)setNilValueForKey:(NSString *)key{
    
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

+(NSDictionary *)mj_replacedKeyFromPropertyName {
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"ID":@"id"
             
             };
}



@end
