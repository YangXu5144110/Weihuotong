//
//  YXHomeViewModel.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2020/7/24.
//  Copyright © 2020 杨旭. All rights reserved.
//

#import "BaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXHomeViewModel : BaseViewModel

/**
请求首页列表接口

@param success         返回成功
@param failure         返回失败
*/
+ (void)queryHomePageWithSuccess:(SuccessBlock)success
                         failure:(ErrorBlock)failure;


@end

NS_ASSUME_NONNULL_END
