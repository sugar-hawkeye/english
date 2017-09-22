//
//  CardCell.m
//  toefl_ios
//
//  Created by wim on 2017/9/15.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "CardCell.h"

@implementation CardCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

- (void)setProgress:(NSInteger)progress total:(NSInteger)total {
    NSString *string = [NSString stringWithFormat:@"%ld/%ld",progress,total];
    _progressLabel.text = string;
}

- (void)layoutSubviews {
    [super layoutSubviews];
//    NSLog(@"%@",NSStringFromCGRect(_containerView.frame));
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:_containerView.bounds cornerRadius:10];
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.frame = _containerView.bounds;
    _containerView.layer.mask = shapeLayer;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
}


@end
