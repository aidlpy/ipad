//
//  YSEQPThemeSixModel.m
//  ipad
//
//  Created by wangshiwen on 2018/11/20.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSEQPThemeSixModel.h"

@implementation YSEQPThemeSixModel

- (void)initData {
    
    [super initData];
    self.play = -1;
    self.screenNumber = -1;
}

- (void)setScreenNumber:(NSInteger)screenNumber {
    
    _screenNumber = screenNumber;
    if (screenNumber>=0) {
        self.play = -1;
    }
}

@end
