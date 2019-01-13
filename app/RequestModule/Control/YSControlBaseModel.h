//
//  YSControlBaseModel.h
//  ipad
//
//  Created by wangshiwen on 2018/11/17.
//  Copyright © 2018 nil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSControlBaseModel : NSObject

@property (nonatomic, assign) NSInteger index;  //0对应全厅  剩下的以此类推
@property (nonatomic, copy) void(^(refreshBlock))(void);  //接口返回刷新界面

- (void)getControlInfoFromNetWork;

/**
 刷新开关

 @param row cell所处的rowIndex
 @param isSwitch 开关
 */
- (void)refreshSwitchWithRow:(NSInteger)row switch:(NSInteger)isSwitch;

/**
 关系滚条大小

 @param row cell所处的rowIndex
 @param value 滚条大小
 */
- (void)refreshSliderWithRow:(NSInteger)row value:(float)value;

- (BOOL)switchValueWithRow:(NSInteger)row;

- (float)sliderValueWithRow:(NSInteger)row;

#pragma mark - 子类可重写

- (NSString *)switch_propertyKeyWithRow:(NSInteger)row;

- (NSString *)slider_propertyKeyWithRow:(NSInteger)row;

- (NSDictionary *)jsonDict;

@end

NS_ASSUME_NONNULL_END
