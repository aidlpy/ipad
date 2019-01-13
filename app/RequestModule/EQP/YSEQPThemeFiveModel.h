//
//  YSEQPThemeFiveModel.h
//  ipad
//
//  Created by wangshiwen on 2018/11/20.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSEQPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YSEQPThemeFiveModel : YSEQPBaseModel

@property (nonatomic, assign) NSInteger screenNumber;   //屏幕编号
@property (nonatomic, assign) NSInteger categoryId;    //详情模块id     通过这个id来显示那个标签页    
@property (nonatomic, assign) NSInteger detailIndex;    //详情索引
@property (nonatomic, assign) NSInteger detailContentIndex;  //详情里面的内容索引
@end

NS_ASSUME_NONNULL_END
