//
//  YXHuoYuanModel.h
//  TailGoodsPass
//
//  Created by 李小朋 on 2017/9/4.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "BaseModel.h"

@interface YXHuoYuanModel : BaseModel

/**
 地址
 */
@property (nonatomic ,copy) NSString *ADDRESSNAME;

/**
 可批发
 */
@property (nonatomic ,copy) NSString *DEALMODENAME;

/**
 图片
 */
@property (nonatomic ,copy) NSString *FIRSTIMAGE;

/**
 库存量
 */
@property (nonatomic ,copy) NSString *NUMNAME;

/**
 价格
 */
@property (nonatomic ,copy) NSString *PRICENAME;

/**
 标题
 */
@property (nonatomic ,copy) NSString *TITLE;

/**
 分类
 */
@property (nonatomic ,copy) NSString *INVENTORYTYPENAME;

@end
