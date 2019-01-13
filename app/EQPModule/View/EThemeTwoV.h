//
//  EThemeTwoV.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/10.
//  Copyright © 2018 nil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSEQPThemeTwoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EThemeTwoV : UIView
@property(nonatomic,strong)UILabel *titleLabel1;
@property(nonatomic,strong)UIButton *btn1;
@property(nonatomic,strong)UIButton *btn2;

@property (nonatomic, strong) YSEQPThemeTwoModel *model;

@end

NS_ASSUME_NONNULL_END
