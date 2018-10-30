//
//  UIView+borders.m
//  HouseRent
//
//  Created by liruiqin on 13-11-18.
//  Copyright (c) 2013年 ganji.com. All rights reserved.
//

#import "UIView+borders.h"
#import <CoreGraphics/CoreGraphics.h>
#import "GJTableCellBorderView.h"
#import "UIViewAdditions.h"

#define kBorderViewTag 345344

static inline NSUInteger borderTagWithPosition(enum UIViewBorderPosition position)
{
    return kBorderViewTag + position;
};
@implementation UIView (borders)

-(void)setBorderImage:(UIImage *)borderImage in:(enum UIViewBorderPosition)position edgeInserts:(UIEdgeInsets)edgeInserts
{
    [self setBorderWithColor:nil thickness:borderImage.size.height imageSize:borderImage.size in:position edgeInserts:edgeInserts];
    GJTableCellBorderView *border=(GJTableCellBorderView *)[self viewWithTag:borderTagWithPosition(position)];
    border.borderColor = [UIColor colorWithPatternImage:borderImage];
}

-(void)setXuxianIn:(enum UIViewBorderPosition)position edgeInserts:(UIEdgeInsets)edgeInserts
{
    UIImage *border = [UIImage imageNamed:@"common_xuxian"];
    [self setBorderImage:border in:position edgeInserts:edgeInserts];
}

-(void)setRedXuxianIn:(enum UIViewBorderPosition)position edgeInserts:(UIEdgeInsets)edgeInserts
{
    UIImage *border = [UIImage imageNamed:@"common_xuxian_red"];
    [self setBorderImage:border in:position edgeInserts:edgeInserts];
}

-(void)setGrayXuxianIn:(enum UIViewBorderPosition)position edgeInserts:(UIEdgeInsets)edgeInserts
{
    UIImage *border = [UIImage imageNamed:@"common_xuxian_gray"];
    [self setBorderImage:border in:position edgeInserts:edgeInserts];
}

-(void)setFinanceHomeXuxianIn:(enum UIViewBorderPosition)position edgeInserts:(UIEdgeInsets)edgeInserts
{
    UIImage *border = [UIImage imageNamed:@"finance_home_arrow"];
    [self setBorderImage:border in:position edgeInserts:edgeInserts];
}
-(void)setFinanceHomeVerticalXuxianIn:(enum UIViewBorderPosition)position edgeInserts:(UIEdgeInsets)edgeInserts
{
    UIImage *border = [UIImage imageNamed:@"finance_home_arrow_shu"];
    [self setBorderImage:border in:position edgeInserts:edgeInserts];
}

-(void)setBorderWithColor:(UIColor *)color thickness:(CGFloat)thickness in:(enum UIViewBorderPosition)position edgeInserts:(UIEdgeInsets)edgeInserts
{
    [self setBorderWithColor:color thickness:thickness imageSize:CGSizeZero in:position edgeInserts:edgeInserts];
}

-(void)setBorderWithColor:(UIColor *)color thickness:(CGFloat)thickness imageSize:(CGSize)imageSize in:(enum UIViewBorderPosition)position edgeInserts:(UIEdgeInsets)edgeInserts{
    CGRect borderFrame;
    CGSize borderSize;
    CGPoint borderPosition;
    GJTableCellBorderView *border=(GJTableCellBorderView *)[self viewWithTag:borderTagWithPosition(position)];
    [border removeFromSuperview];
    border=nil;
    border=[[GJTableCellBorderView alloc] initWithBorderColor:color];
    border.tag = borderTagWithPosition(position);
    // 上下横向的线高度是粗细，左右纵向的线宽度是粗细
    if (position == UIViewBorderPositionTop || position == UIViewBorderPositionBottom) {
        borderSize.height = thickness;
        borderSize.width = self.width - edgeInserts.left - edgeInserts.right;
        
    }
    else {
        borderSize.height = self.height - edgeInserts.top - edgeInserts.bottom;
        borderSize.width = thickness > imageSize.width ? imageSize.width : thickness;
    }
    switch (position) {
        case UIViewBorderPositionTop:
        {
            borderPosition.x = edgeInserts.left;
            borderPosition.y = edgeInserts.top;
        }
            break;
        case UIViewBorderPositionBottom:
        {
            borderPosition.x = edgeInserts.left;
            borderPosition.y = self.height - edgeInserts.bottom - thickness;
            
        }
            break;
        case UIViewBorderPositionLeft:
        {
            borderPosition.x = edgeInserts.left;
            borderPosition.y = edgeInserts.top;
        }
            break;
        case UIViewBorderPositionRight:
        {
            borderPosition.x = self.width - edgeInserts.right - imageSize.width;
            borderPosition.y = edgeInserts.top;
        }
            break;
        default:
            break;
    }
    borderFrame.size = borderSize;
    borderFrame.origin = borderPosition;
    //    border.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
    //    UIViewAutoresizingFlexibleRightMargin |
    //    UIViewAutoresizingFlexibleTopMargin |
    //    UIViewAutoresizingFlexibleBottomMargin;
    border.frame = borderFrame;
    border.borderColor = color;
    [self addSubview:border];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self bringSubviewToFront:border];
    });

}

