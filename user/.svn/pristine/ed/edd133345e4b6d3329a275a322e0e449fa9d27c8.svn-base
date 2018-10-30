//
//  YWDPopupControl.h
//  EA_CloudStoreBuyer
//
//  Created by liruiqin on 15/10/15.
//  Copyright © 2015年 liruiqin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+POViewFrameBuilder.h"
#import "UIViewAdditions.h"

typedef void(^YWDPopupControlEventHandleBlock)();
@interface YWDPopupControl : NSObject

@property(nonatomic,weak) UIView *targetView;

///默认是一个黑色半透明的遮罩
@property(nonatomic,strong) UIView *maskView;

@property(nonatomic) BOOL clickMaskToClose;

///全局的window，可以用category替换,默认是uiapplication.keywindow
@property(nonatomic,readonly) UIWindow *keyWindow;

@property(nonatomic) CGFloat animationDuration;

@property(nonatomic,copy) void (^popupAnimationBlock)(UIView *);
@property(nonatomic,copy) void (^popupCompletionBlock)(BOOL);
@property(nonatomic,copy) void (^hiddenAnimationBlock)(void);
@property(nonatomic,copy) void (^hiddenCompletionBlock)(BOOL);

-(instancetype)initWithTargetView:(UIView *)targetView maskView:(UIView *)maskView popupAnimation:(void(^)(UIView *targetView))animationBlock popupCompletion:(void (^)(BOOL))popupCompletionBlock hiddenAnimation:(void (^)(void))hiddenAnimationBlock hiddenCompletion:(void (^)(BOOL))hiddenCompletionBlock;

-(void)popup;
-(void)hide;

///添加隐藏时候的回调
-(void)addHiddenEvenHandler:(YWDPopupControlEventHandleBlock)handleBlock;

+(instancetype)popupView:(UIView *)targetView;
+(instancetype)popupView:(UIView *)targetView animation:(void(^)(UIView *targetView))animationBlock;
+(instancetype)popupView:(UIView *)targetView onView:(UIView *)oView animation:(void(^)(UIView *targetView))animationBlock;

+(void)hide;
+(void)hiddenEvenHandler:(YWDPopupControlEventHandleBlock)handleBlock;       //隐藏时回调
+(void)hideWithDuration:(CGFloat)duration animations:(void(^)())animationBlock;
+(void)hideWithDuration:(CGFloat)duration animations:(void(^)())animationBlock completion:(void(^)(BOOL finished))completeBlock;

@end
