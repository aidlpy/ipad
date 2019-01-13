//
//  YSEQPBaseModel.m
//  ipad
//
//  Created by wangshiwen on 2018/11/20.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSEQPBaseModel.h"

@implementation YSEQPBaseModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData {
    
    _close = -1;
    _play = -1;
    _backgroundPlay = -1;
}

- (void)request {
    
    [YSSocketRequest requestTopicWithParameters:[self parametersDict] complete:nil];
}

- (void)closeRequest {
    
    self.close = 1;
    [self request];
}

- (NSDictionary *)parametersDict {
    
    NSMutableDictionary *dict = [self mj_keyValues];
    //过滤为-1的属性
    NSDictionary *tmpDict = [dict copy];
    for(NSString *key in tmpDict) {
        if ([[tmpDict objectForKey:key] integerValue] < 0) {
            [dict removeObjectForKey:key];
        }
    }
    return [dict copy];
}

@end
