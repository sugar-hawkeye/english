//
//  UIViewController+Utils.m
//  video_ios
//
//  Created by wim on 2017/8/3.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "UIViewController+Utils.h"
#import <objc/runtime.h>

@implementation UIViewController (Utils)

+ (void)load {
    Class class = [self class];
    SEL originSelector = @selector(viewWillAppear:);
    SEL swizzledSelector = @selector(um_viewWillAppear:);
    Method originMethod = class_getInstanceMethod(class, originSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL success = class_addMethod(class, originSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (success) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }
    else{
        method_exchangeImplementations(originMethod, swizzledMethod);
    }
}

- (void)um_viewWillAppear:(BOOL)animated{
//    NSLog(@"umeng_viewwill===%@",[self class]);
}

@end
