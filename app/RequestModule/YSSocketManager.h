//
//  YSHTTPSessionManager.h
//  ipad
//
//  Created by wangshiwen on 2018/11/17.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSSocketData.h"

NS_ASSUME_NONNULL_BEGIN

@interface YSSocketManager : NSObject

+ (instancetype)sharedInstance;

/**
 socket 发送数据
 
 @param data 数据对象
 */
- (void)socketSendDataWithParam:(YSSocketData *)data;


@end

NS_ASSUME_NONNULL_END
