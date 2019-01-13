//
//  EThemeOneVC.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/9.
//  Copyright © 2018 nil. All rights reserved.
//

#import "EThemeOneVC.h"

@interface EThemeOneVC ()



@end

@implementation EThemeOneVC

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _model = [YSEQPThemeOneModel new];
        _model.type = 0;
        _model.index = 1;
        self.titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 85, 20)];
        self.titleLabel1.text = @"投屏:";
        self.titleLabel1.textColor = [UIColor whiteColor];
        self.titleLabel1.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.titleLabel1];
        
        UIColor *backColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        UIColor *borderColor = [UIColor colorWithRed:0.47 green:0.47 blue:0.47 alpha:1.0];
        
        _btn1 = [[UIButton alloc] initWithFrame:CGRectMake(85, 0,186,91)];
        [_btn1 setTitle:@"领导1" forState:UIControlStateNormal];
        [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn1 addTarget:self action:@selector(detailAction:) forControlEvents:UIControlEventTouchUpInside];
        _btn1.backgroundColor = backColor;
        _btn1.tag =100;
        [_btn1.layer setBorderWidth:2.0f];
        [_btn1.layer setBorderColor:borderColor.CGColor];
        [self addSubview:_btn1];
        
        _btn2 = [[UIButton alloc] initWithFrame:CGRectMake(_btn1.frame.origin.x,_btn1.frame.origin.y+_btn1.frame.size.height,_btn1.frame.size.width/2,91)];
        [_btn2 setTitle:@"领导2" forState:UIControlStateNormal];
        [_btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         [_btn2 addTarget:self action:@selector(detailAction:) forControlEvents:UIControlEventTouchUpInside];
        _btn2.backgroundColor = backColor;
        _btn2.tag =101;
        [_btn2.layer setBorderWidth:2.0f];
        [_btn2.layer setBorderColor:borderColor.CGColor];
        [self addSubview:_btn2];
        
        _btn3 = [[UIButton alloc] initWithFrame:CGRectMake(_btn2.frame.origin.x+_btn2.frame.size.width,_btn1.frame.origin.y+_btn1.frame.size.height,_btn1.frame.size.width/2,91)];
        [_btn3 setTitle:@"领导3" forState:UIControlStateNormal];
        [_btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn3 addTarget:self action:@selector(detailAction:) forControlEvents:UIControlEventTouchUpInside];
        _btn3.backgroundColor = backColor;
        _btn3.tag =102;
        [_btn3.layer setBorderWidth:2.0f];
        [_btn3.layer setBorderColor:borderColor.CGColor];
        [self addSubview:_btn3];
        
        NSArray *imageArray = @[@{@"title":@"图片1",@"tag":@"0"},@{@"title":@"图片3",@"tag":@"2"},@{@"title":@"图片5",@"tag":@"4"},@{@"title":@"图片7",@"tag":@"6"},@{@"title":@"图片2",@"tag":@"1"},@{@"title":@"图片4",@"tag":@"3"},@{@"title":@"图片6",@"tag":@"5"},@{@"title":@"图片8",@"tag":@"7"}];
        [imageArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(292+(idx>3?115:0),idx>3?(idx-4)*45:idx*45, 115, 45)];
            btn.backgroundColor = backColor;
            btn.tag =1000+[obj[@"tag"] integerValue];
            [btn setTitle:obj[@"title"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(detailAction:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn.layer setBorderWidth:2.0f];
            [btn.layer setBorderColor:borderColor.CGColor];
            [self addSubview:btn];
        }];
        
        //180*180
        NSArray *fileArray = @[@{@"title":@"文件1",@"frame":@"{{543,0},{90,90}}"},@{@"title":@"文件2",@"frame":@"{{633,0},{90,90}}"},@{@"title":@"文件3",@"frame":@"{{543,90},{90,90}}"},@{@"title":@"文件4",@"frame":@"{{633,90},{90,90}}"}];
        [fileArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSLog(@"obj==>%@",obj);
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectFromString(obj[@"frame"])];
            btn.backgroundColor = backColor;
            btn.tag =10000+idx;
            [btn setTitle:obj[@"title"] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(detailAction:) forControlEvents:UIControlEventTouchUpInside];
            [btn.layer setBorderWidth:2.0f];
            [btn.layer setBorderColor:borderColor.CGColor];
            [self addSubview:btn];
        }];
        
        
        self.titleLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0,_titleLabel1.frame.origin.y+_titleLabel1.frame.size.height+200, 85, 20)];
        self.titleLabel2.text = @"序言:";
        self.titleLabel2.textColor = [UIColor whiteColor];
        self.titleLabel2.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.titleLabel2];
        
        _btn6= [[UIButton alloc] initWithFrame:CGRectMake(_btn1.frame.origin.x,_titleLabel2.frame.origin.y-5,139,235)];
        [_btn6 setTitle:@"文件" forState:UIControlStateNormal];
        [_btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn6.backgroundColor = backColor;
        [_btn6.layer setBorderWidth:2.0f];
        [_btn6.layer setBorderColor:borderColor.CGColor];
        [self addSubview:_btn6];
        
        _btn4 = [[UIButton alloc] initWithFrame:CGRectMake(0,_btn6.frame.origin.y+_btn6.frame.size.height+16,105, 33)];
        _btn4.center = CGPointMake(_btn6.center.x,_btn4.center.y);
        [_btn4 setTitle:@"开始播放" forState:UIControlStateNormal];
        [_btn4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn4.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:0 alpha:1.0];
        [_btn4.layer setCornerRadius:_btn4.frame.size.height/2];
        [_btn4 addTarget:self action:@selector(playAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn4];
        
        
    }
    return self;
}

#pragma mark - Action

- (void)playAction {
    
    [RequestLogic handleTopicPlayEvent:self.model button:_btn4];
}

-(void)detailAction:(UIButton *)sender{
    
    NSInteger tag = sender.tag;
    if (tag<1000) {
        self.model.screenNumber = 0;
        self.model.screenIndex = tag%100;
    }else if(tag<10000) {
        self.model.screenNumber = 1;
        self.model.screenIndex = tag%1000;
    }else  {
        self.model.screenNumber = 2;
        self.model.screenIndex = tag%10000;
    }
    self.model.secondViewVerticalIndex = 0;
    if (_selectedBlock) {
        _selectedBlock(sender, self.model);
    }
}

- (void)exit {
    
    [RequestLogic handleTopicExitEvent:self.model button:_btn4];
}

- (void)enter {
    
    [RequestLogic handleTopicEnterEvent:self.model];
}

@end
