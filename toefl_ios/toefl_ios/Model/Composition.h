//
//  Composition.h
//  toefl_ios
//
//  Created by wim on 2017/9/20.
//  Copyright © 2017年 wim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Composition : NSObject

@property (nonatomic, assign) int titleID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *require;
@property (nonatomic, strong) NSString *custom;
@property (nonatomic, strong) NSString *example;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) int category;
@property (nonatomic, assign) int isStore;


@end
