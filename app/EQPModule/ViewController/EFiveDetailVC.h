//
//  EFiveDetailVC.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/10.
//  Copyright © 2018 nil. All rights reserved.
//

#import "BaseViewController.h"
#import "YSEQPThemeFiveModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EFiveDetailVC : BaseViewController
@property(nonatomic,assign)BOOL isE;
@property(nonatomic,assign)NSInteger tag;

- (instancetype)initWithModel:(YSEQPThemeFiveModel *)model;

@end

NS_ASSUME_NONNULL_END
