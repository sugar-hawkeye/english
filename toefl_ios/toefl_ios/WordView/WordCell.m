//
//  WordCell.m
//  toefl_ios
//
//  Created by wim on 2017/9/15.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "WordCell.h"

#import "NSString+Utils.h"

#import "Word.h"

#import "UIView+Utils.h"

@implementation WordCell


- (void)setWord:(Word *)word {
    _nameLabel.text = word.name;
    _meanLabel.text = [word.mean split:@"[a-z]{1,5}\\." flag:@"\n"];
    [_symbolButton setSymbol:word.symbol];
    [_symbolButton setPlayName:word.name];
    _widthConstraint.constant = [_symbolButton getWidth];
}

@end
