//
//  BaseSwitchView.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/8.
//  Copyright © 2018 nil. All rights reserved.
//

#import "BaseSwitchView.h"
@implementation BaseSwitchView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        self.leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
//        self.rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
//        self.leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
//        self.rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
//        [self addGestureRecognizer:self.leftSwipeGestureRecognizer];
//        [self addGestureRecognizer:self.rightSwipeGestureRecognizer];
        
        self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        self.tap.numberOfTouchesRequired = 1;
        self.tap.numberOfTapsRequired = 1;
      
  
        
        self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-10)];
        self.backView.center = CGPointMake(self.backView.center.x, frame.size.height/2);
        [self.backView.layer setCornerRadius:self.backView.frame.size.height/2];
        [self updateBackColor];
        [self addSubview:self.backView];
        
        self.btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.height, frame.size.height)];
        self.btn.backgroundColor = [UIColor whiteColor];
        [self.btn.layer setCornerRadius:self.btn.frame.size.height/2];
        [self addSubview:self.btn];
        
        self.stateText = [[UILabel alloc] init];
        self.stateText.textColor = [UIColor whiteColor];
        self.stateText.font = [UIFont systemFontOfSize:11];
        [self updateStateText];
        [self addSubview:self.stateText];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,self.bounds.size.width, self.bounds.size.height)];
        btn.backgroundColor = [UIColor clearColor];
        [self addSubview:btn];
        [btn addGestureRecognizer:self.tap];
    
    }
    return self;
}

-(void)setDefalutState:(BOOL)state{
    self.isON = state;
    [self updateBackColor];
    [self updateStateText];
    self.btn.center = CGPointMake(state?self.btn.frame.size.width/2:(self.frame.size.width-self.btn.frame.size.width/2), self.btn.center.y);
}

-(void)tapAction
{
    if (_tapBlock) {
        _tapBlock();
    }
}

//-(void)handleSwipes:(UISwipeGestureRecognizer *)swpie{
//    if (swpie.direction == UISwipeGestureRecognizerDirectionLeft) {
//        self.isON = YES;
//        if (self.btn.frame.origin.x != 0) {
//            self.stateText.hidden = YES;
//            [UIView animateWithDuration:0.3 animations:^{
//                self.btn.center = CGPointMake(self.btn.frame.size.width/2, self.btn.center.y);
//            } completion:^(BOOL finished) {
//                self.stateText.hidden = NO;
//                [self updateBackColor];
//                [self updateStateText];
//            }];
//        }
//    }
//    else
//    {
//        self.isON = NO;
//        if (self.btn.frame.origin.x == 0) {
//            self.stateText.hidden = YES;
//            [UIView animateWithDuration:0.3 animations:^{
//                self.btn.center = CGPointMake(self.frame.size.width-self.btn.frame.size.width/2, self.btn.center.y);
//            } completion:^(BOOL finished) {
//                self.stateText.hidden = NO;
//                [self updateBackColor];
//                [self updateStateText];
//            }];
//        }
//    }
//    if (self.valueChangeBlock) {
//        self.valueChangeBlock(self.isON);
//    }
//}

-(void)updateStateText{
    
    if (!self.isON) {
        self.stateText.text = @"关闭";
        self.stateText.frame = CGRectMake(self.btn.frame.size.height/2-5, 0, 40, 20);
        self.stateText.center = CGPointMake(self.stateText.center.x, self.backView.center.y);
    }
    else
    {
        self.stateText.text = @"开启";
        self.stateText.frame = CGRectMake(self.backView.frame.size.width/2+5, 0, 40, 20);
        self.stateText.center = CGPointMake(self.stateText.center.x,self.backView.center.y);
    }
}

-(void)updateBackColor{
     self.backView.backgroundColor = self.isON?[UIColor colorWithRed:0 green:0.8 blue:0.6 alpha:1.0]:RGB(107, 223, 244);
    self.stateText.textColor = self.isON?[UIColor whiteColor]:[UIColor blackColor];
    
}


@end
