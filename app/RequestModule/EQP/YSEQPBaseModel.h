//
//  YSEQPBaseModel.h
//  ipad
//
//  Created by wangshiwen on 2018/11/20.
//  Copyright © 2018 nil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSEQPBaseModel : NSObject

@property (nonatomic, assign) NSInteger type;   //0：生态  1：未检
@property (nonatomic, assign) NSInteger index;  //0:形象墙 1:专题1  以此类推
@property (nonatomic, assign) NSInteger close;  //0：打开专题   1关闭专题
@property (nonatomic, assign) NSInteger play;   //序言播放  0暂停 1播放 2重播
@property (nonatomic, assign) NSInteger backgroundPlay;   //背景音乐播放  0暂停 1播放

- (void)initData;

- (void)request;
- (void)closeRequest;  //关闭屏幕调用该方法

- (NSDictionary *)parametersDict;

@end

NS_ASSUME_NONNULL_END
