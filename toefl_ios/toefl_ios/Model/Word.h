//
//  Word.h
//  toefl_ios
//
//  Created by wim on 2017/9/15.
//  Copyright © 2017年 wim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject

@property (nonatomic, assign) NSInteger wordID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, strong) NSString *mp3;
@property (nonatomic, strong) NSString *mean;
@property (nonatomic, strong) NSString *example;

@end
