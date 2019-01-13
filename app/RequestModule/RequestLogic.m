//
//  RequestLogic.m
//  ipad
//
//  Created by wangshiwen on 2018/12/9.
//  Copyright © 2018 nil. All rights reserved.
//

#import "RequestLogic.h"

@implementation RequestLogic

+ (void)handleTopicPlayEvent:(YSEQPBaseModel *)model button:(UIButton *)button {
    
    if (model.play == -1) {
        model.play = 2;
    }else if (model.play == 0) {
        model.play = 1;
    }else {
         model.play = 0;
    }
    NSInteger tmpPlay = model.play;
    //初始数据
    [model initData];
    model.play = tmpPlay;
    [model request];
    [button setTitle:tmpPlay==0?@"开始播放":@"暂停播放" forState:UIControlStateNormal];
}

+ (void)handleTopicExitEvent:(YSEQPBaseModel *)model button:(UIButton *)button {
    
//    if (model.play == 0) {
//        return;
//    }

    [model initData];
    model.play = 0;
    [model request];
    
    [button setTitle:@"开始播放" forState:UIControlStateNormal];
}

+ (void)handleTopicEnterEvent:(YSEQPBaseModel *)model {
    
    model.play = -1;
    [YSSocketRequest requestTopicWithParameters:@{@"type":@(model.type),
                                                   @"index":@(model.index),
                                                   @"init":@"1"} complete:nil];
}

@end
