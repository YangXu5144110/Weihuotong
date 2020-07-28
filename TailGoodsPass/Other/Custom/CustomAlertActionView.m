//
//  CustomAlertActionView.m
//  SameWorld
//
//  Created by 杨旭 on 2017/3/20.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "CustomAlertActionView.h"

// 定义alertView 宽
#define AlertW  280

// 定义各个栏目之间的距离
#define Spce 10.0

// 定义提示弹框的时间
#define k_AlertTypeNotButtonTime 1.8

@interface CustomAlertActionView ()
/**
 *  弹窗
 */
@property (nonatomic ,strong) UIView *alertView;

/**
 *  title
 */
@property (nonatomic ,strong) UILabel *titleLbl;

/**
 *  内容
 */
@property (nonatomic ,strong) UILabel *msgLbl;

/**
 *  确认按钮
 */
@property (nonatomic ,strong) UIButton *sureBtn;

/**
 *  取消按钮
 */
@property (nonatomic ,strong) UIButton *cancleBtn;

/**
 *  横线
 */
@property (nonatomic ,strong) UIView *lineView;

/**
 *  竖线
 */
@property (nonatomic ,strong) UIView *verLineView;


@property (nonatomic ,assign) AlertViewType type;
@property (nonatomic ,strong) UIView *rootView;
@property (nonatomic ,strong) UIView *rootAlertView;
@property (nonatomic ,strong) UILabel *titleLabel;

@end

@implementation CustomAlertActionView


#pragma mark - 选择弹框-
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle {
    
    if (self == [super init]) {
        
        self.frame = [UIScreen mainScreen].bounds;
        
        self.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.6];
        
        self.alertView = [[UIView alloc] init];
        self.alertView.backgroundColor = [UIColor whiteColor];
        self.alertView.layer.cornerRadius = 10.0;
        
        if (title) {
            
            self.titleLbl = [self GetAdaptiveLabel:CGRectMake(2*Spce, 2*Spce, AlertW-4*Spce, 20) AndText:title andIsTitle:YES];
            self.titleLbl.textAlignment = NSTextAlignmentCenter;
            
            [self.alertView addSubview:self.titleLbl];
            
            CGFloat titleW = self.titleLbl.bounds.size.width;
            CGFloat titleH = self.titleLbl.bounds.size.height;
            
            self.titleLbl.frame = CGRectMake((AlertW-titleW)/2, 2*Spce, titleW, titleH);
            
        }
        if (message) {
            
            self.msgLbl = [self GetAdaptiveLabel:CGRectMake(Spce, CGRectGetMaxY(self.titleLbl.frame)+Spce, AlertW-2*Spce, 20) AndText:message andIsTitle:NO];
            self.msgLbl.textAlignment = NSTextAlignmentCenter;
            
            [self.alertView addSubview:self.msgLbl];
            
            CGFloat msgW = self.msgLbl.bounds.size.width;
            CGFloat msgH = self.msgLbl.bounds.size.height;
            
            self.msgLbl.frame = self.titleLbl?CGRectMake((AlertW-msgW)/2, CGRectGetMaxY(self.titleLbl.frame)+Spce, msgW, msgH):CGRectMake((AlertW-msgW)/2, 2*Spce, msgW, msgH);
        }
        
        self.lineView = [[UIView alloc] init];
        self.lineView.frame = self.msgLbl?CGRectMake(0, CGRectGetMaxY(self.msgLbl.frame)+2*Spce, AlertW, 1):CGRectMake(0, CGRectGetMaxY(self.titleLbl.frame)+2*Spce, AlertW, 1);
        self.lineView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.6];
        [self.alertView addSubview:self.lineView];
        
        //两个按钮
        if (cancleTitle && sureTitle) {
            
            self.cancleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            self.cancleBtn.frame = CGRectMake(0, CGRectGetMaxY(self.lineView.frame), (AlertW-1)/2, 40);
            [self.cancleBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2]] forState:UIControlStateNormal];
            [self.cancleBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2]] forState:UIControlStateSelected];
            [self.cancleBtn setTitle:cancleTitle forState:UIControlStateNormal];
            //[self.cancleBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            self.cancleBtn.tag = 1;
            [self.cancleBtn addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
            
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.cancleBtn.bounds byRoundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(5.0, 5.0)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = self.cancleBtn.bounds;
            maskLayer.path = maskPath.CGPath;
            self.cancleBtn.layer.mask = maskLayer;
            
            [self.alertView addSubview:self.cancleBtn];
        }
        
        if (cancleTitle && sureTitle) {
            self.verLineView = [[UIView alloc] init];
            self.verLineView.frame = CGRectMake(CGRectGetMaxX(self.cancleBtn.frame), CGRectGetMaxY(self.lineView.frame), 1, 40);
            self.verLineView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.6];
            [self.alertView addSubview:self.verLineView];
        }
        
        if(sureTitle && cancleTitle){
            
            self.sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            self.sureBtn.frame = CGRectMake(CGRectGetMaxX(self.verLineView.frame), CGRectGetMaxY(self.lineView.frame), (AlertW-1)/2+1, 40);
            [self.sureBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2]] forState:UIControlStateNormal];
            [self.sureBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2]] forState:UIControlStateSelected];
            [self.sureBtn setTitle:sureTitle forState:UIControlStateNormal];
            //[self.sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.sureBtn.tag = 2;
            [self.sureBtn addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
            
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.sureBtn.bounds byRoundingCorners:UIRectCornerBottomRight cornerRadii:CGSizeMake(5.0, 5.0)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = self.sureBtn.bounds;
            maskLayer.path = maskPath.CGPath;
            self.sureBtn.layer.mask = maskLayer;
            
            [self.alertView addSubview:self.sureBtn];
            
        }
        
        //只有取消按钮
        if (cancleTitle && !sureTitle) {
            
            self.cancleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            self.cancleBtn.frame = CGRectMake(0, CGRectGetMaxY(self.lineView.frame), AlertW, 40);
            [self.cancleBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2]] forState:UIControlStateNormal];
            [self.cancleBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2]] forState:UIControlStateSelected];
            [self.cancleBtn setTitle:cancleTitle forState:UIControlStateNormal];
            //[self.cancleBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            self.cancleBtn.tag = 1;
            [self.cancleBtn addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
            
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.cancleBtn.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(5.0, 5.0)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = self.cancleBtn.bounds;
            maskLayer.path = maskPath.CGPath;
            self.cancleBtn.layer.mask = maskLayer;
            
            [self.alertView addSubview:self.cancleBtn];
        }
        
        //只有确定按钮
        if(sureTitle && !cancleTitle){
            
            self.sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            self.sureBtn.frame = CGRectMake(0, CGRectGetMaxY(self.lineView.frame), AlertW, 40);
            [self.sureBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2]] forState:UIControlStateNormal];
            [self.sureBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2]] forState:UIControlStateSelected];
            [self.sureBtn setTitle:sureTitle forState:UIControlStateNormal];
            //[self.sureBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            self.sureBtn.tag = 2;
            [self.sureBtn addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
            
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.sureBtn.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(5.0, 5.0)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = self.sureBtn.bounds;
            maskLayer.path = maskPath.CGPath;
            self.sureBtn.layer.mask = maskLayer;
            
            [self.alertView addSubview:self.sureBtn];
            
        }
        
        //计算高度
        CGFloat alertHeight = cancleTitle?CGRectGetMaxY(self.cancleBtn.frame):CGRectGetMaxY(self.sureBtn.frame);
        self.alertView.frame = CGRectMake(0, 0, AlertW, alertHeight);
        self.alertView.layer.position = self.center;
        
        [self addSubview:self.alertView];
    }
    
    return self;
}

