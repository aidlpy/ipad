//
//  MThemeOneV.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/12.
//  Copyright © 2018 nil. All rights reserved.
//

#import "MThemeOneV.h"
#import "MOneSubVC.h"

@implementation MThemeOneV
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _model = [YSEQPThemeOneModel new];
        _model.type = 1;
        _model.index = 1;
        
        self.titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 85, 20)];
        self.titleLabel1.text = @"投屏:";
        self.titleLabel1.textColor = [UIColor whiteColor];
        self.titleLabel1.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.titleLabel1];
        
        UIColor *backColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        UIColor *borderColor = [UIColor colorWithRed:0.47 green:0.47 blue:0.47 alpha:1.0];
        
        self.titleLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0,_titleLabel1.frame.origin.y+_titleLabel1.frame.size.height+200, 85, 20)];
        self.titleLabel2.text = @"序言:";
        self.titleLabel2.textColor = [UIColor whiteColor];
        self.titleLabel2.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.titleLabel2];
        
        NSArray *array = @[@{@"title":@"第三屏幕",@"frame":@"{{91,0},{182,154}}"}];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton  *btn = [[UIButton alloc] initWithFrame:CGRectFromString(obj[@"frame"])];
            [btn setTitle:obj[@"title"] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn.backgroundColor = backColor;
            btn.tag = 100+idx;
            [btn.layer setBorderWidth:2.0f];
            [btn.layer setBorderColor:borderColor.CGColor];
            [self addSubview:btn];
        }];
        
        

        _btn6= [[UIButton alloc] initWithFrame:CGRectMake(91,_titleLabel2.frame.origin.y-5,139,235)];
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

-(void)clickAction:(UIButton *)sender{
    
    if (_selectedBlock) {
        _selectedBlock(self.model);
    }
    
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
