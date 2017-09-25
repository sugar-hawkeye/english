//
//  SymbolButton.m
//  toefl_ios
//
//  Created by wim on 2017/9/22.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "SymbolButton.h"

#import "SymbolPlayer.h"


@interface SymbolButton(){
    
}

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) UIImage *imgae;

@property (nonatomic, strong) SymbolPlayer *symbolPlayer;


@end


@implementation SymbolButton

- (void)awakeFromNib {
    [super awakeFromNib];
    _imgae = [UIImage imageNamed:@"audio_play_btn.png"];
    [self setImage:_imgae forState:UIControlStateNormal];
    
    [self addTarget:self action:@selector(playSymbol) forControlEvents:UIControlEventTouchUpInside];
    

}

- (void)setPlayName:(NSString*)name {
    _name = name;
}

- (void)playSymbol {
    if (_symbolPlayer) {
        _symbolPlayer = nil;
    }
    _symbolPlayer = [[SymbolPlayer alloc] initWithName:_name];
    [_symbolPlayer play];
}




@end
