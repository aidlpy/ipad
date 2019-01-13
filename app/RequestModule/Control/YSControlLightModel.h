//
//  YSControlAllModel.h
//  ipad
//
//  Created by wangshiwen on 2018/12/25.
//  Copyright © 2018 nil. All rights reserved.
//

#import "YSControlBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YSControlLightModel : YSControlBaseModel

@property (nonatomic, assign) NSInteger all; //全厅控制
@property (nonatomic, assign) NSInteger center; //全厅设备
@property (nonatomic, assign) NSInteger image;
@property (nonatomic, assign) NSInteger topic1;
@property (nonatomic, assign) NSInteger topic2;
@property (nonatomic, assign) NSInteger topic3;
@property (nonatomic, assign) NSInteger topic4;
@property (nonatomic, assign) NSInteger topic5;
@property (nonatomic, assign) NSInteger topic6;
@property (nonatomic, assign) NSInteger tableGame;
@property (nonatomic, assign) NSInteger parkour;
@property (nonatomic, assign) NSInteger VR;
@property (nonatomic, assign) NSInteger psychology;

@end

NS_ASSUME_NONNULL_END
