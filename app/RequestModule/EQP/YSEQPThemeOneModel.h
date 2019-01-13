//
//  YSEQPThemeOneModel.h
//  ipad
//
//  Created by wangshiwen on 2018/11/20.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSEQPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YSEQPThemeOneModel : YSEQPBaseModel

@property (nonatomic, assign) NSInteger screenNumber;   //屏幕编号
@property (nonatomic, assign) NSInteger screenIndex;   //屏幕编号
@property (nonatomic, assign) NSInteger secondViewVerticalIndex;   //二级界面水平索引
@property (nonatomic, assign) NSInteger nextPage;    //0：上一页  1：下一页

@end

NS_ASSUME_NONNULL_END
