//
//  BaseSlider.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/9.
//  Copyright © 2018 nil. All rights reserved.
//

#import "BaseSlider.h"

@implementation BaseSlider

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.processView = [[UIProgressView alloc] initWithFrame:CGRectMake(2.5, 0, frame.size.width-5, 40)];
        self.processView.center = CGPointMake(self.processView.center.x, self.center.y);
        [self.processView.layer setCornerRadius:5.0];
        self.processView.clipsToBounds = YES;
        self.processView.progress = 0.5;
        self.processView.trackTintColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0];
        self.processView.progressTintColor = [UIColor colorWithRed:1 green:0.4 blue:0 alpha:1.0];
        CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 3.0f);
        self.processView.transform = transform;
        [self addSubview:self.processView];
        
        self.slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 40)];//创建一个滑竿对象
        self.slider.center = CGPointMake(self.slider.center.x, self.center.y);
        self.slider.backgroundColor = [UIColor clearColor];
        self.slider.minimumTrackTintColor = [UIColor clearColor]; //设置滑竿滑过部分的颜色
        self.slider.maximumTrackTintColor = [UIColor clearColor];  //设置滑竿未滑过部分的颜色.
        self.slider.minimumValue = 0.0; //设置滑竿滑动的数值区间的最小值 //不设置时,默认最小值是0, 最大值是1
        self.slider.maximumValue = 1.0; //设置滑竿滑动的数值区间的最大值
        self.slider.value = 0.2; //设置滑动按钮默认出现所在的位置
        self.processView.progress = self.slider.value;
        [self addSubview:self.slider];
        [self.slider addTarget:self action:@selector(handleSlider:) forControlEvents:UIControlEventValueChanged]; //添加点击事件.
        
    }
    return self;
}

-(void)handleSlider:(UISlider *)slider{
    
    self.progress = slider.value;
    self.processView.progress = self.slider.value;
    if (self.valueChangeBlock) {
        self.valueChangeBlock(slider.value);
    }
}

- (void)setProgress:(float)progress {
    
    _progress = progress;
    self.slider.value = progress;
    self.processView.progress = progress;
}

@end
