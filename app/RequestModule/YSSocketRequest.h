//
//  YSSocketRequest.h
//  ipad
//
//  Created by wangshiwen on 2018/11/21.
//  Copyright © 2018 nil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSSocketRequest : NSObject
//开启关闭设备
+ (void)requestSwitchDeviceWithSwitch:(BOOL)isSwitch complete:(void(^)(NSError *error))complete;
//硬件控制
+ (void)requestControlDeviceWithParameters:(NSDictionary *)parameters  complete:(void(^)(NSError *error))complete;

+ (void)requestGetDeviceWithParameters:(NSDictionary *)parameters complete:(void(^)(NSDictionary *dict, NSError *error))complete;

//专题控制
+ (void)requestTopicWithParameters:(NSDictionary *)parameters complete:(void(^)(NSError *error))complete;
//专题三定时事件控制
+ (void)requestTimeEventWithParameters:(NSDictionary *)parameters complete:(void(^)(NSError *error))complete;

@end
