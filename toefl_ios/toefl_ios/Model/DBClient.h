//
//  DBClient.h
//  toefl_ios
//
//  Created by wim on 2017/9/15.
//  Copyright © 2017年 wim. All rights reserved.
//

#import <Foundation/Foundation.h>

static const NSInteger limit = 100;

@interface DBClient : NSObject

- (NSMutableArray *)getDataAtPage:(NSString *)page;
- (NSInteger)getCount:(NSString *)tableName;

@end
