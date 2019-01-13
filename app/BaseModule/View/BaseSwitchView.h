//
//  BaseSwitchView.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/8.
//  Copyright © 2018 nil. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseSwitchView : UIView
@property(nonatomic, assign) BOOL isON;
@property(nonatomic, strong) UIView *backView;
@property(nonatomic, strong) UIButton *btn;
@property(nonatomic, strong) UILabel *stateText;
@property(nonatomic, strong) UITapGestureRecognizer *tap;
@property(nonatomic, copy) void (^tapBlock)(void);
@property (nonatomic, copy) void(^valueChangeBlock)(BOOL isOn);


-(void)setDefalutState:(BOOL)state;

@end

NS_ASSUME_NONNULL_END
