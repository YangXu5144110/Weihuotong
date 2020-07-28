//
//  YXUserInfoModel.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/6.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXUserInfoModel.h"

@implementation YXUserInfoModel


//序列化,归档时系统会自动调用的方法
- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_BALANCE forKey:@"BALANCE"];
    [aCoder encodeObject:_YQCODE forKey:@"YQCODE"];
    [aCoder encodeObject:_USERNAME forKey:@"USERNAME"];
    [aCoder encodeObject:_PASSWORD forKey:@"PASSWORD"];
    [aCoder encodeObject:_PHONE forKey:@"PHONE"];
    [aCoder encodeObject:_PHOTOURL forKey:@"PHOTOURL"];

    [aCoder encodeObject:_INTEGRAL forKey:@"INTEGRAL"];
    [aCoder encodeObject:_CREDITLEVEL forKey:@"CREDITLEVEL"];
    [aCoder encodeObject:_CREATEDATE forKey:@"CREATEDATE"];

    
    [aCoder encodeObject:_SEX forKey:@"SEX"];
    [aCoder encodeObject:_QQ forKey:@"QQ"];
    [aCoder encodeObject:_EMAIL forKey:@"EMAIL"];

}

//反序列化,反归档时系统会自动调用的方法
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        
        _BALANCE = [aDecoder decodeObjectForKey:@"BALANCE"];
        _USERNAME = [aDecoder decodeObjectForKey:@"USERNAME"];
        _PASSWORD = [aDecoder decodeObjectForKey:@"PASSWORD"];
        _PHOTOURL = [aDecoder decodeObjectForKey:@"PHOTOURL"];
        _PHONE = [aDecoder decodeObjectForKey:@"PHONE"];
        _YQCODE = [aDecoder decodeObjectForKey:@"YQCODE"];
        
        
        _INTEGRAL = [aDecoder decodeObjectForKey:@"INTEGRAL"];
        _CREDITLEVEL = [aDecoder decodeObjectForKey:@"CREDITLEVEL"];
        _CREATEDATE = [aDecoder decodeObjectForKey:@"CREATEDATE"];

        _SEX = [aDecoder decodeObjectForKey:@"SEX"];
        _QQ = [aDecoder decodeObjectForKey:@"QQ"];
        _EMAIL = [aDecoder decodeObjectForKey:@"EMAIL"];

    }
    return self;
}

@end
