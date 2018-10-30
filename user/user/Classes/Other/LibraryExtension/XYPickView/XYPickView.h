//
//  XYPickView.h
//  tgy
//
//  Created by xingyun on 2017/1/8.
//  Copyright © 2017年 xingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXAddressModel.h"
@class XYPickView;

@protocol XYPickViewDelegate <NSObject>

@optional

//-(void)toobarDonBtnHaveClick:(XYPickView *)pickView resultString:(NSString *)resultString;

-(void)closePickView;

-(void)toobarDonBtnHaveClick:(XYPickView *)pickView resultString:(NSString *)resultString resultIDString:(NSString *)resultIDString isHaveStreetArea:(BOOL )isHaveStreetArea;

@end

@interface XYPickView : UIView

@property(nonatomic,weak) id<XYPickViewDelegate> delegate;
/**
 *  通过plistName添加一个pickView
 *
 *  @return 带有toolbar的pickview
 */
//-(instancetype)initHHPickviewWithPlistName:(NSString *)plistName;

+(instancetype)sharedInstance;

-(instancetype)initPickviewWithArray:(NSMutableArray *)array key:(NSString*)key idkey:(NSString*)idkey andSelectString:(NSString*)string;

-(instancetype)initPickviewWithArray:(NSMutableArray *)array key:(NSString*)key idkey:(NSString*)idkey;
-(instancetype)initPickviewWithArray:(NSMutableArray *)array key:(NSString*)key idkey:(NSString*)idkey regionIndex:(NSInteger)regionIndex disstrictIndex:(NSInteger)disstrictIndex;
/**
 *   移除本控件
 */
-(void)remove;
/**
 *  显示本控件
 */
-(void)show;


@end
