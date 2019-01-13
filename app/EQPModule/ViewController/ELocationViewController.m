//
//  ELocationViewController.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/13.
//  Copyright © 2018 nil. All rights reserved.
//

#import "ELocationViewController.h"
#import "LeaderCell.h"

@interface ELocationViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) YSEQPThemeOneModel *model;

@end

@implementation ELocationViewController

- (instancetype)initWithModel:(YSEQPThemeOneModel *)model {
    
    self = [super init];
    if (self) {
        _model = model;
        //
        model.close = 0;
        [model request];
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
    
    self.tagsArray = [[NSMutableArray alloc] initWithCapacity:0];
    self.cellArray = [[NSMutableArray alloc] initWithCapacity:0];
    
}

-(void)initUI{
    NSLog(@"self.array==>%@",self.array);
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 33, 53, 54)];
    [backBtn setImage:[UIImage imageNamed:@"image.bundle/back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(143,39,250, 50)];
    titleLabel.text = @"相关详情";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:32];
    [self.view addSubview:titleLabel];
    
    self.rightView = [[UIView alloc] initWithFrame:CGRectMake(ScreenSize.width-300,108,300, ScreenSize.height-108)];
    self.rightView.backgroundColor = [UIColor colorWithRed:0.89 green:0.90 blue:0.90 alpha:1.0];
    [self.view addSubview:self.rightView];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,20,154,115)];
    self.imageView.center = CGPointMake(self.rightView.frame.size.width/2,self.imageView.center.y);
    [self.imageView setImage:[UIImage imageNamed:self.array[self.defalutIndex][@"image"]]];
    [self.rightView addSubview:self.imageView];
    
    self.leftbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 45, 64, 64)];
    [self.leftbtn setImage:[UIImage imageNamed:@"image.bundle/leftarrow"] forState:UIControlStateNormal];
    [self.leftbtn addTarget:self action:@selector(slide:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightView addSubview:self.leftbtn];
    
    self.rightbtn = [[UIButton alloc] initWithFrame:CGRectMake(self.imageView.frame.origin.x+self.imageView.frame.size.width, 45, 64, 64)];
    [self.rightbtn setImage:[UIImage imageNamed:@"image.bundle/rightarrow"] forState:UIControlStateNormal];
    [self.rightbtn addTarget:self action:@selector(slide:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightView addSubview:self.rightbtn];
    
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 108, ScreenSize.width-self.rightView.frame.size.width, ScreenSize.height-108)];
    self.leftView.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.76 alpha:1.0];
    [self.view addSubview:self.leftView];
   
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(5, 10, self.leftView.frame.size.width-10,100)];
    self.textView.backgroundColor = [UIColor clearColor];
    self.textView.font = [UIFont systemFontOfSize:20];
    self.textView.text = self.array[self.defalutIndex][@"detail"];
    self.textView.frame = CGRectMake(self.textView.frame.origin.x,self.textView.frame.origin.y, self.textView.frame.size.width, self.textView.contentSize.height);
    [self.leftView addSubview:self.textView];
    [self updateSelectedArray];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.imageView.frame.origin.y+self.imageView.frame.size.height+20,self.rightView.frame.size.width,self.rightView.frame.size.height-self.imageView.frame.origin.y-self.imageView.frame.size.height-20)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.rightView addSubview:self.tableView];
}

-(void)updateSelectedArray{
    
    [self.cellArray removeAllObjects];
    [self.array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.cellArray addObject:idx == self.defalutIndex?@"1":@"0"];
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *celltypeCell = @"celltypeCell";
    LeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:celltypeCell];
    if (cell == nil) {
        cell = [[LeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celltypeCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.tag = indexPath.row;
    cell.backgroundColor = [self.cellArray[indexPath.row] integerValue]==1?[UIColor colorWithRed:0.18 green:0.19 blue:0.34 alpha:1.0]:[UIColor clearColor];
    cell.textLabel.text = self.array[indexPath.row][@"title"];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"self.cellArray==>%@",self.cellArray);
    self.defalutIndex = indexPath.row;
    [self updateSelectedArray];
    [self.imageView setImage:[UIImage imageNamed:self.array[self.defalutIndex][@"image"]]];
    self.textView.text = self.array[self.defalutIndex][@"detail"];
    self.textView.frame = CGRectMake(self.textView.frame.origin.x,self.textView.frame.origin.y, self.textView.frame.size.width, self.textView.contentSize.height);
    [self.tableView reloadData];
    
    self.model.screenIndex = indexPath.row;
    [self.model request];
}

-(void)slide:(UIButton *)sender{
    if (sender == self.leftbtn) {
        if (self.defalutIndex == 0) {
            self.defalutIndex = self.array.count-1;
        }
        else
        {
            self.defalutIndex--;
        }
        
    }
    
    if (sender == self.rightbtn){
        if (self.defalutIndex == self.array.count-1) {
            self.defalutIndex = 0;
        }
        else
        {
            self.defalutIndex++;
        }
    }
    [self updateSelectedArray];
    [self.imageView setImage:[UIImage imageNamed:self.array[self.defalutIndex][@"image"]]];
    self.textView.text = self.array[self.defalutIndex][@"detail"];
    self.textView.frame = CGRectMake(self.textView.frame.origin.x,self.textView.frame.origin.y, self.textView.frame.size.width, self.textView.contentSize.height);
    [self.tableView reloadData];
    
    
    self.model.screenIndex = self.defalutIndex;
    [self.model request];
}

-(void)backAction{
    
    [self.model closeRequest];
    [self.navigationController  popViewControllerAnimated:YES];
    
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
