//
//  VerticalSelectView.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/9.
//  Copyright © 2018 nil. All rights reserved.
//

#import "VerticalSelectView.h"
#import "MenuCell.h"

@implementation VerticalSelectView

-(instancetype)initWithFrame:(CGRect)frame withCount:(NSMutableArray *)array{
    self = [super init];
    if (self) {
        self.frame = frame;
        _menuArray = [[NSMutableArray alloc] initWithCapacity:0];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] initWithCapacity:0];
            [mutableDic setObject:[obj objectForKey:@"title"] forKey:@"title"];
            if (idx == 0) {
                [mutableDic setObject:@"1" forKey:@"selected"];
            }
            else
            {
                [mutableDic setObject:@"0" forKey:@"selected"];
            }
            [self.menuArray addObject:mutableDic];
        }];
        
        
        self.menu = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width,frame.size.height)];
        self.menu.backgroundColor = [UIColor clearColor];
        self.menu.dataSource = self;
        self.menu.delegate = self;
        self.menu.scrollEnabled = NO;
        self.menu.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:self.menu];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _menuArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *celltypeCell = @"celltypeCell";
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:celltypeCell];
    if (cell == nil) {
        cell = [[MenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celltypeCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.tag = indexPath.row;
    [cell updateUI:_menuArray[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [_menuArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       NSMutableDictionary  *mutableDic =(NSMutableDictionary *)obj;
        if (idx == indexPath.row) {
            [mutableDic setObject:@"1" forKey:@"selected"];
        }
        else
        {
            [mutableDic setObject:@"0" forKey:@"selected"];
        }
    }];
    [tableView reloadData];
    if (_selecedBlock) {
        _selecedBlock(indexPath.row);
    }
}


@end
