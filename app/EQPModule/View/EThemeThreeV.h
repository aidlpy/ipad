//
//  EThemeThreeV.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/10.
//  Copyright © 2018 nil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSEQPThemeThreeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EThemeThreeV : UIView
@property(nonatomic,strong)UILabel *titleLabel1;
@property(nonatomic,strong)UIButton *btn1;
@property(nonatomic,strong)UIButton *btn2;
@property(nonatomic,strong)UILabel *titleLabel2;
@property(nonatomic,strong)UIButton *btn3;
@property(nonatomic,strong)UIButton *btn4;
@property(nonatomic,copy)void(^changeBlock)(YSEQPThemeThreeModel *model);

@property (nonatomic, strong) YSEQPThemeThreeModel *model;

@end

NS_ASSUME_NONNULL_END
