//
//  MThemeSixV.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/13.
//  Copyright © 2018 nil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSEQPThemeSixModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MThemeSixV : UIView
@property(nonatomic,strong)UILabel *titleLabel1;
@property(nonatomic,strong)UIButton *btn1;
@property(nonatomic,strong)UIButton *btn2;
@property(nonatomic,strong)UILabel *titleLabel2;
@property(nonatomic,strong)UIButton *btn3;
@property(nonatomic,strong)UIButton *btn4;
@property(nonatomic,strong)UIButton *btn5;

@property (nonatomic, strong) YSEQPThemeSixModel *model;

- (void)exit;

- (void)enter;

@end

NS_ASSUME_NONNULL_END