#pragma mark - 弹出 -
- (void)showCostomAlertView {
    
    UIWindow *rootWindow = [UIApplication sharedApplication].keyWindow;
    [rootWindow addSubview:self];
    [self creatShowAnimation];
}

- (void)creatShowAnimation {
    
    self.alertView.layer.position = self.center;
    self.alertView.transform = CGAffineTransformMakeScale(0.90, 0.90);
    [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
        self.alertView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - 回调 -设置只有2  -- > 确定才回调
- (void)buttonEvent:(UIButton *)sender {
    
    if (sender.tag == 2) {
        if (self.resultIndex) {
            self.resultIndex(sender.tag);
        }
    }
    [self removeFromSuperview];
}

// 封装label
- (UILabel *)GetAdaptiveLabel:(CGRect)rect AndText:(NSString *)contentStr andIsTitle:(BOOL)isTitle {
    
    UILabel *contentLbl = [[UILabel alloc] initWithFrame:rect];
    contentLbl.numberOfLines = 0;
    contentLbl.text = contentStr;
    contentLbl.textAlignment = NSTextAlignmentCenter;
    if (isTitle) {
        contentLbl.font = [UIFont boldSystemFontOfSize:16.0];
    }else{
        contentLbl.font = [UIFont systemFontOfSize:14.0];
    }
    
    NSMutableAttributedString *mAttrStr = [[NSMutableAttributedString alloc] initWithString:contentStr];
    NSMutableParagraphStyle *mParaStyle = [[NSMutableParagraphStyle alloc] init];
    mParaStyle.lineBreakMode = NSLineBreakByCharWrapping;
    [mParaStyle setLineSpacing:3.0];
    [mAttrStr addAttribute:NSParagraphStyleAttributeName value:mParaStyle range:NSMakeRange(0, [contentStr length])];
    [contentLbl setAttributedText:mAttrStr];
    [contentLbl sizeToFit];
    
    return  contentLbl;
}

- (UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


#pragma mark - 提示弹框 -
- (instancetype)initWithViewType:(AlertViewType)type {
    
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        self.backgroundColor = [UIColor clearColor];
        self.rootView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.rootView.backgroundColor = [UIColor blackColor];
        [self addSubview:self.rootView];
        switch (type) {
            case AlertTypes:{
                //                self.rootAlertView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, k_alerViewWitch, k_alerViewHeight)];
                //                self.rootAlertView.backgroundColor = [UIColor whiteColor];
                //                self.rootAlertView.center = self.rootView.center;
                //                self.rootAlertView.layer.masksToBounds = YES;
                //                self.rootAlertView.layer.cornerRadius = 15.0;
            }
                break;
            case ActionSheetType:{
                //                self.rootSheetView = [[UIView alloc]initWithFrame:CGRectMake(0, self.rootView.frame.size.height, self.rootView.frame.size.width, 0)];
                //                self.rootAlertView.backgroundColor = [UIColor clearColor];
                //                [self addSubview:_rootSheetView];
            }
                break;
            case AlertTypeNotButton:{
                self.rootAlertView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
                self.rootAlertView.backgroundColor = [UIColor blackColor];
                self.rootAlertView.center = self.rootView.center;
                self.rootAlertView.layer.masksToBounds = YES;
                self.rootAlertView.layer.cornerRadius = 5.0;
            }
                break;
            default:
                break;
        }
        self.type = type;
    }
    return self;
    
    
}


#pragma mark - show
- (void)show {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [self setTypesss:_type];
    [window addSubview:self];
}

#pragma mark - setTypesss
- (void)setTypesss:(AlertViewType)type {
    switch (type) {
        case AlertTypes:{
            //            [self showAlertViewAnimationReduce:self.rootAlertView];
            //            [self addSubview:self.rootAlertView];
        }
            break;
        case ActionSheetType:{
            //            [self showSheetViewAction:nil];
        }
            break;
        case AlertTypeNotButton:{
            [self showAlertViewAnimationReduce:self.rootAlertView];
            [self addSubview:self.rootAlertView];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(k_AlertTypeNotButtonTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self showAlertViewAnimationIncrease:self.rootAlertView];
            });
        }
            break;
        default:
            break;
    }
}

