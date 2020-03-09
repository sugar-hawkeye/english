//
//  CommonNavigationViewController.h
//  video_ios
//
//  Created by wim on 2017/7/24.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "CommonViewController.h"

@interface CommonNavigationViewController : CommonViewController

@property (nonatomic, strong) UIButton *rightButton;

- (void)setLeftButton:(UIImage *)image target:(id)target action:(SEL)action;
- (void)setRightButton:(UIImage *)image target:(id)target action:(SEL)action;
- (void)setRightButton:(UIImage*)image selectImage:(UIImage*)selectImage target:(id)target action:(SEL)action;

- (void)setCloseButton;
- (void)popViewController;
@end
