//
//  TFiveSubDetailView.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/11.
//  Copyright © 2018 nil. All rights reserved.
//



#import "TFiveSubDetailView.h"

@interface TFiveSubDetailView()
@property(nonatomic,strong)NSMutableArray *btnArray;
@property(nonatomic,strong)NSArray *jsonArray;
//@property(nonatomic,strong)NSDictionary *localDic;
@end
@implementation TFiveSubDetailView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _btnArray = [[NSMutableArray alloc] initWithCapacity:0];
        self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 64, frame.size.height)];
        self.leftView.backgroundColor = [UIColor colorWithRed:0 green:0.4 blue:0.6 alpha:1.0];
        [self addSubview:self.leftView];
        
        self.leftLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, frame.size.height)];
        self.leftLab.numberOfLines = 0;
        self.leftLab.font = [UIFont systemFontOfSize:26];
        self.leftLab.textColor = [UIColor whiteColor];
        self.leftLab.textAlignment = NSTextAlignmentCenter;
        self.leftLab.center = CGPointMake(self.leftView.center.x, self.leftView.center.y);
        [self addSubview:self.leftLab];
        
        self.topView = [[UIView alloc] initWithFrame:CGRectMake(64, 0, frame.size.width-64, 46)];
        self.topView.backgroundColor =[UIColor colorWithRed:0 green:0.2 blue:0.8 alpha:1.0];
        [self addSubview:self.topView];
        
        
        self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(self.leftView.frame.size.width+5,self.topView.frame.size.height+10,frame.size.width-self.leftView.frame.size.width-10,frame.size.height-self.topView.frame.size.height-20)];
        self.bottomView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0];
        [self addSubview:self.bottomView];
        
        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(self.bottomView.frame.origin.x+5, self.bottomView.frame.origin.y+10, self.frame.size.width-10, 24)];
        self.titleLab.font = [UIFont systemFontOfSize:20.f];
        [self addSubview:self.titleLab];
        
        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(self.bottomView.frame.origin.x+5, self.titleLab.frame.origin.x+self.titleLab.frame.size.height+5,self.bottomView.frame.size.width-10, self.bottomView.frame.size.height-self.titleLab.frame.origin.x+self.titleLab.frame.size.height+10)];
        self.textView.font = [UIFont systemFontOfSize:10.0f];
        self.textView.editable = NO;
        self.textView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.textView];
    }
    return self;
}

-(void)updateUI:(NSDictionary *)dic{

    [self.topView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [_btnArray removeAllObjects];
    NSArray *tagsArray = dic[@"tags"];
    _jsonArray = tagsArray;
    self.leftLab.text = dic[@"title"];
    NSDictionary *textDic = tagsArray[0];
    self.titleLab.text = textDic[@"tagTitle"];
    self.textView.text = textDic[@"tagDetail"];
    self.textView.frame = CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y, self.textView.frame.size.width, self.textView.contentSize.height+20);
    self.bottomView.frame = CGRectMake(self.bottomView.frame.origin.x, self.bottomView.frame.origin.y, self.textView.frame.size.width,self.textView.contentSize.height+40+self.titleLab.frame.size.height);

    
    CGFloat width = self.topView.frame.size.width/tagsArray.count;
    [tagsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(idx*width, 0, width, self.topView.frame.size.height)];
        btn.titleLabel.numberOfLines = 0;
        [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:8.0f];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.tag = idx;
        [btn setTitle:obj[@"tagTitle"] forState:UIControlStateNormal];
        [self.topView addSubview:btn];
        if (idx == 0) {
            btn.backgroundColor = [UIColor colorWithRed:0 green:0.6 blue:1 alpha:1];
        }
        else{
            btn.backgroundColor = [UIColor clearColor];
        }
        [self.btnArray addObject:btn];
    }];
}

-(void)clickAction:(UIButton *)sender{
    
    [self.btnArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = (UIButton *)obj;
        if (idx == sender.tag) {
            btn.backgroundColor = [UIColor colorWithRed:0 green:0.6 blue:1 alpha:1];
        }
        else
        {
            btn.backgroundColor = [UIColor clearColor];
        }
    }];
    NSDictionary *dic = _jsonArray[sender.tag];
    self.titleLab.text = dic[@"tagTitle"];
    self.textView.text = dic[@"tagDetail"];
    self.textView.frame = CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y, self.textView.frame.size.width, self.textView.contentSize.height+20);
    self.bottomView.frame = CGRectMake(self.bottomView.frame.origin.x, self.bottomView.frame.origin.y, self.textView.frame.size.width,self.textView.contentSize.height+40+self.titleLab.frame.size.height);

    if (self.selectedBlock) {
        self.selectedBlock(sender.tag);
    }
}

@end
