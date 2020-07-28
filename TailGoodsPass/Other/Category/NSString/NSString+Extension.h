//
//  NSString+Extension.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2020/7/24.
//  Copyright © 2020 杨旭. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)
#pragma mark -- 调取MD5加密
- (NSString *)passwordToMD5:(NSString *)password;

#pragma mark - 判断手机号
- (NSString *)valiMobile:(NSString *)mobile;
@end

NS_ASSUME_NONNULL_END
