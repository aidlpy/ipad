//
//  YSControlThemeTwoModel.m
//  ipad
//
//  Created by wangshiwen on 2018/11/17.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSControlProjectorModel.h"

@implementation YSControlProjectorModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.index = 3;
    }
    return self;
}

- (NSString *)switch_propertyKeyWithRow:(NSInteger)row {
    
    NSDictionary *rowPropertyDict = @{@0:@"all",
                                      @1:@"topic4Projector1",
                                      @2:@"topic4Projector2",
                                      @3:@"topic4Projector3",
                                      @4:@"topic4Projector4",
                                      @5:@"topic5Projector1",
                                      @6:@"topic5Projector2",
                                      @7:@"topic5Projector3",
                                      @8:@"parkour",
                                      @9:@"psychology"
                                      };
    
    return [rowPropertyDict objectForKey:@(row)];
}

@end
