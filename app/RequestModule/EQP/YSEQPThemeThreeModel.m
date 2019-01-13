//
//  YSEQPThemeThreeModel.m
//  ipad
//
//  Created by wangshiwen on 2018/11/20.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSEQPThemeThreeModel.h"

@implementation YSEQPThemeThreeModel

- (void)initData {
    
    [super initData];
    self.play = -1;
    self.contentIndex = -1;
}

- (void)setContentIndex:(NSInteger)contentIndex {
    
    _contentIndex = contentIndex;
    if (contentIndex >=0) {
        self.play = -1;
    }
}

@end
