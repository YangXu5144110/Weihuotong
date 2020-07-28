//
//  YXHomeTypeViewController.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/5.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger,TypeView) {
    Home_SnapView,   //最后疯抢
    Home_PiFaView,  //在线批发
    Home_LingShouView, //零售卖场
    Home_HuoYuanView, //货源信息
    Home_QiuGouView, //求购信息
    Home_ShopView, //商家
};

@interface YXHomeTypeViewController : BaseViewController

@property (nonatomic ,assign) TypeView typeView;


@end
