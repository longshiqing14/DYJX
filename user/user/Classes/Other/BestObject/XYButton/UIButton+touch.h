//
//  UIButton+touch.h
//  RMRuntime
//
//  Created by Raymon on 16/6/8.
//  Copyright © 2016年 Raymon. All rights reserved.
//

#import <UIKit/UIKit.h>
#define defaultInterval 1.0// 默认间隔时间
@interface UIButton (touch)
/**
 *  设置点击时间间隔
 */
@property (nonatomic, assign) NSTimeInterval timeInterVal;
//消息个数
//消息为@“”的时候不显示为@“ ”只显示背景不显示数字
@property(nonatomic,strong)NSString *badgeValue;
//显示数字和背景
@property(nonatomic,strong)UILabel *badgeLable;
//背景颜色
@property(nonatomic,strong)UIColor *badgeBackgroundColor;
//显示字体颜色 默认红色
@property(nonatomic,strong)UIColor *fontColor;
//显示字体大小 默认13
@property(nonatomic,strong)UIFont *fontSize;

@end
