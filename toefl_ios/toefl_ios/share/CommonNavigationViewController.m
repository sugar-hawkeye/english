//
//  CommonNavigationViewController.m
//  video_ios
//
//  Created by wim on 2017/7/24.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "CommonNavigationViewController.h"

@interface CommonNavigationViewController ()

@end

@implementation CommonNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    
}

- (void)setLeftButton:(UIImage*)image target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    if (image) {
        UIImage *backgroundImage = [image copy];
//        [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0 , 0, 13)];
        [button setImage:backgroundImage forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 50, 49);
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = leftBar;
}

- (void)setRightButton:(UIImage*)image target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    if (image) {
        UIImage *backgroundImage = [image copy];
//        [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0 , 0, 13)];
        [button setImage:backgroundImage forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 50, 49);
    }
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightBar;
}

- (void)setCloseButton {
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.navigationController.viewControllers.count > 1) {
        [self setLeftButton:nil target:self action:@selector(popViewController)];
    }
    
}

- (void)popViewController {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)dissView{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
