//
//  EThemeFiveV.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/10.
//  Copyright © 2018 nil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSEQPThemeFiveModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EThemeFiveV : UIView
@property(nonatomic,strong)NSMutableArray *selectedArray;
@property(nonatomic,strong)UILabel *titleLabel1;
@property(nonatomic,strong)UIButton *btn1;
@property(nonatomic,strong)UIButton *btn2;
@property(nonatomic,strong)UILabel *titleLabel2;
@property(nonatomic,strong)UIButton *btn3;
@property(nonatomic,strong)UIButton *btn4;
@property(nonatomic,strong)UIButton *btn5;
@property(nonatomic,strong)UIButton *btn6;
@property(nonatomic,assign)BOOL isSelected1;
@property(nonatomic,assign)BOOL isSelected2;
@property(nonatomic,copy)void(^selectedBlock)(UIButton *sender, YSEQPThemeFiveModel *model);
@property (nonatomic, strong) YSEQPThemeFiveModel *model;
-(void)initToDefault;
@end

NS_ASSUME_NONNULL_END
