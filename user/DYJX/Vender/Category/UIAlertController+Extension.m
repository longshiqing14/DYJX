//
//  UIAlertController+Extension.m
//  CharoniaTritonis
//
//  Created by YP on 2017/8/27.
//  Copyright © 2017年 LY. All rights reserved.
//

#import "UIAlertController+Extension.h"

@implementation UIAlertController (Extension)

+ (UIAlertController *)alertWithTitle:(NSString *)title
                              message:(NSString *)message
                       preferredStyle:(UIAlertControllerStyle)preferredStyle
                    cancelActionTitle:(NSString *)cancelActionTitle
                   defaultActionTitle:(NSArray *)defaultActionTitles
          textFieldConfigurationBlock:(textFieldConfigurationBlock)textFieldConfigurationBlock
                          handleBlock:(handleBlock)handleBlock;
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(preferredStyle)];
    
    if (preferredStyle != UIAlertControllerStyleActionSheet) {
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textFieldConfigurationBlock(textField);
        }];
    }
    
    UIAlertAction *leftAction = [UIAlertAction actionWithTitle:cancelActionTitle style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:leftAction];

    for (NSString *action in defaultActionTitles) {
        UIAlertAction *rightAction = [UIAlertAction actionWithTitle:action style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            UITextField *login = alertController.textFields.firstObject;
            handleBlock(login.text);
        }];
        [alertController addAction:rightAction];
    }
    
    return alertController;
}

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
        preferredStyle:(UIAlertControllerStyle)preferredStyle
     cancelActionTitle:(NSString *)cancelActionTitle
    defaultActionTitle:(NSArray *)defaultActionTitles
    defaultActionBlock:(defaultActionBlock)defaultActionBlock {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(preferredStyle)];
    
    UIAlertAction *leftAction = [UIAlertAction actionWithTitle:cancelActionTitle style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:leftAction];
    
    for (NSString *action in defaultActionTitles) {
        UIAlertAction *rightAction = [UIAlertAction actionWithTitle:action style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            defaultActionBlock(action);
        }];
        [alertController addAction:rightAction];
    }
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
        preferredStyle:(UIAlertControllerStyle)preferredStyle
     cancelActionTitle:(NSString *)cancelActionTitle
cancelActionTitleColor:(UIColor *)cancelActionTitleColor
    defaultActionTitle:(NSArray *)defaultActionTitles
defaultActionTitleColor:(NSArray *)defaultActionTitleColors
    defaultActionBlock:(defaultActionBlock)defaultActionBlock {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(preferredStyle)];
    
    UIAlertAction *leftAction = [UIAlertAction actionWithTitle:cancelActionTitle style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [leftAction setValue:cancelActionTitleColor forKey:@"titleTextColor"];
    [alertController addAction:leftAction];
    
    for (NSString *action in defaultActionTitles) {
        UIAlertAction *rightAction = [UIAlertAction actionWithTitle:action style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            defaultActionBlock(action);
        }];
        NSInteger index = [defaultActionTitles indexOfObject:action];
        [rightAction setValue:defaultActionTitleColors[index] forKey:@"titleTextColor"];
        [alertController addAction:rightAction];
    }
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

@end
