//
//  EFiveSubDetailVC.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/11.
//  Copyright © 2018 nil. All rights reserved.
//

#import "EFiveSubDetailVC.h"
#import "ThemeFiveBtn.h"
#import "TFiveSubDetailView.h"

@interface EFiveSubDetailVC ()
{
    NSMutableArray *_viewArray;
}
@property(nonatomic,strong)NSMutableArray *viewArray;
@property(nonatomic,strong)UIView *detailView;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,assign)CGFloat y;

@property (nonatomic, strong) YSEQPThemeFiveModel *model;

@end

@implementation EFiveSubDetailVC

- (instancetype)initWithModel:(YSEQPThemeFiveModel *)model {
    
    self = [super init];
    if (self) {
        _model = model;
        model.detailContentIndex = 0;
        [_model request];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initUI];
}

-(void)initData{
    _viewArray = [[NSMutableArray alloc] initWithCapacity:0];
    
}

-(void)initUI{

    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 33, 53, 54)];
    [backBtn setImage:[UIImage imageNamed:@"image.bundle/back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(143,39,250, 50)];
    titleLabel.text = @"专题五详情页";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:32];
    [self.view addSubview:titleLabel];
    
    self.width = 0.082*ScreenSize.width;
    self.height = 7.15*self.width;
    self.y = 0.12*ScreenSize.width;

    
    [_viewArray removeAllObjects];
    [_array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id currentView;
        if (idx == self.defalutIndex) {
            TFiveSubDetailView *view ;
            UIView *lastView = (UIView *)self.viewArray.lastObject;
            if (self.viewArray.count == 0) {
                view = [[TFiveSubDetailView alloc] initWithFrame:CGRectMake(0,self.y,ScreenSize.width*0.65,self.height)];
            }
            else
            {
                view = [[TFiveSubDetailView alloc] initWithFrame:CGRectMake(lastView.frame.origin.x+lastView.frame.size.width+5,self.y,ScreenSize.width*0.65,self.height)];
            }
             __weak __typeof(self)weakSelf = self;
            view.selectedBlock = ^(NSInteger index) {
                weakSelf.model.detailContentIndex = index;
                [weakSelf.model request];
            };
            view.backgroundColor = [UIColor whiteColor];
            [view updateUI:self.array[idx]];
            view.tag = idx;
            [self.view addSubview:view];
            currentView = view;
        }
        else
        {
            ThemeFiveBtn *btn;
            if (self.viewArray.count == 0) {
                btn = [[ThemeFiveBtn alloc] initWithFrame:CGRectMake(0,self.y,self.width,self.height)];
            }
            else
            {
                UIView *view = (UIView *)self.viewArray.lastObject;
                btn = [[ThemeFiveBtn alloc] initWithFrame:CGRectMake(view.frame.origin.x+view.frame.size.width+5,self.y,self.width,self.height)];
            }
            
            btn.titleLab.hidden = YES;
            btn.detailLab.hidden = YES;
            btn.backgroundColor = [UIColor whiteColor];
            [btn setTitle:self.array[idx][@"title"] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:45];
            btn.titleLabel.numberOfLines = 0 ;
            btn.tag = idx;
            [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:btn];
            currentView = btn;
        }
      
        [self.viewArray addObject:currentView];
    }];
}

-(void)backAction{
    
    self.model.detailContentIndex = -1;
    [self.model request];
    [self.navigationController  popViewControllerAnimated:YES];
    
}

-(void)clickAction:(UIButton *)sender{
    
    if (self.defalutIndex == sender.tag) {
        return;
    }
    self.defalutIndex = sender.tag;
    self.model.detailIndex = sender.tag;
    self.model.detailContentIndex = 0;
    [self.model request];
    
    [self.viewArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[TFiveSubDetailView class]]) {
            [self.viewArray exchangeObjectAtIndex:sender.tag withObjectAtIndex:idx];
            [((TFiveSubDetailView *)obj) updateUI:self.array[sender.tag]];
            *stop = YES;
        }
    }];
    
    [self.viewArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
        UIView *view = (UIView *)obj;
        view.tag = idx;
        if (idx == 0) {
            view.frame = CGRectMake(0, view.frame.origin.y,view.frame.size.width, view.frame.size.height);
        }
        else{
            UIView *lastView = (UIView *)self.viewArray[idx -1];
            view.frame = CGRectMake(lastView.frame.origin.x+lastView.frame.size.width+5, view.frame.origin.y,view.frame.size.width, view.frame.size.height);
        }
        if ([view isKindOfClass:[ThemeFiveBtn class]]) {
            ThemeFiveBtn *btn = (ThemeFiveBtn *)view;
            [btn setTitle:self.array[idx][@"title"] forState:UIControlStateNormal];
        }
        [self.view addSubview:view];
    }];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
