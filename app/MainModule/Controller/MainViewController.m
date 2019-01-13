//
//  MainViewController.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/8.
//  Copyright © 2018 nil. All rights reserved.
//

#import "MainViewController.h"
#import "ControlViewController.h"
#import "EcologyViewController.h"
#import "MinorCheckViewController.h"
#import "YSSocketRequest.h"
#import "YSEQPThemeModelManager.h"
static NSString *turnOn = @"开启\n设备";
static NSString *turnOff = @"关闭\n设备";


@interface MainViewController ()
{
    UILabel *_timeLabel;
    UIView *_upView;
    UIButton *_modelBtn;
    UIButton *_controlBtn;
    UIButton *_leftBtn;
    UIButton *_rightBtn;
    UIButton *_autoBtn;
    UIButton *_leftCoverBtn;
    UIButton *_rightCoverBtn;
    UIButton *_rightArrowBtn;
    NSTimer *_timer;
    BOOL _isTurnOn;
    NSArray *_titleArray;
    NSString *_typeString;

}


@end


@implementation MainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _isTurnOn = NO;
    [self initData];
    [self initUI];
}

-(void)initData{
    _isTurnOn = NO;
    _typeString = @"";
    _titleArray = @[@"生态",@"未检"];
    
}

-(void)initUI{
    
    UIImageView *mainView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, ScreenSize.height)];
    [mainView setImage:[UIImage imageNamed:@"image.bundle/mainback"]];
    mainView.userInteractionEnabled = YES;
    [self.view addSubview:mainView];
    
    
    _upView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 95)];
    _upView.backgroundColor = [UIColor colorWithRed:0.078 green:0.137 blue:0.215 alpha:1.0];
    [self.view addSubview:_upView];
    
    UIImageView *customerView = [[UIImageView alloc] initWithFrame:CGRectMake(35,0, 43, 43)];
    customerView.center = CGPointMake(customerView.center.x,_upView.frame.size.height/2+10);
    [customerView setImage:[UIImage imageNamed:@"image.bundle/customerLogo"]];
    [_upView addSubview:customerView];
    
    UILabel *companyTitle = [[UILabel alloc] initWithFrame:CGRectMake(88, 0, 200, 20)];
    companyTitle.center = CGPointMake(companyTitle.center.x, _upView.center.y+10);
    companyTitle.font = [UIFont boldSystemFontOfSize:23];
    companyTitle.text = @"惠安县人民检察院";
    companyTitle.textColor = [UIColor whiteColor];
    [_upView addSubview:companyTitle];
    
    _controlBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenSize.width-110,10,150,55)];
    _controlBtn.center = CGPointMake(_controlBtn.center.x, _upView.center.y+10);
    _controlBtn.backgroundColor = [UIColor clearColor];
    [_controlBtn setImage:[UIImage imageNamed:@"image.bundle/control"] forState:UIControlStateNormal];
    [_controlBtn setTitle:@"控制台" forState:UIControlStateNormal];
    _controlBtn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    _controlBtn.imageEdgeInsets = UIEdgeInsetsMake(0,60,20,60);
    _controlBtn.titleEdgeInsets = UIEdgeInsetsMake(35,10,0,35);
    [_controlBtn addTarget:self action:@selector(toControlAction) forControlEvents:UIControlEventTouchUpInside];
    [_controlBtn setTitleColor:[UIColor colorWithWhite:0.8 alpha:0.8] forState:UIControlStateNormal];
    [_upView addSubview:_controlBtn];
    
    _modelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0.19*ScreenSize.height,350, 50)];
    [_modelBtn setImage:[UIImage imageNamed:@"image.bundle/modelLogo"] forState:UIControlStateNormal];
    NSString *titleString = [NSString stringWithFormat:@"               %@主题播放中...  ",_typeString];
    [_modelBtn setTitle:titleString forState:UIControlStateNormal];
    [_modelBtn setTitleColor:[UIColor colorWithRed:0.43 green:0.90 blue:0.98 alpha:1.0] forState:UIControlStateNormal];
    _modelBtn.imageEdgeInsets = UIEdgeInsetsMake(10,25,10,255);
    _modelBtn.titleEdgeInsets = UIEdgeInsetsMake(10,-50,10,0);
    _modelBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    _modelBtn.center = CGPointMake(ScreenSize.width/2,_modelBtn.center.y);
    _modelBtn.backgroundColor =[UIColor colorWithRed:0.109 green:0.188 blue:0.274 alpha:1.0];
    [_modelBtn.layer setCornerRadius:_modelBtn.frame.size.height/2];
    [self.view addSubview:_modelBtn];
    _modelBtn.hidden = !_isTurnOn;
    
    _rightArrowBtn = [[UIButton alloc] initWithFrame:CGRectMake(_modelBtn.frame.size.width-60, 0, 30, 20)];
    _rightArrowBtn.center = CGPointMake(_rightArrowBtn.center.x, _modelBtn.frame.size.height/2);
    _rightArrowBtn.backgroundColor = [UIColor clearColor];
    [_rightArrowBtn setImage:[UIImage imageNamed:@"image.bundle/modelarrow"] forState:UIControlStateNormal];
    [_modelBtn addSubview:_rightArrowBtn];
    

    _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenSize.width/2-330,0.36*ScreenSize.height,305,268)];
    [_leftBtn setBackgroundImage:[UIImage imageNamed:@"image.bundle/elogo"] forState:UIControlStateNormal];
    _leftBtn.tag = 1;
    [_leftBtn addTarget:self action:@selector(ecologyAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_leftBtn];
    
    
    _leftCoverBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenSize.width/2-330,0.36*ScreenSize.height,305,268)];
    _leftCoverBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    [_leftCoverBtn setTitle:@"设备未开启" forState:UIControlStateNormal];
    _leftCoverBtn.tag = 1;
    [_leftCoverBtn addTarget:self action:@selector(ecologyAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_leftCoverBtn];
    
    UILabel *leftTitle = [[UILabel alloc] initWithFrame:CGRectMake(_leftBtn.frame.origin.x,_leftBtn.frame.origin.y+_leftBtn.frame.size.height+34,_leftBtn.frame.size.width,20)];
    leftTitle.textColor = [UIColor whiteColor];
    leftTitle.font =  [UIFont boldSystemFontOfSize:20];
    leftTitle.textAlignment = NSTextAlignmentCenter;
    leftTitle.text = @"生态主题";
    [self.view addSubview:leftTitle];
    
    _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenSize.width/2+25,0.36*ScreenSize.height, 305, 268)];
    [_rightBtn setBackgroundImage:[UIImage imageNamed:@"image.bundle/mlogo"] forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(minorAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_rightBtn];
    
    _rightCoverBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenSize.width/2+25,0.36*ScreenSize.height, 305, 268)];
    _rightCoverBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [_rightCoverBtn setTitle:@"设备未开启" forState:UIControlStateNormal];
    _rightCoverBtn.tag = 1;
    [_rightCoverBtn addTarget:self action:@selector(ecologyAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_rightCoverBtn];
    
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(_rightBtn.frame.origin.x,_rightBtn.frame.origin.y+_rightBtn.frame.size.height+34,_rightBtn.frame.size.width,20)];
    rightLabel.textColor = [UIColor whiteColor];
    rightLabel.font = [UIFont boldSystemFontOfSize:20];
    rightLabel.textAlignment = NSTextAlignmentCenter;
    rightLabel.text = @"未检主题";
    [self.view addSubview:rightLabel];
    
    _autoBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, ScreenSize.height-135, 65, 65)];
  //  [_autoBtn setImage:[UIImage imageNamed:@"image.bundle/autologo"] forState:UIControlStateNormal];
    [_autoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_autoBtn setTitle:turnOn forState:UIControlStateNormal];
    _autoBtn.titleEdgeInsets = UIEdgeInsetsMake(0,0,0,0);
    _autoBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    _autoBtn.titleLabel.numberOfLines = 0;
    _autoBtn.imageEdgeInsets = UIEdgeInsetsMake(10,10,10,10);
    _autoBtn.center = CGPointMake(ScreenSize.width/2, _autoBtn.center.y);
    [_autoBtn.layer setCornerRadius:_autoBtn.frame.size.height/2];
    _autoBtn.backgroundColor = RGB(102, 209, 222);
    [_autoBtn addTarget:self action:@selector(autoTurnOn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_autoBtn];
    
}


