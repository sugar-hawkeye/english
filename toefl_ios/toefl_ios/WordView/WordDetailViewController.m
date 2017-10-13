//
//  WordDetailViewController.m
//  toefl_ios
//
//  Created by wim on 2017/9/15.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "WordDetailViewController.h"

#import "NSString+Utils.h"
#import "Word.h"
#import "SymbolButton.h"
#import "CustomTextView.h"

#import "UIView+Utils.h"

@interface WordDetailViewController ()

@property (nonatomic, weak) IBOutlet UIView *headerView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet SymbolButton *symbolButton;
@property (nonatomic, weak) IBOutlet UILabel *meanLabel;
@property (nonatomic, weak) IBOutlet CustomTextView *customTextView;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *headerViewHeight;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *symbolWidth;

@property (nonatomic, strong) Word *word;

@end

@implementation WordDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _nameLabel.text = _word.name;
    [_symbolButton setSymbol:_word.symbol];
    [_symbolButton setPlayName:_word.name];
    _symbolWidth.constant = [_symbolButton getWidth];
    [_customTextView setContent:_word.example flag:_word.name];
    
    NSString *mean = [_word.mean split:@"[a-z]{1,5}\\." flag:@"\n"];
    _meanLabel.text = mean;
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSString *mean = [_word.mean split:@"[a-z]{1,5}\\." flag:@"\n"];
    CGSize size = CGSizeMake(_meanLabel.frame.size.width, MAXFLOAT);
    CGFloat height = [mean sizeWithFont:_meanLabel.font maxSize:size].height + 80;
    _headerViewHeight.constant = height;
}

- (void)setWord:(Word *)word {
    _word = word;
}


@end
