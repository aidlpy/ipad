//
//  MThemeFiveV.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/12.
//  Copyright © 2018 nil. All rights reserved.
//

#import "MThemeFiveV.h"
#import "BaseViewController.h"


@implementation MThemeFiveV

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _model = [YSEQPThemeFiveModel new];
        _model.type = 1;
        _model.index = 5;
        
        _selectedArray = [[NSMutableArray alloc] initWithCapacity:0];
        
        self.backgroundColor = [UIColor clearColor];
        NSArray *array = [BaseViewController readLocalFileWithName:@"mtfive"];
        
        self.titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 85, 20)];
        self.titleLabel1.text = @"投屏:";
        self.titleLabel1.textColor = [UIColor whiteColor];
        self.titleLabel1.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.titleLabel1];
        
        UIColor *backColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        UIColor *borderColor = [UIColor colorWithRed:0.47 green:0.47 blue:0.47 alpha:1.0];
        
        _btn1 = [[UIButton alloc] initWithFrame:CGRectMake(90,0,400,80)];
        [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn1.backgroundColor = backColor;
        [_btn1 setTitle:@"待机首页" forState:UIControlStateNormal];
        _btn1.titleLabel.font = [UIFont systemFontOfSize:40.0f];
        [_btn1.layer setBorderWidth:2.0f];
        [_btn1.layer setBorderColor:borderColor.CGColor];
        [_btn1 addTarget:self action:@selector(screenAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn1];
        
        
        _selected1= [[UIButton alloc] initWithFrame:CGRectMake(470.5, 0, 40, 40)];
        _selected1.tag = 0;
        [_selected1 setImage:[UIImage imageNamed:@"image.bundle/selected"] forState:UIControlStateNormal];
        _selected1.backgroundColor = [UIColor whiteColor];
        [_selected1.layer setCornerRadius:20];
        [_selected1.layer setBorderWidth:1.0f];
        [_selected1.layer setBorderColor:[UIColor grayColor].CGColor];
        [_selected1 addTarget:self action:@selector(selectedAction1:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_selected1];
        [_selectedArray addObject:_selected1];
        
        _btn12 = [[UIButton alloc] initWithFrame:CGRectMake(90,90,400,80)];
        [_btn12 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn12.backgroundColor = backColor;
        [_btn12 setTitle:@"未检宣传片" forState:UIControlStateNormal];
        _btn12.titleLabel.font = [UIFont systemFontOfSize:40.0f];
        [_btn12.layer setBorderWidth:2.0f];
        [_btn12.layer setBorderColor:borderColor.CGColor];
        [_btn12 addTarget:self action:@selector(screenAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn12];
        
        _selected2= [[UIButton alloc] initWithFrame:CGRectMake(470.5, 90, 40,40)];
        _selected2.tag = 1;
        _selected2.backgroundColor = [UIColor whiteColor];
        [_selected2.layer setCornerRadius:20];
        [_selected2.layer setBorderWidth:1.0f];
        [_selected2.layer setBorderColor:[UIColor grayColor].CGColor];
        [_selected2 addTarget:self action:@selector(selectedAction1:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_selected2];
        [_selectedArray addObject:_selected2];
        
        _btn13= [[UIButton alloc] initWithFrame:CGRectMake(90,180,400,80)];
        [_btn13 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn13.backgroundColor = backColor;
        [_btn13 setTitle:@"检察院宣传片" forState:UIControlStateNormal];
        _btn13.titleLabel.font = [UIFont systemFontOfSize:40.0f];
        [_btn13.layer setBorderWidth:2.0f];
        [_btn13.layer setBorderColor:borderColor.CGColor];
        [_btn13 addTarget:self action:@selector(screenAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn13];
        
        _selected3= [[UIButton alloc] initWithFrame:CGRectMake(470.5, 180, 40, 40)];
        _selected3.tag = 2;
        _selected3.backgroundColor = [UIColor whiteColor];
        [_selected3.layer setCornerRadius:20];
        [_selected3.layer setBorderWidth:1.0f];
        [_selected3.layer setBorderColor:[UIColor grayColor].CGColor];
        [_selected3 addTarget:self action:@selector(selectedAction1:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_selected3];
        [_selectedArray addObject:_selected3];
        
        
        self.titleLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 85, 20)];
        self.titleLabel2.text = @"投屏:";
        self.titleLabel2.textColor = [UIColor whiteColor];
        self.titleLabel2.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.titleLabel2];
        
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(90+idx*50,self.titleLabel2.frame.origin.y-5,50,160)];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(deatailAction:) forControlEvents:UIControlEventTouchUpInside];
            btn.titleLabel.numberOfLines = 0;
            btn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
            btn.titleLabel.textAlignment = NSTextAlignmentLeft;
            NSString *text = array[idx][@"title"];
            NSString *resultText = @"";
            NSString *temp =@"";
            for(int i = 0;i<text.length;i++){
                temp = [text substringWithRange:NSMakeRange(i, 1)];
                if (resultText.length == 0) {
                    resultText = [NSString stringWithFormat:@"%@",temp];
                    
                }
                else{
                    resultText = [NSString stringWithFormat:@"%@\n%@",resultText,temp];
                }
            }
            [btn  setTitle:resultText forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(deatailAction:) forControlEvents:UIControlEventTouchUpInside];
            btn.backgroundColor = backColor;
            [btn.layer setBorderWidth:2.0f];
            [btn.layer setBorderColor:borderColor.CGColor];
            [self addSubview:btn];
        }];
        
    }
    return self;
}

-(void)selectedAction1:(UIButton *)sender{
    [_selectedArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (sender.tag == idx) {
            [obj setImage:[UIImage imageNamed:@"image.bundle/selected"] forState:UIControlStateNormal];
        }
        else
        {
            [obj setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        }
    }];
    self.model.screenNumber = sender.tag;
    [self.model request];
}


-(void)initToDefalut{
    
    [_selectedArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            [obj setImage:[UIImage imageNamed:@"image.bundle/selected"] forState:UIControlStateNormal];
        }
        else
        {
            [obj setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        }
    }];
    self.model.screenNumber = 0;
    [self.model request];
    
}

-(void)deatailAction:(UIButton *)sender{
    
    if (_selectedBlock) {
        _selectedBlock(sender, self.model);
    }
    [self.model request];
}

- (void)screenAction {
    
    self.model.screenNumber = 0;
}

- (void)exit {
    
    //[RequestLogic handleTopicExitEvent:self.model button:_btn4];
}

- (void)enter {
    
    [RequestLogic handleTopicEnterEvent:self.model];
}

@end
