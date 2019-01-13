//
//  YSocketDataFactory.m
//  ipad
//
//  Created by wangshiwen on 2018/11/21.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSocketDataFactory.h"

@implementation YSocketDataFactory

+ (YSSocketData *)socketActionSwitchDeviceWithSwitch:(BOOL)isSwitch {
    
    //待办
    return nil;
}

+ (YSSocketData *)socketActionControlDeviceWithParameters:(NSDictionary *)parameters {
    
    YSSocketData *socket = [YSSocketData new];
    socket.object = @"ipadManager";
    socket.act = @"set";
    [socket.sendParam setObject:socket.object forKey:@"obj"];
    [socket.sendParam setObject:socket.act forKey:@"act"];
    [socket.sendParam addEntriesFromDictionary:parameters];
    
    return socket;
}

+ (YSSocketData *)socketActionGetDeviceWithParameters:(NSDictionary *)parameters {
    
    YSSocketData *socket = [YSSocketData new];
    socket.object = @"ipadManager";
    socket.act = @"get";
    [socket.sendParam setObject:socket.object forKey:@"obj"];
    [socket.sendParam setObject:socket.act forKey:@"act"];
    [socket.sendParam addEntriesFromDictionary:parameters];
    
    return socket;
}

+ (YSSocketData *)socketActionTopicWithParameters:(NSDictionary *)parameters {
    
    YSSocketData *socket = [YSSocketData new];
    socket.object = @"IPAD";
    socket.act = @"control";
    [socket.sendParam setObject:socket.object forKey:@"obj"];
    [socket.sendParam setObject:socket.act forKey:@"act"];
    [socket.sendParam addEntriesFromDictionary:parameters];
    
    return socket;
}

+ (YSSocketData *)socketActionTimeEventWithParameters:(NSDictionary *)parameters {
    
    //
    YSSocketData *socket = [YSSocketData new];
    socket.object = @"topic3";
    socket.act = @"control";
    [socket.sendParam setObject:socket.object forKey:@"obj"];
    [socket.sendParam setObject:socket.act forKey:@"act"];
    [socket.sendParam addEntriesFromDictionary:parameters];
    
    return socket;
}

@end
