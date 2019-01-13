//
//  YSEQPThemeModelManager.h
//  ipad
//
//  Created by wangshiwen on 2018/12/15.
//  Copyright © 2018 nil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSEQPBaseModel.h"

@interface YSEQPThemeModelManager : NSObject

+ (instancetype)shareInstance;

- (void)addBackgroundPlayModel:(YSEQPBaseModel *)model;

//切换主题的时候调用
- (void)switchSubjectWithType:(NSInteger)type;

@end
