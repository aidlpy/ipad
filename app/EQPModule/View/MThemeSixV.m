//
//  MThemeSixV.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/13.
//  Copyright © 2018 nil. All rights reserved.
//

#import "MThemeSixV.h"

@interface MThemeSixV ()


@end

@implementation MThemeSixV

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _model = [YSEQPThemeSixModel new];
        _model.type = 1;
        _model.index = 6;
        
        self.backgroundColor = [UIColor clearColor];
        
        self.titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 85, 20)];
        self.titleLabel1.text = @"投屏:";
        self.titleLabel1.textColor = [UIColor whiteColor];
        self.titleLabel1.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.titleLabel1];
        
        
        UIColor *backColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        UIColor *borderColor = [UIColor colorWithRed:0.47 green:0.47 blue:0.47 alpha:1.0];
        
     
        NSArray *array = @[@"{{102.5,0},{35,22.5}}",@"{{172.5,0},{35,22.5}}",@"{{85,22.5},{35,22.5}}",@"{{120,22.5},{35,22.5}}",@"{{155,22.5},{35,22.5}}",@"{{190,22.5},{35,22.5}}",@"{{102.5,45},{35,22.5}}",@"{{137.5,45},{35,22.5}}",@"{{172.5,45},{35,22.5}}",@"{{120,67.5},{35,22.5}}",@"{{155,67.5},{35,22.5}}",@"{{137.5,90},{35,22.5}}"];

        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectFromString(obj)];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor colorWithRed:0.37 green:0.80 blue:0.79 alpha:1.0];
            [btn.layer setBorderWidth:2.0f];
            [btn.layer setBorderColor:borderColor.CGColor];
            [self addSubview:btn];
        }];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(230,0, 45, 45)];
        btn.backgroundColor = [UIColor whiteColor];
        [btn.layer setCornerRadius:22.5];
        [btn.layer setBorderWidth:1.0f];
        [btn.layer setBorderColor:[UIColor grayColor].CGColor];
        [btn addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        [btn setImage:[UIImage imageNamed:@"image.bundle/selected"] forState:UIControlStateSelected];
        [self addSubview:btn];
        
        self.titleLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0,279, 85, 20)];
        self.titleLabel2.text = @"序言:";
        self.titleLabel2.textColor = [UIColor whiteColor];
        self.titleLabel2.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.titleLabel2];
        
        
        _btn3 = [[UIButton alloc] initWithFrame:CGRectMake(75,284, 135, 235)];
        [_btn3 setTitle:@"序言" forState:UIControlStateNormal];
        [_btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn3.backgroundColor = backColor;
        [_btn3.layer setBorderWidth:2.0f];
        [_btn3.layer setBorderColor:borderColor.CGColor];
        [self addSubview:_btn3];
        
        _btn4 = [[UIButton alloc] initWithFrame:CGRectMake(0,_btn3.frame.origin.y+_btn3.frame.size.height+16,105, 33)];
        _btn4.center = CGPointMake(_btn3.center.x,_btn4.center.y);
        [_btn4 setTitle:@"开始播放" forState:UIControlStateNormal];
        [_btn4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn4.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:0 alpha:1.0];
        [_btn4.layer setCornerRadius:_btn4.frame.size.height/2];
        [_btn4 addTarget:self action:@selector(playAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn4];
        
    }
    return self;
}

-(void)selectedAction:(UIButton *)sender{

    sender.selected = !sender.selected;
    
    [self.model initData];
    self.model.screenNumber = 0;
    [self.model request];
    
    [self.model initData];
    self.model.backgroundPlay = sender.selected;
    [self.model request];
}

- (void)playAction {
    
    [RequestLogic handleTopicPlayEvent:self.model button:_btn4];
}

- (void)exit {
    
    [RequestLogic handleTopicExitEvent:self.model button:_btn4];
}

- (void)enter {
    
    [RequestLogic handleTopicEnterEvent:self.model];
}

@end
