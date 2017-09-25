//
//  WordCell.h
//  toefl_ios
//
//  Created by wim on 2017/9/15.
//  Copyright © 2017年 wim. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SymbolButton.h"

@class Word;

@interface WordCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIView *containerView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *symbolLabel;
@property (nonatomic, weak) IBOutlet UILabel *meanLabel;
@property (nonatomic, weak) IBOutlet SymbolButton *audioButton;

- (void)setWord:(Word *)word;

- (void)setMean:(NSString*)mean;


@end
