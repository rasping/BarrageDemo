//
//  CustomCell.h
//  BarrageDemo
//
//  Created by siping ruan on 16/9/22.
//  Copyright © 2016年 siping ruan. All rights reserved.
//

#import "BarrageViewCell.h"

@class BarrageModel, BarrageView;

@interface CustomCell : BarrageViewCell

@property (strong, nonatomic) BarrageModel *model;

+ (instancetype)cellWithBarrageView:(BarrageView *)barrageView;

@end
