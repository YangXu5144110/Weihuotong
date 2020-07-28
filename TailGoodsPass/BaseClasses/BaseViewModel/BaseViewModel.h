//
//  BaseViewModel.h
//  SameWorld(merchant)
//
//  Created by 杨旭 on 2017/4/18.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id responseObject);
typedef void(^ErrorBlock)(id errorCode);
@interface BaseViewModel : NSObject

@property (nonatomic, copy) SuccessBlock success;
@property (nonatomic, copy) ErrorBlock errorCode;

@end
