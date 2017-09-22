//
//  SymbolPlayer.m
//  toefl_ios
//
//  Created by wim on 2017/9/22.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "SymbolPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface SymbolPlayer(){
    
}

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation SymbolPlayer

+ (SymbolPlayer*)singleton {
    static dispatch_once_t once;
    static SymbolPlayer *client = nil;
    dispatch_once(&once, ^ {
        client = [[self alloc] init];
    });
    return client;
}


- (instancetype)init{
    self = [super init];
    if (self) {
        _audioPlayer = [[AVAudioPlayer alloc] init];
    }
    return self;
}


- (void)setPlayPath:(NSString *)path {
    
}

@end
