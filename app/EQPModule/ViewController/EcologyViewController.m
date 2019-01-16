//
//  EcologyViewController.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/9.
//  Copyright © 2018 nil. All rights reserved.
//

#import "EcologyViewController.h"
#import "VerticalSelectView.h"
#import "EImageView.h"
#import "EThemeOneVC.h"
#import "EThemeTwoV.h"
#import "EThemeThreeV.h"
#import "EThemeFourV.h"
#import "EThemeFiveV.h"
#import "EThemeSixView.h"
#import "EFiveDetailVC.h"
#import "EThreeChangeVC.h"
#import "EThemeLeaderVC.h"
#import "ELocationViewController.h"
#import "EFileViewController.h"
#import "YSEQPThemeModelManager.h"

@interface EcologyViewController ()
@property(nonatomic,strong)NSMutableArray *menuArray;
@property(nonatomic,strong)UIView *currentView;
@end

@implementation EcologyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initUI];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_currentView && [_currentView isKindOfClass:[EThemeFiveV class]]) {
        EThemeFiveV *efive = (EThemeFiveV *)_currentView;
        [efive initToDefault];
    }
}

-(void)initData{
    
    NSArray *jsonArray =[BaseViewController readLocalFileWithName:@"title"];
    _menuArray = [[NSMutableArray alloc] initWithArray:@[@{@"title":jsonArray[0],@"view":[[EImageView alloc] initWithFrame:CGRectMake(50, 150, 690, 600) type:0]},@{@"title":jsonArray[1],@"view":[[EThemeOneVC alloc] initWithFrame:CGRectMake(50, 150, 800, 600)]},@{@"title":jsonArray[2],@"view":[[EThemeTwoV alloc] initWithFrame:CGRectMake(50, 150, 690, 600)]},@{@"title":jsonArray[3],@"view":[[EThemeThreeV alloc] initWithFrame:CGRectMake(50, 150, 690, 600)]},@{@"title":jsonArray[4],@"view":[[EThemeFourV alloc] initWithFrame:CGRectMake(50, 150, 789, 600)]},@{@"title":jsonArray[5],@"view":[[EThemeFiveV alloc] initWithFrame:CGRectMake(50, 150, 789, 600)]},@{@"title":jsonArray[6],@"view":[[EThemeSixView alloc] initWithFrame:CGRectMake(50, 150, 789, 600)]}]];
}

-(void)initUI{
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 33, 53, 54)];
    [backBtn setImage:[UIImage imageNamed:@"image.bundle/back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(143,39,150, 50)];
    titleLabel.text = @"生态主题";
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
            [self exitTopicWithView:weakSelf.currentView];
            [weakSelf.currentView removeFromSuperview];
        }
        NSDictionary *dic = self.menuArray[idx];
        weakSelf.currentView = dic[@"view"];
        [self enterTopicWithView:weakSelf.currentView];
        if ([weakSelf.currentView isKindOfClass:[EThemeThreeV class]]) {
            EThemeThreeV *ethree = (EThemeThreeV *)weakSelf.currentView;
            ethree.changeBlock = ^(YSEQPThemeThreeModel *model){
                NSArray *list = [BaseViewController readLocalFileWithName:@"ethree"][model.categoryId];
                if (list.count == 0) {
                    return;
                }
                EThreeChangeVC *vc = [[EThreeChangeVC alloc] initWithModel:model];
                vc.isM = NO;
                [self.navigationController pushViewController:vc animated:YES];
            };
        }
        if ([weakSelf.currentView isKindOfClass:[EThemeFiveV class]]) {
            EThemeFiveV *efive = (EThemeFiveV *)weakSelf.currentView;
            efive.selectedBlock = ^(UIButton * _Nonnull sender, YSEQPThemeFiveModel *model) {
                
                EFiveDetailVC *vc = [[EFiveDetailVC alloc] initWithModel:model];
                vc.isE = YES;
                vc.tag = sender.tag;
                [self.navigationController pushViewController:vc animated:YES];
            };
        }
        if ([weakSelf.currentView isKindOfClass:[EThemeOneVC class]]) {
            EThemeOneVC *onev = (EThemeOneVC *)weakSelf.currentView;
            onev.selectedBlock = ^(UIButton * _Nonnull sender, YSEQPThemeOneModel *model) {
                if (sender.tag > 99 && sender.tag < 150 ) {
                    NSLog(@"sender.tag==>%ld",(long)(long)sender.tag);
                    EThemeLeaderVC *vc = [[EThemeLeaderVC alloc] initWithModel:model];
                    vc.array = [BaseViewController readLocalFileWithName:@"leader"];
                    vc.defalutIndex = model.screenIndex;
                    [self.navigationController pushViewController:vc animated:YES];
                }
                else if (sender.tag > 999 && sender.tag < 1500) {
                    NSLog(@"sender.tag==>%ld",(long)(long)sender.tag);
                    ELocationViewController *vc = [[ELocationViewController alloc] initWithModel:model];
                    vc.array = [BaseViewController readLocalFileWithName:@"location"];
                    vc.defalutIndex = model.screenIndex;;
                    [self.navigationController pushViewController:vc animated:YES];
                }
                else if (sender.tag > 9999 && sender.tag <15000){
                    NSLog(@"sender.tag==>%ld",(long)(long)sender.tag);
                    EFileViewController *vc = [[EFileViewController alloc] initWithModel:model];
                    vc.array = [BaseViewController readLocalFileWithName:@"files"];
                    vc.defalutIndex = model.screenIndex;;
                    [self.navigationController pushViewController:vc animated:YES];
                }
                else{
               
                    return ;
                }
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Private

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
