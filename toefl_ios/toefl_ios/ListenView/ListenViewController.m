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

@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, assign) NSInteger index;

@property (nonatomic, strong) PageScrollView *pageScrollView;

@end

@implementation ListenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageScrollView = [[PageScrollView alloc] initWithFrame:self.view.bounds];
    _pageScrollView.pageDataSource = self;
    [_pageScrollView setPageOrientation:PageOrientationVertical];
    
    [self.view addSubview:_pageScrollView];
    
    _datas = [[NSMutableArray alloc] init];
    _index = 0;
    
    [self setRightButton:[UIImage imageNamed:@"nav_downup_btn.png"] target:self action:@selector(touchRight)];
}

- (void)touchRight {
    [self addData];
    [_pageScrollView reload];
}

- (void)addData {
    for (NSInteger i = _index; i < _index+10; i++) {
        NSString *name = [NSString stringWithFormat:@"%ld",_index];
        [_datas addObject:name];
    }
    _index += 10;
}

- (void)viewDidLayoutSubviews {
    [super viewWillLayoutSubviews];

}

- (NSInteger)numberOfRow:(PageScrollView*)pageScrollView {
    return _datas.count;
}

- (CGFloat)pageScrollView:(PageScrollView*)pageScrollView heightForRowAtIndex:(NSInteger)index {
    return 100;
}

- (CGFloat)pageScrollView:(PageScrollView*)pageScrollView widthForRowAtIndex:(NSInteger)index {
    return self.view.frame.size.width;
}


- (PageView *)pageScrollView:(PageScrollView*)pageScrollView cellForRowAtIndex:(NSInteger)row {
    PageView *view = [pageScrollView dequeueReusableCell];
    view.layer.borderColor = [UIColor redColor].CGColor;
    view.layer.borderWidth = 2;
    view.textLabel.text = [_datas objectAtIndex:row];
    return view;
}



@end
