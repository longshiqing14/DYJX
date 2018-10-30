//
//  UIAlertController+EABFAlertController.m
//  TYAlertControllerDemo
//
//  Created by Chapter Zhang on 16/9/9.
//  Copyright © 2016年 tanyang. All rights reserved.
//

#import "UIAlertController+EABFAlertController.h"
#import <YYModel/YYModel.h>

@implementation UIAlertController (EABFAlertController)

- (BOOL)clickMaskToClose
{
    NSNumber *number = objc_getAssociatedObject(self, @selector(clickMaskToClose));
    return [number boolValue];
}

- (void)setClickMaskToClose:(BOOL)clickMaskToClose
{
    NSNumber *number = [NSNumber numberWithBool:clickMaskToClose];
    objc_setAssociatedObject(self, @selector(clickMaskToClose), number, OBJC_ASSOCIATION_ASSIGN);
}

+(instancetype)alertWithTitle:(NSString *)title
                 text:(NSString *)text
buttonTitles:(NSArray<NSString *> *)buttonTitles
       destructiveButtonIndex:(NSUInteger)destructiveButtonIndex
                  handleBlock:(void (^)(NSUInteger))handleBlock
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:text preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *buttonAction = nil;
    NSUInteger index = 0;
    for (NSString *buttonTitle in buttonTitles) {
        buttonAction = [UIAlertAction actionWithTitle:buttonTitle style:((index != destructiveButtonIndex) ? UIAlertActionStyleDefault : UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
            [self removeTapGestureRecognizer];
            if (handleBlock) {
                handleBlock(index);
            }
        }];
        [alert addAction:buttonAction];
        buttonAction = nil;
        index++;
    }
    return alert;
}

+(instancetype)alertWithTitle:(NSString *)title
                         text:(NSString *)text
                  buttonTitle:(NSString *)buttonTitle
                  destructive:(BOOL)isDestructive
                  handleBlock:(void (^)(void))handleBlock
{
    return [self alertWithTitle:title text:text buttonTitles:buttonTitle ? @[buttonTitle] : nil destructiveButtonIndex:isDestructive ? 0 : -1 handleBlock:^(NSUInteger buttonIndex) {
        [self removeTapGestureRecognizer];
        if (handleBlock) {
            handleBlock();
        }
    }];
}

+(instancetype)alertWithTitle:(NSString *)title
                         text:(NSString *)text
              leftButtonTitle:(NSString *)leftButtonTitle
             rightButtonTitle:(NSString *)rightButtonTitle
       destructiveButtonIndex:(NSUInteger)destructiveButtonIndex
                  handleBlock:(void (^)(NSUInteger))handleBlock
{
    NSMutableArray *buttonTitles = [NSMutableArray array];
    if (leftButtonTitle) {
        [buttonTitles addObject:leftButtonTitle];
    }
    if (rightButtonTitle) {
        [buttonTitles addObject:rightButtonTitle];
    }
    return [self alertWithTitle:title text:text
                   buttonTitles:buttonTitles
         destructiveButtonIndex:destructiveButtonIndex handleBlock:^(NSUInteger buttonIndex) {
             [self removeTapGestureRecognizer];
             if (handleBlock) {
                 handleBlock(buttonIndex);
             }
         }];
}

+(instancetype)alertWithTitle:(NSString *)title
                         text:(NSString *)text
                  buttonTitle:(NSString *)buttonTitle
                  destructive:(BOOL)isDestructive
  textFieldConfigurationBlock:(void (^)(UITextField *))textFieldConfigurationBlock
                  handleBlock:(void (^)(NSString *))handleBlock
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:text preferredStyle:UIAlertControllerStyleAlert];
    __weak typeof(alert) weakAlert = alert;
    [alert addTextFieldWithConfigurationHandler:textFieldConfigurationBlock];
    UIAlertAction *buttonAction = [UIAlertAction actionWithTitle:buttonTitle style:isDestructive ? UIAlertActionStyleDestructive : UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self removeTapGestureRecognizer];
        if (handleBlock) {
            handleBlock(weakAlert.textFields.firstObject.text);
        }
    }];
    [alert addAction:buttonAction];
    return alert;
}

