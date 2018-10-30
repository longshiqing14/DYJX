//
//  JXMaximumInteritemSpacingFlowLayout.m
//  user
//
//  Created by 岩  熊 on 2017/11/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXMaximumInteritemSpacingFlowLayout.h"

@implementation JXMaximumInteritemSpacingFlowLayout
- (instancetype)init{
    if (self = [super init]) {
        self.maximumInteritemSpacing = 8.0f;
    }
    return self;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    /*
     //使用系统帮我们计算好的结果。
     NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
     
     //第0个cell没有上一个cell，所以从1开始
     for(int i = 1; i < [attributes count]; ++i) {
     //这里 UICollectionViewLayoutAttributes 的排列总是按照 indexPath的顺序来的。
     UICollectionViewLayoutAttributes *curAttr = attributes[i];
     UICollectionViewLayoutAttributes *preAttr = attributes[i-1];
     
     NSInteger origin = CGRectGetMaxX(preAttr.frame);
     //根据  maximumInteritemSpacing 计算出的新的 x 位置
     CGFloat targetX = origin + _maximumInteritemSpacing;
     // 只有系统计算的间距大于  maximumInteritemSpacing 时才进行调整
     if (CGRectGetMinX(curAttr.frame) > targetX) {
     // 换行时不用调整
     if (targetX + CGRectGetWidth(curAttr.frame) < self.collectionViewContentSize.width) {
     CGRect frame = curAttr.frame;
     frame.origin.x = targetX;
     curAttr.frame = frame;
     }
     }
     }
     return attributes;
     */
    //使用系统帮我们计算好的结果。
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    // 通过一次遍历求出最左边的 X
    CGFloat minX = kScreenWidth;
    for (UICollectionViewLayoutAttributes *attr in attributes) {
        CGRect frame = attr.frame;
        if (frame.origin.x) {
            minX = MIN(attr.frame.origin.x, minX);
        }
    }
    
    for (NSInteger i = 0; i < attributes.count; i++) {
        UICollectionViewLayoutAttributes *curAttr = attributes[i];
        UICollectionViewLayoutAttributes *preAttr = i ? attributes[i-1] : [UICollectionViewLayoutAttributes new];
        
        
        NSInteger origin = CGRectGetMaxX(preAttr.frame);
        //根据  maximumInteritemSpacing 计算出的新的 x 位置
        CGFloat targetX = origin + _maximumInteritemSpacing;
        // 只有系统计算的间距大于 maximumInteritemSpacing 时才进行调整
        if (CGRectGetMinX(curAttr.frame) > targetX) {
            // 换行时不用调整
            if (targetX + CGRectGetWidth(curAttr.frame) < self.collectionViewContentSize.width) {
                CGRect frame = curAttr.frame;
                frame.origin.x = targetX;
                curAttr.frame = frame;
            }
        }
        
        BOOL flag = [curAttr.representedElementKind isEqualToString:UICollectionElementKindSectionFooter] ||
        [curAttr.representedElementKind isEqualToString:UICollectionElementKindSectionHeader];
        if (!flag) {                            // 排除组头组尾
            CGFloat delta = 1.0f;
            if (curAttr.frame.origin.y - preAttr.frame.origin.y > delta) {  // 换行了
                CGRect frame = curAttr.frame;
                frame.origin.x = minX;
                curAttr.frame = frame;          // 每行第一个cell一定靠左
            }
        }
        
    }
    
    return attributes;
    
}

@end
