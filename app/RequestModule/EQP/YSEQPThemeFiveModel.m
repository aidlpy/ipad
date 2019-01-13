//
//  YSEQPThemeFiveModel.m
//  ipad
//
//  Created by wangshiwen on 2018/11/20.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSEQPThemeFiveModel.h"

@implementation YSEQPThemeFiveModel

- (void)initData {
    
    [super initData];
    self.screenNumber = -1;
    self.detailIndex = -1;
    self.detailContentIndex = -1;
    self.close = -1;
    self.categoryId = -1;
}

- (void)setScreenNumber:(NSInteger)screenNumber {
    
    _screenNumber = screenNumber;
    if (screenNumber >= 0) {
        self.detailIndex = -1;
        self.detailContentIndex = -1;
    }
}

@end
