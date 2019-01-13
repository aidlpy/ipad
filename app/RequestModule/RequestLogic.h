//
//  RequestLogic.h
//  ipad
//
//  Created by wangshiwen on 2018/12/9.
//  Copyright © 2018 nil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YSEQPBaseModel.h"


@interface RequestLogic : NSObject

+ (void)handleTopicPlayEvent:(YSEQPBaseModel *)model button:(UIButton *)button;

+ (void)handleTopicExitEvent:(YSEQPBaseModel *)model button:(UIButton *)button;

+ (void)handleTopicEnterEvent:(YSEQPBaseModel *)model;

@end
