//
//  YSControlAllModel.m
//  ipad
//
//  Created by wangshiwen on 2018/12/25.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSControlLightModel.h"

@interface YSControlLightModel()

@end

@implementation YSControlLightModel

- (instancetype)init
{

    self = [super init];
    if (self) {
        self.index = 0;
       
    }
    return self;
}

- (NSString *)switch_propertyKeyWithRow:(NSInteger)row {
   
    NSDictionary *rowPropertyDict = @{@0:@"all",
                                      @1:@"center",
                                      @2:@"image",
                                      @3:@"topic1",
                                      @4:@"topic2",
                                      @5:@"topic3",
                                      @6:@"topic4",
                                      @7:@"topic5",
                                      @8:@"topic6",
                                      @9:@"tableGame",
                                      @10:@"parkour",
                                      @11:@"VR",
                                      @12:@"psychology"
                                      };
    return [rowPropertyDict objectForKey:@(row)];
}

@end
