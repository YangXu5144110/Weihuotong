//
//  DESEncrypt.m
//  DES测试
//
//  Created by macbook on 16/10/25.
//  Copyright © 2016年 shenyanlong. All rights reserved.
//

#import "DESEncrypt.h"
#import <CommonCrypto/CommonCrypto.h>

#define keykey @"2016-10-29 15:20"
@implementation DESEncrypt
DESEncrypt *encryptObj = nil;
+ (DESEncrypt *)sharedDESEncryptObj{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!encryptObj) {
            encryptObj = [[DESEncrypt alloc] init];
        }
    });
    return encryptObj;
}
+ (NSString *)encrytWithText:(NSString *)sText
{
    return [[self sharedDESEncryptObj] encryptUseDES:sText key:[self getKey]];
//    return [self encryptUseDES:sText key:[self getKey]];
}

+ (NSString *)decryWithText:(NSString *)sText
{
    return [[self sharedDESEncryptObj] decryptUseDES:sText key:[self getKey]];
//    return [self decryptUseDES:sText key:[self getKey]];
}



const Byte iv[] = {1,2,3,4,5,6,7,8};

#pragma mark- 加密算法

-(NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key
{
    NSString *ciphertext = nil;

    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);

    NSData *textData;
    if ([DESEncrypt sharedDESEncryptObj].encodeType) {
        textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    }else{
        textData = [plainText dataUsingEncoding:enc];
    }
    NSUInteger dataLength = [textData length];

    size_t bufferSize = dataLength + kCCBlockSizeDES;
    
    // 更改
//    unsigned char buffer[bufferSize];
//    memset(buffer, 0, sizeof(char));

    void *buffer = malloc(bufferSize);

    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          [textData bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        
//        ciphertext = [Base64 encode:data];
        ciphertext = [DESEncrypt convertDataToHexStr:data];
    }
    free(buffer);
    return ciphertext;
}
//NSData转成16进制
+ (NSString *)convertDataToHexStr:(NSData *)data
{
    if (!data || [data length] == 0) {
        return @"";
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    [data enumerateByteRangesUsingBlock:^(const void * _Nonnull bytes, NSRange byteRange, BOOL * _Nonnull stop) {
       
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++)
        {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i])&0xff];
            if ([hexStr length] == 2)
            {
                [string appendString:hexStr];
            }
            else
            {
                [string appendFormat:@"0%@", hexStr];
            }
        }
        
    }];
    return string;
}
//16进制字符串转换成NSData
+ (NSMutableData *)convertHexStrToData:(NSString *)str
{
    if (!str || [str length] == 0) {
        return nil;
    }
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    }
    else
    {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [str length]; i+=2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        range.location += range.length;
        range.length = 2;
    }
    return hexData;
}

#pragma mark- 解密算法
-(NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key
{
    NSString *plaintext = [NSString string];
//    NSData *cipherdata = [Base64 decode:cipherText];
    NSData *cipherdata = [DESEncrypt convertHexStrToData:cipherText];
    
    NSUInteger dataLength = [cipherdata length];
    size_t bufferSize = dataLength + kCCBlockSizeDES;
    void *buffer = malloc(bufferSize);

    size_t numBytesDecrypted = 0;
    
    // kCCOptionPKCS7Padding|kCCOptionECBMode 最主要在这步
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          [cipherdata bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if(cryptStatus == kCCSuccess) {
        NSData *plaindata = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
        if ([DESEncrypt sharedDESEncryptObj].encodeType) {
            plaintext = [[NSString alloc] initWithData:plaindata encoding:NSUTF8StringEncoding];
        }else{
            plaintext = [[NSString alloc] initWithData:plaindata encoding:enc];
        }
        if (!plaintext) {
            [DESEncrypt sharedDESEncryptObj].encodeType = ![DESEncrypt sharedDESEncryptObj].encodeType;
            plaintext = [self decryptUseDES:cipherText key:key];
        }
    }
    free(buffer);
    return plaintext;
}

+ (NSString *)getKey
{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
////    NSLog(@"%@", dateString);
//    
//    //转换为byte数组
//    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(NSUTF16BigEndianStringEncoding);
//    NSData *data = [dateString dataUsingEncoding:enc];
//    Byte *byte = (Byte *)[data bytes];
//    
//    Byte arr[8] = {0};
//    
//    for (int i = 0; i < [data length] && i < sizeof(arr); i++) {
//        //        NSLog(@"byte = %d", byte[i]);
//        arr[i] = byte[i];
////        NSLog(@"arr[%d] = %d", i, arr[i]);
//    }
////    NSLog(@"%d", byte[data.length - 1]);
//   // arr[0] = byte[data.length - 1];
//    
////    for (int i = 0; i < sizeof(arr); i++) {
////        NSLog(@"arr[%d] = %d-----", i, arr[i]);
////    }
//    NSData *mdata = [[NSData alloc] initWithBytes:arr length:8];
//    NSString *aString = [[NSString alloc] initWithData:mdata encoding:NSUTF8StringEncoding];
//    return aString;
    return dateString;
}



@end
