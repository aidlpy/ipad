//
//  MThemeThreeV.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/12.
//  Copyright © 2018 nil. All rights reserved.
//

#import "MThemeThreeV.h"

@implementation MThemeThreeV
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _model = [YSEQPThemeThreeModel new];
        _model.type = 1;
        _model.index = 3;
        
        self.backgroundColor = [UIColor clearColor];
        
        self.titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 85, 20)];
        self.titleLabel1.text = @"投屏:";
        self.titleLabel1.textColor = [UIColor whiteColor];
        self.titleLabel1.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.titleLabel1];
        
        UIColor *backColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        UIColor *borderColor = [UIColor colorWithRed:0.47 green:0.47 blue:0.47 alpha:1.0];
        
        
        NSArray *array = @[@{@"title":@"首页",@"tag":@"0",@"frame":@"{{90,0},{170,90}}"},@{@"title":@"目录1",@"tag":@"1",@"frame":@"{{270,0},{80,40}}"},@{@"title":@"网络犯罪",@"tag":@"5",@"frame":@"{{270,50},{80,40}}"},@{@"title":@"目录2",@"tag":@"2",@"frame":@"{{360,0},{80,40}}"},
                           @{@"title":@"校园暴力",@"tag":@"6",@"frame":@"{{360,50},{80,40}}"},@{@"title":@"青春保护\n守则",@"tag":@"3",@"frame":@"{{450,0},{80,40}}"},@{@"title":@"性侵",@"tag":@"7",@"frame":@"{{450,50},{80,40}}"},@{@"title":@"",@"tag":@"4",@"frame":@"{{540,0},{80,40}}"},@{@"title":@"诈骗",@"tag":@"8",@"frame":@"{{540,50},{80,40}}"},@{@"title":@"",@"tag":@"9",@"frame":@"{{90,100},{80,40}}"},@{@"title":@"",@"tag":@"15",@"frame":@"{{90,150},{80,40}}"},@{@"title":@"",@"tag":@"10",@"frame":@"{{180,100},{80,40}}"},@{@"title":@"",@"tag":@"16",@"frame":@"{{180,150},{80,40}}"},@{@"title":@"",@"tag":@"11",@"frame":@"{{270,100},{80,40}}"},
                           @{@"title":@"",@"tag":@"17",@"frame":@"{{270,150},{80,40}}"},@{@"title":@"",@"tag":@"12",@"frame":@"{{360,100},{80,40}}"},@{@"title":@"",@"tag":@"18",@"frame":@"{{360,150},{80,40}}"},@{@"title":@"",@"tag":@"13",@"frame":@"{{450,100},{80,40}}"},@{@"title":@"",@"tag":@"19",@"frame":@"{{450,150},{80,40}}"},@{@"title":@"",@"tag":@"14",@"frame":@"{{540,100},{80,40}}"},@{@"title":@"",@"tag":@"20",@"frame":@"{{540,150},{80,40}}"}];
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectFromString(obj[@"frame"])];
            [btn setTitle:obj[@"title"] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.backgroundColor = backColor;
            btn.tag = [obj[@"tag"] integerValue];
            [btn.layer setBorderWidth:2.0f];
            [btn.layer setBorderColor:borderColor.CGColor];
             btn.titleLabel.font = [UIFont systemFontOfSize:idx ==0?16:10];
            [btn addTarget:self action:@selector(changeAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }];

        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(240,0, 30, 30)];
        btn.backgroundColor = [UIColor whiteColor];
        [btn.layer setCornerRadius:15];
        [btn.layer setBorderWidth:1.0f];
        [btn.layer setBorderColor:[UIColor grayColor].CGColor];
        [btn addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        [btn setImage:[UIImage imageNamed:@"image.bundle/selected"] forState:UIControlStateSelected];
        btn.clipsToBounds = YES;
        [self addSubview:btn];
//

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

-(void)changeAction:(UIButton *)sender
{
    self.model.contentIndex = 0;
    self.model.categoryId = sender.tag;
    if (_changeBlock) {
        _changeBlock(self.model);
    }
}

- (void)selectedAction:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
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
