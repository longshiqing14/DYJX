//
//  XYStringHandle.h
//  user
//
//  Created by xingyun on 2017/9/4.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYStringHandle : NSObject


/**
 *  计算字符串长度
 *  返回 字符串的 CGRect
 */
+ (CGRect)stringWithSize:(NSString*)string font:(UIFont*)font viewWidth:(CGFloat)viewWidth;

/**
 *  计算字符串长度
 *  返回 字符串 CGSize
 */
+ (CGSize)sizeWithString:(NSString*)string font:(UIFont*)font viewWidth:(CGFloat)viewWidth;


/**
 *  删除线 富文本 字典
 *  返回 富文本字典
 */
+ (NSDictionary*)initDeleteLineMutableAttributedstringFont:(NSInteger)stringFont
                                               stringColor:(UIColor*)stringColor
                                                 lineColor:(UIColor*)lineColor;

/**
 *  下划线 富文本 字典
 *  返回  富文本字典
 */
+ (NSDictionary*)initUnderLineMutableAttributedstringFont:(NSInteger)stringFont
                                              stringColor:(UIColor*)stringColor
                                                lineColor:(UIColor*)lineColor;

/**
 *  文本上添加删除线或者下划线
 *  返回 富文本
 */
+ (NSMutableAttributedString*)addDeleteLineWithString:(NSString*)string
                                        attributeDict:(NSDictionary*)attributeDict;


/**
 *  文本上添加其他大小颜色的字体
 *  string          全部的文本
 *  stringFont      要修改的文本字体大小
 *  stringColor     要修改的文本字体颜色
 *  stringLength    要修改的文本长度
 *  stringLocation  要修改的文本起始位置
 *  return          返回 富文本
 */
+ (NSMutableAttributedString*)addColorWithFontString:(NSString*)string
                                          StringFont:(NSInteger)stringFont
                                         stringColor:(UIColor*)stringColor
                                      stringLocation:(NSInteger)stringLocation
                                        stringLength:(NSInteger)stringLength;




@end
