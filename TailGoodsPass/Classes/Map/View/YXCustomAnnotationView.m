//
//  YXCustomAnnotationView.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/15.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXCustomAnnotationView.h"
#import "YXCustomCalloutView.h"
// 默认气泡的宽度和高度
#define kCalloutWidth   220.0
#define kCalloutHeight  70.0

@interface YXCustomAnnotationView ()

@end

@implementation YXCustomAnnotationView

- (UIImageView *)pictureImage {
    if (!_pictureImage) {
        _pictureImage = [UIImageView new];
        _pictureImage.frame = CGRectMake(5, 5, 50, 50);
    }
    return _pictureImage;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel setLabelWithText:@"" fontSize:14 color:[UIColor whiteColor]];
        _titleLab.frame = CGRectMake(60, 10, 160, 15);
    }
    return _titleLab;
}

- (UILabel *)addressLab {
    if (!_addressLab) {
        _addressLab = [UILabel setLabelWithText:@"" fontSize:12 color:color_textTwo];
        _addressLab.frame = CGRectMake(60, 35, 160, 15);
    }
    return _addressLab;
}
- (UIButton *)selectBtn {
    if (!_selectBtn) {
        _selectBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _selectBtn.frame = self.calloutView.bounds;
        [_selectBtn addTarget:self action:@selector(selectBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _selectBtn;
}

#pragma mark - 点击气泡view
- (void)selectBtnClick:(UIButton *)sender {
    
    CLLocationCoordinate2D coorinate = [self.annotation coordinate];
    
    NSLog(@"coordinate = {%f, %f}", coorinate.latitude, coorinate.longitude);

    self.selectCalloutViewClick(coorinate);
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if (self.selected == selected){
        return;
    }
    
    if (selected)
    {
        if (self.calloutView == nil)
        {
            /* Construct custom callout. */
            self.calloutView = [[YXCustomCalloutView alloc] initWithFrame:CGRectMake(0, 0, kCalloutWidth, kCalloutHeight)];
            self.calloutView.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.f + self.calloutOffset.x,
                                                  -CGRectGetHeight(self.calloutView.bounds) / 2.f + self.calloutOffset.y);
            
            [self.calloutView addSubview:self.pictureImage];
            [self.calloutView addSubview:self.titleLab];
            [self.calloutView addSubview:self.addressLab];
            [self.calloutView addSubview:self.selectBtn];

        }
        
        [self addSubview:self.calloutView];
    }
    else
    {
        [self.calloutView removeFromSuperview];
    }
    
    [super setSelected:selected animated:animated];
}



#pragma mark - 点击大头针上的气泡触发事件
#pragma mark - 如不实现气泡将不可点击
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL inside = [super pointInside:point withEvent:event];
    /* Points that lie outside the receiver’s bounds are never reported as hits,
     even if they actually lie within one of the receiver’s subviews.
     This can occur if the current view’s clipsToBounds property is set to NO and the affected subview extends beyond the view’s bounds.
     */
    if (!inside && self.selected)
    {
        inside = [self.calloutView pointInside:[self convertPoint:point toView:self.calloutView] withEvent:event];
    }
    
    return inside;
}


@end
