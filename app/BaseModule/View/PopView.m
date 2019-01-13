//
//  PopView.m
//  ipad
//
//  Created by Zhang Xinrong on 2019/1/8.
//  Copyright © 2019 nil. All rights reserved.
//

#import "PopView.h"
static NSString *closeTitle = @"关闭提示";
@interface PopView()
@end

@implementation PopView

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        self.frame = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        
        UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [backBtn addTarget:self action:@selector(popDimiss:) forControlEvents:UIControlEventTouchUpInside];
        backBtn.backgroundColor = [UIColor clearColor];
        [self addSubview:backBtn];
        
        int width = 209*2; int height = 96*2;
        UIView *popView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        popView.center = CGPointMake(self.frame.size.width/2,self.frame.size.height/2);
        popView.backgroundColor = RGB(255,255,255);
        [popView.layer setCornerRadius:2.0f];
        [self addSubview:popView];
        
        int pedding = 27*2;
        UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,popView.frame.size.width,pedding)];
        titleView.backgroundColor = RGB(81, 81, 81);
        [popView addSubview:titleView];
        
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 20)];
        label.center = CGPointMake(label.center.x, titleView.frame.size.height/2);
        label.text = closeTitle;
        label.textColor = [UIColor whiteColor];
        [titleView addSubview:label];
        
        _popLab = [[UILabel alloc] initWithFrame:CGRectMake(20,titleView.frame.size.height+20,popView.frame.size.width-40, 20)];
        _popLab.text = @"确认关闭声音";
        [popView addSubview:_popLab];
        
        int widthBtn = 38*2;
        int heightBtn = 18*2;
        int rightPedding = 12.5*2;
        
        UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(popView.frame.size.width-(widthBtn+rightPedding), _popLab.frame.origin.y+_popLab.frame.size.height+25, widthBtn, heightBtn)];
        cancelBtn.backgroundColor = [UIColor whiteColor];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cancelBtn.layer setBorderColor:RGB(220, 220, 220).CGColor];
        [cancelBtn.layer setBorderWidth:1.0f];
        [cancelBtn.layer setCornerRadius:6.0f];
        [cancelBtn addTarget:self action:@selector(popDimiss:) forControlEvents:UIControlEventTouchUpInside];
        [popView addSubview:cancelBtn];
        
        UIButton *confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(cancelBtn.frame.origin.x-(widthBtn+20), 0,widthBtn, heightBtn)];
        confirmBtn.center = CGPointMake(confirmBtn.center.x,cancelBtn.center.y);
        confirmBtn.backgroundColor = [UIColor redColor];
        [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [confirmBtn.layer setCornerRadius:6.0f];
        [confirmBtn addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
        [popView addSubview:confirmBtn];

       
    }
    return self;
}


-(void)popDimiss:(UIButton *)btn
{
    if (self.superview) {
        [self removeFromSuperview];
    }
}

-(void)confirmAction:(UIButton *)btn{
    
    if (self.subviews && _resultBlock) {
        [self removeFromSuperview];
        _resultBlock();
    }
    
}



@end
