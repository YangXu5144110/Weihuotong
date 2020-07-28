//
//  YXShoppingDetailsModel.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/20.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "BaseModel.h"

@interface YXShoppingDetailsModel : BaseModel

/**
 标题
 */
@property (nonatomic ,copy) NSString *TITLE;
/**
 价格
 */
@property (nonatomic ,copy) NSString *PRICE;
/**
 数量
 */
@property (nonatomic ,copy) NSString *NUM;

/**
 颜色和尺寸
 */
@property (nonatomic ,copy) NSString *NOTE;

/**
 图片
 */
@property (nonatomic ,copy) NSString *FIRSTIMAGE;

@end
