//
//  SymbolButton.h
//  toefl_ios
//
//  Created by wim on 2017/9/22.
//  Copyright © 2017年 wim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SymbolButton : UIView

- (void)setPlayName:(NSString*)name;
- (void)setSymbol:(NSString*)symbol;

- (CGFloat)getWidth;

@end
