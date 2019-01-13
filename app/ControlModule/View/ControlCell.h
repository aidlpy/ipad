//
//  ControlCell.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/8.
//  Copyright © 2018 nil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseSwitchView.h"
#import "BaseSlider.h"


@interface ControlCell : UITableViewCell
@property(nonatomic,strong)UILabel *mainLabel;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *sliderTitle;
@property(nonatomic,strong)BaseSwitchView *switchView;
@property(nonatomic,strong)BaseSlider *slider;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,copy)void(^tapBlock)(NSInteger tag);
-(void)updataUIwithDic:(NSDictionary *)dic;
@end


