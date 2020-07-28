//
//  YXShoppingModel.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/20.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "BaseModel.h"

@interface YXShoppingModel : BaseModel

/**
 店铺名称
 */
@property (nonatomic ,copy) NSString *SHOPNAME;

@property (nonatomic ,copy) NSArray *DETAILS;

@end
