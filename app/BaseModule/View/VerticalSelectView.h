//
//  VerticalSelectView.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/9.
//  Copyright © 2018 nil. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VerticalSelectView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *menu;
@property(nonatomic,strong)NSMutableArray *menuArray;
@property(nonatomic,copy)void(^selecedBlock)(NSInteger idx);
-(instancetype)initWithFrame:(CGRect)frame withCount:(NSMutableArray *)array;
@end

NS_ASSUME_NONNULL_END
