//
//  UIAlertController+XYAlertController.h
//  user
//
//  Created by 岩  熊 on 2018/1/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (XYAlertController)

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

/// 2个按钮＋1个输入框 + textFieldPlaceHolder
+(instancetype)alertWithTitle:(NSString *)title
                         text:(NSString *)text
              leftButtonTitle:(NSString *)leftButtonTitle
             rightButtonTitle:(NSString *)rightButtonTitle
         textFieldPlaceHolder:(NSString *)textFieldPlaceHolder
       destructiveButtonIndex:(NSUInteger)destructiveButtonIndex
  textFieldConfigurationBlock:(void (^)(UITextField *))textFieldConfigurationBlock
                  handleBlock:(void (^)(NSUInteger, NSString *))handleBlock;

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
