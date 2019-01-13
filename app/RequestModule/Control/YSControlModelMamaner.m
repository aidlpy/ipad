//
//  YSControlModelMamaner.m
//  ipad
//
//  Created by wangshiwen on 2018/11/17.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSControlModelMamaner.h"
#import "YSControlLightModel.h"
#import "YSControlSocketModel.h"
#import "YSControlComputerModel.h"
#import "YSControlProjectorModel.h"
#import "YSControlSoundModel.h"


#import <YYCache/YYCache.h>

NSNotificationName const YSControlValueChangeNotification = @"YSControlValueChangeNotification";

@implementation YSControlModelMamaner

+ (instancetype)shareInstance {
    
    static YSControlModelMamaner *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[YSControlModelMamaner alloc] init];
    });
    
    return manager;
}

- (void)refreshModeWithDict:(NSDictionary *)dict {
    
    if ([dict objectForKey:@"index"]) {
        NSInteger index = [[dict objectForKey:@"index"] integerValue];
        YSControlBaseModel *model = nil;
        for (YSControlBaseModel *tmpModel in self.modelList) {
            if (tmpModel.index == index) {
                model = tmpModel;
                break;
            }
        }
        if (model) {
            NSArray *propertyKeyList = [model mj_keyValues].allKeys;
            for (NSString *key in propertyKeyList) {
                if ([dict objectForKey:key]) {
                    [model setValue:[dict objectForKey:key] forKey:key];
                    [[NSNotificationCenter defaultCenter] postNotificationName:YSControlValueChangeNotification object:nil];
                }
            }
        }
    }
}

static NSString *kControlCacheKey = @"kControlCacheKey";

- (void)saveToCache {
    
    id object = [self.modelList mj_JSONObject];
    [[self controlCache] setObject:object forKey:kControlCacheKey];
}

- (NSArray<YSControlBaseModel *> *)modelList {
    
    if (!_modelList) {
        id object = [[self controlCache] objectForKey:kControlCacheKey];
        if (object) {
            _modelList = object;
        }else {
            _modelList = @[[YSControlLightModel new],
                           [YSControlSocketModel new],
                           [YSControlComputerModel new],
                           [YSControlProjectorModel new],
                           [YSControlSoundModel new]];
        }
    }
    return _modelList;
}

#pragma mark - Cache

- (YYCache *)controlCache {
    
    static YYCache *cache =  nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[YYCache alloc] initWithName:@"ipad_control_cache"];
    });
    
    return cache;
}

@end
