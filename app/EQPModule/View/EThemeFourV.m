//
//  EThemeFourV.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/10.
//  Copyright © 2018 nil. All rights reserved.
//

#import "EThemeFourV.h"

@interface EThemeFourV ()

@end

@implementation EThemeFourV
-(instancetype)initWithFrame:(CGRect)frame type:(NSInteger)type {
    self = [super initWithFrame:frame];
    if (self) {
        
        _model = [[YSEQPThemeFourModel alloc] init];
        _model.type = type;
        _model.index = 4;
        
        self.backgroundColor = [UIColor clearColor];
        
        self.titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 85, 20)];
        self.titleLabel1.text = @"模块选择:";
        self.titleLabel1.textColor = [UIColor whiteColor];
        self.titleLabel1.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.titleLabel1];
        
        UIColor *backColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        UIColor *borderColor = [UIColor colorWithRed:0.47 green:0.47 blue:0.47 alpha:1.0];
        
        CGFloat width = (self.frame.size.width - 90)/2;
        
        _btn1 = [[UIButton alloc] initWithFrame:CGRectMake(90,0,width, width*1.11)];
        _btn1.tag = 1000;
        [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn1.backgroundColor = backColor;
        [_btn1.layer setBorderWidth:2.0f];
        [_btn1.layer setBorderColor:borderColor.CGColor];
        [_btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn1];
        
        _btn2 = [[UIButton alloc] initWithFrame:CGRectMake(_btn1.frame.origin.x+_btn1.frame.size.width,0,width, width*1.11)];
         _btn2.tag = 1001;
        [_btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn2.backgroundColor = backColor;
        [_btn2.layer setBorderWidth:2.0f];
        [_btn2.layer setBorderColor:borderColor.CGColor];
        [_btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn2];
        
    }
    return self;
}

- (void)btnAction:(UIButton *)sender {
    
    self.model.screenNumber = sender.tag - 1000;
    [self.model request];
}

- (void)exit {
    
    //[RequestLogic handleTopicExitEvent:self.model button:_btn4];
}

- (void)enter {
    
    [RequestLogic handleTopicEnterEvent:self.model];
}

@end
