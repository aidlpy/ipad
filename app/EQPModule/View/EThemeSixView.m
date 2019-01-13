//
//  EThemeSixView.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/10.
//  Copyright © 2018 nil. All rights reserved.
//

#import "EThemeSixView.h"

@interface EThemeSixView ()

@property(nonatomic,strong)NSMutableArray<UIButton *> *btnArray;
@property (nonatomic, assign) NSInteger selectIndex;

@end

@implementation EThemeSixView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _btnArray = [[NSMutableArray alloc] initWithCapacity:0];
        
        _model = [YSEQPThemeSixModel new];
        _model.type = 0;
        _model.index = 6;
        
        self.backgroundColor = [UIColor clearColor];
        
        _isSelected = NO;
        
        self.titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 85, 20)];
        self.titleLabel1.text = @"投屏:";
        self.titleLabel1.textColor = [UIColor whiteColor];
        self.titleLabel1.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.titleLabel1];
        
        
        UIColor *backColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        UIColor *borderColor = [UIColor colorWithRed:0.47 green:0.47 blue:0.47 alpha:1.0];
        
        NSArray *array =@[@"{{102.5,0},{35,22.5}}",@"{{172.5,0},{35,22.5}}",@"{{85,22.5},{35,22.5}}",@"{{120,22.5},{35,22.5}}",@"{{155,22.5},{35,22.5}}",@"{{190,22.5},{35,22.5}}",@"{{102.5,45},{35,22.5}}",@"{{137.5,45},{35,22.5}}",@"{{172.5,45},{35,22.5}}",@"{{120,67.5},{35,22.5}}",@"{{155,67.5},{35,22.5}}",@"{{137.5,90},{35,22.5}}"];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectFromString(obj)];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.backgroundColor = backColor;
            [btn.layer setBorderWidth:2.0f];
            [btn.layer setBorderColor:borderColor.CGColor];
            [self addSubview:btn];
        }];
        
    
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectFromString(obj)];
            btn.frame = CGRectMake(btn.frame.origin.x+250, btn.frame.origin.y, btn.frame.size.width, btn.frame.size.height);
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.backgroundColor = backColor;
            [btn.layer setBorderWidth:2.0f];
            [btn.layer setBorderColor:borderColor.CGColor];
            [self addSubview:btn];
        }];
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectFromString(obj)];
            btn.frame = CGRectMake(btn.frame.origin.x+500, btn.frame.origin.y, btn.frame.size.width, btn.frame.size.height);
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.backgroundColor = backColor;
            [btn.layer setBorderWidth:2.0f];
            [btn.layer setBorderColor:borderColor.CGColor];
            [self addSubview:btn];
        }];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(225, 0, 45, 45)];
        btn.tag = 0;
        btn.backgroundColor = [UIColor whiteColor];
        [btn.layer setCornerRadius:22.5];
        [btn.layer setBorderWidth:1.0f];
        [btn.layer setBorderColor:[UIColor grayColor].CGColor];
        [btn addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [_btnArray addObject:btn];
        [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"image.bundle/selected"] forState:UIControlStateSelected];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(123, 125, 70, 45)];
        label.text = @"待机首页";
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(373, 125, 70, 45)];
        label1.text = @"视频";
        label1.textColor = [UIColor whiteColor];
        label1.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label1];
        
        UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(475, 0, 45, 45)];
        btn1.tag = 1;
        btn1.backgroundColor = [UIColor whiteColor];
        [btn1.layer setCornerRadius:22.5];
        [btn1.layer setBorderWidth:1.0f];
        [btn1.layer setBorderColor:[UIColor grayColor].CGColor];
        [btn1 addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn1];
        [_btnArray addObject:btn1];
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(623, 125, 70, 45)];
        label2.text = @"图片";
        label2.textColor = [UIColor whiteColor];
        label2.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label2];
        
        UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(725, 0, 45, 45)];
        btn2.tag = 2;
        btn2.backgroundColor = [UIColor whiteColor];
        [btn2.layer setCornerRadius:22.5];
        [btn2.layer setBorderWidth:1.0f];
        [btn2.layer setBorderColor:[UIColor grayColor].CGColor];
        [btn2 addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn2];
        [_btnArray addObject:btn2];
        
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
    [_btnArray enumerateObjectsUsingBlock:^(UIButton *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == sender.tag ) {
            
            //先发送屏幕选择
            [self.model initData];
            self.model.screenNumber = idx;
            [self.model request];
            
            if (idx == 0) {
                //播放背景音乐
                obj.selected = !obj.selected;
                [self.model initData];
                self.model.backgroundPlay = obj.selected;
                [self.model request];
            }else {
                [obj setImage:[UIImage imageNamed:@"image.bundle/selected"] forState:UIControlStateNormal];
                
                if (self.btnArray[0].selected) {//暂停背景音乐播放
                    self.btnArray[0].selected = NO;
                    [self.model initData];
                    self.model.backgroundPlay = 0;
                    [self.model request];
                }
            }
        }
        else
        {
            [obj setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        }
    }];
//    [sender setImage:[UIImage imageNamed:_isSelected?@"image.bundle/selected":@""] forState:UIControlStateNormal];
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
