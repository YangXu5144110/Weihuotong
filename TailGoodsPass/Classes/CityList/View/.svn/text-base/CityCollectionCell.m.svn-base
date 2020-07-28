//
//  CityCollectionCell.m
//  VTravel
//
//  Created by lanouhn on 15/6/16.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#import "CityCollectionCell.h"

#import "YXCityListModel.h"

@implementation CityCollectionCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.layer.borderColor = color_lineColor.CGColor;
    self.contentView.layer.borderWidth = 1;
}

- (void)setModel:(YXCityListModel *)model {
    _model = model;
    _cityNameLabel.text = _model.CODENAME;
}


@end
