//
//  XYProgressHUD.m
//  myText
//
//  Created by xingyun on 16/7/22.
//  Copyright © 2016年 xingyun. All rights reserved.
//

#import "XYProgressHUD.h"




@implementation XYProgressHUD


/**
 菊花
 toolStyle  菊花类型
 title      显示文字
 interval   hud显示的时间
 */
+ (void)svHUDShowStyle:(XYProgressHUDStyle)toolStyle title:(NSString*)title dismissTimeInterval:(NSTimeInterval)interval
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (toolStyle == XYHUDStyleNone) {
            [SVProgressHUD showWithStatus:title];
        }else if (toolStyle == XYHUDStyleMaskNone){
            [SVProgressHUD showWithStatus:title];
            [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        }else if (toolStyle == XYHUDStyleSuccess){
            [SVProgressHUD setMinimumDismissTimeInterval:interval];
            [SVProgressHUD showSuccessWithStatus:title];
//            [SVProgressHUD setSuccessImage:[UIImage imageNamed:@""]];
        }else if (toolStyle == XYHUDStyleError){
            [SVProgressHUD setMinimumDismissTimeInterval:interval];
            [SVProgressHUD showErrorWithStatus:title];
//            [SVProgressHUD setErrorImage:[UIImage imageNamed:@""]];
        }else if (toolStyle == XYHUDStyleInfo){
            [SVProgressHUD setMinimumDismissTimeInterval:interval];
            [SVProgressHUD showInfoWithStatus:title];
//            [SVProgressHUD setInfoImage:[UIImage imageNamed:@""]];
        }
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    });
}
/** 消除 */
+(void)svHUDDismiss
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}



/** 没有取消按钮(确认后无跳转) */
+(UIAlertController *)alertMesasge:(NSString *)message  confirmHandler:(AlertAction)confirmActionHandle viewController:(UIViewController *)vc
{
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:confirmActionHandle];
    
    [alertController addAction:confirmAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
    
}

/** 没有取消按钮(确认后有跳转) */
+(UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle  confirmHandler:(AlertAction)confirmActionHandler viewController:(UIViewController *)vc
{
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:confirmActionHandler];
    
    [alertController addAction:confirmAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
    
}


/** 有取消按钮的 */
+(UIAlertController *)alertTitle:(NSString *)title mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle  confirmHandler:(AlertAction)confirmHandler cancleHandler:(AlertAction)cancleHandler viewController:(UIViewController *)vc
{
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:confirmHandler];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:cancleHandler];
    
    [alertController addAction:confirmAction];
    [alertController addAction:cancleAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
    
}

//+(void)show{
//    [SVProgressHUD setInfoImage:[UIImage imageNamed:@"testImage@2x.gif"]];
//    [SVProgressHUD show];
//}

+ (void)show{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    // 设置显示最小时间 以便观察效果
    [SVProgressHUD setMinimumDismissTimeInterval:MAXFLOAT];
    // 设置背景颜色为透明色
    UIColor *color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeBlack)];
    [SVProgressHUD setBackgroundColor:color];
    [SVProgressHUD setImageViewSize:CGSizeMake(50, 50)];
    [SVProgressHUD resetOffsetFromCenter];
    // 利用SVP提供类方法设置 通过UIImage分类方法返回的动态UIImage对象
    [SVProgressHUD showImage:[UIImage imageWithGIFNamed:@"loading"] status:nil];
}

+ (void)dismiss{
    [SVProgressHUD dismiss];
}
@end
