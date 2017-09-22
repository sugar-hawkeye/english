//
//  CustomTextView.m
//  toefl_ios
//
//  Created by wim on 2017/9/18.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "CustomTextView.h"

@implementation CustomTextView

- (void)setContent:(NSString*)content flag:(NSString*)flag {
    
    self.attributedText = [self matchString:content toRegexString:@" [0-9]." flag:flag];

}

- (void)chineseRange:(NSString*)content{
    
    int location = -1;
    int length = 0;
    BOOL isChinese = NO;
    for (int i = 0; i < content.length; i++) {
        int temp = [content characterAtIndex:i];
        if (temp > 0x4e00 && temp < 0x9fff) {
            if (location == -1) {
                location = i;
                isChinese = YES;
                length++;
            }
        }
        else{
            if (isChinese == YES) {
                length = i - 1;
                NSRange range = NSMakeRange(location, length);
                NSLog(@"%@",NSStringFromRange(range));
            
                location = -1;
                length = 0;
                isChinese = NO;
            }
        }

    }
}

- (NSMutableAttributedString *)matchString:(NSString *)string toRegexString:(NSString *)regexStr flag:(NSString*)flag
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray * matches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    NSMutableAttributedString *array = [[NSMutableAttributedString alloc] init];
    
    NSUInteger location = 0;
    NSUInteger length = 0;
    for (int i = 0; i < matches.count; i ++) {
        NSTextCheckingResult *match = [matches objectAtIndex:i];
        length = match.range.location - location;
        NSRange range = NSMakeRange(location, length);
        location = match.range.location+1;
        
        if (i == matches.count - 1) {
            NSString *temp1 = [[string substringWithRange:range] stringByAppendingString:@"\n\r"];
            temp1 = [self slipChinese:temp1];
            [array appendAttributedString:[self changeColor:temp1 flag:flag]];
            
            
            NSString *temp2 = [[string substringFromIndex:range.location+range.length+1] stringByAppendingString:@"\n\r"];
            temp2 = [self slipChinese:temp2];
            [array appendAttributedString:[self changeColor:temp2 flag:flag]];
        }
        else{
            NSString *temp = [[string substringWithRange:range] stringByAppendingString:@"\n\r"];
            
            temp= [self slipChinese:temp];
            
            [array appendAttributedString:[self changeColor:temp flag:flag]];
        }
    }
    
    if (array.length == 0) {
        [array appendAttributedString:[self changeColor:string flag:flag]];
    }
    return array;
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

- (NSMutableAttributedString*)changeColor:(NSString*)content flag:(NSString*)flag {
    NSRange range = [content rangeOfString:flag options:NSCaseInsensitiveSearch];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:content];
    if (range.location != NSNotFound) {
        [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
    }
    return attributedStr;
}

@end
