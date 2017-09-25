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

@end

@implementation SymbolPlayer

- (instancetype)initWithName:(NSString *)name{
    self = [super init];
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"mp3"];
        NSError *error = nil;
        if (_audioPlayer) {
            _audioPlayer = nil;
        }
        if (path.length > 0) {
            _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:&error];
            _audioPlayer.delegate = self;
            _audioPlayer.numberOfLoops = 3;
        }
        
    }
    return self;
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

#pragma mark -- AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    
}

@end
