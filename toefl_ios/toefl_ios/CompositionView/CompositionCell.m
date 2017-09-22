//
//  CompositionCell.m
//  toefl_ios
//
//  Created by wim on 2017/9/20.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "CompositionCell.h"

@interface CompositionCell ()



@end

@implementation CompositionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setContent:(NSString*)content {
    _titleLabel.text = content;
    [_titleLabel sizeToFit];
}

@end
