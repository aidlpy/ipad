//
//  YSEQPThemeThreeTimeEvent.h
//  ipad
//
//  Created by wangshiwen on 2018/12/8.
//  Copyright © 2018 nil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSEQPThemeThreeTimeEvent : NSObject

@property (nonatomic, assign) NSInteger type;  //0生态   1未检
@property (nonatomic, assign) NSInteger categoryId;  //
@property (nonatomic, assign) NSInteger index;

- (void)stopRepeatEvent;

@end
