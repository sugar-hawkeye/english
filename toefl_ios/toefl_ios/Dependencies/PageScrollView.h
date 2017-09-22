//
//  PageScrollView.h
//  toefl_ios
//
//  Created by wim on 2017/9/19.
//  Copyright © 2017年 wim. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PageView.h"

@class PageScrollView;

typedef NS_ENUM(NSInteger, PageOrientation) {
    PageOrientationHorizontal,
    PageOrientationVertical
};



@protocol PageScrollViewDatasource <NSObject>

- (NSInteger)numberOfRow:(PageScrollView*)pageScrollView;
- (PageView *)pageScrollView:(PageScrollView*)pageScrollView cellForRowAtIndex:(NSInteger)row;

@optional

- (CGFloat)pageScrollView:(PageScrollView*)pageScrollView heightForRowAtIndex:(NSInteger)index;
- (CGFloat)pageScrollView:(PageScrollView*)pageScrollView widthForRowAtIndex:(NSInteger)index;

@end

@protocol PageScrollViewDelegate <NSObject>

- (void)pageScrollView:(PageScrollView*)pageScrollView didSelectRowAtIndex:(NSInteger)index;

@end

@interface PageScrollView : UIScrollView

@property (nonatomic, weak) id<PageScrollViewDatasource> pageDataSource;
@property (nonatomic, weak) id<PageScrollViewDelegate> pageDelegate;
@property (nonatomic, assign) BOOL isRecycle;

- (PageView *)dequeueReusableCell;

- (void)setPageOrientation:(PageOrientation)pageOrientation;

- (void)reload;

@end
