//
//  YWDLimitTextView.m
//  EA_CloudStoreBuyer
//
//  Created by wuyang on 15/11/26.
//  Copyright © 2015年 liruiqin. All rights reserved.
//

#import "EABFLimitTextView.h"


@interface EABFLimitTextView()
@property (nonatomic,strong) UITextView *placeHolderTextView;

@end
@implementation EABFLimitTextView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addTextDidchangeNotification];
        self.placeHolderTextView.text = self.placeHolder;
        self.placeHolderTextView.hidden = YES;
        self.layer.masksToBounds = YES;
        self.textColor = [UIColor blackColor];
        [self addSubview:self.placeHolderTextView];
    }
    return self;
}

- (void)awakeFromNib{
    [self addTextDidchangeNotification];
    if (self.text.length == 0) {
        
        self.placeHolderTextView.hidden = YES;
        self.placeHolderTextView.text = self.placeHolder;
        self.layer.masksToBounds = YES;
        self.textColor = [UIColor blackColor];
        [self addSubview:self.placeHolderTextView];
    }
}

-(void)setText:(NSString *)text{
    [super setText:text];
    if (text.length == 0) {
        self.placeHolderTextView.hidden = NO;
    }else{
        self.placeHolderTextView.hidden = YES;
    }
    
}

-(void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}

-(void)setBorderWidth:(CGFloat)borderWidth{
    self.layer.borderWidth = borderWidth;
}

-(void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
}

-(UITextView *)placeHolderTextView{
    if (_placeHolderTextView == nil) {
        UITextView *textView = [[UITextView alloc] initWithFrame:self.bounds];
        textView.backgroundColor = [UIColor clearColor];
        textView.font = self.font;
        textView.textColor = [UIColor lightGrayColor];
        textView.userInteractionEnabled = NO;
        _placeHolderTextView = textView;
    }
    return _placeHolderTextView;
}

- (void)setPlaceHolder:(NSString *)placeHolder{
    _placeHolder = nil;
    _placeHolder = placeHolder;
    self.placeHolderTextView.text = placeHolder;
    
}
- (void)addTextDidchangeNotification{
 
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFiledEditChanged:)
                                                name:UITextViewTextDidChangeNotification
                                              object:self];
}

 

-(void)textFiledEditChanged:(NSNotification *)obj{
    UITextView *textField = (UITextView *)obj.object;
 
    NSString *toBeString = textField.text;
    NSString *lang = [[self textInputMode] primaryLanguage]; // 键盘输入模式
    
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            
            if (self.maxLimitTextNumber != 0 && toBeString.length > self.maxLimitTextNumber) {
                textField.text = [toBeString substringToIndex:self.maxLimitTextNumber];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (self.maxLimitTextNumber != 0 && toBeString.length > self.maxLimitTextNumber) {
            textField.text = [toBeString substringToIndex:self.maxLimitTextNumber];
        }
    }
    if (textField.text.length == 0) {
        
        self.placeHolderTextView.hidden = NO;
    }else{
        self.placeHolderTextView.hidden = YES;
    }
    
    
}




@end