-(void)autoTurnOn:(UIButton *)sender{
    _isTurnOn = !_isTurnOn;
    if (!_isTurnOn) {
        _modelBtn.hidden = YES;
    }
    [_autoBtn setTitle:!_isTurnOn?turnOn:turnOff forState:UIControlStateNormal];
    [_autoBtn setTitleColor:!_isTurnOn?[UIColor blackColor]:[UIColor whiteColor] forState:UIControlStateNormal];
    _autoBtn.backgroundColor = !_isTurnOn?RGB(102, 209, 222):_upView.backgroundColor;
    if (_isTurnOn) {
        _leftCoverBtn.hidden = YES;
        _rightCoverBtn.hidden = YES;
    }
    else
    {
        _leftCoverBtn.hidden =  NO;
        _rightCoverBtn.hidden =  NO;
    }
    [YSSocketRequest requestSwitchDeviceWithSwitch:_isTurnOn complete:^(NSError * _Nullable error) {
        
    }];
}

-(void)toControlAction{
    
    ControlViewController *vc = [[ControlViewController alloc] init];
    [self.navigationController  pushViewController:vc animated:YES];
    
}

-(void)ecologyAction{
    _typeString = _titleArray[0];
    NSString *titleString = [NSString stringWithFormat:@"               %@主题播放中...  ",_typeString];
    [_modelBtn setTitle:titleString forState:UIControlStateNormal];
    if (!_isTurnOn) {
        return;
    }
    EcologyViewController *vc = [[EcologyViewController alloc] init];
    [self.navigationController  pushViewController:vc animated:YES ];
    _modelBtn.hidden = NO;
    
    [YSSocketRequest requestTopicWithParameters:@{@"switch":@"0"} complete:nil];
    [[YSEQPThemeModelManager shareInstance] switchSubjectWithType:0];
}

-(void)minorAction{
    _typeString = _titleArray[1];
    NSString *titleString = [NSString stringWithFormat:@"               %@主题播放中...  ",_typeString];
    [_modelBtn setTitle:titleString forState:UIControlStateNormal];
    if (!_isTurnOn) {
        return;
    }
    MinorCheckViewController *vc = [[MinorCheckViewController alloc] init];
    [self.navigationController  pushViewController:vc animated:YES];
     _modelBtn.hidden = NO;
    
    [YSSocketRequest requestTopicWithParameters:@{@"switch":@"1"} complete:nil];
    [[YSEQPThemeModelManager shareInstance] switchSubjectWithType:1];
}

@end
