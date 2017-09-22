//
//  CompositionViewController.m
//  toefl_ios
//
//  Created by wim on 2017/9/15.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "CompositionViewController.h"

#import "NSString+Utils.h"
#import "DBClient.h"

#import "Composition.h"
#import "CompositionCell.h"

@interface CompositionViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) DBClient *dbClient;
@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation CompositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dbClient = [[DBClient alloc] init];
    _datas = [_dbClient getDataFromComposition];
    
    UINib *nibCell = [UINib nibWithNibName:@"CompositionCell" bundle:nil];
    [_tableView registerNib:nibCell forCellReuseIdentifier:@"CompositionCell"];
    _tableView.scrollsToTop = YES;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CompositionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CompositionCell"];
    Composition *composition = [_datas objectAtIndex:indexPath.row];
    [cell setContent:composition.title];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Composition *composition = [_datas objectAtIndex:indexPath.row];
    
    CompositionCell *cell=(CompositionCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    CGSize size = CGSizeMake(cell.titleLabel.frame.size.width, MAXFLOAT);
    CGFloat height = [composition.title sizeWithFont:cell.titleLabel.font maxSize:size].height + 20;
    
    
    return height;
}

@end
