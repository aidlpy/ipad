//
//  YSSocketData.m
//  ipad
//
//  Created by wangshiwen on 2018/11/21.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSSocketData.h"

@implementation YSSocketData

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sendParam = [[JSONObject alloc] initWithCapacity:1];
    }
    return self;
}

@end
