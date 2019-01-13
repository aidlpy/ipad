//
//  PopView.h
//  ipad
//
//  Created by Zhang Xinrong on 2019/1/8.
//  Copyright © 2019 nil. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PopView : UIView
@property(nonatomic,strong)UILabel *popLab;
@property(nonatomic,copy)void(^resultBlock)(void);
@end

NS_ASSUME_NONNULL_END
