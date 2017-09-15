//
//  WordDetailViewController.h
//  toefl_ios
//
//  Created by wim on 2017/9/15.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "CommonNavigationViewController.h"

@class Word;

@interface WordDetailViewController : CommonNavigationViewController

@property (nonatomic, weak) IBOutlet UIView *headerView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *symbolLabel;
@property (nonatomic, weak) IBOutlet UILabel *meanLabel;
@property (nonatomic, weak) IBOutlet UILabel *exampleLabel;

- (void)setWord:(Word *)word;

@end
