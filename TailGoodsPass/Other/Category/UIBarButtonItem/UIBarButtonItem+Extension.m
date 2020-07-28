//
//  UIBarButtonItem+Extension.m
//  DDAPP
//
//  Created by 赵士军 on 2018/3/19.
//  Copyright © 2018年 赵士军. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+(instancetype)barBtnItemWithNmlImg:(NSString *)nmlImg target:(id)target action:(SEL)action{
      UIButton *_backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.frame=CGRectMake(-10, 0,60, 48);
    [_backButton setTitle:@"" forState:UIControlStateNormal];
    _backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIImage* image = [UIImage imageNamed:@"nav_back" ];
    [_backButton setImage:image forState:UIControlStateNormal];
    [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _backButton.autoresizingMask = YES;
    _backButton.titleLabel.font=[UIFont systemFontOfSize:17];
    _backButton.imageEdgeInsets = UIEdgeInsetsMake(0,-5, 0, 0);
    _backButton.titleEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    
    _backButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [_backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithCustomView:_backButton];
    add.tintColor=[UIColor whiteColor];
   return [[UIBarButtonItem alloc]initWithCustomView:_backButton];

}
//右侧导航栏颜色
+(instancetype)rightImage:(NSString*)rightImage and:(NSString*)rightThtle target:(id)target action:(SEL)action{
    if (rightImage.length>0) {
        UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:rightImage] style:UIBarButtonItemStylePlain target:target action:action];
        rightBarButtonItem.tintColor=[UIColor whiteColor];;
        return rightBarButtonItem;
    }else{

        UIButton *_backButton = [UIButton buttonWithType:UIButtonTypeCustom];
            _backButton.frame=CGRectMake(-10, 0, kScreenWidth/3, 48);
        
            [_backButton setTitle:rightThtle forState:UIControlStateNormal];
            _backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
             [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            _backButton.autoresizingMask = YES;        
            _backButton.titleLabel.font = [UIFont systemFontOfSize:17];
            [_backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithCustomView:_backButton];
            add.tintColor=[UIColor whiteColor];
            return [[UIBarButtonItem alloc]initWithCustomView:_backButton];
    }
  
    
}
//+(instancetype)barBtnItemWithNmlImg:(NSString *)nmlImg withFlag:(NSString*)flag target:(id)target action:(SEL)action{
//
//    UIButton *_backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    _backButton.frame=CGRectMake(-10, 0, DDWiDTH/3, 48);
//    
//    [_backButton setTitle:flag forState:UIControlStateNormal];
//    _backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    UIImage* image = [UIImage imageNamed:@"nav_backbtn" ];
//    [_backButton setImage:image forState:UIControlStateNormal];
//    [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    _backButton.autoresizingMask = YES;
//    _backButton.titleLabel.font=EleventeenTextFont;
//    _backButton.imageEdgeInsets = UIEdgeInsetsMake(0,-12, 0, 0);
//    _backButton.titleEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
//    
//    _backButton.titleLabel.font = EleventeenTextFont;
//    [_backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithCustomView:_backButton];
//    add.tintColor=[UIColor whiteColor];
//    return [[UIBarButtonItem alloc]initWithCustomView:_backButton];
//    
//}
+(instancetype)barBtnItemWithOnlyNmlImg:(NSString *)nmlImg withFlag:(NSString*)flag target:(id)target action:(SEL)action{
    
    UIButton *_backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.frame=CGRectMake(0, 0, 48, 48);

    if ([flag isEqualToString:@"0"]) {
        _backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }else if ([flag isEqualToString:@"1"]){
            _backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }

    UIImage* image = [UIImage imageNamed:nmlImg ];
    [_backButton setImage:image forState:UIControlStateNormal];
    [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _backButton.autoresizingMask = YES;
    _backButton.titleLabel.font=[UIFont systemFontOfSize:17];
    [_backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithCustomView:_backButton];
    add.tintColor=[UIColor whiteColor];
    return [[UIBarButtonItem alloc]initWithCustomView:_backButton];
    
}
@end