+(instancetype)alertWithTitle:(NSString *)title
                         text:(NSString *)text
              leftButtonTitle:(NSString *)leftButtonTitle
             rightButtonTitle:(NSString *)rightButtonTitle
       destructiveButtonIndex:(NSUInteger)destructiveButtonIndex
  textFieldConfigurationBlock:(void (^)(UITextField *))textFieldConfigurationBlock
                  handleBlock:(void (^)(NSUInteger, NSString *))handleBlock
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:text preferredStyle:UIAlertControllerStyleAlert];
    __weak typeof(alert) weakAlert = alert;
    [alert addTextFieldWithConfigurationHandler:textFieldConfigurationBlock];
    NSArray<NSString *> *buttonTitles = @[leftButtonTitle ? : @"",rightButtonTitle ? : @""];
    UIAlertAction *buttonAction = nil;
    NSUInteger index = 0;
    for (NSString *buttonTitle in buttonTitles) {
        buttonAction = [UIAlertAction actionWithTitle:buttonTitle style:((index != destructiveButtonIndex) ? UIAlertActionStyleDefault : UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
            [self removeTapGestureRecognizer];
            if (handleBlock) {
                handleBlock(index,weakAlert.textFields.firstObject.text);
            }
        }];
        [alert addAction:buttonAction];
        buttonAction = nil;
        index++;
    }
    return alert;
}

+(instancetype)alertWithTitle:(NSString *)title
                         text:(NSString *)text
            numberOfTextField:(NSUInteger)numberOfTextField
                 buttonTitles:(NSArray<NSString *> *)buttonTitles
       destructiveButtonIndex:(NSUInteger)destructiveButtonIndex
  textFieldConfigurationBlock:(void (^)(NSUInteger, UITextField *))textFieldConfigurationBlock
                  handleBlock:(void (^)(NSUInteger, NSArray<UITextField *> *))handleBlock
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:text preferredStyle:UIAlertControllerStyleAlert];
    for (int count = 0; count < numberOfTextField; count++) {
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            [self removeTapGestureRecognizer];
            if (textFieldConfigurationBlock) {
                textFieldConfigurationBlock(count,textField);
            }
        }];
    }
    UIAlertAction *buttonAction = nil;
    NSUInteger index = 0;
    for (NSString *buttonTitle in buttonTitles) {
        buttonAction = [UIAlertAction actionWithTitle:buttonTitle
            style:((index != destructiveButtonIndex) ? UIAlertActionStyleDefault : UIAlertActionStyleDestructive)
                                              handler:^(UIAlertAction * _Nonnull action) {
            [self removeTapGestureRecognizer];
            if (handleBlock) {
                handleBlock(index,alert.textFields);
            }
        }];
        [alert addAction:buttonAction];
        buttonAction = nil;
        index++;
    }

    return alert;
}

-(UIViewController *)targetViewController
{
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([vc isKindOfClass:[UITabBarController class]]) {
        vc = [(UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController selectedViewController];
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = [(UINavigationController *)vc visibleViewController];
        }
    }
    return vc;
}

-(void)show
{
    if (self.clickMaskToClose) {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
        tap.delegate = self;
        [keyWindow addGestureRecognizer:tap];
    }
    if (self.actions.count == 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self hide];
        });
    }
    [[self targetViewController] presentViewController:self animated:YES completion:nil];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    //    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    CGPoint point = [touch locationInView:self.view];
    
    BOOL isIn = CGRectContainsPoint(self.view.bounds, point);
    if (isIn) {
        return NO;
    }
    return YES;
}



-(void)hide
{
    [self.class removeTapGestureRecognizer];
    
    [[self targetViewController] dismissViewControllerAnimated:YES completion:nil];
}

+ (void)removeTapGestureRecognizer {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIGestureRecognizer *gest = keyWindow.gestureRecognizers.lastObject;
    if ([gest isKindOfClass:[UITapGestureRecognizer class]]) {
        [keyWindow removeGestureRecognizer:gest];
    }
}

@end
