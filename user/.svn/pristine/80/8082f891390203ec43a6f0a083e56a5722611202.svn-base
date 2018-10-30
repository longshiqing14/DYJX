//
//  XYOrderCommentTools.m
//  user
//
//  Created by xingyun on 2017/9/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderCommentTools.h"

@implementation XYOrderCommentTools
/**
 * 暂时不做错误判读
 * 计算lab字体高度
 * @param viewWidth 计算的lab宽度
 * @param fontSize 字体大小 例如 16
 * @param str lab的text字段
 */

+(CGSize)caculateViewWidth:(CGFloat)viewWidth fontSize:(NSInteger)fontSize describeStr:(NSString *)str
{
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:6];
    CGRect rect = [str boundingRectWithSize:CGSizeMake(viewWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSParagraphStyleAttributeName:paragraphStyle, NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil];
    
    return rect.size;
    
}
@end
