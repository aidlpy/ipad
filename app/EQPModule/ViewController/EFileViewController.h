//
//  EFileViewController.h
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/13.
//  Copyright © 2018 nil. All rights reserved.
//

#import "BaseViewController.h"
#import "YSEQPThemeOneModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EFileViewController : BaseViewController

- (instancetype)initWithModel:(YSEQPThemeOneModel *)model;
@property(nonatomic,assign)NSInteger imageIndex;
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)UIView *rightView;
@property(nonatomic,strong)UIView *leftView;
@property(nonatomic,assign)NSInteger defalutIndex;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIButton *titleBtn;
@property(nonatomic,strong)UIButton *rightbtn;
@property(nonatomic,strong)UIButton *leftbtn;
@property(nonatomic,strong)NSMutableArray *tagsArray;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *cellArray;
@property(nonatomic,strong)UIImageView *imageView;
@end

NS_ASSUME_NONNULL_END
