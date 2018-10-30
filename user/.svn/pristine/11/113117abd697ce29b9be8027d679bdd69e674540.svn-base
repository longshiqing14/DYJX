//
//  YWDPopupControl+YWDBuyer.m
//  EA_CloudStoreBuyer
//
//  Created by liruiqin on 15/10/21.
//  Copyright © 2015年 liruiqin. All rights reserved.
//

#import "YWDPopupControl+YWDBuyer.h"
#import "YWDPopupControl.h"
#import "FXBlurView.h"

@implementation YWDPopupControl (YWDBuyer)

+(UIView *)createMaskView
{
    UIView *mView = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    mView.backgroundColor = COLOR(0, 0, 0, 0.5);
    //蒙层透明
    mView.alpha = 0;
    FXBlurView *maskView = [[FXBlurView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    maskView.blurRadius = 5;
    maskView.dynamic = NO;
    maskView.iterations = 1;;
    maskView.tintColor = [UIColor blackColor];
    [maskView insertSubview:mView atIndex:0];
    return maskView;
}

+(instancetype)popupFilterView:(UIView *)filterView
{
    YWDPopupControl *pControl = [[YWDPopupControl alloc] initWithTargetView:filterView maskView:[self createMaskView] popupAnimation:^(UIView *targetView) {
        [targetView.po_frameBuilder alignRightInSuperviewWithInset:-targetView.width];
        [UIView animateWithDuration:0.3 animations:^{
            [targetView.po_frameBuilder alignRightInSuperviewWithInset:0];
        }];
    } popupCompletion:nil hiddenAnimation:^{
        [filterView.po_frameBuilder alignRightInSuperviewWithInset:-filterView.width];
    } hiddenCompletion:nil];
    pControl.animationDuration = 0.3;
    [pControl popup];
    return pControl;
}

+(instancetype)popupCustomView:(UIView *)customView
{
    return [self popupViewFadeInOut:customView];
}

+(instancetype)popupViewFadeInOut:(UIView *)customView
{
    return [self popupViewFadeInOut:customView yOffset:0 xOffset:0];
}

+(instancetype)popupViewFadeInOut:(UIView *)customView yOffset:(CGFloat)yOffset xOffset:(CGFloat)xOffset
{
    YWDPopupControl *pControl = [[YWDPopupControl alloc] initWithTargetView:customView maskView:[self createMaskView] popupAnimation:^(UIView *targetView) {
        [[targetView.po_frameBuilder centerInSuperview] moveWithOffsetX:xOffset offsetY:yOffset];
        targetView.alpha = 0;
        [UIView animateWithDuration:0.3 animations:^{
            targetView.alpha = 1;
        }];
        
    } popupCompletion:nil hiddenAnimation:^{
        customView.alpha = 0;
        pControl.maskView.alpha = 0;
    } hiddenCompletion:nil];
    pControl.animationDuration = 0.3;
    [pControl popup];
    return pControl;
}

+(instancetype)popupView:(UIView *)customView offsetTop:(float)height
{
    YWDPopupControl *pControl = [[YWDPopupControl alloc] initWithTargetView:customView maskView:[self createMaskView] popupAnimation:^(UIView *targetView) {
        [targetView.po_frameBuilder alignToTopInSuperviewWithInset:height];
        [UIView animateWithDuration:0.3 animations:^{
            [targetView.po_frameBuilder alignToTopInSuperviewWithInset:height];
        }];
    } popupCompletion:nil hiddenAnimation:^{
        [customView.po_frameBuilder alignToTopInSuperviewWithInset:height];
    } hiddenCompletion:nil];
    pControl.animationDuration = 0.3;
    [pControl popup];
    return pControl;
}

+(instancetype)popupView:(UIView *)customView offsetTop:(float)height backGroudcolor:(UIColor*)backGroudcolor{
    
    UIView *maskView = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    if (backGroudcolor) {
        [maskView setBackgroundColor:backGroudcolor];
    }
    
    YWDPopupControl *pControl = [[YWDPopupControl alloc] initWithTargetView:customView maskView:maskView popupAnimation:^(UIView *targetView) {
        [targetView.po_frameBuilder alignToTopInSuperviewWithInset:height];
        [UIView animateWithDuration:0.3 animations:^{
            [targetView.po_frameBuilder alignToTopInSuperviewWithInset:height];
        }];
    } popupCompletion:nil hiddenAnimation:^{
        [customView.po_frameBuilder alignToTopInSuperviewWithInset:height];
    } hiddenCompletion:nil];
    pControl.animationDuration = 0.3;
    [pControl popup];
    return pControl;
    
}

+(instancetype)popupViewInCenter:(UIView *)customView
{
    YWDPopupControl *pControl = [[YWDPopupControl alloc] initWithTargetView:customView maskView:[self createMaskView] popupAnimation:^(UIView *targetView) {
            [targetView.po_frameBuilder centerInSuperview];
        [UIView animateWithDuration:0.3 animations:^{
            [targetView.po_frameBuilder centerInSuperview];
        }];
    } popupCompletion:nil hiddenAnimation:^{
        [customView.po_frameBuilder centerInSuperview];
    } hiddenCompletion:nil];
    pControl.animationDuration = 0.3;
    [pControl popup];
    return pControl;
}

+(instancetype)popupViewFromBottom:(UIView *)customView
{
    YWDPopupControl *pControl = [[YWDPopupControl alloc] initWithTargetView:customView maskView:[self createMaskView] popupAnimation:^(UIView *targetView) {
        [targetView.po_frameBuilder alignToBottomInSuperviewWithInset:-targetView.height];
        [UIView animateWithDuration:0.3 animations:^{
            [targetView.po_frameBuilder alignToBottomInSuperviewWithInset:0];
        }];
    } popupCompletion:nil hiddenAnimation:^{
        [customView.po_frameBuilder alignToBottomInSuperviewWithInset:-customView.height];
    } hiddenCompletion:nil];
    pControl.animationDuration = 0.3;
    [pControl popup];
    return pControl;
}
+(instancetype)popupViewFromUp:(UIView *)customView
{
    YWDPopupControl *pControl = [[YWDPopupControl alloc] initWithTargetView:customView maskView:[self createMaskView] popupAnimation:^(UIView *targetView) {
        [targetView.po_frameBuilder alignToTopInSuperviewWithInset:-targetView.height];
        [UIView animateWithDuration:0.3 animations:^{
            [targetView.po_frameBuilder alignToTopInSuperviewWithInset:0];
        }];
    } popupCompletion:nil hiddenAnimation:^{
        [customView.po_frameBuilder alignToTopInSuperviewWithInset:-customView.height];
    } hiddenCompletion:nil];
    pControl.animationDuration = 0.3;
    [pControl popup];
    return pControl;
}

+(instancetype)popupViewFromRightSide:(UIView *)customView
{
    YWDPopupControl *pControl = [[YWDPopupControl alloc] initWithTargetView:customView maskView:[self createMaskView] popupAnimation:^(UIView *targetView) {
        [targetView.po_frameBuilder alignRightInSuperviewWithInset:-targetView.width];
        [UIView animateWithDuration:0.3 animations:^{
            [targetView.po_frameBuilder alignRightInSuperviewWithInset:0];
        }];
    } popupCompletion:nil hiddenAnimation:^{
        [customView.po_frameBuilder alignRightInSuperviewWithInset:-customView.width];
    } hiddenCompletion:nil];
    pControl.animationDuration = 0.3;
    [pControl popup];
    return pControl;
}

+(instancetype)popupViewFromLeftSide:(UIView *)customView
{
    YWDPopupControl *pControl = [[YWDPopupControl alloc] initWithTargetView:customView maskView:[self createMaskView] popupAnimation:^(UIView *targetView) {
        [targetView.po_frameBuilder alignLeftInSuperviewWithInset:-targetView.width];
        [UIView animateWithDuration:0.3 animations:^{
            [targetView.po_frameBuilder alignLeftInSuperviewWithInset:0];
        }];
    } popupCompletion:nil hiddenAnimation:^{
        [customView.po_frameBuilder alignLeftInSuperviewWithInset:-customView.width];
    } hiddenCompletion:nil];
    pControl.animationDuration = 0.3;
    [pControl popup];
    return pControl;
}

@end