- (void)setLineWithColor:(UIColor *)color
               thickness:(CGFloat)thickness
                      in:(enum UIViewBorderPosition)position
      standardLineLength:(CGFloat)lineLength
             edgeInserts:(UIEdgeInsets)edgeInserts{
    CGRect borderFrame;
    CGSize borderSize;
    CGPoint borderPosition;
    GJTableCellBorderView *border=(GJTableCellBorderView *)[self viewWithTag:borderTagWithPosition(position)];
    [border removeFromSuperview];
    border=nil;
    border=[[GJTableCellBorderView alloc] initWithBorderColor:color];
    border.tag = borderTagWithPosition(position);
    // 上下横向的线高度是粗细，左右纵向的线宽度是粗细
    if (position == UIViewBorderPositionTop || position == UIViewBorderPositionBottom) {
        borderSize.height = thickness;
        borderSize.width = lineLength - edgeInserts.left - edgeInserts.right;
        
    }
    else {
        borderSize.height = lineLength - edgeInserts.top - edgeInserts.bottom;
        borderSize.width = thickness;
    }
    switch (position) {
        case UIViewBorderPositionTop:
        {
            borderPosition.x = edgeInserts.left;
            borderPosition.y = edgeInserts.top;
        }
            break;
        case UIViewBorderPositionBottom:
        {
            borderPosition.x = edgeInserts.left;
            borderPosition.y = self.height - edgeInserts.bottom - thickness;
            
        }
            break;
        case UIViewBorderPositionLeft:
        {
            borderPosition.x = edgeInserts.left;
            borderPosition.y = edgeInserts.top;
        }
            break;
        case UIViewBorderPositionRight:
        {
            borderPosition.x = self.width - edgeInserts.right - thickness;
            borderPosition.y = edgeInserts.top;
        }
            break;
        default:
            break;
    }
    borderFrame.size = borderSize;
    borderFrame.origin = borderPosition;
    //    border.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
    //    UIViewAutoresizingFlexibleRightMargin |
    //    UIViewAutoresizingFlexibleTopMargin |
    //    UIViewAutoresizingFlexibleBottomMargin;
    border.frame = borderFrame;
    border.borderColor = color;
    [self addSubview:border];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self bringSubviewToFront:border];
    });
    
}


- (void)setXuXianLineWithThickness:(CGFloat)thickness
                                in:(enum UIViewBorderPosition)position
                standardLineLength:(CGFloat)lineLength
                       edgeInserts:(UIEdgeInsets)edgeInserts
{
    UIImage *borderImage = [UIImage imageNamed:@"common_xuxian"];
    [self setLineWithColor:[UIColor colorWithPatternImage:borderImage] thickness:thickness in:position standardLineLength:lineLength edgeInserts:edgeInserts];
    
}
- (void)hiddenSeparateLine:(BOOL)hidden position:(enum UIViewBorderPosition)position{
    GJTableCellBorderView *border=(GJTableCellBorderView *)[self viewWithTag:borderTagWithPosition(position)];
    border.hidden = hidden;
}

@end
