//
//  EFileViewController.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/13.
//  Copyright © 2018 nil. All rights reserved.
//

#import "EFileViewController.h"
#import "LeaderCell.h"

@interface EFileViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) YSEQPThemeOneModel *model;
@property (nonatomic, assign) NSInteger indexRow;
@property (nonatomic, strong) UISwipeGestureRecognizer *upRecongizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *downRecongizer;
@end

@implementation EFileViewController

- (instancetype)initWithModel:(YSEQPThemeOneModel *)model {
    
    self = [super init];
    if (self) {

        _model = model;
        //默认是0
        model.secondViewVerticalIndex = 0;
        model.close = 0;
        model.nextPage = 2;
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
    self.imageIndex = 0;
    self.indexRow = 0;
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
    
    self.titleBtn = [[UIButton  alloc] initWithFrame:CGRectMake(0,20,154,115)];
    self.titleBtn.backgroundColor = [UIColor colorWithRed:0 green:0.4 blue:0.8 alpha:1.0];
    self.titleBtn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
    self.titleBtn.center = CGPointMake(self.rightView.frame.size.width/2,self.titleBtn.center.y);
    [self.titleBtn setTitle:self.array[self.defalutIndex][@"title"] forState:UIControlStateNormal];
    [self.rightView addSubview:self.titleBtn];
    
    self.leftbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 45, 64, 64)];
    [self.leftbtn setImage:[UIImage imageNamed:@"image.bundle/leftarrow"] forState:UIControlStateNormal];
    [self.leftbtn addTarget:self action:@selector(slide:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightView addSubview:self.leftbtn];
    
    self.rightbtn = [[UIButton alloc] initWithFrame:CGRectMake(self.titleBtn.frame.origin.x+self.titleBtn.frame.size.width, 45, 64, 64)];
    [self.rightbtn setImage:[UIImage imageNamed:@"image.bundle/rightarrow"] forState:UIControlStateNormal];
    [self.rightbtn addTarget:self action:@selector(slide:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightView addSubview:self.rightbtn];
    
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 108, ScreenSize.width-self.rightView.frame.size.width, ScreenSize.height-108)];
    self.leftView.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.76 alpha:1.0];
    [self.view addSubview:self.leftView];
    
    _upRecongizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [_upRecongizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [ self.leftView  addGestureRecognizer:_upRecongizer];
    
    _downRecongizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [_downRecongizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [ self.leftView  addGestureRecognizer:_downRecongizer];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
    _imageView.userInteractionEnabled = YES;
    _imageView.center = CGPointMake(self.leftView.frame.size.width/2, self.leftView.frame.size.height/2);
    _imageView.backgroundColor = [UIColor redColor];
    [self.leftView addSubview:_imageView];
    [self loadCurrentPdf:_defalutIndex];
    [self updateSelectedArray];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.titleBtn.frame.origin.y+self.titleBtn.frame.size.height+20,self.rightView.frame.size.width,self.rightView.frame.size.height-self.titleBtn.frame.origin.y-self.titleBtn.frame.size.height-20)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.rightView addSubview:self.tableView];
}

-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)upRecongizer{
    if (upRecongizer.direction  == UISwipeGestureRecognizerDirectionDown) {
          _imageIndex++;
        NSArray *imageArray = self.array[self.defalutIndex][@"tags"][self.indexRow][@"detail"];
        if (_imageIndex > imageArray.count -1) {
            _imageIndex = imageArray.count -1;\
            return;
        }
        self.model.nextPage = 1;
        [self.model request];
    }
    if (upRecongizer.direction == UISwipeGestureRecognizerDirectionUp) {
        if (_imageIndex != 0) {
            _imageIndex--;
        }
        else
        {
            return;
        }
        self.model.nextPage = 0;
        [self.model request];
    }

    [self loadCurrentPdf:self.indexRow];
}


-(void)updateSelectedArray{
    
    NSArray *array = self.array[self.defalutIndex][@"tags"];
    [self.cellArray removeAllObjects];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.cellArray addObject:idx == 0?@"1":@"0"];
    }];
}

-(void)loadCurrentPdf:(NSInteger)tag{

    
    NSString *imagePath = [NSString stringWithFormat:@"image.bundle/%@",self.array[self.defalutIndex][@"tags"][tag][@"detail"][_imageIndex]];
    NSString *path = [[NSBundle  mainBundle] pathForResource:imagePath ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    NSLog(@"图片地址==>%@",imagePath);
    if (image) {
        CGFloat widthRate = image.size.width/image.size.height;
        CGFloat height = self.leftView.frame.size.height-20;
        if (height*widthRate >self.leftView.frame.size.width) {
            widthRate = image.size.height/image.size.height;
            CGFloat width = self.leftView.frame.size.width -100;
            _imageView.frame = CGRectMake(0, 0, width, width*widthRate);
        }
        else
        {
            _imageView.frame = CGRectMake(0, 0, height*widthRate,height);
        }
        _imageView.center = CGPointMake(self.leftView.frame.size.width/2, self.leftView.frame.size.height/2);
        [_imageView setImage:image];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)self.array[self.defalutIndex][@"tags"]).count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
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
    cell.textLabel.text = self.array[self.defalutIndex][@"tags"][indexPath.row][@"tagTitle"];
    cell.textLabel.numberOfLines = 0;
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"我已经点击了");
    NSLog(@"self.cellArray==>%@",self.cellArray);
    [self.cellArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == indexPath.row) {
            [self.cellArray replaceObjectAtIndex:idx withObject:@"1"];
        }
        else
        {
            [self.cellArray replaceObjectAtIndex:idx withObject:@"0"];
        }
    }];
    self.imageIndex = 0;
    self.indexRow = indexPath.row;
    [self loadCurrentPdf:self.indexRow];
    [self.tableView reloadData];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0),^{
        self.model.secondViewVerticalIndex = indexPath.row;
        self.model.nextPage = 2;
        [self.model request];
    });
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
    self.indexRow = 0;
    self.imageIndex = 0;
    [self loadCurrentPdf:0];
    [self.titleBtn setTitle:self.array[self.defalutIndex][@"title"] forState:UIControlStateNormal];
    [self.tableView reloadData];
    self.model.screenIndex = self.defalutIndex;
    self.model.nextPage = 2;
    self.model.secondViewVerticalIndex = 0;
    [self.model request];
}

-(void)backAction{
    
    [self.model closeRequest];
    [self.navigationController  popViewControllerAnimated:YES];
    
}

-(void)dealloc{
   
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
