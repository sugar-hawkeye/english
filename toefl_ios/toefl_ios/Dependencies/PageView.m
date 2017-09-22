//
//  PageView.m
//  toefl_ios
//
//  Created by wim on 2017/9/21.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "PageView.h"

@implementation PageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    _textLabel = [[UILabel alloc] init];
    _textLabel.font = [UIFont systemFontOfSize:15];
    _textLabel.backgroundColor = [UIColor whiteColor];
    [self addSubview:_textLabel];
}

- (void)layoutSubviews {
    _textLabel.frame = self.bounds;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
