//
//  EFiveSubDetailVC.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/11.
//  Copyright © 2018 nil. All rights reserved.
//

#import "BaseViewController.h"
#import "YSEQPThemeFiveModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EFiveSubDetailVC : BaseViewController
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,assign)NSInteger defalutIndex;

- (instancetype)initWithModel:(YSEQPThemeFiveModel *)model;

@end

NS_ASSUME_NONNULL_END
