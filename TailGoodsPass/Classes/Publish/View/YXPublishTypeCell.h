//
//  YXPublishTypeCell.h
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/25.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXPublishTypeCell : UITableViewCell
@property (nonatomic ,strong) UILabel *titleLab;
@property (nonatomic ,strong) UILabel *contentLab;
@property (nonatomic ,strong) UIView *lineView;
@end

@interface YXPublishTypeCell1 : UITableViewCell
@property (nonatomic ,strong) UILabel *titleLab;
@property (nonatomic ,strong) UITextField *contentTF;
@property (nonatomic ,strong) UIView *lineView;
@end

@interface YXPublishTypeCell2 : UITableViewCell
@property (nonatomic ,strong) UILabel *titleLab;
@property (nonatomic ,strong) UITextField *contentTF;
@property (nonatomic ,strong) UILabel *unitLab;
@property (nonatomic ,strong) UILabel *unitContentLab;
@property (nonatomic ,strong) UIView *lineView;
@end


@interface YXPublishTypeCell3 : UITableViewCell
@property (nonatomic ,strong) UILabel *titleLab;
@property (nonatomic ,strong) UIButton *imageBtn1;
@property (nonatomic ,strong) UIButton *imageBtn2;
@property (nonatomic ,strong) UIView *lineView;

@property (nonatomic ,copy) void(^selectImageBlock)(NSInteger index);
@end


@interface YXPublishTypeCell4 : UITableViewCell
@property (nonatomic ,strong) UILabel *titleLab;
@property (nonatomic ,strong) UITextView *textView;
@property (nonatomic ,strong) UIView *lineView;
@end









