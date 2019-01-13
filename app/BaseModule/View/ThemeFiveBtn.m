//
//  ThemeFiveBtn.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/11.
//  Copyright © 2018 nil. All rights reserved.
//

#import "ThemeFiveBtn.h"

@implementation ThemeFiveBtn

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(18, 30, frame.size.width-36,30)];
        _titleLab.font = [UIFont boldSystemFontOfSize:28];
        [self addSubview:_titleLab];
        
        _detailLab = [[UILabel alloc] initWithFrame:CGRectMake(18, _titleLab.frame.origin.y+_titleLab.frame.size.height, frame.size.width-36,70)];
        _detailLab.font = [UIFont systemFontOfSize:15];
        _detailLab.numberOfLines = 0;
        [self addSubview:_detailLab];
        
        _virticalLabel = [[UITextView alloc] initWithFrame:CGRectMake((self.frame.size.width-30)/2, 30, 40, self.frame.size.height-30)];
        _virticalLabel.font = [UIFont systemFontOfSize:28];
        _virticalLabel.textColor = [UIColor blackColor];
        _virticalLabel.hidden = YES;
        _virticalLabel.editable = NO;
        _virticalLabel.userInteractionEnabled = YES;
        [self addSubview:_virticalLabel];

    }
    return self;
}

@end
