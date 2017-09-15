//
//  CommomTableViewController.m
//  tv_ios
//
//  Created by  on 16/10/8.
//  Copyright © 2016年 . All rights reserved.
//

#import "CommomTableViewController.h"



@interface CommomTableViewController (){
   
}

@end

@implementation CommomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.headerRefresh = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.headerRefresh.lastUpdatedTimeLabel.hidden = YES;
    self.headerRefresh.stateLabel.hidden = YES;
    
    self.footerRefresh = [MJRefreshBackStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.footerRefresh.stateLabel.hidden = YES;
}

- (void)loadNewData{
    
}

- (void)loadMoreData{
    
}





@end
