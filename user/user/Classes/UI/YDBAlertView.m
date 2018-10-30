//
//  YDBAlertView.m
//  YWD_baseFramework
//
//  Created by liruiqin on 15/8/13.
//  Copyright (c) 2015年 liruiqin. All rights reserved.
//

#import "YDBAlertView.h"
#import "SVProgressHUD.h"
#import "UIAlertController+EABFAlertController.h"

static NSString * currentAlertText;
@implementation YDBAlertView

+(void)hideKeyboard
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

+(void)showLoading
{
    [self hideKeyboard];
    [SVProgressHUD resetOffsetFromCenter];
    [SVProgressHUD setCornerRadius:4];
    [SVProgressHUD setBackgroundColor:[UIColor clearColor]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD showWithStatus:nil maskType:SVProgressHUDMaskTypeBlack];
}

+(void)dismiss
{
    [SVProgressHUD dismiss];
}

+(void)showToast:(NSString *)message
{
    if (!message.length) {
        return;
    }
    [self hideKeyboard];
    [self showToast:message dismissDelay:2];
}

+(void)showToast:(NSString *)message dismissDelay:(NSTimeInterval)delay
{
    if (!message.length) {
        return;
    }
    [self hideKeyboard];
    [SVProgressHUD setCornerRadius:4];
    [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0, 150)];
    [SVProgressHUD showImage:nil status:message maskType:SVProgressHUDMaskTypeNone];
    
    
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }];
    [[NSOperationQueue mainQueue] addOperation:op];
}

+(void)showAlert:(NSString *)message
{
    if (!message.length) {
        return;
    }
    [self showAlert:message title:nil confirmButtonTitle:@"确定" cancelButtonTitle:nil complete:nil];
}

+(void)showAlertWithConfirm:(NSString *)message complete:(CompleteBlock)block
{
    if (!message.length) {
        return;
    }
    [self showAlertWithConfirm:message title:nil complete:block];
}

+(void)showAlertWithConfirm:(NSString *)message title:(NSString *)title complete:(CompleteBlock)block
{
    if (!message.length) {
        return;
    }
    [self showAlert:message title:title confirmButtonTitle:@"确定" complete:block];
}

+(void)showAlert:(NSString *)message title:(NSString *)title confirmButtonTitle:(NSString *)confirmTitle complete:(CompleteBlock)block
{
    if (!message.length) {
        return;
    }
    [self showAlert:message title:title confirmButtonTitle:confirmTitle cancelButtonTitle:@"取消" complete:block];
}

+(void)showAlert:(NSString *)message title:(NSString *)title confirmButtonTitle:(NSString *)confirmTitle cancelButtonTitle:(NSString *)cancelTitle complete:(CompleteBlock)block
{
    if (!message.length) {
        return;
    }
    [self hideKeyboard];
    [self dismiss];
    if ([message isEqualToString:currentAlertText]) {
        //重复弹窗
        NSLog(@"重复的弹窗");
        return;
    }
    currentAlertText = message;
    [[UIAlertController alertWithTitle:title text:message leftButtonTitle:cancelTitle rightButtonTitle:confirmTitle destructiveButtonIndex:-1 handleBlock:^(NSUInteger buttonIndex) {
        currentAlertText = nil;
        if (block) {
            block(buttonIndex);
        }
    }] show];
}

@end
