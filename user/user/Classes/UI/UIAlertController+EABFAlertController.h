//
//  UIAlertController+EABFAlertController.h
//  TYAlertControllerDemo
//
//  Created by Chapter Zhang on 16/9/9.
//  Copyright © 2016年 tanyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (EABFAlertController)

@property (assign, nonatomic) BOOL clickMaskToClose;

/// 1个按钮
+(instancetype)alertWithTitle:(NSString *)title
                 text:(NSString *)text
          buttonTitle:(NSString *)buttonTitle
          destructive:(BOOL)isDestructive
          handleBlock:(void(^)(void))handleBlock;

/// 2个按钮
+(instancetype)alertWithTitle:(NSString *)title
                 text:(NSString *)text
              leftButtonTitle:(NSString *)leftButtonTitle
             rightButtonTitle:(NSString *)rightButtonTitle
destructiveButtonIndex:(NSUInteger)destructiveButtonIndex
          handleBlock:(void(^)(NSUInteger buttonIndex))handleBlock;

/// 多个按钮
+(instancetype)alertWithTitle:(NSString *)title
                 text:(NSString *)text
         buttonTitles:(NSArray<NSString *> *)buttonTitles
destructiveButtonIndex:(NSUInteger)destructiveButtonIndex
          handleBlock:(void(^)(NSUInteger buttonIndex))handleBlock;

/// 1个按钮＋1个输入框
+(instancetype)alertWithTitle:(NSString *)title
                 text:(NSString *)text
          buttonTitle:(NSString *)buttonTitle
                  destructive:(BOOL)isDestructive
textFieldConfigurationBlock:(void(^)(UITextField *textField))textFieldConfigurationBlock
          handleBlock:(void(^)(NSString *text))handleBlock;

/// 2个按钮＋1个输入框
+(instancetype)alertWithTitle:(NSString *)title
                 text:(NSString *)text
              leftButtonTitle:(NSString *)leftButtonTitle
             rightButtonTitle:(NSString *)rightButtonTitle
destructiveButtonIndex:(NSUInteger)destructiveButtonIndex
textFieldConfigurationBlock:(void(^)(UITextField *textField))textFieldConfigurationBlock
          handleBlock:(void(^)(NSUInteger buttonIndex,NSString *text))handleBlock;

/// 多个按钮＋多个输入框
+(instancetype)alertWithTitle:(NSString *)title
                 text:(NSString *)text
      numberOfTextField:(NSUInteger)numberOfTextField
         buttonTitles:(NSArray<NSString *> *)buttonTitles
       destructiveButtonIndex:(NSUInteger)destructiveButtonIndex
textFieldConfigurationBlock:(void(^)(NSUInteger textFieldIndex,UITextField *textField))textFieldConfigurationBlock
          handleBlock:(void(^)(NSUInteger buttonIndex,NSArray<UITextField *> *textField))handleBlock;


-(void)show;

@end
