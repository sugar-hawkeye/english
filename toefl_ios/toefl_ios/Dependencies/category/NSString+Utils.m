//
//  NSString+Utils.m
//  video_ios
//
//  Created by wim on 2017/6/7.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "NSString+Utils.h"
#import <UIKit/UIColor.h>


@implementation NSString (Utils)

- (UIColor *)colorWithHex
{
    NSString *cString = [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

+ (NSString*)toTime:(NSTimeInterval)second{
    NSString *time = @"";
    if (second >= 3600) {
        time = [NSString stringWithFormat:@"%d:%02d:%02d",(int)second/3600,(int)second % 3600 / 60,(int)second % 3600 % 60];
    }
    else{
        time = [NSString stringWithFormat:@"%02d:%02d",(int)second / 60,(int)second % 60];
    }
    return time;
}

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

//adj. 不受欢迎的 n. 冷淡
//vt. 挣扎，痛苦地扭曲 vi. 扭曲，翻腾，受苦 n. 翻腾，苦恼
//adj. 相反的，截然不同的 adv. 相反(地) n. 反面，相反

- (NSString*)split:(NSString *)pattern flag:(NSString*)flag {
    NSMutableString *string = [[NSMutableString alloc] initWithString:self];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray * matches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    for (int i = 1; i < matches.count; i ++) {
        NSTextCheckingResult *match = [matches objectAtIndex:i];
        if ([[string substringWithRange:match.range] containsString:@" "]) {
            [string insertString:flag atIndex:match.range.location+1];
        }
        else{
            [string insertString:flag atIndex:match.range.location];
        }
    }
    return string;
}


- (NSString *)slipChinese:(NSString*)content {
    NSMutableString *string = [[NSMutableString alloc] initWithString:content];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[a-z]\\.|[a-z]\\?|[a-z]\\!" options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray * matches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    for (int i = 0; i < matches.count; i ++) {
        NSTextCheckingResult *match = [matches objectAtIndex:i];
        [string insertString:@"\n" atIndex:match.range.location+match.range.length];
        
    }
    return string;
}



@end
