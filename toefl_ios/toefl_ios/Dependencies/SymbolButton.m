//
//  SymbolButton.m
//  toefl_ios
//
//  Created by wim on 2017/9/22.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "SymbolButton.h"



@interface SymbolButton(){
    
}

@property (nonatomic, strong) UIImage *imgae;


@end


@implementation SymbolButton

- (void)awakeFromNib {
    [super awakeFromNib];
    _imgae = [UIImage imageNamed:@"audio_play_btn.png"];
    [self setImage:_imgae forState:UIControlStateNormal];
    
    [self addTarget:self action:@selector(playSymbol) forControlEvents:UIControlEventTouchUpInside];
    

}

- (void)playSymbol {
    NSLog(@"play");
}




@end
