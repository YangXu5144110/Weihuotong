//
//  YXScreeningButton.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/23.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXScreeningButton : UIButton

@property (nonatomic ,strong) NSString *shang;
@property (nonatomic ,strong) NSString *xia;
@property (nonatomic ,strong) NSString *xia_L;


- (void)setShang:(NSString *)shang;
- (void)setXia:(NSString *)xia;
- (void)setXia_L:(NSString *)xia_L;
@end
