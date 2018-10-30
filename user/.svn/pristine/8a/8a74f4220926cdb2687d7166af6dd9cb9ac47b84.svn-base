//
//  EABAButton.h
//  EABuyerAPP
//
//  Created by longshiqing on 16/9/29.
//  Copyright © 2016年 eascs. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    EABAButtonStyleNormal = 0,
    EABAButtonStyleCheckbox = 1,
} EABAButtonStyle;
@interface EABAButton : UIButton

// 在定义类的前面加上IB_DESIGNABLE宏,确保该控件在xib或storyboard上可以实时渲染
IB_DESIGNABLE
/**
 *  风格
 */
@property(nonatomic) IBInspectable EABAButtonStyle buttonStyle;

@property(nonatomic) CGSize responseSize;

@end
