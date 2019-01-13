//
//  TFiveSubDetailView.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/11.
//  Copyright © 2018 nil. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TFiveSubDetailView : UIView
@property(nonatomic,strong)UIView *leftView;
@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UITextView *textView;
@property(nonatomic,strong)UILabel *leftLab;
@property(nonatomic,copy)void(^selectedBlock)(NSInteger index);
-(void)updateUI:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
