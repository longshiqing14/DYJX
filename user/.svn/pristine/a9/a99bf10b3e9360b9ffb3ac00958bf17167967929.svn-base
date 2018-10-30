//
//  UIView+Tool.h
//  JLYP
//
//  Created by liu_yakai on 17/6/23.
//  Copyright © 2017年 liu_yakai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoNetworkView.h"

@interface UIView (Tool)

-(void)reat:(NSInteger)reatNumber;

-(void)sideLine:(NSInteger)sideLineNumber SideLineColor:(UIColor *)sideLineColor;

-(void)showNoDataCustomTipViewWithText:(NSString *)string imageString:(NSString *)image WithInset:(CGFloat)offset;


- (void)removeTipViewFromSelf;

- (void)hide;
//返回错误的加载页面
-(NoNetworkView *)showNoNetWorkData:(NSString *)imageName HintContent:(NSString *)hintContent;
//隐藏错误的加载页面
-(void)hideNoNetWorkData;
//弹窗View
-(void)bombBoxPOP;

//取消弹窗试图
-(void)dismissPOP;

-(void)bombBoxPOP:(NSInteger)index;

@end
