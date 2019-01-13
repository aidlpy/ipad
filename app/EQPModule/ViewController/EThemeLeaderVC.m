//
//  EThemeLeaderVC.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/12.
//  Copyright © 2018 nil. All rights reserved.
//

#import "EThemeLeaderVC.h"
#import "LeaderCell.h"

@interface EThemeLeaderVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIButton *rightbtn;
@property(nonatomic,strong)UIButton *leftbtn;
@property(nonatomic,strong)NSMutableArray *tagsArray;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *cellArray;

@property (nonatomic, strong) YSEQPThemeOneModel *model;

@end

@implementation EThemeLeaderVC

- (instancetype)initWithModel:(YSEQPThemeOneModel *)model {
    
    self = [super init];
    if (self) {
        _model = model;
        //默认是0
        model.secondViewVerticalIndex = 0;
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
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 33, 53, 54)];
    [backBtn setImage:[UIImage imageNamed:@"image.bundle/back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(143,39,250, 50)];
    titleLabel.text = @"相关详情";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:32];
    [self.view addSubview:titleLabel];
    
    self.rightView = [[UIView alloc] initWithFrame:CGRectMake(ScreenSize.width-260,108,260, ScreenSize.height-108)];
    self.rightView.backgroundColor = [UIColor colorWithRed:0.89 green:0.90 blue:0.90 alpha:1.0];
    [self.view addSubview:self.rightView];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,115,154)];
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
    [self updateSelectedArray];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(5, 10, self.leftView.frame.size.width-10,100)];
    self.textView.backgroundColor = [UIColor clearColor];
    self.textView.font = [UIFont systemFontOfSize:20];
    self.textView.text = self.array[self.defalutIndex][@"tags"][0][@"tagDetail"];
    self.textView.frame = CGRectMake(self.textView.frame.origin.x,self.textView.frame.origin.y, self.textView.frame.size.width, self.textView.contentSize.height);
    [self.leftView addSubview:self.textView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.imageView.frame.origin.y+self.imageView.frame.size.height+10,self.rightView.frame.size.width,self.rightView.frame.size.height-self.imageView.frame.origin.y-self.imageView.frame.size.height-10)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.rightView addSubview:self.tableView];
}

-(void)updateSelectedArray{
    
    NSArray *array = self.array[self.defalutIndex][@"tags"];
    [self.cellArray removeAllObjects];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.cellArray addObject:idx == 0?@"1":@"0"];
    }];
    
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
    [self.tableView reloadData];
    self.textView.text = self.array[self.defalutIndex][@"tags"][indexPath.row][@"tagDetail"];
    self.textView.frame = CGRectMake(self.textView.frame.origin.x,self.textView.frame.origin.y, self.textView.frame.size.width, self.textView.contentSize.height);
    
    self.model.secondViewVerticalIndex = indexPath.row;
    [self.model request];
}

-(void)reloadTag{
    [self.tagsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [self.tagsArray removeAllObjects];
    NSArray *tagsArray = self.array[self.defalutIndex][@"tags"];
    [tagsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *dic = (NSDictionary *)obj;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.imageView.frame.origin.y+self.imageView.frame.size.height+10+idx*40,self.rightView.frame.size.width,25)];\
        [btn setTitle:dic[@"tagTitle"] forState:UIControlStateNormal];
        [self.rightView  addSubview:btn];
        [self.tagsArray addObject:btn];
    }];
    
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
    self.textView.text = self.array[self.defalutIndex][@"tags"][0][@"tagDetail"];
    self.textView.frame = CGRectMake(self.textView.frame.origin.x,self.textView.frame.origin.y, self.textView.frame.size.width, self.textView.contentSize.height);
    [self.tableView reloadData];
    
    self.model.screenIndex = self.defalutIndex;
    self.model.secondViewVerticalIndex = 0;
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
