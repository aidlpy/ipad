//
//  EImageView.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/10.
//  Copyright © 2018 nil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSEQPImageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EImageView : UIView

//type 0：生态  1：未检
-(instancetype)initWithFrame:(CGRect)frame type:(NSInteger)type;

@property(nonatomic,strong)UILabel *titleLabel1;
@property(nonatomic,strong)UILabel *titleLabel2;
@property(nonatomic,strong)UIButton *btn1;

@property (nonatomic, strong) YSEQPImageModel *model;

@end

NS_ASSUME_NONNULL_END
