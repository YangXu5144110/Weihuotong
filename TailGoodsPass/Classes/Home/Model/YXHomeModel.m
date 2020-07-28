//
//  YXHomeModel.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2020/7/24.
//  Copyright © 2020 杨旭. All rights reserved.
//

#import "YXHomeModel.h"
@implementation YXHomeModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"AD_TOP" : [YXBalanceModel class],
             @"AD_MIDDLE" :[YXBalanceModel class],
             @"PIFA" : [YXPiFaModel class],
             @"LINGSHOU" : [YXPiFaModel class],
             @"HUOYUAN" : [YXHuoYuanModel class],
             @"BUY" : [YXBuyModel class],
             @"SHOP" : [YXShopModel class],

    };
}

@end

@implementation YXBalanceModel


@end

@implementation YXPiFaModel


@end


@implementation YXHuoYuanModel


@end

@implementation YXBuyModel


@end


@implementation YXShopModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"DETAIL" : [YXShopDetailModel class]};
}

@end

@implementation YXShopDetailModel


@end
