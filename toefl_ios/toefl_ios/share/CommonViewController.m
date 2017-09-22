//
//  CommonViewController.m
//  video_ios
//
//  Created by wim on 2017/6/7.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "CommonViewController.h"

@interface CommonViewController ()<UIGestureRecognizerDelegate>

@end

@implementation CommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    SEL handler = NSSelectorFromString(@"handleNavigationTransition:");
    UIView *targetView = self.navigationController.interactivePopGestureRecognizer.view;
    
    UIPanGestureRecognizer *fullGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:handler];
    fullGesture.delegate = self;
    [targetView addGestureRecognizer:fullGesture];
    
    [self.navigationController.interactivePopGestureRecognizer setEnabled:NO];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    CGPoint translation = [gestureRecognizer locationInView:self.view];
    if (translation.x <= 0) {
        return NO;
    }
    return self.childViewControllers.count == 1 ? NO : YES;
    

}



@end
