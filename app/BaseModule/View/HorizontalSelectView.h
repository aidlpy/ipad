//
//  HorizontalSelectView.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/9.
//  Copyright © 2018 nil. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HorizontalSelectView : UIView
@property(nonatomic,strong)NSMutableArray *btnArray;
@property(nonatomic,copy)void(^selectBlock)(UIButton *sender);
-(instancetype)initWithFrame:(CGRect)frame withCount:(NSArray *)array;
@end

NS_ASSUME_NONNULL_END
