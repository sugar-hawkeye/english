//
//  CardCell.h
//  toefl_ios
//
//  Created by wim on 2017/9/15.
//  Copyright © 2017年 wim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIView *containerView;
@property (nonatomic, weak) IBOutlet UILabel *namLabel;
@property (nonatomic, weak) IBOutlet UILabel *progressLabel;

- (void)setProgress:(NSInteger)progress total:(NSInteger)total;

@end
