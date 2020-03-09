//
//  CompositionTypeViewController.m
//  toefl_ios
//
//  Created by wim on 2020/1/21.
//  Copyright © 2020年 wim. All rights reserved.
//

#import "CompositionTypeViewController.h"

#import "DBClient.h"

#import "CompositionViewController.h"

@interface CompositionTypeViewController ()

@property (nonatomic, strong) DBClient *dbClient;
@property (nonatomic, strong) CompositionViewController *compositionViewController;

@property (nonatomic, copy) NSMutableArray *xxData;
@property (nonatomic, copy) NSMutableArray *czData;
@property (nonatomic, copy) NSMutableArray *gzData;
@property (nonatomic, copy) NSMutableArray *dxData;

@end

@implementation CompositionTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _compositionViewController = [[CompositionViewController alloc] init];
}


- (IBAction)touchXXEvent:(id)sender {
    if (!_xxData) {
        _xxData = [self.dbClient getCompositionWithType:1];
    }
    [_compositionViewController setData:_xxData];
    [self.navigationController pushViewController:_compositionViewController animated:YES];
}

- (IBAction)touchCZEvent:(id)sender {
    if (!_czData) {
        _czData = [self.dbClient getCompositionWithType:2];
    }
    [_compositionViewController setData:_czData];
    [self.navigationController pushViewController:_compositionViewController animated:YES];
}

- (IBAction)touchGZEvent:(id)sender {
    if (!_gzData) {
        _gzData = [self.dbClient getCompositionWithType:3];
    }
    [_compositionViewController setData:_gzData];
    [self.navigationController pushViewController:_compositionViewController animated:YES];
}

- (IBAction)touchDXEvent:(id)sender {
    if (!_dxData) {
        _dxData = [self.dbClient getCompositionWithType:4];
    }
    [_compositionViewController setData:_dxData];
    [self.navigationController pushViewController:_compositionViewController animated:YES];
}

- (DBClient *)dbClient {
    if (!_dbClient) {
        _dbClient = [[DBClient alloc] init];
    }
    return _dbClient;
}


@end
