//
//  YDBAlertView.h
//  YWD_baseFramework
//
//  Created by liruiqin on 15/8/13.
//  Copyright (c) 2015年 liruiqin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIAlertView+UIAlertView_Block.h"

@interface YDBAlertView : NSObject

+(void)showLoading;

+(void)dismiss;

+(void)showToast:(NSString *)message;

+(void)showToast:(NSString *)message dismissDelay:(NSTimeInterval)delay;

///带确定的弹窗，没有title,没有回调，代替toast
+(void)showAlert:(NSString *)message;

///带确定的弹窗，没有title，有回调，代替toast
+(void)showAlertWithConfirm:(NSString *)message complete:(CompleteBlock)block;

///带确定的弹窗，有title，有回调
+(void)showAlertWithConfirm:(NSString *)message title:(NSString *)title complete:(CompleteBlock)block;

///可以设置取消按钮文本的弹窗
+(void)showAlert:(NSString *)message title:(NSString *)title confirmButtonTitle:(NSString *)confirmTitle complete:(CompleteBlock)block;

///可以全部自定义的弹窗
+(void)showAlert:(NSString *)message title:(NSString *)title confirmButtonTitle:(NSString *)confirmTitle cancelButtonTitle:(NSString *)cancelTitle complete:(CompleteBlock)block;

@end
