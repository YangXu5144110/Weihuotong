//
//  YXHomeModel.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2020/7/24.
//  Copyright © 2020 杨旭. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXHomeModel : BaseModel

@property (nonatomic ,strong) NSArray *AD_TOP;//顶部广告
@property (nonatomic ,strong) NSArray *AD_MIDDLE;//中间广告
@property (nonatomic ,strong) NSArray *PIFA; //在线批发
@property (nonatomic ,strong) NSArray *LINGSHOU;// 零售卖场
@property (nonatomic ,strong) NSArray *HUOYUAN; // 货源信息
@property (nonatomic ,strong) NSArray *BUY; // 求购信息
@property (nonatomic ,strong) NSArray *SHOP; // 商家


@end


@interface YXBalanceModel : BaseModel

@property (nonatomic ,copy) NSString *IMAGEURL;

@property (nonatomic ,copy) NSString *TITLE;

@property (nonatomic ,copy) NSString *IMAGELINK;

@end

@interface YXPiFaModel : BaseModel

/**
 商品ID
 */
@property (nonatomic ,copy) NSString *PRODUCTNO;
@property (nonatomic ,copy) NSString *TITLE;

@property (nonatomic ,copy) NSString *FIRSTIMAGE;
@property (nonatomic ,copy) NSString *SHARECONTENT;
@property (nonatomic ,copy) NSString *PRICENAME;
@property (nonatomic ,copy) NSString *NUMNAME;
@property (nonatomic ,strong) NSArray *IMAGEURL;

@end



@interface YXHuoYuanModel : BaseModel

/**
 货源ID
 */
@property (nonatomic ,copy) NSString *INVENTORYNO;

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



@interface YXBuyModel : BaseModel

@property (nonatomic ,copy) NSString *ADDRESS;
@property (nonatomic ,copy) NSString *ADDRESSNAME;
@property (nonatomic ,copy) NSString *BUYNO;
@property (nonatomic ,copy) NSString *BUYTYPENAME;
@property (nonatomic ,copy) NSString *ENDDATE;
@property (nonatomic ,copy) NSString *LEFTDATENAME;
@property (nonatomic ,copy) NSString *LEFTDATESHOW;
@property (nonatomic ,copy) NSString *NEEDREGION;
@property (nonatomic ,copy) NSString *NEEDREGIONNAME;
@property (nonatomic ,copy) NSString *NOTE;
@property (nonatomic ,copy) NSString *NUMNAME;
@property (nonatomic ,copy) NSString *PRICENAME;
@property (nonatomic ,copy) NSString *TITLE;
@property (nonatomic ,copy) NSString *TRADEMODENAME;
@property (nonatomic ,copy) NSString *UNIT;
@property (nonatomic ,copy) NSString *UNITNAME;
@end


@interface YXShopModel : BaseModel

@property (nonatomic ,copy) NSString *ADDRESSNAME;
@property (nonatomic ,copy) NSString *CREATETIME;
@property (nonatomic ,copy) NSString *CREDITLEVEL;
@property (nonatomic ,copy) NSString *CREDITSCORE;
@property (nonatomic ,copy) NSString *LOGONAME;
@property (nonatomic ,copy) NSString *PRODUCTNUMNAME;
@property (nonatomic ,copy) NSString *SALENUM;
@property (nonatomic ,copy) NSString *SALENUMNAME;
@property (nonatomic ,copy) NSString *SHOPIMAGENAME;
@property (nonatomic ,copy) NSString *SHOPNAME;
@property (nonatomic ,copy) NSString *SHOPNO;
@property (nonatomic ,copy) NSString *SHOPRUNTYPE;
@property (nonatomic ,copy) NSString *TITLE;
@property (nonatomic ,strong) NSArray *DETAIL;
@end

@interface YXShopDetailModel : BaseModel

@property (nonatomic ,copy) NSString *FIRSTIMAGE;
@property (nonatomic ,copy) NSString *MODE;
@property (nonatomic ,copy) NSString *NUM;
@property (nonatomic ,copy) NSString *PRICENAME;
@property (nonatomic ,copy) NSString *PRODUCTNO;


@end

NS_ASSUME_NONNULL_END
