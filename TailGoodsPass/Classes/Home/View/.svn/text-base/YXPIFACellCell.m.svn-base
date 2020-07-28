//
//  YXPIFACellCell.m
//  TailGoodsPass
//
//  Created by 李小朋 on 2017/9/4.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "YXPIFACellCell.h"
#import "YXPiFaModel.h"
@interface YXPIFACellCell ()

@property (weak, nonatomic) IBOutlet UIImageView *pictureImage;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;


@end

@implementation YXPIFACellCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(YXPiFaModel *)model {
    _model = model;
    
    [_pictureImage sd_setImageWithURL:[NSURL URLWithString:_model.FIRSTIMAGE] placeholderImage:[UIImage imageNamed:@""]];
    _contentLabel.text = _model.SHARECONTENT;
    _priceLabel.text = _model.PRICENAME;
    _numberLabel.text = _model.NUMNAME;
    
}


@end
