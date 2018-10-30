//
//  YWDPickViewControl.h
//  EA_CloudStoreBuyer
//
//  Created by liruiqin on 15/10/16.
//  Copyright © 2015年 liruiqin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YWDListItem.h"
#import "ActionDefine.h"
#import <UIKit/UIKit.h>
#import "UIView+POViewFrameBuilder.h"
#import "UIViewAdditions.h"

YWDActionDefine(PickViewDidSelectItem);
YWDActionDefine(PickViewDidCancel);
///为定义的值,碰到应该忽略
static NSUInteger const kUndefineValue = -111111111;
static NSUInteger const kAllValue = 0;
typedef void(^YWDPickViewActionHandler)(YWDListViewActionName action, YWDListItem *item);

///配合 YWDPopupControl 使用有奇效,先获取pickview,然后popup pickViewContainer
@interface YWDPickViewControl<ItemType : YWDListItem *> : NSObject<UIPickerViewDataSource,UIPickerViewDelegate>
@property(nonatomic,readonly) NSArray<ItemType> *data;
@property(nonatomic,copy) YWDPickViewActionHandler actionHandler;
@property(nonatomic, strong) UIView *pickViewContainer;

///不建议用，因为买家卖家样式不统一，用ywdpopupcontrol进行show！-------
+(YWDPickViewControl *)showSexPickView:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler;

+(YWDPickViewControl *)showAddressPickView:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler;
+(YWDPickViewControl *)showAddressLevel2PickView:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler;

+(YWDPickViewControl *)showPickViewWithData:(NSArray<ItemType> *)data title:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler;

+(YWDPickViewControl *)showPickViewWithTexts:(NSArray<NSString *> *)texts title:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler;
/// --------

///选择省市区,包含全部
+(instancetype)addressLevel3HaveAllPickView:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler;
///选择省市区
+(instancetype)addressLevel3PickView:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler;
///选择省市,包含全部
+(instancetype)addressLevel2PickHaveAllView:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler;
///选择省市
+(instancetype)addressLevel2PickView:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler;
///选择省
+(instancetype)addressLevel1PickView:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler;
///性别选择
+(instancetype)sexLevel1PickView:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler;

///data里边是 YWDListItem 类型的数据，YWDListItem 是有层级关系的，建议先看看类定义
-(instancetype)initWithTitle:(NSString *)title data:(NSArray<ItemType> *)data withActionHandler:(YWDPickViewActionHandler)actionHandler;
-(instancetype)initWithTitle:(NSString *)title Texts:(NSArray<NSString *> *)texts withActionHandler:(YWDPickViewActionHandler)actionHandler;

-(void)showPickViewWithData:(NSArray<ItemType> *)data title:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler;

///不建议用
-(void)show;
-(void)hide;

-(ItemType)selectedItem;

@end
