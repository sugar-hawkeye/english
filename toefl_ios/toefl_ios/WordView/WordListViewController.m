//
//  WordListViewController.m
//  toefl_ios
//
//  Created by wim on 2017/9/15.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "WordListViewController.h"

#import "DBClient.h"
#import "Word.h"
#import "WordCell.h"

#import "WordDetailViewController.h"

@interface WordListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) DBClient *dbClient;
@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) WordDetailViewController *wordDetailViewController;

@end

@implementation WordListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UINib *nibCell = [UINib nibWithNibName:@"WordCell" bundle:nil];
    [_tableView registerNib:nibCell forCellReuseIdentifier:@"WordCell"];
}



- (void)setPage:(NSInteger)page count:(NSInteger)count{
    _count = count;
    _datas = [self.dbClient getDataAtPage:[NSString stringWithFormat:@"%ld",page]];
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WordCell *wordCell = [tableView dequeueReusableCellWithIdentifier:@"WordCell"];
    Word *word = (Word*)[_datas objectAtIndex:indexPath.row];
    wordCell.nameLabel.text = word.name;
    wordCell.symbolLabel.text = word.symbol;
    wordCell.meanLabel.text = word.mean;
    return wordCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Word *word = (Word*)[_datas objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:self.wordDetailViewController animated:YES];
    [self.wordDetailViewController setWord:word];
}

- (DBClient *)dbClient {
    if (!_dbClient) {
        _dbClient = [[DBClient alloc] init];
    }
    return _dbClient;
}

- (WordDetailViewController *)wordDetailViewController {
    if (!_wordDetailViewController) {
        _wordDetailViewController = [[WordDetailViewController alloc] init];
    }
    return _wordDetailViewController;
}

@end
