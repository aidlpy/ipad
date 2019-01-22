//
//  YSEQPThemeThreeTimeEvent.m
//  ipad
//
//  Created by wangshiwen on 2018/12/8.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSEQPThemeThreeTimeEvent.h"

#define kDelay 15

@interface YSEQPThemeThreeTimeEvent ()

@end

@implementation YSEQPThemeThreeTimeEvent

- (void)dealloc
{
    
}

- (void)setIndex:(NSInteger)index {
    
    _index = index;
    if (self.type == 0 && index == 1) {
        [self startRepeatEvent];
    }else {
        [self stopRepeatEvent];
        [YSSocketRequest requestTimeEventWithParameters:@{@"type":@(self.type),
                                                          @"categoryId":@(self.categoryId),
                                                          @"index":@(self.index)
                                                          }
                                               complete:nil];
    }
}

- (void)startRepeatEvent {
    
    [self stopRepeatEvent];
    [self reportFirstEvent];
}

- (void)stopRepeatEvent {
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

#pragma mark - Private

- (void)reportFirstEvent {
    
#warning test
    [YSSocketRequest requestTimeEventWithParameters:@{@"type":@(self.type),
                                                      @"categoryId":@(self.categoryId),
                                                      @"statue":@"1",
                                                      @"index":@(self.index)
                                                      }
                                           complete:nil];
    [self performSelector:@selector(reportSecondEvent) withObject:nil afterDelay:kDelay];
//    __weak __typeof(self)weakSelf = self;
//    [YSSocketRequest requestTimeEventWithParameters:@{@"type":@(self.type),
//                                                      @"statue":@(1)} complete:^(NSError *error) {
//        __strong __typeof(weakSelf)strongSelf = weakSelf;
//        if (strongSelf.playNextPageBlock) {
//            strongSelf.playNextPageBlock();
//        }
//        [strongSelf performSelector:@selector(reportSecondEvent) withObject:nil afterDelay:kDelay];
//    }];
    
}

- (void)reportSecondEvent {
    
#warning test
    [YSSocketRequest requestTimeEventWithParameters:@{@"type":@(self.type),
                                                      @"categoryId":@(self.categoryId),
                                                      @"index":@(self.index),
                                                      @"statue":@"2"} complete:nil];
    [self performSelector:@selector(reportFirstEvent) withObject:nil afterDelay:kDelay];
//    [YSSocketRequest requestTimeEventWithParameters:@{@"type":@(self.type),
//                                                      @"statue":@(2)} complete:^(NSError *error) {
//                                                          __strong __typeof(weakSelf)strongSelf = weakSelf;
//                                                          if (strongSelf.playNextPageBlock) {
//                                                              strongSelf.playNextPageBlock();
//                                                          }
//                                                          [strongSelf performSelector:@selector(reportFirstEvent) withObject:nil afterDelay:kDelay];
//                                                      }];
}

@end
