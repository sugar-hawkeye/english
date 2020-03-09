//
//  CompositionDetailViewController.m
//  toefl_ios
//
//  Created by wim on 2020/1/22.
//  Copyright © 2020年 wim. All rights reserved.
//

#import "CompositionDetailViewController.h"

#import "DBClient.h"

@interface CompositionDetailViewController ()

@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) Composition *model;
@property (nonatomic, strong) DBClient *dbClient;

@end

@implementation CompositionDetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    _normalImage = [UIImage imageNamed:@"nav_fav_normal.png"];
    _selectedImage = [UIImage imageNamed:@"nav_fav_selected.png"];
    [self setRightButton:_normalImage selectImage:_selectedImage target:self action:@selector(touchFav:)];
}

- (void)setComposition:(Composition*)model {
    _model = model;
    self.contentTextView.text = model.content;
    self.title = model.title;
    if (model.isStore == 0) {
        self.rightButton.selected = NO;
    }
    else{
        self.rightButton.selected = YES;
    }
}

- (void)touchFav:(UIButton*)btn{
    NSString *table = [self getTable];
    if (btn.selected) {
        //cancel
        BOOL isSuccess = [self.dbClient setCompositionFavorite:NO inTable:table titleID:_model.titleID];
        if (isSuccess) {
            btn.selected = NO;
        }
    }
    else{
       BOOL isSuccess = [self.dbClient setCompositionFavorite:YES inTable:table titleID:_model.titleID];
        if (isSuccess) {
            btn.selected = YES;
        }
    }
}


- (NSString*)getTable{
    if (_model.category == 1) {
        return @"composition_xx";
    }
    else if (_model.category == 2) {
        return @"composition_cz";
    }
    else if (_model.category == 3) {
        return @"composition_gz";
    }
    else if (_model.category == 4) {
        return @"composition_dx";
    }
    return nil;
}

- (DBClient *)dbClient {
    if (!_dbClient) {
        _dbClient = [[DBClient alloc] init];
    }
    return _dbClient;
}


@end
