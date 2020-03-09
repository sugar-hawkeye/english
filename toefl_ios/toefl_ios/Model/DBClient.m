//
//  DBClient.m
//  toefl_ios
//
//  Created by wim on 2017/9/15.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "DBClient.h"
#import "FMDB.h"

#import "Word.h"
#import "Composition.h"

@interface DBClient () {
    
}


@property (nonatomic, strong) FMDatabaseQueue *queue;

@end

@implementation DBClient

- (instancetype)init {
    self = [super init];
    if (self) {
        
        _queue = [FMDatabaseQueue databaseQueueWithPath:[self getDBPath]];
    }
    return self;
}




- (NSMutableArray *)getDataAtPage:(NSString *)page {
    NSMutableArray *data = [[NSMutableArray alloc] init];
    
    NSString *sql = [NSString stringWithFormat:@"select * from word limit (%@-1)*%ld,%ld",page,limit,limit];
    [_queue inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            Word *word = [[Word alloc] init];
            word.wordID = [rs intForColumn:@"wordID"];
            word.name = [rs stringForColumn:@"name"];
            word.symbol = [rs stringForColumn:@"symbol"];
            word.mean = [rs stringForColumn:@"mean"];
            word.mp3 = [rs stringForColumn:@"mp3"];
            word.example = [rs stringForColumn:@"example"];
            [data addObject:word];
        }
        [rs close];
    }];
    [_queue close];
    return data;
}

- (NSMutableArray *)getDataFromComposition {
    NSMutableArray *data = [[NSMutableArray alloc] init];
    
    NSString *sql = [NSString stringWithFormat:@"select * from composition"];
    [_queue inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            Composition *composition = [[Composition alloc] init];
            composition.titleID = [rs intForColumn:@"titleID"];
            composition.title = [rs stringForColumn:@"title"];
            composition.require = [rs stringForColumn:@"require"];
            composition.custom = [rs stringForColumn:@"custom"];
            composition.example = [rs stringForColumn:@"example"];
            [data addObject:composition];
        }
        [rs close];
    }];
    [_queue close];
    return data;
}

- (NSMutableArray *)getCompositionWithType:(int)type {
    NSMutableArray *data = [[NSMutableArray alloc] init];
    
    NSString *typeStr = @"";
    if (type == 1) {
        typeStr = @"composition_xx";
    }
    else if (type == 2){
        typeStr = @"composition_cz";
    }
    else if (type == 3){
        typeStr = @"composition_gz";
    }
    else if (type == 4){
        typeStr = @"composition_dx";
    }
    NSString *sql = [NSString stringWithFormat:@"select * from %@",typeStr];
    
    [_queue inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            Composition *composition = [[Composition alloc] init];
            composition.titleID = [rs intForColumn:@"id"];
            composition.title = [rs stringForColumn:@"title"];
            composition.content = [rs stringForColumn:@"content"];
            composition.category = [rs intForColumn:@"category"];
            composition.isStore = [rs intForColumn:@"isStore"];
            [data addObject:composition];
        }
        [rs close];
    }];
    [_queue close];
    return data;
}

- (BOOL)setCompositionFavorite:(BOOL)fav inTable:(NSString*)table titleID:(int)titleID{
    int value;
    if (fav) {
        value = 1;
    }
    else {
        value = 0;
    }
    __block BOOL isSuccess;
    NSString *sql = [NSString stringWithFormat:@"update favorite set isStore = %d where id=%d",value,titleID];
    [_queue inDatabase:^(FMDatabase * _Nonnull db) {
         isSuccess = [db executeUpdate:sql];
    }];
    [_queue close];
    return isSuccess;
}

- (NSInteger)getCount:(NSString *)tableName
{
    __block NSInteger count = 0;
    NSString *sql = [NSString stringWithFormat:@"SELECT count(*) as 'count' FROM %@",tableName];
    [_queue inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            count = [rs intForColumn:@"count"];
            
        }
        [rs close];
    }];
    [_queue close];
    return count;
}
- (NSString *)getDBPath {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"toefl_word_l" ofType:@"sqlite"];
    return path;
}

@end
