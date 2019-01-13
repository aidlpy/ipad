//
//  YSControlThemeThreeModel.m
//  ipad
//
//  Created by wangshiwen on 2018/11/17.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSControlSoundModel.h"

@implementation YSControlSoundModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.index = 4;
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

- (NSString *)slider_propertyKeyWithRow:(NSInteger)row {
    
    NSDictionary *rowPropertyDict = @{@1:@"imageVolume",
                                      @2:@"topic1OrderVolume",
                                      @3:@"topic1Volume",
                                      @4:@"topic2OrderVolume",
                                      @5:@"topic2Volume",
                                      @6:@"topic3OrderVolume",
                                      @7:@"topic3Volume",
                                      @8:@"topic4Volume",
                                      @9:@"topic5Volume",
                                      @10:@"topic5BackVolume",
                                      @11:@"topic6OrderVolume",
                                      @12:@"topic6Volume",
                                      @13:@"tableGameVolume",
                                      @14:@"parkourVolume",
                                      @15:@"VRVolume",
                                      @16:@"psychologyVolume",
                                      @17:@"historyVolume"
                                      };
    return [rowPropertyDict objectForKey:@(row)];
}

@end
