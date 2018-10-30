//
//  EABAButton.m
//  EABuyerAPP
//
//  Created by longshiqing on 16/9/29.
//  Copyright © 2016年 eascs. All rights reserved.
//

#import "EABAButton.h"

@implementation EABAButton

+(id)buttonWithType:(UIButtonType)buttonType
{
    return [[EABAButton alloc] initWithFrame:CGRectZero];
}

-(void)setButtonStyle:(EABAButtonStyle)style
{
    switch (style) {
        case EABAButtonStyleNormal:
            [self setNormalStyle];
            break;
        case EABAButtonStyleCheckbox:
            [self setCheckboxStyle];
            break;
        default:
            break;
    }
}

-(void)setNormalStyle
{
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = ColorFromHex(@"#FA5E71").CGColor;
    self.layer.cornerRadius = 2;
    self.backgroundColor = [UIColor whiteColor];
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
}

-(void)setCheckboxStyle
{
    
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (CGSizeEqualToSize(self.responseSize, CGSizeZero) || !self.enabled) {
        return [super hitTest:point withEvent:event];
    }
    else {
        CGPoint thePoint = [self convertPoint:point toView:self.superview];
        CGFloat offsetX = self.frame.origin.x - (self.responseSize.width - self.frame.size.width) / 2.0;
        CGFloat offsetY = self.frame.origin.y - (self.responseSize.height - self.frame.size.height) / 2.0;
        CGRect newFrame = CGRectMake(offsetX, offsetY, self.responseSize.width, self.responseSize.height);
        BOOL inArea = CGRectContainsPoint(newFrame, thePoint);
        if (inArea) {
            return self;
        }
    }
    return [super hitTest:point withEvent:event];
}
//修改小于44*44的点击范围
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect bounds = self.bounds;
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}



@end
