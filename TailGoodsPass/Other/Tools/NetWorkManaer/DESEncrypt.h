//
//  DESEncrypt.h
//  DES测试
//
//  Created by macbook on 16/10/25.
//  Copyright © 2016年 shenyanlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DESEncrypt : NSObject
+ (DESEncrypt *)sharedDESEncryptObj;
@property (nonatomic, assign) BOOL encodeType;

//加密方法
+ (NSString *)encrytWithText:(NSString *)sText;

- (NSString *)encryptUseDES:(NSString *)plainText key:(NSString *)key;
//解密方法
+ (NSString *)decryWithText:(NSString *)sText;

- (NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key;

//获取key
+ (NSString *)getKey;

@end