#pragma mark - setTitle
- (void)setTitle:(NSString *)title {
    _title = title;
    switch (_type) {
        case AlertTypes:{
            //            _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 10, self.rootAlertView.frame.size.width - 10, self.rootAlertView.frame.size.height / 5.0 * 1)];
            //            _titleLabel.text = title;
            //            _titleLabel.font = [UIFont systemFontOfSize:17];
            //            _titleLabel.textAlignment = NSTextAlignmentCenter;
            //            _titleLabel.numberOfLines = NO;
            //            [self.rootAlertView addSubview:_titleLabel];
        }
            break;
        case ActionSheetType:{
            //            _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.rootSheetView.frame.size.width - 20, k_actionSheetButtonHeight)];
            //            _titleLabel.text = title;
            //            CGFloat red = 100.0 / 255.0;
            //            _titleLabel.textColor = [UIColor colorWithRed:red green:red blue:red alpha:1];
            //            _titleLabel.font = [UIFont systemFontOfSize:13];
            //            _titleLabel.textAlignment = NSTextAlignmentCenter;
        }
            break;
        case AlertTypeNotButton:{
            CGRect rect = [title boundingRectWithSize:CGSizeMake(5000.0f, 60) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:12] forKey:NSFontAttributeName] context:nil];
            CGFloat width = 90;
            if (rect.size.width + 30 >= 100) {
                width = rect.size.width + 30;
            }
            _rootAlertView.frame = CGRectMake(0, 0, width, 34);
            _rootAlertView.center = _rootView.center;
            _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, self.rootAlertView.frame.size.width - 10, 34)];
            _titleLabel.text = title;
            _titleLabel.textColor = [UIColor whiteColor];
            _titleLabel.font = [UIFont systemFontOfSize:12];
            _titleLabel.textAlignment = NSTextAlignmentCenter;
            [self.rootAlertView addSubview:_titleLabel];
        }
            break;
        default:
            break;
    }
    
}



#pragma mark -动画
- (void)showAlertViewAnimationReduce:(UIView *)mainView{
    self.rootView.alpha = 0;
    mainView.alpha = 0;
    mainView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    [UIView animateWithDuration:.4 animations:^{
        self.rootView.alpha = 0.4;
        mainView.alpha = 0.98;
        mainView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
    }];
}


- (void)showAlertViewAnimationIncrease:(UIView *)mainView{
    self.rootView.alpha = 0.4;
    mainView.alpha = 0.98;
    mainView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:.3 animations:^{
        self.rootView.alpha = 0;
        mainView.alpha = 0;
        mainView.transform = CGAffineTransformMakeScale(.8, .8);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end