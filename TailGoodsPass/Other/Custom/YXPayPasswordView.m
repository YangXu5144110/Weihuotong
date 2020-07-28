//
//  YXPayPasswordView.m
//  MushroomRider
//
//  Created by 李小朋 on 2017/7/1.
//  Copyright © 2017年 Yang Xu. All rights reserved.
//

#import "YXPayPasswordView.h"
//#define SCREEN_WIDTH  (self.frame.size.width)
//#define SCREEN_HEIGHT  (self.frame.size.height)
//#define ColorHUI [UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1.0]


@interface YXPayPasswordView ()

{
    
    UITextField * la1,*la2,*la3,*la4,*la5,*la6;
    
    UILabel * passwordLable;
    NSString * passwordStr;
}

@property(nonatomic,strong)UIView * PhotoView;
@property(nonatomic,strong)UIView * keyBordView;
@end

@implementation YXPayPasswordView

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0, 60, kScreenWidth, 20))];
        _titleLabel.textColor = color_titleColor;
        _titleLabel.text = @"请设置支付密码，用于支付验证";
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLabel];
        [self setup];
       
    }
    return self;
}

- (void)setup {

    
    self.PhotoView=[[UIView alloc] initWithFrame:CGRectMake(10,60+20+22, kScreenWidth-20, 100)];
    self.PhotoView.backgroundColor= color_backColor;
    self.PhotoView.layer.cornerRadius=6;
    self.PhotoView.layer.masksToBounds=YES;
    [self addSubview:self.PhotoView];
    
    
    
#pragma 方法写得笨，勿喷
    
    la1= [[UITextField alloc] initWithFrame:CGRectMake((kScreenWidth-240)/2, 30, 40, 40)];
    la1.textAlignment= NSTextAlignmentCenter;
    la1.textColor=[UIColor blackColor];
    [la1 setSecureTextEntry:YES];
    la1.font=[UIFont systemFontOfSize:14.0f];
    la1.layer.borderWidth=1;
    [la1 setEnabled:NO];
    la1.layer.borderColor= color_lineColor.CGColor;
    [self.PhotoView addSubview:la1];
    
    la2= [[UITextField alloc] initWithFrame:CGRectMake((kScreenWidth-240)/2+40, 30, 40, 40)];
    la2.textAlignment= NSTextAlignmentCenter;
    la2.textColor=[UIColor blackColor];
    [la2 setSecureTextEntry:YES];
    la2.font=[UIFont systemFontOfSize:14.0f];
    la2.layer.borderWidth=1;
    [la2 setEnabled:NO];
    la2.layer.borderColor= color_lineColor.CGColor;
    [self.PhotoView addSubview:la2];
    
    
    la3= [[UITextField alloc] initWithFrame:CGRectMake((kScreenWidth-240)/2+80, 30, 40, 40)];
    la3.textAlignment= NSTextAlignmentCenter;
    la3.textColor=[UIColor blackColor];
    [la3 setSecureTextEntry:YES];
    la3.font=[UIFont systemFontOfSize:14.0f];
    la3.layer.borderWidth=1;
    [la3 setEnabled:NO];
    la3.layer.borderColor=color_lineColor.CGColor;
    [self.PhotoView addSubview:la3];
    
    la4= [[UITextField alloc] initWithFrame:CGRectMake((kScreenWidth-240)/2+120, 30, 40, 40)];
    la4.textAlignment= NSTextAlignmentCenter;
    la4.textColor=[UIColor blackColor];
    [la4 setSecureTextEntry:YES];
    la4.font=[UIFont systemFontOfSize:14.0f];
    la4.layer.borderWidth=1;
    la4.layer.borderColor= color_lineColor.CGColor;
    [la4 setEnabled:NO];
    [self.PhotoView addSubview:la4];
    
    la5= [[UITextField alloc] initWithFrame:CGRectMake((kScreenWidth-240)/2+160, 30, 40, 40)];
    la5.textAlignment= NSTextAlignmentCenter;
    la5.textColor=[UIColor blackColor];
    [la5 setSecureTextEntry:YES];
    la5.font=[UIFont systemFontOfSize:14.0f];
    la5.layer.borderWidth=1;
    la5.layer.borderColor=color_lineColor.CGColor;
    [la5 setEnabled:NO];
    [self.PhotoView addSubview:la5];
    
    la6= [[UITextField alloc] initWithFrame:CGRectMake((kScreenWidth-240)/2+200, 30, 40, 40)];
    la6.textAlignment= NSTextAlignmentCenter;
    la6.textColor=[UIColor blackColor];
    [la6 setSecureTextEntry:YES];
    la6.font=[UIFont systemFontOfSize:14.0f];
    la6.layer.borderWidth=1;
    la6.layer.borderColor=color_lineColor.CGColor;
    [la6 setEnabled:NO];
    
    [self.PhotoView addSubview:la6];
    
    
    la3.text=@"";
    la2.text=@"";
    la1.text=@"";
    la4.text=@"";
    la5.text=@"";
    la6.text=@"";
    
    
    self.keyBordView=[[UIView alloc] initWithFrame:CGRectMake(0,kScreenHeight - 265,kScreenWidth,200)];
    self.keyBordView.backgroundColor=[UIColor whiteColor];
    [self addSubview:self.keyBordView];
    
    
    NSArray * ary =[[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0",@"清除",@"x", nil];
    
    for(int i=0;i<ary.count;i++)
    {
        NSInteger index = i%3;
        NSInteger page = i/3;
        
        UIButton * btn =[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(index * (kScreenWidth/3), page  * 50,kScreenWidth/3,50);
        btn.tag=i;
        [btn setTitle:[ary objectAtIndex:i] forState:normal];
        [btn setTitleColor:[UIColor blackColor] forState:normal];
        btn.layer.borderColor=color_lineColor.CGColor;
        btn.layer.borderWidth=0.5;
        
        if(i<=9)
        {
            
            [btn addTarget:self action:@selector(KeyBoradClass:) forControlEvents:UIControlEventTouchUpInside];
        }
        if(i==10)
        {
            [btn addTarget:self action:@selector(KeyBoradClear:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        if(i==11)
        {
            [btn addTarget:self action:@selector(KeyBoradRemove:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
        [self.keyBordView addSubview:btn];
        
    }
}
#pragma 清除
-(void)KeyBoradRemove:(UIButton *)btn
{
    
    if(passwordStr.length==0)
    {
        la3.text=@"";
        la2.text=@"";
        la1.text=@"";
        la4.text=@"";
        la5.text=@"";
        la6.text=@"";
        
        return;
    }
    
    
    NSString *str=[passwordStr substringToIndex:passwordStr.length-1];
    
    if(str.length==6)
    {
        
    }
    else if (str.length==5)
    {
        la6.text=@"";
        
    }
    else if(str.length==4)
    {
        la5.text=@"";
        la6.text=@"";
        
    }
    else if (str.length==3)
    {
        la4.text=@"";
        la5.text=@"";
        la6.text=@"";
    }
    else if(str.length==2)
    {
        la3.text=@"";
        la4.text=@"";
        la5.text=@"";
        la6.text=@"";
        
    }
    else if(str.length==1)
    {
        
        la3.text=@"";
        la2.text=@"";
        la4.text=@"";
        la5.text=@"";
        la6.text=@"";
    }
    else
    {
        la3.text=@"";
        la2.text=@"";
        la1.text=@"";
        la4.text=@"";
        la5.text=@"";
        la6.text=@"";
        
    }
    
    passwordStr=str;
    
    NSLog(@"%@",passwordStr);
    
}

#pragma 清空
-(void)KeyBoradClear:(UIButton *)btn{
    
    la3.text=@"";
    la2.text=@"";
    la1.text=@"";
    la4.text=@"";
    la5.text=@"";
    la6.text=@"";
    
}


#pragma 输入密码
-(void)KeyBoradClass:(UIButton *)btn
{
    
    NSArray * ary =[[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0",@"清除",@"x", nil];
    
    
    if (la1.text.length<1) {
        
        if (la1.text.length==0) {
            la1.text=[ary objectAtIndex:btn.tag];
        }
        
    }
    else if (la2.text.length<1 && la1.text.length==1) {
        
        if (la2.text.length==0) {
            la2.text=[ary objectAtIndex:btn.tag];
        }
        
    }
    else if (la3.text.length<1 && la2.text.length==1) {
        
        if (la3.text.length==0) {
            la3.text=[ary objectAtIndex:btn.tag];
        }
        
    }
    else if (la4.text.length<1 && la3.text.length==1) {
        
        if (la4.text.length==0) {
            la4.text=[ary objectAtIndex:btn.tag];
        }
        
    }
    else if (la5.text.length<1 && la4.text.length==1) {
        
        if (la5.text.length==0) {
            la5.text=[ary objectAtIndex:btn.tag];
        }
        
    }
    
    else if (la6.text.length<1 && la5.text.length==1) {
        
        if (la6.text.length==0) {
            la6.text=[ary objectAtIndex:btn.tag];
        }
        
    }
    
    
#pragma 密码输入己有6位
    
    passwordStr=[NSString stringWithFormat:@"%@%@%@%@%@%@",la1.text,la2.text,la3.text,la4.text,la5.text,la6.text];
    
    if(passwordStr.length==6)
    {
//        NSLog(@"%@",passwordStr);
        
        if (self.payPasswordBlock) {
            self.payPasswordBlock(passwordStr);
        }
        
       
        
//        [self hiddenBackVew];
        
        
    }
    
    
}

//#pragma   隐藏密码框及定义的键盘
//-(void)hiddenBackVew
//{
//    [self donghuaView:self.PhotoView Rect:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 200)];
//    [self donghuaView:self.keyBordView Rect:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 200)];
//    
//    [UIView beginAnimations:@"animationID" context:nil];
//    [UIView setAnimationDuration:0.35f];
//    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.backView cache:YES];
//    self.backView.alpha=0;
//    [UIView commitAnimations];
//}


@end
