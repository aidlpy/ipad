//
//  MenuCell.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/9.
//  Copyright © 2018 nil. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 95, 64)];
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        self.titleLabel.font = [UIFont systemFontOfSize:18.0f];
        [self addSubview:self.titleLabel];
        
        self.rightView = [[UIView alloc] initWithFrame:CGRectMake(110, 0, 10, 30)];
        self.rightView.center = CGPointMake(self.rightView.center.x, self.titleLabel.center.y);
        self.rightView.backgroundColor = RGB(107, 223, 244);
        [self addSubview:self.rightView];
        
    }
    return self;
}

-(void)updateUI:(NSDictionary *)dic{
    
    self.titleLabel.text = dic[@"title"];
    if ([dic[@"selected"] integerValue] ==1) {
        self.rightView.hidden = NO;
        self.titleLabel.textColor = RGB(107, 223, 244);
        self.titleLabel.font = [UIFont systemFontOfSize:29.0f];
    }
    else
    {
        self.rightView.hidden = YES;
        self.titleLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
        self.titleLabel.font = [UIFont systemFontOfSize:18];
    }
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
