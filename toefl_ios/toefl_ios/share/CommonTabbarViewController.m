//
//  CommonTabbarViewController.m
//  video_ios
//
//  Created by wim on 2017/6/7.
//  Copyright © 2017年 wim. All rights reserved.
//

#import "CommonTabbarViewController.h"

#import "WordViewController.h"
#import "ProfileViewController.h"
#import "ListenViewController.h"
#import "CompositionViewController.h"
#import "CompositionTypeViewController.h"


@interface CommonTabbarViewController (){
    UINavigationController *_wordNav;
    UINavigationController *_listenNav;
    UINavigationController *_compositionNav;
    UINavigationController *_profileNav;
}

@property (nonatomic, strong) WordViewController *wordViewController;
@property (nonatomic, strong) ListenViewController *listenViewController;
@property (nonatomic, strong) CompositionViewController *compositionViewController;
@property (nonatomic, strong) ProfileViewController *profileViewController;
@property (nonatomic, strong) CompositionTypeViewController *compositionTypeViewController;
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation CommonTabbarViewController

+ (CommonTabbarViewController*)singleton {
    static dispatch_once_t once;
    static CommonTabbarViewController *client = nil;
    dispatch_once(&once, ^ {
        client = [[self alloc] init];
    });
    return client;
}


- (instancetype)init{
    self = [super init];
    if (self) {
    
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _wordViewController = [[WordViewController alloc] init];
    _listenViewController = [[ListenViewController alloc] init];
    _compositionViewController = [[CompositionViewController alloc] init];
    _profileViewController = [[ProfileViewController alloc] init];
    _compositionTypeViewController = [[CompositionTypeViewController alloc] init];
    
    _wordNav = [[UINavigationController alloc] initWithRootViewController:_wordViewController];
    _listenNav = [[UINavigationController alloc] initWithRootViewController:_listenViewController];
    _compositionNav = [[UINavigationController alloc] initWithRootViewController:_compositionTypeViewController];
    _profileNav = [[UINavigationController alloc] initWithRootViewController:_profileViewController];
    
    NSDictionary *wordDic = [NSDictionary dictionaryWithObjectsAndKeys:_wordNav,ViewKey,
                             @"tab_word_normal.png",ImgNormalKey,
                             @"tab_word_selected.png",ImgSelectedKey,
                             @"词汇",TitleKey,nil];
    NSDictionary *listenDic = [NSDictionary dictionaryWithObjectsAndKeys:_listenNav,ViewKey,
                             @"tab_listen_normal.png",ImgNormalKey,
                             @"tab_listen_selected.png",ImgSelectedKey,
                             @"听力",TitleKey,nil];
    NSDictionary *compositionDic = [NSDictionary dictionaryWithObjectsAndKeys:_compositionNav,ViewKey,
                               @"tab_composition_normal.png",ImgNormalKey,
                               @"tab_composition_selected.png",ImgSelectedKey,
                               @"写作",TitleKey,nil];
    
    NSDictionary *profileDic = [NSDictionary dictionaryWithObjectsAndKeys:_profileNav,ViewKey,
                               @"profile_tab_normal.png",ImgNormalKey,
                               @"profile_tab_selected.png",ImgSelectedKey,
                               @"我的",TitleKey,nil];
    
    
    
    _items = [[NSMutableArray alloc] init];
    [_items addObject:wordDic];
    [_items addObject:listenDic];
    [_items addObject:compositionDic];
    [_items addObject:profileDic];
    
    [self setTabbar:_items];
}


@end
