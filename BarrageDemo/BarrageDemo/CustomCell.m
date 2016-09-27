//
//  CustomCell.m
//  BarrageDemo
//
//  Created by siping ruan on 16/9/22.
//  Copyright © 2016年 siping ruan. All rights reserved.
//

#import "CustomCell.h"
#import "BarrageModel.h"
#import "UIImageView+WebCache.h"
#import "BarrageView.h"

@interface CustomCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *message;

@end

@implementation CustomCell

- (instancetype)initWithIdentifier:(NSString *)identifier
{
    if (self = [super initWithIdentifier:identifier]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:0].firstObject;
    }
    return self;
}

+ (instancetype)cellWithBarrageView:(BarrageView *)barrageView
{
    static NSString *reuseIdentifier = @"CustomCell";
    CustomCell *cell = [barrageView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[CustomCell alloc] initWithIdentifier:reuseIdentifier];
    }
    return cell;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 10;
    self.avatar.clipsToBounds = YES;
    self.avatar.layer.cornerRadius = 17;
}

- (void)setModel:(BarrageModel *)model
{
    _model = model;
    
    [self.avatar sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed:@"mor_toux"]];
    self.message.text = model.message;
}

@end
