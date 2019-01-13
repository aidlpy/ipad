//
//  BaseSlider.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/9.
//  Copyright © 2018 nil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseSlider : UIView
@property(nonatomic,strong)UISlider *slider;
@property(nonatomic,strong)UIProgressView *processView;

@property (nonatomic, assign) float progress;
@property (nonatomic, copy) void(^valueChangeBlock)(float progress);

@end

