//
//  CityCollectionCell.m
//  VTravel
//
//  Created by lanouhn on 15/6/16.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#import "CityCollectionCell.h"

@implementation CityCollectionCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.layer.borderColor = color_lineColor.CGColor;
    self.contentView.layer.borderWidth = 1;
}

@end
