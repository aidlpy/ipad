//
//  YSResponseObj.m
//  ipad
//
//  Created by wangshiwen on 2018/11/17.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSResponseObj.h"

@implementation YSResponseObj

- (BOOL)isSuccess {
    return [self.resCode.uppercaseString isEqualToString:@"success"];
}

@end
