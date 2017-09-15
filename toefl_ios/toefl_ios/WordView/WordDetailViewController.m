//
//  WordDetailViewController.m
//  toefl_ios
//
//  Created by wim on 2017/9/15.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "WordDetailViewController.h"

#import "Word.h"

@interface WordDetailViewController ()

@property (nonatomic, strong) Word *word;

@end

@implementation WordDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _nameLabel.text = _word.name;
    _symbolLabel.text = _word.symbol;
    _meanLabel.text = _word.mean;
    _exampleLabel.text = _word.example;
    _exampleLabel.numberOfLines = 0;
    [_exampleLabel sizeToFit];
}

- (void)setWord:(Word *)word {
    _word = word;
}


@end
