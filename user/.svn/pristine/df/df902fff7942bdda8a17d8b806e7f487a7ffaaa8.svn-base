//
//  YWDPopupControl+YDBBiz.m
//  YWD_baseFramework
//
//  Created by liruiqin on 15/10/21.
//  Copyright © 2015年 liruiqin. All rights reserved.
//

#import "YWDPopupControl+YDBBiz.h"

@implementation YWDPopupControl (YDBBiz)

+(UIView *)createMaskView
{
    UIView *maskView = [[UIView alloc] initWithFrame:CGRectZero];
    maskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
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

+(instancetype)popupViewFadeInOut:(UIView *)customView yOffset:(CGFloat)yOffset xOffset:(CGFloat)xOffset clickMaskClose:(BOOL)clickMaskClose
{
    YWDPopupControl *pControl = [[YWDPopupControl alloc] initWithTargetView:customView maskView:[self createMaskView] popupAnimation:^(UIView *targetView) {
        [[targetView.po_frameBuilder centerInSuperview] moveWithOffsetX:xOffset offsetY:yOffset];
        targetView.alpha = 0;
        [UIView animateWithDuration:0.3 animations:^{
            targetView.alpha = 1;
        }];
        
    } popupCompletion:nil hiddenAnimation:^{
        customView.alpha = 0;
    } hiddenCompletion:nil];
    pControl.clickMaskToClose = clickMaskClose;
    pControl.animationDuration = 0.3;
    [pControl popup];
    return pControl;
}
+(instancetype)popupViewFadeInOut:(UIView *)customView yOffset:(CGFloat)yOffset xOffset:(CGFloat)xOffset
{
    YWDPopupControl *pControl = [YWDPopupControl popupViewFadeInOut:customView yOffset:yOffset xOffset:xOffset clickMaskClose:YES];
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
