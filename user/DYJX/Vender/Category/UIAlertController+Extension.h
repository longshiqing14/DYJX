//
//  UIAlertController+Extension.h
//  CharoniaTritonis
//
//  Created by YP on 2017/8/27.
//  Copyright © 2017年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^textFieldConfigurationBlock)(UITextField *textField);
typedef void(^handleBlock)(NSString *text);
typedef void(^defaultActionBlock)(UIAlertAction *action);

@interface UIAlertController (Extension)

+ (UIAlertController *)alertWithTitle:(NSString *)title
                              message:(NSString *)message
                       preferredStyle:(UIAlertControllerStyle)preferredStyle
                    cancelActionTitle:(NSString *)cancelActionTitle
                   defaultActionTitle:(NSArray *)defaultActionTitles
          textFieldConfigurationBlock:(textFieldConfigurationBlock)textFieldConfigurationBlock
                          handleBlock:(handleBlock)handleBlock;

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
        preferredStyle:(UIAlertControllerStyle)preferredStyle
     cancelActionTitle:(NSString *)cancelActionTitle
    defaultActionTitle:(NSArray *)defaultActionTitles
    defaultActionBlock:(defaultActionBlock)defaultActionBlock;

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
        preferredStyle:(UIAlertControllerStyle)preferredStyle
     cancelActionTitle:(NSString *)cancelActionTitle
cancelActionTitleColor:(id)cancelActionTitleColor
    defaultActionTitle:(NSArray *)defaultActionTitles
defaultActionTitleColor:(NSArray *)defaultActionTitles
    defaultActionBlock:(defaultActionBlock)defaultActionBlock;

@end
