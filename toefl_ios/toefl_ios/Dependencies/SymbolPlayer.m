//
//  SymbolPlayer.m
//  toefl_ios
//
//  Created by wim on 2017/9/22.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "SymbolPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface SymbolPlayer()<AVAudioPlayerDelegate>{
    
}

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, copy) NSString *audioName;

@end

@implementation SymbolPlayer

+ (SymbolPlayer *)singleton {
    static dispatch_once_t once;
    static SymbolPlayer *client = nil;
    dispatch_once(&once, ^ {
        client = [[SymbolPlayer alloc] init];
    });
    return client;
}

- (instancetype)initWithName:(NSString *)name{
    self = [super init];
    if (self) {
        
        [self setName:name];
    }
    return self;
}

- (void)setName:(NSString *)name {
    if ([name isEqualToString:_audioName]) {
        return;
    }
    _audioName = name;
    NSString *path = [[NSBundle mainBundle] pathForResource:_audioName ofType:@"mp3"];
    NSError *error = nil;
    if (_audioPlayer) {
        _audioPlayer = nil;
    }
    if (path.length > 0) {
        if (_audioPlayer && _audioPlayer.isPlaying) {
            [_audioPlayer stop];
            _audioPlayer = nil;
        }
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:&error];
        _audioPlayer.delegate = self;
        _audioPlayer.numberOfLoops = 3;
    }
}

- (NSString*)getName{
    return _audioName;
}

- (void)play {
    if ([_audioPlayer prepareToPlay]) {
        [_audioPlayer play];
    }
}

- (void)stop {
    [_audioPlayer stop];
    _audioPlayer = nil;
}

- (BOOL)isPlaying {
    return _audioPlayer.isPlaying;
}

#pragma mark -- AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    
}

@end
