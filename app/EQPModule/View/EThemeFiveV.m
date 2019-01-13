//
//  EThemeFiveV.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/10.
//  Copyright © 2018 nil. All rights reserved.
//

#import "EThemeFiveV.h"
#import "EFiveDetailVC.h"
@class  BaseViewController;

@implementation EThemeFiveV
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _model = [YSEQPThemeFiveModel new];
        _model.type = 0;
        _model.index = 5;
        
        _selectedArray = [[NSMutableArray alloc] initWithCapacity:0];
        self.backgroundColor = [UIColor clearColor];
        NSArray *array = [BaseViewController readLocalFileWithName:@"etfive1"];
        NSArray *array1 = [BaseViewController readLocalFileWithName:@"etfive2"];
        
        self.titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 27.5, 85, 20)];
        self.titleLabel1.text = @"投屏:";
        self.titleLabel1.textColor = [UIColor whiteColor];
        self.titleLabel1.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.titleLabel1];
        
        UIColor *backColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        UIColor *borderColor = [UIColor colorWithRed:0.47 green:0.47 blue:0.47 alpha:1.0];
        
        _btn1 = [[UIButton alloc] initWithFrame:CGRectMake(90,22.5,400, 80)];
        [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn1.backgroundColor = backColor;
        [_btn1 setTitle:@"待机首页" forState:UIControlStateNormal];
        _btn1.titleLabel.font = [UIFont systemFontOfSize:40.0f];
        [_btn1.layer setBorderWidth:2.0f];
        [_btn1.layer setBorderColor:borderColor.CGColor];
        [self addSubview:_btn1];
        
        _btn3 = [[UIButton alloc] initWithFrame:CGRectMake(470.5, 22.5, 45, 45)];
        _btn3.backgroundColor = [UIColor whiteColor];
        _btn3.tag = 0;
        [_btn3.layer setCornerRadius:22.5];
        [_btn3.layer setBorderWidth:1.0f];
        [_btn3.layer setBorderColor:[UIColor grayColor].CGColor];
        [_btn3 setImage:[UIImage imageNamed:@"image.bundle/selected"] forState:UIControlStateNormal];
        [_btn3 addTarget:self action:@selector(selectedAction1:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn3];
        [_selectedArray addObject:_btn3];
        
        _btn2 = [[UIButton alloc] initWithFrame:CGRectMake(90,110,400,80)];
        [_btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn2.backgroundColor = backColor;
        [_btn2 setTitle:@"生态宣传片" forState:UIControlStateNormal];
        _btn2.titleLabel.font = [UIFont systemFontOfSize:40.0f];
        [_btn2.layer setBorderWidth:2.0f];
        [_btn2.layer setBorderColor:borderColor.CGColor];
        [self addSubview:_btn2];
        
        _btn4 = [[UIButton alloc] initWithFrame:CGRectMake(470.5, 110, 45, 45)];
        _btn4.tag = 1;
        _btn4.backgroundColor = [UIColor whiteColor];
        [_btn4.layer setCornerRadius:22.5];
        [_btn4.layer setBorderWidth:1.0f];
        [_btn4.layer setBorderColor:[UIColor grayColor].CGColor];
        [_btn4 addTarget:self action:@selector(selectedAction1:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn4];
        [_selectedArray addObject:_btn4];
        
        
        _btn5= [[UIButton alloc] initWithFrame:CGRectMake(90,200,400,80)];
        [_btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn5.backgroundColor = backColor;
        [_btn5 setTitle:@"检察院宣传片" forState:UIControlStateNormal];
        _btn5.titleLabel.font = [UIFont systemFontOfSize:40.0f];
        [_btn5.layer setBorderWidth:2.0f];
        [_btn5.layer setBorderColor:borderColor.CGColor];
        [self addSubview:_btn5];
        
        _btn6 = [[UIButton alloc] initWithFrame:CGRectMake(470.5, 200, 45, 45)];
        _btn6.tag = 2;
        _btn6.backgroundColor = [UIColor whiteColor];
        [_btn6.layer setCornerRadius:22.5];
        [_btn6.layer setBorderWidth:1.0f];
        [_btn6.layer setBorderColor:[UIColor grayColor].CGColor];
        [_btn6 addTarget:self action:@selector(selectedAction1:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn6];
        [_selectedArray addObject:_btn6];
        
        
        self.titleLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 310, 85, 20)];
        self.titleLabel2.text = @"投屏:";
        self.titleLabel2.textColor = [UIColor whiteColor];
        self.titleLabel2.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.titleLabel2];
        
        
        NSLog(@"array==>%@",array);
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
            btn.tag = 10000;
            [self addSubview:btn];
        }];
        
        
        [array1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(340+idx*50,self.titleLabel2.frame.origin.y-5,50,160)];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(deatailAction:) forControlEvents:UIControlEventTouchUpInside];
            btn.titleLabel.numberOfLines = 0;
            btn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
            btn.titleLabel.textAlignment = NSTextAlignmentLeft;
            NSString *text = array1[idx][@"title"];
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
            btn.tag = 10001;
            [self addSubview:btn];
        }];
    }
    return self;
}

-(void)deatailAction:(UIButton *)sender{
    
    [self.model initData];
    self.model.categoryId = sender.tag - 10000;
    [self.model request];
    if (_selectedBlock) {
        _selectedBlock(sender, self.model);
    }
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
    [self.model initData];
    self.model.screenNumber = sender.tag;
    [self.model request];
}

-(void)initToDefault{
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

- (void)exit {
    
    //[RequestLogic handleTopicExitEvent:self.model button:_btn4];
}

- (void)enter {
    
    [RequestLogic handleTopicEnterEvent:self.model];
}

@end
