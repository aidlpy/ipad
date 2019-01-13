//
//  BaseViewController.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/8.
//  Copyright © 2018 nil. All rights reserved.
//

#import "ViewController.h"
#define ScreenSize  [[UIScreen mainScreen] bounds].size
NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : ViewController
+(id)readLocalFileWithName:(NSString *)name;
+(NSString*)getCurrentTimes;
@end

NS_ASSUME_NONNULL_END
