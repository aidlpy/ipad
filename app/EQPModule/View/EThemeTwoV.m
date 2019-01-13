//
//  EThemeTwoV.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/10.
//  Copyright © 2018 nil. All rights reserved.
//

#import "EThemeTwoV.h"

@implementation EThemeTwoV
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _model = [YSEQPThemeTwoModel new];
        _model.type = 0;
        _model.index = 2;
        
        self.titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 85, 20)];
        self.titleLabel1.text = @"序言:";
        self.titleLabel1.textColor = [UIColor whiteColor];
        self.titleLabel1.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.titleLabel1];
        
        UIColor *backColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        UIColor *borderColor = [UIColor colorWithRed:0.47 green:0.47 blue:0.47 alpha:1.0];
        
        _btn1 = [[UIButton alloc] initWithFrame:CGRectMake(75,0, 135, 235)];
         [_btn1 setTitle:@"序言" forState:UIControlStateNormal];
        [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn1.backgroundColor = backColor;
        [_btn1.layer setBorderWidth:2.0f];
        [_btn1.layer setBorderColor:borderColor.CGColor];
        [self addSubview:_btn1];
        
        _btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0,_btn1.frame.origin.y+_btn1.frame.size.height+16,105, 33)];
        _btn2.center = CGPointMake(_btn1.center.x,_btn2.center.y);
        [_btn2 setTitle:@"开始播放" forState:UIControlStateNormal];
        [_btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn2.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:0 alpha:1.0];
        [_btn2.layer setCornerRadius:_btn2.frame.size.height/2];
        [_btn2 addTarget:self action:@selector(playAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn2];
        
    }
    return self;
}

- (void)playAction {
    
    [RequestLogic handleTopicPlayEvent:self.model button:_btn2];
}

- (void)exit {
    
   [RequestLogic handleTopicExitEvent:self.model button:_btn2];
}

- (void)enter {
    
    [RequestLogic handleTopicEnterEvent:self.model];
}

@end
