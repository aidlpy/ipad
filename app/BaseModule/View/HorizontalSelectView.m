//
//  HorizontalSelectView.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/9.
//  Copyright © 2018 nil. All rights reserved.
//

#import "HorizontalSelectView.h"

static CGFloat superman =28;
static CGFloat spiderman = 22;

@implementation HorizontalSelectView
-(instancetype)initWithFrame:(CGRect)frame withCount:(NSArray *)array{
    self = [super init];
    if (self) {
        self.frame = frame;
        _btnArray = [[NSMutableArray alloc] initWithCapacity:0];
        CGFloat width = frame.size.width/array.count;
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(idx*width, 0, width, frame.size.height)];
            id dic = array[idx];
            if ([dic isKindOfClass:[NSDictionary class]]) {
                [btn setTitle:[NSString stringWithFormat:@"%@",[dic objectForKey:@"title"]] forState:UIControlStateNormal];
            }
            if (idx == 0) {
                btn.titleLabel.font = [UIFont systemFontOfSize:superman];
                btn.titleEdgeInsets = UIEdgeInsetsMake(-15, 0, 0, 0);
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
            else
            {
                btn.titleLabel.font = [UIFont systemFontOfSize:spiderman];
                btn.titleEdgeInsets = UIEdgeInsetsMake(5, 0, 0, 0);
                [btn setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.3] forState:UIControlStateNormal];
            }
            [btn addTarget:self action:@selector(selectedItem:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = idx;
            [self addSubview:btn];
            [self.btnArray addObject:btn];
        }];
    }
    return self;
}

-(void)selectedItem:(UIButton *)sender{
    
    
    [_btnArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = (UIButton *)obj;
        if (idx == sender.tag) {
            btn.titleLabel.font = [UIFont systemFontOfSize:superman];
            btn.titleEdgeInsets = UIEdgeInsetsMake(-15, 0, 0, 0);
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        else
        {
            btn.titleLabel.font = [UIFont systemFontOfSize:spiderman];
            btn.titleEdgeInsets = UIEdgeInsetsMake(-5, 0, 0, 0);
            [btn setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.3] forState:UIControlStateNormal];
        }
    }];
    if (_selectBlock) {
        _selectBlock(sender);
    }
    
}


@end
