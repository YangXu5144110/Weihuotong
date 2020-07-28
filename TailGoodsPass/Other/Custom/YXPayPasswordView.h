//
//  YXPayPasswordView.h
//  MushroomRider
//
//  Created by 李小朋 on 2017/7/1.
//  Copyright © 2017年 Yang Xu. All rights reserved.
//

#import "BaseView.h"

@interface YXPayPasswordView : BaseView

@property (nonatomic ,copy)void(^payPasswordBlock)(NSString *password);
@property (nonatomic ,strong) UILabel *titleLabel;

@end
