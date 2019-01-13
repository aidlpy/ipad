//
//  EThreeChangeVC.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/12.
//  Copyright © 2018 nil. All rights reserved.
//

#import "BaseViewController.h"
#import "YSEQPThemeThreeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EThreeChangeVC : BaseViewController
@property(nonatomic,assign)BOOL isM;
@property(nonatomic,strong)UIButton *btn ;
@property(nonatomic,strong)UIButton *btn1 ;
@property(nonatomic,strong)UIButton *btn2;

- (instancetype)initWithModel:(YSEQPThemeThreeModel *)model;

@end

NS_ASSUME_NONNULL_END
