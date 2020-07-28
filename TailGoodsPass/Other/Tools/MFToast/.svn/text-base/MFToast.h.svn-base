//
//  MFToast.h
//  shangpinjiazu
//
//  Created by maweefeng on 16/10/12.
//  Copyright © 2016年 maweefeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DEFAULT_DISPLAY_DURATION 2.0f
@interface MFToast : NSObject
 {
    NSString *text;
    UIButton *contentView;
    CGFloat  duration;
}

+ (void)showWithText:(NSString *) text_;
+ (void)showWithText:(NSString *) text_
            duration:(CGFloat)duration_;

+ (void)showWithText:(NSString *) text_
           topOffset:(CGFloat) topOffset_;
+ (void)showWithText:(NSString *) text_
           topOffset:(CGFloat) topOffset
            duration:(CGFloat) duration_;

+ (void)showWithText:(NSString *) text_
        bottomOffset:(CGFloat) bottomOffset_;
+ (void)showWithText:(NSString *) text_
        bottomOffset:(CGFloat) bottomOffset_
            duration:(CGFloat) duration_;

@end
