//
//  EImageView.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/10.
//  Copyright © 2018 nil. All rights reserved.
//

#import "EImageView.h"
#import "YSSocketRequest.h"

@interface EImageView ()

@end

@implementation EImageView

-(instancetype)initWithFrame:(CGRect)frame type:(NSInteger)type {
    self = [super initWithFrame:frame];
    if (self) {
        
        _model = [[YSEQPImageModel alloc] init];
        _model.type = type;
        _model.index = 0;
        _model.screenNumber = 0;
        
        self.titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 85, 20)];
        self.titleLabel1.text = @"投屏:";
        self.titleLabel1.textColor = [UIColor whiteColor];
        self.titleLabel1.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.titleLabel1];
        
        UIColor *backColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        UIColor *borderColor = [UIColor colorWithRed:0.47 green:0.47 blue:0.47 alpha:1.0];
        
        _btn1 = [[UIButton alloc] initWithFrame:CGRectMake(75,0, 370, 200)];
       // [_btn1 setTitle:@"领导1" forState:UIControlStateNormal];
        [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn1.backgroundColor = backColor;
        [_btn1.layer setBorderWidth:2.0f];
        [_btn1.layer setBorderColor:borderColor.CGColor];
        [_btn1 addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn1];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(_btn1.frame.size.width+_btn1.frame.origin.x-45, _btn1.frame.origin.y, 45, 45)];
        btn.backgroundColor = [UIColor whiteColor];
        [btn.layer setCornerRadius:22.5];
        [btn.layer setBorderWidth:1.0f];
        [btn.layer setBorderColor:[UIColor grayColor].CGColor];
        [btn addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        [btn setImage:[UIImage imageNamed:@"image.bundle/selected"] forState:UIControlStateSelected];
        [self addSubview:btn];
        
        self.titleLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0,_btn1.frame.origin.y+_btn1.frame.size.height+33, 370, 25)];
        self.titleLabel2.center = CGPointMake(self.btn1.center.x, self.titleLabel2.center.y);
        self.titleLabel2.text = @"标题";
        self.titleLabel2.textAlignment = NSTextAlignmentCenter;
        self.titleLabel2.font = [UIFont systemFontOfSize:23];
        self.titleLabel2.textColor = [UIColor whiteColor];
        self.titleLabel2.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.titleLabel2];
        
    }
    return self;
}

#pragma mark - Action

- (void)selectedAction:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    [self.model initData];
    self.model.backgroundPlay = sender.selected;
    [self.model request];
}

- (void)btnAction {
    
    [self.model initData];
    self.model.screenNumber = 0;
    [self.model request];
}

- (void)exit {
    
//    [RequestLogic handleTopicExitEvent:self.model button:nil];
}

- (void)enter {
    
    [RequestLogic handleTopicEnterEvent:self.model];
}

@end
