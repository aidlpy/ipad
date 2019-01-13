//
//  YSocketDataFactory.h
//  ipad
//
//  Created by wangshiwen on 2018/11/21.
//  Copyright © 2018 nil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSSocketData.h"

@interface YSocketDataFactory : NSObject

+ (YSSocketData *)socketActionSwitchDeviceWithSwitch:(BOOL)isSwitch;

+ (YSSocketData *)socketActionControlDeviceWithParameters:(NSDictionary *)parameters;
//获取设备控制信息
+ (YSSocketData *)socketActionGetDeviceWithParameters:(NSDictionary *)parameters;

+ (YSSocketData *)socketActionTopicWithParameters:(NSDictionary *)parameters;

+ (YSSocketData *)socketActionTimeEventWithParameters:(NSDictionary *)parameters;

@end
