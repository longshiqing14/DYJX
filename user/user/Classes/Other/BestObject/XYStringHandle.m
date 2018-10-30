//
//  XYStringHandle.m
//  user
//
//  Created by xingyun on 2017/9/4.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYStringHandle.h"

@implementation XYStringHandle

/** 计算字符串长度 */
+ (CGRect)stringWithSize:(NSString*)string font:(UIFont*)font viewWidth:(CGFloat)viewWidth
{
    if ([string length] > 0) {
        
        CGRect textRect = [string
                           boundingRectWithSize:CGSizeMake(viewWidth, MAXFLOAT)
                           options:(NSStringDrawingTruncatesLastVisibleLine |
                                    NSStringDrawingUsesLineFragmentOrigin |
                                    NSStringDrawingUsesFontLeading)
                           attributes:@{
                                        NSFontAttributeName : font
                                        }
                           context:nil];
        textRect.size.height = ceilf(textRect.size.height);
        textRect.size.width = ceilf(textRect.size.width);
        return CGRectMake(0, 0, textRect.size.width, textRect.size.height);
    } else {
        return CGRectZero;
    }
    
}

/** 计算字符串长度 */
+ (CGSize)sizeWithString:(NSString*)string font:(UIFont*)font viewWidth:(CGFloat)viewWidth
{
    if ([string length] > 0) {
        
        CGRect textRect = [string
                           boundingRectWithSize:CGSizeMake(viewWidth, MAXFLOAT)
                           options:(NSStringDrawingTruncatesLastVisibleLine |
                                    NSStringDrawingUsesLineFragmentOrigin |
                                    NSStringDrawingUsesFontLeading)
                           attributes:@{
                                        NSFontAttributeName : font
                                        }
                           context:nil];
        textRect.size.height = ceilf(textRect.size.height);
        textRect.size.width = ceilf(textRect.size.width);
        return CGSizeMake(textRect.size.width, textRect.size.height);
    } else {
        return CGSizeZero;
    }
}


/** 删除线 富文本 字典 */
+ (NSDictionary*)initDeleteLineMutableAttributedstringFont:(NSInteger)stringFont
                                               stringColor:(UIColor*)stringColor
                                                 lineColor:(UIColor*)lineColor
{
    NSDictionary * attributeDict = @{NSFontAttributeName:[UIFont systemFontOfSize:stringFont],
                                     NSForegroundColorAttributeName:stringColor,
                                     NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle|NSUnderlinePatternSolid),
                                     NSStrikethroughColorAttributeName:lineColor};
    
    return attributeDict;
}

/** 下划线 富文本 字典 */
+ (NSDictionary*)initUnderLineMutableAttributedstringFont:(NSInteger)stringFont
                                              stringColor:(UIColor*)stringColor
                                                lineColor:(UIColor*)lineColor
{
    NSDictionary * attributeDict = @{NSFontAttributeName:[UIFont systemFontOfSize:stringFont],
                                     NSForegroundColorAttributeName:stringColor,
                                     NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle|NSUnderlinePatternSolid),
                                     NSUnderlineColorAttributeName:lineColor};
    
    return attributeDict;
}





/**
 *  文本上 添加删除线 或者 下划线
 */
+ (NSMutableAttributedString*)addDeleteLineWithString:(NSString*)string attributeDict:(NSDictionary*)attributeDict
{
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:string
                                                                               attributes:attributeDict];
    return attrStr;
}


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
                                        stringLength:(NSInteger)stringLength
{
    NSMutableAttributedString *attrString =
    [[NSMutableAttributedString alloc] initWithString:string];
    
    [attrString addAttribute:NSForegroundColorAttributeName
                       value:stringColor
                       range:NSMakeRange(stringLocation, stringLength)];
    
    [attrString addAttribute:NSFontAttributeName
                       value:[UIFont systemFontOfSize:stringFont]
                       range:NSMakeRange(stringLocation, stringLength)];
    
    return attrString;
}


@end
