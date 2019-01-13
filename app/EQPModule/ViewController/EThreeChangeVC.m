//
//  EThreeChangeVC.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/12.
//  Copyright © 2018 nil. All rights reserved.
//

#import "EThreeChangeVC.h"
#import "YSEQPThemeThreeTimeEvent.h"


@interface EThreeChangeVC ()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,assign)NSInteger index;
@property (nonatomic, strong) YSEQPThemeThreeModel *model;
@property (nonatomic, strong) YSEQPThemeThreeTimeEvent *timeEvent;

@end

@implementation EThreeChangeVC

- (instancetype)initWithModel:(YSEQPThemeThreeModel *)model {
    
    self = [super init];
    if (self) {
        _model = model;
        //默认是0
        model.contentIndex = 0;
        [model request];
        
        
        [self initTimeEvent:model.type];
    }
    return self;
}

-(void)initTimeEvent:(NSInteger)type{
    
    _timeEvent = [[YSEQPThemeThreeTimeEvent alloc] init];
    _timeEvent.type = type;
    _timeEvent.index = self.model.contentIndex+1;
   // __weak __typeof(self)weakSelf = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initUI];
}

-(void)initData{
    _index = 0 ;
    _array = [BaseViewController readLocalFileWithName:_isM?@"mthree":@"ethree"][self.model.categoryId];
    NSLog(@"_array==>%@",_array);
    
}

-(void)initUI{
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 33, 53, 54)];
    [backBtn setImage:[UIImage imageNamed:@"image.bundle/back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(143,39,250, 50)];
    titleLabel.text = @"专题三投屏";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:32];
    [self.view addSubview:titleLabel];
    
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(0,213,ScreenSize.width,ScreenSize.width*0.4)];
    _btn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_btn];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10,0, _btn.frame.size.width-20,_btn.frame.size.height)];
    NSString *imageString = [NSString stringWithFormat:@"%@/%@",@"image.bundle",self.array[_index]];
    [_imageView setImage:[UIImage imageNamed:imageString]];
    [self.btn addSubview:_imageView];
    
    
    _btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0,_btn.frame.origin.y+_btn.frame.size.height+16,105, 33)];
    _btn1.center = CGPointMake(self.view.center.x-80, _btn1.center.y);
    [_btn1 setTitle:@"上一页" forState:UIControlStateNormal];
    [_btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btn1.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:0 alpha:1.0];
    [_btn1 addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn1.layer setCornerRadius:_btn1.frame.size.height/2];
    [self.view addSubview:_btn1];
    
    _btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0,_btn.frame.origin.y+_btn.frame.size.height+16,105, 33)];
    _btn2.center = CGPointMake(self.view.center.x+80, _btn2.center.y);
    [_btn2 setTitle:@"下一页" forState:UIControlStateNormal];
    [_btn2 addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btn2.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:0 alpha:1.0];
    [_btn2.layer setCornerRadius:_btn2.frame.size.height/2];
    [self.view addSubview:_btn2];
    
}

-(void)nextAction:(UIButton *)sender{
    
    if (sender == _btn1) {
        if (_index < 0) {
            _index = 0;
        }
        else
        {
            _index--;
            if (_index < 0) {
                _index = 0;
            }
        }
    }
    else{
        
        if (_index == _array.count - 1) {
            _index = 0 ;
        }else
        {
            _index ++;
        }
        
    }
    self.timeEvent.index = _index+1;
    
  
    NSString *imageString = [NSString stringWithFormat:@"%@/%@",@"image.bundle",self.array[_index]];
    NSString *path = [[NSBundle  mainBundle] pathForResource:imageString ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    [_imageView setImage:image];
    
    self.model.contentIndex = _index;
    [self.model request];
}
-(void)backAction{
    
    [_timeEvent stopRepeatEvent];
    [self.navigationController  popViewControllerAnimated:YES];
}

@end
