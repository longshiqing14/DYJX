//
//  YWDPopupControl+YDBBiz.h
//  YWD_baseFramework
//
//  Created by liruiqin on 15/10/21.
//  Copyright © 2015年 liruiqin. All rights reserved.
//

#import "YWDPopupControl.h"

@interface YWDPopupControl (YDBBiz)

///推出自定义的view，动画效果默认是居中淡入淡出显示
+(instancetype)popupCustomView:(UIView *)customView;

///推出自定义的view，动画效果默认是居中淡入淡出显示
+(instancetype)popupViewFadeInOut:(UIView *)customView;

///推出自定义的view，动画效果默认是居中淡入淡出显示
+(instancetype)popupViewFadeInOut:(UIView *)customView yOffset:(CGFloat)yOffset xOffset:(CGFloat)xOffset;
///推出自定义的view，动画效果默认是居中淡入淡出显示
+(instancetype)popupViewFadeInOut:(UIView *)customView yOffset:(CGFloat)yOffset xOffset:(CGFloat)xOffset clickMaskClose:(BOOL)clickMaskClose;
///从下面推出自定义view
+(instancetype)popupViewFromBottom:(UIView *)customView;

///从右边推出自定义view
+(instancetype)popupViewFromRightSide:(UIView *)customView;

///从左边推出自定义view
+(instancetype)popupViewFromLeftSide:(UIView *)customView;

@end
