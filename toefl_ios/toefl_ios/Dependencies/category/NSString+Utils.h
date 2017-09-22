//
//  NSString+Utils.h
//  video_ios
//
//  Created by wim on 2017/6/7.
//  Copyright © 2017年 wim. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIFont.h>
#import <UIKit/NSAttributedString.h>
#import <UIKit/NSStringDrawing.h>

@class UIColor;

@interface NSString (Utils)

- (UIColor *)colorWithHex;
+ (NSString *)toTime:(NSTimeInterval)second;
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

- (NSString *)split:(NSString *)pattern flag:(NSString*)flag;

@end
