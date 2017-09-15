//
//  WordViewController.m
//  toefl_ios
//
//  Created by wim on 2017/9/15.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "WordViewController.h"

#import "DBClient.h"

#import "CardCell.h"
#import "UIView+Utils.h"

#import "WordListViewController.h"

@interface WordViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
}

@property (nonatomic, assign) NSInteger wordCount;
@property (nonatomic, assign) NSInteger cardCount;
@property (nonatomic, strong) DBClient *dbClient;
@property (nonatomic, strong) WordListViewController *wordListViewController;

@end

@implementation WordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"词汇";

    _dbClient = [[DBClient alloc] init];
    _wordCount = [_dbClient getCount:@"word"];
    _cardCount = _wordCount/limit + (_wordCount%limit != 0 ? 1:0);
    
    UINib *nibCell = [UINib nibWithNibName:@"CardCell" bundle:nil];
    [_tableView registerNib:nibCell forCellReuseIdentifier:@"CardCell"];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cardCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CardCell *cardCell = [tableView dequeueReusableCellWithIdentifier:@"CardCell"];
    cardCell.namLabel.text = [NSString stringWithFormat:@"第 %ld 关",indexPath.row + 1];
    if ((indexPath.row + 1) == _cardCount) {
        [cardCell setProgress:0 total:(_wordCount - indexPath.row*limit)];
    }
    else{
        [cardCell setProgress:0 total:limit];
    }
    return cardCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger count = 0;
    if ((indexPath.row + 1) == _cardCount) {
        count = (_wordCount - indexPath.row*limit);
    }
    else{
        count = limit;
    }
    [self.wordListViewController setPage:indexPath.row + 1 count:count];
    [self.navigationController pushViewController:self.wordListViewController animated:YES];
}


- (WordListViewController *)wordListViewController {
    if (!_wordListViewController) {
        _wordListViewController = [[WordListViewController alloc] init];
    }
    return _wordListViewController;
}

@end
