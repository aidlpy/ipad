//
//  YSResponseObj.h
//  ipad
//
//  Created by wangshiwen on 2018/11/17.
//  Copyright © 2018 nil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSResponseObj : NSObject

/**
 接口返回的code,调用成功: SUCCESS, 调用失败参考每个接口的错误代码
 */
@property (nonatomic, copy) NSString *resCode;

/**
 返回信息说明
 */
@property (nonatomic, copy  ) NSString *resDescription;

/**
 返回的接口数据
 */
@property (nonatomic, strong) NSDictionary *resData;

- (BOOL)isSuccess;

@end

NS_ASSUME_NONNULL_END
