//
//  SymbolPlayer.h
//  toefl_ios
//
//  Created by wim on 2017/9/22.
//  Copyright © 2017年 wim. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SymbolPlayer : NSObject

- (instancetype)initWithName:(NSString *)name;

- (void)play;
- (void)stop;

@end
