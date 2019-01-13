//
//  ControlCell.m
//  ipad
//
//  Created by Zhang Xinrong on 2018/11/8.
//  Copyright © 2018 nil. All rights reserved.
//

#import "ControlCell.h"
#import "BaseSwitchView.h"


@implementation ControlCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(50,20, 104, 40)];
        self.mainLabel.textColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:1.0f];
        self.mainLabel.hidden = YES;
        self.mainLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.mainLabel];
        
        self.titleLabel= [[UILabel alloc] initWithFrame:CGRectMake(50, 20, 150, 40)];
        self.titleLabel.font = [UIFont systemFontOfSize:20];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.titleLabel];
        
        @PaPa(self);
        self.switchView = [[BaseSwitchView alloc] initWithFrame:CGRectMake(200, 25,75, 37)];
        self.switchView.tapBlock = ^{
            @baba(self)
            if (self.tapBlock) {
                self.tapBlock(self.tag);
            }
        };
        [self.switchView setDefalutState:YES];
        [self addSubview:self.switchView];
        
        self.sliderTitle = [[UILabel alloc] initWithFrame:CGRectMake(445, 30, 86, 20)];
        self.sliderTitle.center = CGPointMake(self.sliderTitle.center.x, self.switchView.center.y);
        self.sliderTitle.font = [UIFont systemFontOfSize:11.0f];
        self.sliderTitle.textColor = [UIColor whiteColor];
        self.sliderTitle.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.sliderTitle];
        
        self.slider = [[BaseSlider alloc] initWithFrame:CGRectMake(510, 0, 300, 25)];//创建一个滑竿对象
        self.slider.center = CGPointMake(self.slider.center.x, self.switchView.center.y);
        self.slider.backgroundColor = [UIColor clearColor];
        [self addSubview:self.slider];
        self.slider.hidden = YES;
        self.lineView = [[UIView alloc] initWithFrame:CGRectMake(45,79.5,[[UIScreen mainScreen] bounds].size.width-90, 0.5)];
        self.lineView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
        [self addSubview:self.lineView];
        

    }
    return self;
}


-(void)updataUIwithDic:(NSDictionary *)dic{
    self.titleLabel.text = dic[@"title"];
    NSInteger type = [dic[@"type"]  integerValue];
    [self setSlide:type];
    
    if (dic[@"sTitle"] != nil) {
        self.sliderTitle.text = dic[@"sTitle"];
    }
    
    if (dic[@"mainTitle"] != nil) {
        self.mainLabel.text = dic[@"mainTitle"];
        [self setCellStyle:2];
    }
    else
    {
        [self setCellStyle:1];
    }
    
    if (dic[@"lineType"] != nil) {
        [self setlineStyle:2];
    }
    else
    {
        [self setlineStyle:1];
    }

}

-(void)setCellStyle:(NSInteger)type{
    switch (type) {
        case 1:
        {
            self.mainLabel.hidden = YES;
            self.titleLabel.frame = CGRectMake(50, 20, 150, 40);
            self.switchView.frame = CGRectMake(226, 25,75, 37);
        }
            break;
        case 2:
        {
            self.mainLabel.hidden = NO;
            self.titleLabel.frame = CGRectMake(187, 20, 150, 40);
            self.switchView.frame = CGRectMake(334, 25,75, 37);
            
        }
            break;
            
        default:
            break;
    }
}

-(void)setlineStyle:(NSInteger)lineType{

    if (lineType == 1)
    {
        self.lineView.frame = CGRectMake(50,79.5,[[UIScreen mainScreen] bounds].size.width-90, 0.5);
        self.sliderTitle.frame = CGRectMake(400, self.sliderTitle.frame.origin.y, self.sliderTitle.frame.size.width, self.sliderTitle.frame.size.height);
        self.slider.frame = CGRectMake(490, self.slider.frame.origin.y, self.frame.size.width, self.frame.size.height);
    }
    else
    {
        self.lineView.frame = CGRectMake(187,79.5,[[UIScreen mainScreen] bounds].size.width-90, 0.5);
        self.sliderTitle.frame = CGRectMake(425, self.sliderTitle.frame.origin.y, self.sliderTitle.frame.size.width, self.sliderTitle.frame.size.height);
        self.slider.frame = CGRectMake(515, self.slider.frame.origin.y, self.frame.size.width, self.frame.size.height);
    }
}

-(void)setSlide:(NSInteger)slideType{
    if (slideType == 1) {
        self.slider.hidden =YES;
        self.sliderTitle.hidden = YES;
    }
    else
    {
        self.slider.hidden =NO;
        self.sliderTitle.hidden = NO;
    }
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
