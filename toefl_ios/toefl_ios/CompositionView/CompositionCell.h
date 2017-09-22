//
//  CompositionCell.h
//  toefl_ios
//
//  Created by wim on 2017/9/20.
//  Copyright © 2017年 wim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompositionCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

- (void)setContent:(NSString*)content;

@end
