//
//  EFiveDetailVC.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/10.
//  Copyright © 2018 nil. All rights reserved.
//

#import "EFiveDetailVC.h"
#import "ThemeFiveBtn.h"
#import "EFiveSubDetailVC.h"

@interface EFiveDetailVC ()
@property(nonatomic,strong)NSArray *jsonArray;
@property (nonatomic, strong) YSEQPThemeFiveModel *model;
@end

@implementation EFiveDetailVC

- (instancetype)initWithModel:(YSEQPThemeFiveModel *)model {
    
    self = [super init];
    if (self) {
        _model = model;
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
    
    if (_isE) {
        if (self.tag >= 10000 && self.tag%2 == 0) {
            self.jsonArray = [BaseViewController readLocalFileWithName:@"etfive1"];
        }
        else
        {
           self.jsonArray = [BaseViewController readLocalFileWithName:@"etfive2"];
        }
    }
    else
    {
        self.jsonArray = [BaseViewController readLocalFileWithName:@"mtfive"];
    }
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
    
    CGFloat width = (ScreenSize.width -40)/5;
    [self.jsonArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *dic = (NSDictionary *)obj;
        ThemeFiveBtn *btn = [[ThemeFiveBtn alloc] initWithFrame:CGRectMake(idx*(width+10),ScreenSize.height*0.25, width,2.25*width)];
        btn.backgroundColor = [UIColor whiteColor];
        btn.titleLab.text = dic[@"title"];
        btn.detailLab.text = dic[@"detail"];
        btn.tag = idx;
        [btn addTarget:self action:@selector(subDetailAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }];
    
    UILabel *noteLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    noteLabel.center = CGPointMake(self.view.center.x, 0.88*ScreenSize.height);
    noteLabel.textAlignment = NSTextAlignmentCenter;
    noteLabel.text =@"请选择需要查看的模块";
    noteLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:noteLabel];
    
}

-(void)subDetailAction:(UIButton *)sender{
    
    _model.detailIndex = sender.tag;
    EFiveSubDetailVC *vc = [[EFiveSubDetailVC alloc] initWithModel:_model];
    vc.array = self.jsonArray;
    vc.defalutIndex = sender.tag;
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

-(void)backAction{
    
    [self.model closeRequest];
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

@end
