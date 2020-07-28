//
//  YXCityListModel.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/13.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "BaseModel.h"

@interface YXCityListModel : BaseModel

@property (nonatomic ,copy) NSString *CODEID;
@property (nonatomic ,copy) NSString *CODENAME;
@property (nonatomic ,copy) NSString *CID;
@property (nonatomic ,copy) NSString *CNAME;

@property (nonatomic ,strong) NSArray *CITYS;

@end
