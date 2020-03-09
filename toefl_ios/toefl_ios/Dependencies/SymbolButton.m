//
//  SymbolButton.m
//  toefl_ios
//
//  Created by wim on 2017/9/22.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "SymbolButton.h"
#import "MacroUtils.h"
#import "SymbolPlayer.h"
#import "NSString+Utils.h"
#import "UIView+Utils.h"

@interface SymbolButton(){
    
}
@property (nonatomic, strong) UIButton *audioButton;
@property (nonatomic, strong) UILabel *audioLabel;
@property (nonatomic, strong) NSMutableArray *layouts;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) SymbolPlayer *symbolPlayer;
@property (nonatomic, assign) CGFloat width;

@end


@implementation SymbolButton

- (void)awakeFromNib {
    [super awakeFromNib];
    _layouts = [[NSMutableArray alloc] init];
    self.userInteractionEnabled = YES;
    self.backgroundColor = [UIColor clearColor];
    
    _image = [UIImage imageNamed:@"audio_play_btn.png"];
    
    _audioButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_audioButton setImage:_image forState:UIControlStateNormal];
    [self addSubview:_audioButton];
    
    _audioLabel = [[UILabel alloc] init];
    _audioLabel.textColor = [UIColor darkGrayColor];
    _audioLabel.font = [UIFont systemFontOfSize:14];
    _audioLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_audioLabel];
    
    if (!_symbolPlayer) {
        _symbolPlayer = [SymbolPlayer singleton];
    }

}

- (void)setSymbol:(NSString*)symbol {
    _audioLabel.text = symbol;
    CGSize size = CGSizeMake(MAXFLOAT, _audioLabel.frame.size.height);
    _width = [symbol sizeWithFont:_audioLabel.font maxSize:size].width + _image.size.width+5;

    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    
    [self addConstraints];
    [super updateConstraints];
}

- (void)addConstraints {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_audioButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_audioLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [_layouts addObject:[NSLayoutConstraint constraintWithItem:_audioButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    [_layouts addObject:[NSLayoutConstraint constraintWithItem:_audioButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [_layouts addObject:[NSLayoutConstraint constraintWithItem:_audioButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
//    [_layouts addObject:[NSLayoutConstraint constraintWithItem:_audioButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50]];

    [_layouts addObject:[NSLayoutConstraint constraintWithItem:_audioLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_audioButton attribute:NSLayoutAttributeTrailing multiplier:1 constant:5]];
    [_layouts addObject:[NSLayoutConstraint constraintWithItem:_audioLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [_layouts addObject:[NSLayoutConstraint constraintWithItem:_audioLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    [_layouts addObject:[NSLayoutConstraint constraintWithItem:_audioLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    
    if (iOS6Later) {
        [NSLayoutConstraint activateConstraints:_layouts];
    }
    else{
        [self addConstraints:_layouts];
    }
}


- (void)setPlayName:(NSString*)name {
    _name = name;
}

- (CGFloat)getWidth {
    return _width;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!_symbolPlayer) {
        _symbolPlayer = [SymbolPlayer singleton];
    }
    [_symbolPlayer setName:_name];
    [_symbolPlayer play];
}


@end
