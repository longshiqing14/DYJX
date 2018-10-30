//
//  JXQueryConditionItemView.h
//  user
//
//  Created by 岩  熊 on 2017/11/13.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXQueryConditionItem.h"
/**
 *  回调事件
 *
 *  @param selectedItemIdex 选中item索引
 *  @param arrowType        选中item arrow方向
 */
typedef void (^ EABAItemActionBlock)(NSInteger selectedItemIdex,EABAItemArrowType arrowType);

@interface JXQueryConditionItemView : UIView
/**
 *  title颜色
 */
@property (nonatomic,strong)UIColor *textColor;
/**
 *  title的font
 */
@property (nonatomic,strong)UIFont *textFont;

/**
 *  选中title颜色
 */
@property (nonatomic,strong)UIColor *selectedTextColor;
/**
 *  当前选中item索引
 */
@property (nonatomic) NSInteger selectedItemIndex;
-(instancetype)initWithFrame:(CGRect)frame textColor:(UIColor *)textColor font:(UIFont *)font selectedTextColor:(UIColor *)selectedTextColor block:(EABAItemActionBlock)block;
/**
 *  插入一个item
 *
 *  @param title     文字
 *  @param showArrow 是否显示arrow
 */
- (void)insertItemWithTitle:(NSString *)title showArrow:(BOOL )showArrow;
/**
 *  替换某个索引下的itemt title
 *
 */
- (void)replaceItemWithTitle:(NSString *)title indexPath:(NSInteger)indexPath;
/**
 *  重置某个索引下的itemt title
 *
 */
-(void)resetItemWithTitle:(NSString *)title indexPath:(NSInteger)indexPath showArrow:(BOOL)showArrow;
@end
