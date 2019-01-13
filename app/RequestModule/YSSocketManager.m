//
//  YSHTTPSessionManager.m
//  ipad
//
//  Created by wangshiwen on 2018/11/17.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSSocketManager.h"
#import "APIConnection.h"
#import "MBProgressHUD+ND.h"

//#ifdef DEBUG
//#define WSURL @"ws://134.175.249.29:51717/huian"
//#else
#define WSURL @"ws://192.168.21.2:51717/huian"
//#endif

APIConnection *globalConn;

@interface YSSocketManager ()

@property (nonatomic, strong) NSMutableDictionary *socketActionDictionary;  //socket动作请求

@end

@implementation YSSocketManager

+ (instancetype)sharedInstance {
    
    static YSSocketManager *instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[YSSocketManager alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        globalConn = [[APIConnection alloc] init];
        [globalConn.client_info setObject:@"iOS" forKey:@"clienttype"];
        [globalConn.client_info setObject:@"1.9" forKey:@"version"];
        [globalConn setWsURL:WSURL];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(state_changed) name: globalConn.stateChangedNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(response_received) name: globalConn.responseReceivedNotification object:nil];

        [globalConn connect];
    }
    return self;
}

- (void)socketSendDataWithParam:(YSSocketData *)data {
    
    if (!data) {
        return;
    }
    
    [globalConn send:data.sendParam];
    [self socketActionDictionaryAddObj:data];
}

#pragma mark - Notification

-(void)response_received
{
    // global error display
    NSLog(@"globalConn.response==>%@",globalConn.response);
    NSString * ustr =[globalConn.response s:@"ustr"];
    NSLog(@"返回数据==>%@",ustr);
    if (ustr && ustr.length>0) {
        
        // this is for debug, ignore fornow
//        if ([[globalConn.response s:@"uerr"] isEqualToString:@"ERR_CONNECTION_EXCEPTION"]) return;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [MBProgressHUD hideHUD];
//            [MBProgressHUD showError:ustr];
//        });
        NSLog(@"出错了:%@", ustr);
    }
    
    NSString *object = [globalConn.response s:@"obj"];
    NSString *act = [globalConn.response s:@"act"];
    NSString *action = [self actionWithObject:object act:act];
    NSMutableArray *array = [self.socketActionDictionary objectForKey:action];
    for (YSSocketData *data in array) {
        data.status = (ustr && ustr.length>0)?YSSocketDataStatus_Failure:YSSocketDataStatus_Succeess;
        data.responseData = globalConn.response;
        data.message = ustr;
        [self socketActionDidSuccess:data];
    }
    [self socketActionDictionaryRemoveObjWithAction:action];
}

-(void)state_changed
{
    if(globalConn.state == LOGIN_SCREEN_ENABLED) {//登录
        [globalConn login:@"ipad1" withPasswd:@"123456"];
    }
}

#pragma mark - Private

- (NSString *)actionWithObject:(NSString *)object act:(NSString *)act {
    
    NSString *key = [NSString stringWithFormat:@"%@-%@", object, act];
    return key;
}

- (void)socketActionDictionaryAddObj:(YSSocketData *)data {
    if (data) {
        NSString *object = data.object;
        NSString *act = data.act;
        NSString *action = [self actionWithObject:object act:act];
        NSMutableArray *sockDataArray = [NSMutableArray array];
        if (action && action.length) {
            NSMutableArray *array = [self.socketActionDictionary objectForKey:action];
            if (array) {
                sockDataArray = array;
            }
            else {
                [self.socketActionDictionary setObject:sockDataArray forKey:action];
            }
        }
        if (![sockDataArray containsObject:data]) {
            [sockDataArray addObject:data];
        }
    }
}

- (void)socketActionDictionaryRemoveObjWithAction:(NSString *)action {
    
    [self.socketActionDictionary removeObjectForKey:action];
}

- (void)socketActionDidSuccess:(YSSocketData *)socketData {
    
    if (socketData.completeBlock) {
        socketData.completeBlock();
    }
}

- (void)socketActionDidFailed:(YSSocketData *)socketData {
    
    if (socketData.completeBlock) {
        socketData.completeBlock();
    }
}

@end
