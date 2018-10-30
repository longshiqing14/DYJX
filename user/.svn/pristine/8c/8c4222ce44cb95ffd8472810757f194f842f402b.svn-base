//
//  UIButton+touch.m
//  RMRuntime
//
//  Created by Raymon on 16/6/8.
//  Copyright © 2016年 Raymon. All rights reserved.
//

#import "UIButton+touch.h"
#import <objc/runtime.h>
NSString const *UIButton_badgeKey = @"UIButton_badgeKey";

NSString const *UIButton_badgeValueKey = @"UIButton_badgeValueKey";
@interface UIButton ()
/**
 *  bool 设置是否执行触及事件方法
 */
@property (nonatomic, assign) BOOL isExcuteEvent;
@end
@implementation UIButton (touch)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL oldSel = @selector(sendAction:to:forEvent:);
        SEL newSel = @selector(newSendAction:to:forEvent:);
        // 获取到上面新建的oldsel方法
        Method oldMethod = class_getInstanceMethod(self, oldSel);
        // 获取到上面新建的newsel方法
        Method newMethod = class_getInstanceMethod(self, newSel);
        // IMP 指方法实现的指针,每个方法都有一个对应的IMP,调用方法的IMP指针避免方法调用出现死循环问题
        /**
         *  给oldSel添加方法
         *
         *   self      被添加方法的类
         *   oldSel    被添加方法的方法名
         *   newMethod 实现这个方法的函数
         *  (@types 定义该函数返回值类型和参数类型的字符串)
         *   是否添加成功
         想了解的可以查看下:
         http://blog.csdn.net/lvmaker/article/details/32396167
         */
        BOOL isAdd = class_addMethod(self, oldSel, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
        if (isAdd) {
            // 将newSel替换成oldMethod
            class_replaceMethod(self, newSel, method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
        }else{
            // 给两个方法互换实现
            method_exchangeImplementations(oldMethod, newMethod);
        }
    });
}

- (void)newSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if ([NSStringFromClass(self.class) isEqualToString:@"UIButton"]) {
        if (self.isExcuteEvent == 0) {
            self.timeInterVal = self.timeInterVal = 0? defaultInterval:self.timeInterVal;
        }
        if (self.isExcuteEvent) return;
        if (self.timeInterVal > 0) {
            self.isExcuteEvent = YES;
            [self performSelector:@selector(setIsExcuteEvent:) withObject:nil afterDelay:self.timeInterVal];
        }
    }
    [self newSendAction:action to:target forEvent:event];
}

- (NSTimeInterval)timeInterVal
{
    // 动态获取关联对象
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setTimeInterVal:(NSTimeInterval)timeInterVal
{
    // 动态设置关联对象
    objc_setAssociatedObject(self, @selector(timeInterVal), @(timeInterVal), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setIsExcuteEvent:(BOOL)isExcuteEvent
{
    // 动态设置关联对象
    objc_setAssociatedObject(self, @selector(isExcuteEvent), @(isExcuteEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isExcuteEvent
{
    // 动态获取关联对象
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}




-(UILabel*) badgeLable {
     UILabel* lbl =objc_getAssociatedObject(self, &UIButton_badgeKey);
    if (!lbl) {
        lbl=[[UILabel alloc]init];
        lbl.backgroundColor=[UIColor redColor];
//        lbl.text=@"99+";
        [lbl reat:5];
        lbl.textColor=[UIColor whiteColor];
        lbl.textAlignment=NSTextAlignmentCenter;
        lbl.font=[UIFont systemFontOfSize:11];
         [self setBadgeLable:lbl];
    }
    return lbl;
}

-(void)setBadgeLable:(UILabel *)badgeLable
{
    objc_setAssociatedObject(self, &UIButton_badgeKey, badgeLable, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)layerOut{
   [self addSubview:self.badgeLable];
    self.badgeLable.frame=CGRectMake(self.frame.size.width-8, 3, 8, 8);
    NSLog(@"%@",self.badgeLable);
//    [self.badgeLable mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(0).mas_offset(2);
//        make.right.mas_equalTo(self.mas_right).mas_offset(0);
//        make.height.mas_equalTo(8);
//        make.width.mas_equalTo(8);
//    }];
}

-(void)setFontSize:(UIFont *)fontSize{
    self.badgeLable.font=fontSize;
    [self layerOut];
}

-(void)setFontColor:(UIColor *)fontColor{
    self.badgeLable.textColor=fontColor;
    [self layerOut];
}

-(void)setBadgeBackgroundColor:(UIColor *)badgeBackgroundColor{
    self.badgeLable.backgroundColor=badgeBackgroundColor;
    [self layerOut];
}

-(void)setBadgeValue:(NSString *)badgeValue{
    objc_setAssociatedObject(self, &UIButton_badgeValueKey, badgeValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (![badgeValue isEqualToString:@""]) {
        self.badgeLable.text=badgeValue;
        self.badgeLable.backgroundColor=[UIColor redColor];
        [self layerOut];
    }else{
        self.badgeLable.backgroundColor=[UIColor clearColor];
    }
    
    
}

@end
