//
//  YSControlBaseModel.m
//  ipad
//
//  Created by wangshiwen on 2018/11/17.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSControlBaseModel.h"
#import "YSControlModelMamaner.h"

@implementation YSControlBaseModel

- (void)getControlInfoFromNetWork {
    
    [YSSocketRequest requestGetDeviceWithParameters:@{@"index":@(self.index)} complete:^(NSDictionary *dict, NSError *error) {
        if (!error) {
            [[YSControlModelMamaner shareInstance] refreshModeWithDict:dict];
        }else {
            NSLog(@"请求设备信息出错了：%@", error);
        }
    }];
}

- (void)refreshSwitchWithRow:(NSInteger)row switch:(NSInteger)isSwitch {
    
    NSString *key = [self switch_propertyKeyWithRow:row];
    if (key) {
        [self setValue:@(isSwitch) forKey:key];
        //网络请求
        [YSSocketRequest requestControlDeviceWithParameters:@{@"index":@(self.index),
                                                              key:@(isSwitch)} complete:nil];
        [[YSControlModelMamaner shareInstance] saveToCache];
    }else {
        NSAssert(0, @"请检查变量名与key是否一致");
    }
        
}

- (void)refreshSliderWithRow:(NSInteger)row value:(float)value {
    
    NSString *key = [self slider_propertyKeyWithRow:row];
    if (key) {
        if ([[self valueForKey:key] floatValue] == value) { //前后一样  没有必要上报
            return;
        }
        [self setValue:@(value) forKey:key];
        //网络请求
        [YSSocketRequest requestControlDeviceWithParameters:@{@"index":@(self.index),
                                                              key:@(value)} complete:nil];
        [[YSControlModelMamaner shareInstance] saveToCache];
    }else {
        NSAssert(0, @"请检查变量名与key是否一致");
    }
}

- (BOOL)switchValueWithRow:(NSInteger)row {
    
    NSString *key = [self switch_propertyKeyWithRow:row];
    if (key) {
        return [[self valueForKey:key] boolValue];
        //网络请求
    }else {
        return NO;
    }
}

- (float)sliderValueWithRow:(NSInteger)row {
    
    NSString *key = [self slider_propertyKeyWithRow:row];
    if (key) {
        return [[self valueForKey:key] floatValue];
        //网络请求
    }else {
        return 0;
    }
}

- (NSString *)switch_propertyKeyWithRow:(NSInteger)row {
    
    return nil;
}

- (NSString *)slider_propertyKeyWithRow:(NSInteger)row {
    
    return nil;
}

- (NSDictionary *)jsonDict {
    
    return [self mj_JSONObject];
}

#pragma mark coding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        [self mj_decode:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    
    [self mj_encode:encoder];
}

@end
