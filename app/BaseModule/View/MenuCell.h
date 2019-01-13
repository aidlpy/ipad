//
//  MenuCell.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/9.
//  Copyright © 2018 nil. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuCell : UITableViewCell
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIView *rightView;
-(void)updateUI:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
