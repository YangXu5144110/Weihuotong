//
//  YXPublishTypeViewController.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/25.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger,TypeView) {
    Publish_WholesaleView,
    Publish_RetailView,
    Publish_GoodsView,
    Publish_BuyView,
    Publish_OpenShopView,

};


@interface YXPublishTypeViewController : BaseViewController

@property (nonatomic ,assign) TypeView typeView;


@end
