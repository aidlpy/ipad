//
//  YSSocketData.h
//  ipad
//
//  Created by wangshiwen on 2018/11/21.
//  Copyright © 2018 nil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIConnection.h"

typedef NS_ENUM(NSUInteger, YSSocketDataStatus) {
    YSSocketDataStatus_Ready,
    YSSocketDataStatus_Succeess,    //请求成功
    YSSocketDataStatus_Failure,    //请求失败
};

@interface YSSocketData : NSObject

@property (nonatomic, assign) YSSocketDataStatus status;      //状态
@property (nonatomic, copy) NSString *message;                  //提示消息消息

@property (nonatomic, copy) NSString *object;
@property (nonatomic, copy) NSString *act;
@property (nonatomic, strong) JSONObject *sendParam;          //发送参数

@property (nonatomic, strong) JSONObject *responseData;       //解析后的数据
@property (nonatomic, copy) void(^completeBlock)(void);         //socket完成回调

@end
