//
//  XYProgressHUD.h
//  myText
//
//  Created by xingyun on 16/7/22.
//  Copyright © 2016年 xingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

//#import "SVProgressHUD.h"


typedef void(^AlertAction)(UIAlertAction *action);


typedef NS_ENUM(NSInteger, XYProgressHUDStyle) {
    
    XYHUDStyleNone,             //  只显示菊花  需要dismiss 处理
    XYHUDStyleMaskNone,         //  有底色的HUD  需要dismiss 处理
    XYHUDStyleSuccess,          //  成功  不需要dismiss 处理
    XYHUDStyleError,            //  失败  不需要dismiss 处理
    XYHUDStyleInfo              //  提示  不需要dismiss 处理
    
};

@interface XYProgressHUD : NSObject

/**
 sv 菊花
 toolStyle   菊花类型
 titl        HUD  上的文字
 interval    HUD  显示的时间 在 XYHUDStyleNone 状态下无效
  */
+ (void)svHUDShowStyle:(XYProgressHUDStyle)toolStyle title:(NSString*)title dismissTimeInterval:(NSTimeInterval)interval;

/**
 sv  手动 消掉 菊花
 */
+(void)svHUDDismiss;




/** 没有取消按钮(确认后无跳转) */
+(UIAlertController *)alertMesasge:(NSString *)message  confirmHandler:(AlertAction)confirmActionHandle viewController:(UIViewController *)vc;

/** 没有取消按钮(确认后有跳转) */
+(UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle  confirmHandler:(AlertAction)confirmActionHandler viewController:(UIViewController *)vc;

/** 有取消按钮的 */
+(UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle  confirmHandler:(AlertAction)confirmHandler cancleHandler:(AlertAction)cancleHandler viewController:(UIViewController *)vc;

+ (void)show;
@end
