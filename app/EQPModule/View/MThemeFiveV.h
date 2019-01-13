//
//  MThemeFiveV.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/12.
//  Copyright © 2018 nil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSEQPThemeFiveModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MThemeFiveV : UIView
@property(nonatomic,strong)NSMutableArray *selectedArray;
@property(nonatomic,strong)UILabel *titleLabel1;
@property(nonatomic,strong)UIButton *btn1;
@property(nonatomic,strong)UIButton *btn12;
@property(nonatomic,strong)UIButton *btn13;
@property(nonatomic,strong)UIButton *selected1;
@property(nonatomic,strong)UIButton *selected2;
@property(nonatomic,strong)UIButton *selected3;
@property(nonatomic,strong)UIButton *btn2;
@property(nonatomic,strong)UILabel *titleLabel2;
@property(nonatomic,copy)void(^selectedBlock)(UIButton *sender, YSEQPThemeFiveModel *model);
@property (nonatomic, strong) YSEQPThemeFiveModel *model;
-(void)initToDefalut;
@end

NS_ASSUME_NONNULL_END
