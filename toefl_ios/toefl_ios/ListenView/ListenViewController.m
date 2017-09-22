//
//  ListenViewController.m
//  toefl_ios
//
//  Created by wim on 2017/9/15.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "ListenViewController.h"

#import "PageScrollView.h"


@interface ListenViewController ()<PageScrollViewDatasource>


@property (nonatomic, strong) PageScrollView *pageScrollView;

@end

@implementation ListenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageScrollView = [[PageScrollView alloc] initWithFrame:self.view.bounds];
    _pageScrollView.pageDataSource = self;
    [_pageScrollView setPageOrientation:PageOrientationVertical];
    
    [self.view addSubview:_pageScrollView];
}

- (void)viewDidLayoutSubviews {
    [super viewWillLayoutSubviews];

}

- (NSInteger)numberOfRow:(PageScrollView*)pageScrollView {
    return 5;
}

- (CGFloat)pageScrollView:(PageScrollView*)pageScrollView heightForRowAtIndex:(NSInteger)index {
    
    return 200;
}

- (CGFloat)pageScrollView:(PageScrollView*)pageScrollView widthForRowAtIndex:(NSInteger)index {
    return self.view.frame.size.width;
}


- (PageView *)pageScrollView:(PageScrollView*)pageScrollView cellForRowAtIndex:(NSInteger)row {
    PageView *view = [pageScrollView dequeueReusableCell];
    view.layer.borderColor = [UIColor redColor].CGColor;
    view.layer.borderWidth = 2;
    view.textLabel.text = [NSString stringWithFormat:@"%ld",row];
    return view;
}



@end
