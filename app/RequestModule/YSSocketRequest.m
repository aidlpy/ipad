//
//  YSSocketRequest.m
//  ipad
//
//  Created by wangshiwen on 2018/11/21.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSSocketRequest.h"
#import "YSocketDataFactory.h"
#import <MJExtension/MJExtension.h>
#import "YSSocketManager.h"

@implementation YSSocketRequest

+ (void)requestSwitchDeviceWithSwitch:(BOOL)isSwitch complete:(void(^)(NSError *error))complete {
    
    YSSocketData *socketData = [YSocketDataFactory socketActionSwitchDeviceWithSwitch:isSwitch];
    [self sendSocketData:socketData responseClass:nil success:^(id responseObject) {
        if (complete) {
            complete(nil);
        }
    } failure:^(NSError *error) {
        if (complete) {
            complete(error);
        }
    }];
}

+ (void)requestControlDeviceWithParameters:(NSDictionary *)parameters  complete:(void(^)(NSError *error))complete {
    
    YSSocketData *socketData = [YSocketDataFactory socketActionControlDeviceWithParameters:parameters];
    [self sendSocketData:socketData responseClass:nil success:^(id responseObject) {
        if (complete) {
            complete(nil);
        }
    } failure:^(NSError *error) {
        if (complete) {
            complete(error);
        }
    }];
}

+ (void)requestGetDeviceWithParameters:(NSDictionary *)parameters complete:(void(^)(NSDictionary *dict, NSError *error))complete {
    
    YSSocketData *socketData = [YSocketDataFactory socketActionControlDeviceWithParameters:parameters];
    [self sendSocketData:socketData responseClass:nil success:^(id responseObject) {
        if (complete) {
            complete(responseObject, nil);
        }
    } failure:^(NSError *error) {
        if (complete) {
            complete(nil, error);
        }
    }];
}

+ (void)requestTopicWithParameters:(NSDictionary *)parameters complete:(void(^)(NSError *error))complete {
    
    YSSocketData *socketData = [YSocketDataFactory socketActionTopicWithParameters:parameters];
    [self sendSocketData:socketData responseClass:nil success:^(id responseObject) {
        if (complete) {
            complete(nil);
        }
    } failure:^(NSError *error) {
        if (complete) {
            complete(error);
        }
    }];
}

+ (void)requestTimeEventWithParameters:(NSDictionary *)parameters complete:(void(^)(NSError *error))complete {
    
    YSSocketData *socketData = [YSocketDataFactory socketActionTimeEventWithParameters:parameters];
    [self sendSocketData:socketData responseClass:nil success:^(id responseObject) {
        if (complete) {
            complete(nil);
        }
    } failure:^(NSError *error) {
        if (complete) {
            complete(error);
        }
    }];
}

#pragma mark - Private

+ (void)sendSocketData:(YSSocketData *)socketData responseClass:(Class)responseClass success:(void(^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    NSLog(@"请求参数：%@", socketData.sendParam);
    __weak __typeof(socketData)weak_socketData = socketData;
    socketData.completeBlock = ^{
        if (weak_socketData.status == YSSocketDataStatus_Succeess) {
            if (success) {
                //id responseObject = [responseClass mj_objectWithKeyValues:weak_socketData.responseData];
                success(weak_socketData.responseData);
            }
        } else {
            NSString *message = weak_socketData.message;
            NSError *error = [NSError errorWithDomain:message code:-1 userInfo:nil];
            if (failure) {
                failure(error);
            }
        }
    };
    [[YSSocketManager sharedInstance] socketSendDataWithParam:socketData];
}

@end
