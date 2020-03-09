//
//  CompositionViewController.m
//  toefl_ios
//
//  Created by wim on 2017/9/15.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "CompositionViewController.h"

#import "NSString+Utils.h"

#import "Composition.h"
#import "CompositionCell.h"

#import "CompositionDetailViewController.h"

@interface CompositionViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, copy) NSMutableArray *datas;
@property (nonatomic, strong) CompositionDetailViewController *compositionDetailViewController;
@end

@implementation CompositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _compositionDetailViewController = [[CompositionDetailViewController alloc] init];
    
    UINib *nibCell = [UINib nibWithNibName:@"CompositionCell" bundle:nil];
    [_tableView registerNib:nibCell forCellReuseIdentifier:@"CompositionCell"];
    _tableView.scrollsToTop = YES;
}


- (void)setData:(NSMutableArray*)data {
    _datas = data;
    [_tableView reloadData];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Composition *composition = [_datas objectAtIndex:indexPath.row];
    [_compositionDetailViewController setComposition:composition];
    [self.navigationController pushViewController:_compositionDetailViewController animated:YES];
}

@end
