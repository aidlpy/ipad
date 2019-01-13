//
//  ControlViewController.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/8.
//  Copyright © 2018 nil. All rights reserved.
//

#import "ControlViewController.h"
#import "HorizontalSelectView.h"
#import "ControlCell.h"
#import "PopView.h"
#import "YSControlModelMamaner.h"


@interface ControlViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_titleArray;
    NSMutableArray *_cellArray;
    @private NSString *categoryTitle;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(controlValueChangeNotification) name:YSControlValueChangeNotification object:nil];
}

-(void)initData{
    _cellArray = [[NSMutableArray alloc] initWithCapacity:0];
    _titleArray = [BaseViewController readLocalFileWithName:@"control"];
    _cellArray = [[_titleArray objectAtIndex:0] objectForKey:@"body"];
    categoryTitle =[[_titleArray objectAtIndex:0] objectForKey:@"title"];
    self.dataArray = [[YSControlModelMamaner shareInstance] modelList];

 

}

-(void)initUI{
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 33, 53, 54)];
    [backBtn setImage:[UIImage imageNamed:@"image.bundle/back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    HorizontalSelectView *selectView = [[HorizontalSelectView alloc] initWithFrame:CGRectMake(120,28,ScreenSize.width-150, 100) withCount:_titleArray];
    selectView.selectBlock = ^(UIButton * _Nonnull sender) {
        [self selectTitle:sender];
    };
    [self.view addSubview:selectView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(50, 150, ScreenSize.width-50, ScreenSize.height-150)];
    _tableView.backgroundColor = self.view.backgroundColor;
    _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    

}

-(void)popAction:(NSInteger)tag{
    
    @PaPa(self)
    YSControlBaseModel *model = self.dataArray[self.index];
    BOOL isOpen =  [model switchValueWithRow:tag];
    PopView *popView = [[PopView alloc] init];
    popView.popLab.text = [NSString stringWithFormat:@"确定%@%@的%@?",!isOpen?@"开启":@"关闭",categoryTitle,_cellArray[tag][@"title"]];
    popView.resultBlock = ^{
       //确定的回调
        @baba(self)
        [self test];
        [model refreshSwitchWithRow:tag switch:!isOpen];
        [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:tag inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    };
    [self.view addSubview:popView];
    
}

-(void)test{
    
    
}


-(void)selectTitle:(UIButton *)sender{
    
    self.index = sender.tag;
    NSDictionary *dic = _titleArray[sender.tag];
    _cellArray = dic[@"body"];
    categoryTitle = dic[@"title"];
    [_tableView reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cellArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *celltypeCell = @"celltypeCell";
    ControlCell *cell = [tableView dequeueReusableCellWithIdentifier:celltypeCell];
    if (cell == nil) {
        cell = [[ControlCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celltypeCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    @PaPa(self)
    cell.switchView.valueChangeBlock = ^(BOOL isOn) {

      //  [strongSelf.dataArray[strongSelf.index] refreshSwitchWithRow:indexPath.row switch:isOn?1:0];
    };
    cell.slider.valueChangeBlock = ^(float progress) {
        @baba(self)
        [self.dataArray[self.index] refreshSliderWithRow:indexPath.row value:progress];
    };
    cell.tag = indexPath.row;
    cell.tapBlock = ^(NSInteger tag) {
       [self popAction:tag];
    };
    [cell updataUIwithDic:[_cellArray objectAtIndex:indexPath.row]];
    [cell.switchView setDefalutState:[self.dataArray[self.index] switchValueWithRow:indexPath.row]];
    cell.slider.progress = [self.dataArray[self.index] sliderValueWithRow:indexPath.row];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Notification

- (void)controlValueChangeNotification {
    
    [_tableView reloadData];
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
