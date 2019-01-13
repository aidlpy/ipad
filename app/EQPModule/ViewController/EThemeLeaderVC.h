//
//  EThemeLeaderVC.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/12.
//  Copyright © 2018 nil. All rights reserved.
//

#import "BaseViewController.h"
#import "YSEQPThemeOneModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EThemeLeaderVC : BaseViewController
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)UIView *rightView;
@property(nonatomic,strong)UIView *leftView;
@property(nonatomic,assign)NSInteger defalutIndex;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UITextView *textView;

- (instancetype)initWithModel:(YSEQPThemeOneModel *)model;

@end

NS_ASSUME_NONNULL_END
