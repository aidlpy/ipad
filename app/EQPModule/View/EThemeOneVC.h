//
//  EThemeOneVC.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/9.
//  Copyright © 2018 nil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSEQPThemeOneModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EThemeOneVC : UIView
@property(nonatomic,strong)UILabel *titleLabel1;
@property(nonatomic,strong)UILabel *titleLabel2;
@property(nonatomic,strong)UIButton *btn1;
@property(nonatomic,strong)UIButton *btn2;
@property(nonatomic,strong)UIButton *btn3;
@property(nonatomic,strong)UIButton *btn4;
@property(nonatomic,strong)UIButton *btn5;
@property(nonatomic,strong)UIButton *btn6;

@property(nonatomic, strong) YSEQPThemeOneModel *model;

@property(nonatomic,copy)void(^selectedBlock)(UIButton *sender, YSEQPThemeOneModel *model);
@end

NS_ASSUME_NONNULL_END
