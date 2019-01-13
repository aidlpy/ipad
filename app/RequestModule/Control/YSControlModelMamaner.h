//
//  YSControlModelMamaner.h
//  ipad
//
//  Created by wangshiwen on 2018/11/17.
//  Copyright © 2018 nil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSControlBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YSControlModelMamaner : NSObject

@property (nonatomic, strong) NSArray<YSControlBaseModel *> *modelList;

+ (instancetype)shareInstance;

- (void)refreshModeWithDict:(NSDictionary *)dict;

- (void)saveToCache;

@end

FOUNDATION_EXPORT NSNotificationName const YSControlValueChangeNotification;  //

NS_ASSUME_NONNULL_END
