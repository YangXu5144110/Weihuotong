//
//  YXCustomAnnotationView.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/15.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
@interface YXCustomAnnotationView : MAAnnotationView

@property (nonatomic ,strong) UIView *calloutView; //气泡

@property (nonatomic ,strong) UIImageView *pictureImage;
@property (nonatomic ,strong) UILabel *titleLab;
@property (nonatomic ,strong) UILabel *addressLab;
@property (nonatomic ,strong) UIButton *selectBtn;


@property (nonatomic ,copy) void(^selectCalloutViewClick)(CLLocationCoordinate2D coorinate);

@end
