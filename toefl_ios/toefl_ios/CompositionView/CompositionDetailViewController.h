//
//  CompositionDetailViewController.h
//  toefl_ios
//
//  Created by wim on 2020/1/22.
//  Copyright © 2020年 wim. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "Composition.h"
#import "CommonNavigationViewController.h"

@interface CompositionDetailViewController : CommonNavigationViewController

@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

- (void)setComposition:(Composition*)model;

@end


