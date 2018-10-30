//
//  XYPopInputPasswordView.h
//  user
//
//  Created by xingyun on 2017/9/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYPopInputPassViewDelegate <NSObject>

/**
 *  委托方法传回点击按钮的索引和输入的文本
 *
 *  @param index 索引0表示取消1表示确认
 *  @param text  文本框的内容
 */
-(void)buttonClickedAtIndex:(NSUInteger)index withText:(NSString *)text;

@end
@interface XYPopInputPasswordView : UIView

@property(nonatomic,assign)id<XYPopInputPassViewDelegate>delegate;

/**
 *  弹出
 */
-(void)pop;

/**
 *  消失
 */
-(void)dismiss;


@end





//禁止复制粘贴的UITextField
#import "WTReTextField.h"
@interface YLPasswordTextFiled : WTReTextField

@end
/*
 弹出的供输入密码的框
 */
