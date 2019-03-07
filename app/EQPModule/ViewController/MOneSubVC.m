//
//  MOneSubVC.m
//  ipad
//
//  Created by Zhang Xinrong on 2019/3/7.
//  Copyright © 2019 nil. All rights reserved.
//

#import "MOneSubVC.h"


@interface MOneSubVC ()

@end

@implementation MOneSubVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}

-(void)initUI{
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 33, 53, 54)];
    [backBtn setImage:[UIImage imageNamed:@"image.bundle/back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    
    NSString *imageString = [NSString stringWithFormat:@"%@/%@",@"image.bundle",@"1000"];
    UIImage *image = [UIImage imageNamed:imageString];
    CGFloat width = self.view.frame.size.width-20;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, width, width*image.size.height/image.size.width)];
    [imageView setImage:image];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
   
}

-(void)backAction{
    

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
