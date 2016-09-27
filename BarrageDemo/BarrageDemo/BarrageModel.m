//
//  BarrageModel.m
//  BarrageDemo
//
//  Created by siping ruan on 16/9/14.
//  Copyright © 2016年 siping ruan. All rights reserved.
//

#import "BarrageModel.h"

@implementation BarrageModel

#pragma mark - PriorityLevel

- (CGFloat)cellWidth
{
    return [self.message sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15.0]}].width + 60;
}

@end
