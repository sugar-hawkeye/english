//
//  WordCell.m
//  toefl_ios
//
//  Created by wim on 2017/9/15.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "WordCell.h"

#import "NSString+Utils.h"

@implementation WordCell

- (void)setMean:(NSString*)mean {
    _meanLabel.text = [mean split:@"[a-z]{1,5}\\." flag:@"\n"];
}


@end
