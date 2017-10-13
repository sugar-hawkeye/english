//
//  PageScrollView.m
//  toefl_ios
//
//  Created by wim on 2017/9/19.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "PageScrollView.h"

@interface PageScrollView ()<UIScrollViewDelegate>{
    
}

@property (nonatomic, strong) NSMutableArray<PageView*> *reuseCells;
@property (nonatomic, strong) NSMutableArray<PageView*> *visibleCells;
@property (nonatomic, assign) PageOrientation pageOrientation;

@property (nonatomic, assign) CGFloat screenWidth;
@property (nonatomic, assign) CGFloat screenHeight;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger fisrtVisibleNum;
@property (nonatomic, assign) CGFloat contentHeight;
@property (nonatomic, assign) CGFloat contentWidth;

@property (nonatomic, assign) CGFloat offY;
@property (nonatomic, assign) CGFloat offX;

@property (nonatomic, strong) NSMutableArray *cellFrames;



@end


@implementation PageScrollView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.delegate = self;
    self.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    _isRecycle = NO;
    
    _reuseCells = [[NSMutableArray alloc] init];
    _visibleCells = [[NSMutableArray alloc] init];
    
    _screenWidth = [UIScreen mainScreen].bounds.size.width;
    _screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    _cellFrames = [[NSMutableArray alloc] init];
}

- (void)setPageOrientation:(PageOrientation)pageOrientation {
    _pageOrientation = pageOrientation;
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self reload];
//    });
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"layoutSubviews");
}

- (void)reload {
    _fisrtVisibleNum = 0;
    _contentHeight = 0;
    _contentWidth = 0;
    [_cellFrames removeAllObjects];
    
    _count = [_pageDataSource numberOfRow:self];
    
    CGFloat y = 0;
    CGFloat x = 0;
    for (int i = 0; i < _count; i++) {
        CGFloat rowHeight = [_pageDataSource pageScrollView:self heightForRowAtIndex:i];
        CGFloat rowWidth = [_pageDataSource pageScrollView:self widthForRowAtIndex:i];
        _contentHeight += rowHeight;
        _contentWidth += rowWidth;
        
        if (_pageOrientation == PageOrientationVertical) {
            CGRect frame = CGRectMake(0, y, rowWidth, rowHeight);
            [_cellFrames addObject:[NSValue valueWithCGRect:frame]];
            
            if (y <= self.bounds.size.height) {
                _fisrtVisibleNum = i+1;
            }
            
            y += rowHeight;
        }
        else if (_pageDataSource == PageOrientationHorizontal) {
            CGRect frame = CGRectMake(x, 0, rowWidth, rowHeight);
            [_cellFrames addObject:[NSValue valueWithCGRect:frame]];
            
            if (x <= self.bounds.size.width) {
                _fisrtVisibleNum = i+1;
            }
            
            x += rowWidth;
        }
    }
    
    [self firstLayoutCell];
}

- (PageView *)dequeueReusableCell {
    PageView *view = nil;
    if (_reuseCells.count == 0) {
        view = [[PageView alloc] init];
    }
    else {
        view = [_reuseCells lastObject];
        [_reuseCells removeLastObject];
    }
    return view;
}


- (void)firstLayoutCell {
    if (_pageOrientation == PageOrientationVertical) {
        for (int i = 0; i < _fisrtVisibleNum; i++) {
            PageView *view = [_pageDataSource pageScrollView:self cellForRowAtIndex:i];
            NSValue *value = (NSValue*)[_cellFrames objectAtIndex:i];
            view.frame = [value CGRectValue];
            [self addSubview:view];
        }
        [self setContentSize:CGSizeMake(self.bounds.size.width, _contentHeight)];
    }
    else if (_pageDataSource == PageOrientationHorizontal) {
        [self setContentSize:CGSizeMake(_contentWidth, self.bounds.size.height)];
    }
}

#pragma mark -- UIScrollViewDelegate

//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//
//}
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    PageView *firstView = [_visibleCells firstObject];
//    PageView *lastView = [_visibleCells lastObject];
//    if (_pageOrientation == PageOrientationVertical) {
//
//        if (scrollView.contentOffset.y > _offY) {
//            if (_offY > (firstView.frame.origin.y + firstView.frame.size.height) && _offY >= 0) {
//                [_reuseCells addObject:firstView];
//                [firstView removeFromSuperview];
//                [_visibleCells removeObjectAtIndex:0];
//            }
//
//            if ((_offY + scrollView.bounds.size.height) > (lastView.frame.origin.y + lastView.frame.size.height) && _offY <= _contentHeight) {
//                CGPoint point = CGPointMake(0, _offY+scrollView.bounds.size.height);
//                NSInteger index = -1;
//                CGRect viewFrame = CGRectZero;
//                for (int i = 0; i < _cellFrames.count; i++) {
//                    CGRect frame = [[_cellFrames objectAtIndex:i] CGRectValue];
//                    if (CGRectContainsPoint(frame, point)) {
//                        index = i;
//                        viewFrame = frame;
//                        break;
//                    }
//                }
//                if (index >= 0) {
//                    PageView *view = [_pageDataSource pageScrollView:self cellForRowAtIndex:index];
//                    view.frame = viewFrame;
//                    [self addSubview:view];
//                    [_visibleCells addObject:view];
//                }
//
//            }
//
//        }
//        else{
//            if (_offY < firstView.frame.origin.y && _offY >= 0) {
//                CGPoint point = CGPointMake(0, _offY);
//                NSInteger index = -1;
//                CGRect viewFrame = CGRectZero;
//                for (int i = 0; i < _cellFrames.count; i++) {
//                    CGRect frame = [[_cellFrames objectAtIndex:i] CGRectValue];
//                    if (CGRectContainsPoint(frame, point)) {
//                        index = i;
//                        viewFrame = frame;
//                        break;
//                    }
//                }
//                if (index >= 0) {
//                    PageView *view = [_pageDataSource pageScrollView:self cellForRowAtIndex:index];
//                    view.frame = viewFrame;
//                    [self addSubview:view];
//                    [_visibleCells insertObject:view atIndex:0];
//                }
//            }
//
//
//            if (((_offY + scrollView.bounds.size.height) < lastView.frame.origin.y) && _offY <= _contentHeight) {
//                [_reuseCells addObject:lastView];
//                [lastView removeFromSuperview];
//                [_visibleCells removeLastObject];
//            }
//
//        }
//
//        _offY = scrollView.contentOffset.y;
//
//
//
//
//           }
//    else if (_pageDataSource == PageOrientationHorizontal) {
//
//    }
//}
//
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//
//}

@end
