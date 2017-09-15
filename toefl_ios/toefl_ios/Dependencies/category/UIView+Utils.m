//
//  UIView+Utils.m
//  video_ios
//
//  Created by wim on 2017/6/7.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "UIView+Utils.h"
#import <UIKit/UIBezierPath.h>

@implementation UIView (Utils)

- (void)showBorder:(UIColor*)borderColor{
    if (!borderColor) {
        borderColor = [UIColor redColor];
    }
    
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = 2;
}


- (void)setLayerWithCorner:(CGFloat)radius {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius];
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.frame = self.bounds;
    self.layer.mask = shapeLayer;
//    [self.layer addSublayer:shapeLayer];
}

@end
