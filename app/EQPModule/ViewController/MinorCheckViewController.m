//
//  MinorCheckViewController.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/9.
//  Copyright © 2018 nil. All rights reserved.
//

#import "MinorCheckViewController.h"
#import "VerticalSelectView.h"
#import "EImageView.h"
#import "MThemeOneV.h"
#import "MThemeTwoV.h"
#import "MThemeThreeV.h"
#import "EThemeFourV.h"
#import "MThemeFiveV.h"
#import "MThemeSixV.h"
#import "EFiveDetailVC.h"
#import "EThreeChangeVC.h"
#import "YSEQPThemeModelManager.h"

@interface MinorCheckViewController ()
{
    //__block UIView *currentView;
}
@property(nonatomic,strong)NSMutableArray *menuArray;
@property(nonatomic,strong)UIView *currentView;
@end

@implementation MinorCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initUI];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_currentView && [_currentView isKindOfClass:[MThemeFiveV class]]) {
         MThemeFiveV *efive = (MThemeFiveV *)_currentView;
        [efive initToDefalut];
    }

}

-(void)initData{
    _menuArray = [[NSMutableArray alloc] initWithArray:@[@{@"title":@"形象墙",@"view":[[EImageView alloc] initWithFrame:CGRectMake(50, 150, 690, 500) type:1]},@{@"title":@"专题一",@"view":[[MThemeOneV alloc] initWithFrame:CGRectMake(50, 150, 690, 500)]},@{@"title":@"专题二",@"view":[[MThemeTwoV alloc] initWithFrame:CGRectMake(50, 150, 690, 500)]},@{@"title":@"专题三",@"view":[[MThemeThreeV alloc] initWithFrame:CGRectMake(50, 150, 690, 500)]},@{@"title":@"专题四",@"view":[[EThemeFourV alloc] initWithFrame:CGRectMake(50, 150, 690, 500)]},@{@"title":@"专题五",@"view":[[MThemeFiveV alloc] initWithFrame:CGRectMake(50, 150, 690, 500)]},@{@"title":@"专题六",@"view":[[MThemeSixV alloc] initWithFrame:CGRectMake(50, 150, 690, 500)]}]];
}

-(void)initUI{
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 33, 53, 54)];
    [backBtn setImage:[UIImage imageNamed:@"image.bundle/back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(143,39,150, 50)];
    titleLabel.text = @"未检主题";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:32];
    [self.view addSubview:titleLabel];
    
    
    
    __weak typeof(self) weakSelf = self;
    _currentView = [self.menuArray[0] objectForKey:@"view"];
    [self.view addSubview:_currentView];
    
    VerticalSelectView *selectView = [[VerticalSelectView alloc] initWithFrame:CGRectMake(ScreenSize.width-130,0,130,448) withCount:_menuArray];
    selectView.center = CGPointMake(selectView.center.x, self.view.center.y-40);
    selectView.selecedBlock = ^(NSInteger idx) {
        if (weakSelf.currentView) {
            [weakSelf.currentView removeFromSuperview];
            [self exitTopicWithView:weakSelf.currentView];
        }
        NSDictionary *dic = self.menuArray[idx];
        weakSelf.currentView = dic[@"view"];
        [self enterTopicWithView:weakSelf.currentView];
        if ([weakSelf.currentView isKindOfClass:[MThemeThreeV class]]) {
            MThemeThreeV *eThere = (MThemeThreeV *)weakSelf.currentView;
            eThere.changeBlock = ^(YSEQPThemeThreeModel *model){
                EThreeChangeVC *vc = [[EThreeChangeVC alloc] initWithModel:model];
                vc.isM = YES;
                [self.navigationController pushViewController:vc animated:YES];
            };
        }
        
        if ([weakSelf.currentView isKindOfClass:[MThemeFiveV class]]) {
            MThemeFiveV *efive = (MThemeFiveV *)weakSelf.currentView;
            efive.selectedBlock = ^(UIButton * _Nonnull sender, YSEQPThemeFiveModel *model) {
                EFiveDetailVC *vc = [[EFiveDetailVC alloc] initWithModel:model];
                vc.isE = NO;
                [self.navigationController pushViewController:vc animated:YES];
            };
        }
        [self.view addSubview:weakSelf.currentView];
    };
    [self.view addSubview:selectView];
    
}

-(void)backAction{
    [self.menuArray enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [[YSEQPThemeModelManager shareInstance] addBackgroundPlayModel:[[obj objectForKey:@"view"] valueForKey:@"model"]];
    }];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)exitTopicWithView:(UIView *)view {
    
    @try {
        if ([view respondsToSelector:@selector(exit)]) {
            [view performSelector:@selector(exit) withObject:nil afterDelay:0];
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)enterTopicWithView:(UIView *)view {
    
    @try {
        if ([view respondsToSelector:@selector(enter)]) {
            [view performSelector:@selector(enter) withObject:nil afterDelay:0];
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

@end
