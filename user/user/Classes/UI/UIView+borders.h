//
//  UIView+borders.h
//  HouseRent
//
//  Created by liruiqin on 13-11-18.
//  Copyright (c) 2013年 ganji.com. All rights reserved.
//

#import <UIKit/UIKit.h>

enum UIViewBorderPosition {
    UIViewBorderPositionTop = 0,
    UIViewBorderPositionBottom = 1,
    UIViewBorderPositionLeft = 2,
    UIViewBorderPositionRight = 3
};
@interface UIView (borders)


/**
 *  这个是使用的当view初始化时候的frame尺寸，对于tableviewcell就会遇到cell进行设计时只有某个宽度，如320，但是适配414宽度屏幕的时候不对的问题
 *
 *  @param color       <#color description#>
 *  @param thickness   <#thickness description#>
 *  @param position    <#position description#>
 *  @param edgeInserts <#edgeInserts description#>
 */
-(void)setBorderWithColor:(UIColor*)color thickness:(CGFloat)thickness in:(enum UIViewBorderPosition)position edgeInserts:(UIEdgeInsets)edgeInserts;

-(void)setXuxianIn:(enum UIViewBorderPosition)position edgeInserts:(UIEdgeInsets)edgeInserts;
-(void)setRedXuxianIn:(enum UIViewBorderPosition)position edgeInserts:(UIEdgeInsets)edgeInserts;
-(void)setGrayXuxianIn:(enum UIViewBorderPosition)position edgeInserts:(UIEdgeInsets)edgeInserts;
-(void)setFinanceHomeXuxianIn:(enum UIViewBorderPosition)position edgeInserts:(UIEdgeInsets)edgeInserts;
-(void)setFinanceHomeVerticalXuxianIn:(enum UIViewBorderPosition)position edgeInserts:(UIEdgeInsets)edgeInserts;
-(void)setBorderImage:(UIImage *)borderImage in:(enum UIViewBorderPosition)position edgeInserts:(UIEdgeInsets)edgeInserts;


- (void)setLineWithColor:(UIColor *)color
               thickness:(CGFloat)thickness
                      in:(enum UIViewBorderPosition)position
      standardLineLength:(CGFloat)lineLength
             edgeInserts:(UIEdgeInsets)edgeInserts;

- (void)setXuXianLineWithThickness:(CGFloat)thickness
                      in:(enum UIViewBorderPosition)position
      standardLineLength:(CGFloat)lineLength
             edgeInserts:(UIEdgeInsets)edgeInserts;


- (void)hiddenSeparateLine:(BOOL)hidden position:(enum UIViewBorderPosition)position;

@end
