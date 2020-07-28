//
//  JudgeMobileNumber.h
//  ShangPinFamily
//
//  Created by mac2 on 16/9/9.
//  Copyright © 2016年 shenyanlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JudgeMobileNumber : NSObject
+ (NSString *)valiMobile:(NSString *)mobile;
+ (BOOL)deptNameInputShouldChineseWithText:(NSString *)text;
+ (BOOL)isEnglishFirst:(NSString *)str;
@end
