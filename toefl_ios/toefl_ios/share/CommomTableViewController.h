//
//  CommomTableViewController.h
//  tv_ios
//
//  Created by  on 16/10/8.
//  Copyright © 2016年 . All rights reserved.
//


#import "CommonNavigationViewController.h"

#import "MJRefresh.h"

@interface CommomTableViewController : CommonNavigationViewController


@property (nonatomic, strong) NSMutableArray *tableDatas;

@property (nonatomic, strong) MJRefreshNormalHeader *headerRefresh;
@property (nonatomic, strong) MJRefreshBackStateFooter *footerRefresh;

- (void)loadNewData;
- (void)loadMoreData;

@end
