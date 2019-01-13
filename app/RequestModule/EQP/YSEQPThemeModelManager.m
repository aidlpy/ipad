//
//  YSEQPThemeModelManager.m
//  ipad
//
//  Created by wangshiwen on 2018/12/15.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSEQPThemeModelManager.h"

@interface YSEQPThemeModelManager ()

@property (nonatomic, strong) NSMutableArray<YSEQPBaseModel *> *backgroundPlayModelList;

@end

@implementation YSEQPThemeModelManager

+ (instancetype)shareInstance {
    
    static YSEQPThemeModelManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[YSEQPThemeModelManager alloc] init];
    });
    
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _backgroundPlayModelList = [NSMutableArray arrayWithCapacity:1];
    }
    return self;
}

- (void)addBackgroundPlayModel:(YSEQPBaseModel *)model {
    
    if (![model isKindOfClass:YSEQPBaseModel.class]) {
        return;
    }
    if (model.backgroundPlay != 1) {
        return;
    }
    
    for (YSEQPBaseModel *tmpModel in _backgroundPlayModelList) {
        if (tmpModel.type == model.type && tmpModel.index == model.index) {
            return;
        }
    }
    [_backgroundPlayModelList addObject:model];
}

//切换主题的时候调用
- (void)switchSubjectWithType:(NSInteger)type {
    
    NSMutableArray<YSEQPBaseModel *> *deleteList = [NSMutableArray arrayWithCapacity:1];
    for (YSEQPBaseModel *tmpModel in _backgroundPlayModelList) {
        if (tmpModel.type != type) {
            if (tmpModel.backgroundPlay == 1) {
                [tmpModel initData];
                tmpModel.backgroundPlay = 0;
                [tmpModel request];
                
                [deleteList addObject:tmpModel];
            }
        }
    }
    [_backgroundPlayModelList removeObjectsInArray:[deleteList copy]];
}

@end
