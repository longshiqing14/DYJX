//
//  XYCaculateTool.m
//  user
//
//  Created by xingyun on 2017/10/12.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYCaculateTool.h"

@implementation XYCaculateTool
+ (CGRect)stringWithSize:(NSString*)string fontOfSize:(CGFloat)font viewWidth:(CGFloat)viewWidth
{
    if ([string length] > 0) {
        //        float maxWidth =
        //        [UIScreen mainScreen].bounds.size.width -
        //        (10 + [RCIM sharedRCIM].globalMessagePortraitSize.width + 10) * 2 - 5 -
        //        35;
        CGRect textRect = [string
                           boundingRectWithSize:CGSizeMake(viewWidth, 8000)
                           options:(NSStringDrawingTruncatesLastVisibleLine |
                                    NSStringDrawingUsesLineFragmentOrigin |
                                    NSStringDrawingUsesFontLeading)
                           attributes:@{
                                        NSFontAttributeName :
                                            [UIFont systemFontOfSize:font]
                                        }
                           context:nil];
        textRect.size.height = ceilf(textRect.size.height);
        textRect.size.width = ceilf(textRect.size.width);
        return CGRectMake(0, 0, textRect.size.width, textRect.size.height);
    } else {
        return CGRectZero;
    }
    //    CGRect rect =[string boundingRectWithSize:CGSizeMake(viewWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    //    return rect;
}
/** 计算字符串长度 */
+ (CGSize)sizeWithString:(NSString*)string fontOfSize:(CGFloat)font viewWidth:(CGFloat)viewWidth
{
    if ([string length] > 0) {
        
        CGRect textRect = [string
                           boundingRectWithSize:CGSizeMake(viewWidth, 8000)
                           options:(NSStringDrawingTruncatesLastVisibleLine |
                                    NSStringDrawingUsesLineFragmentOrigin |
                                    NSStringDrawingUsesFontLeading)
                           attributes:@{
                                        NSFontAttributeName :
                                            [UIFont systemFontOfSize:font]
                                        }
                           context:nil];
        textRect.size.height = ceilf(textRect.size.height);
        textRect.size.width = ceilf(textRect.size.width);
        return CGSizeMake(textRect.size.width, textRect.size.height);
    } else {
        return CGSizeZero;
    }
}

@end
