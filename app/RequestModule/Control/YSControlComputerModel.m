//
//  YSControlThemeOneModel.m
//  ipad
//
//  Created by wangshiwen on 2018/11/17.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSControlComputerModel.h"

@implementation YSControlComputerModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.index = 2;
    }
    return self;
}

- (NSString *)switch_propertyKeyWithRow:(NSInteger)row {
    
    NSDictionary *rowPropertyDict = @{@0:@"all",
                                       @1:@"image",
                                       @2:@"topic1Order",
                                       @3:@"topic1",
                                       @4:@"topic2Order",
                                       @5:@"topic2",
                                       @6:@"topic3Order",
                                       @7:@"topic3",
                                      @8:@"topic4",
                                      @9:@"topic5",
                                      @10:@"topic5Back",
                                      @11:@"topic6Order",
                                      @12:@"topic6",
                                       @13:@"tableGame",
                                       @14:@"parkour",
                                       @15:@"VR",
                                       @16:@"psychology",
                                      @17:@"history"
                                       };
    return [rowPropertyDict objectForKey:@(row)];
}

@end
