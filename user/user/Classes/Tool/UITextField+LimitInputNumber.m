//
//  UITextField+LimitInputNumber.m
//  EABuyerAPP
//
//  Created by wuyang on 16/10/9.
//  Copyright © 2016年 eascs. All rights reserved.
//

#import "UITextField+LimitInputNumber.h"
#import "objc/runtime.h"

@implementation UITextField (LimitInputNumber)

static const void *UtilityKeyMaxLimitNumber = &UtilityKeyMaxLimitNumber;
static const void *UtilityKeyDataSource = &UtilityKeyDataSource;

- (NSInteger)maxLimitTextNumber {
    
    return [objc_getAssociatedObject(self, UtilityKeyMaxLimitNumber) integerValue];
    
}

- (void)setMaxLimitTextNumber:(NSInteger)maxLimitTextNumber {
    
    objc_setAssociatedObject(self, UtilityKeyMaxLimitNumber, @(maxLimitTextNumber), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (id<LimitTextNumberDataSource>)dataSource {
    
    return objc_getAssociatedObject(self, UtilityKeyDataSource);
    
}

- (void)setDataSource:(id<LimitTextNumberDataSource>)dataSource{
    
    objc_setAssociatedObject(self, UtilityKeyDataSource, dataSource, OBJC_ASSOCIATION_ASSIGN);
    
}

- (void)observeTextDidchangeNotification{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFiledEditChanged:)
                                                name:UITextFieldTextDidChangeNotification
                                              object:self];
}

-(void)addLeftMarginView{
    self.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 18, 0)];
    //设置显示模式为永远显示(默认不显示)
    self.leftViewMode = UITextFieldViewModeAlways;
}
- (void)removeTextChangeNotificationObserver{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}
-(void)textFiledEditChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
    
    NSString *toBeString = textField.text;
    NSString *lang = [[self textInputMode] primaryLanguage]; // 键盘输入模式
    
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (self.dataSource && [self.dataSource respondsToSelector:@selector(LimitTextFontOfNumber:)]) {
                [self.dataSource LimitTextFontOfNumber:toBeString.length];
            }
            if (toBeString.length > self.maxLimitTextNumber) {
                textField.text = [toBeString substringToIndex:self.maxLimitTextNumber];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(LimitTextFontOfNumber:)]) {
            [self.dataSource LimitTextFontOfNumber:toBeString.length];
        }
        if (toBeString.length > self.maxLimitTextNumber) {
            textField.text = [toBeString substringToIndex:self.maxLimitTextNumber];
        }
    }
}
@end
