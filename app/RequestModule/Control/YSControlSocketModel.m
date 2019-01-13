//
//  YSControlImageModel.m
//  ipad
//
//  Created by wangshiwen on 2018/11/17.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSControlSocketModel.h"

@implementation YSControlSocketModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.index = 1;
    }
    return self;
}

#pragma mark - OverWrite

- (NSString *)switch_propertyKeyWithRow:(NSInteger)row {
    
    NSDictionary *rowPropertyDict = @{@0:@"all",
                                      @1:@"image",
                                      @2:@"topic1",
                                      @3:@"topic2",
                                      @4:@"topic3",
                                      @5:@"topic4",
                                      @6:@"topic5",
                                      @7:@"topic6",
                                      @8:@"tableGame",
                                      @9:@"parkour",
                                      @10:@"VR",
                                      @11:@"psychology"
                                      };
    return [rowPropertyDict objectForKey:@(row)];
}

@end
