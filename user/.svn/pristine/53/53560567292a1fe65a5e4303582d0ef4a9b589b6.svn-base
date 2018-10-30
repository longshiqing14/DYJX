//
//  EABAUITools.m
//  EABuyerAPP
//
//  Created by longshiqing on 16/10/5.
//  Copyright © 2016年 eascs. All rights reserved.
//

#import "EABAUITools.h"

@implementation EABAUITools
+(UIImageView *)sampleImageView {
    return  [[UIImageView alloc] init];
}
+(UILabel *)sampleLabelFont:(UIFont *)font text:(NSString *)text textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    return label;
}
+(UIView *)sampleViewWithBackgroundColor:(UIColor *)color alpha:(CGFloat)alpha {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = color;
    view.alpha = alpha;
    return view;
}
+(UITableView *)sampleTableViewFrame:(CGRect)frame backgroundColor:(UIColor *)backColor target:(id)target bounces:(BOOL)bounces {
    UITableView *table = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    table.delegate = target;
    table.dataSource = target;
    table.bounces = bounces;
    table.showsVerticalScrollIndicator = NO;
    table.showsHorizontalScrollIndicator = NO;
    table.delaysContentTouches = YES;
    table.backgroundColor = backColor;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    return table;
}
+(UIButton *)buttonWithCustometitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backColor {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setBackgroundImage:[self imageWithColor:backColor] forState:UIControlStateNormal];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = kEABAGlobalCornerRadius;
    return button;
}
+(UIButton *)samplebuttonWithCustometitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backColor {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setBackgroundImage:[self imageWithColor:backColor] forState:UIControlStateNormal];
    return button;
}
+(UITextField *)textFieldWithFrame:(CGRect)frame placeholders:(NSString *)placehoder {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.placeholder = placehoder;
    return textField;
}
+(UIBarButtonItem *)barButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor {
    UIView *view = [self sampleViewWithBackgroundColor:[UIColor clearColor] alpha:1];
    view.frame =  CGRectMake(0, 0, 44, 33);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.frame = view.frame;
    [view addSubview:button];
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}
+(UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
+(void)reloadSearchOrigin:(NSString *)originResult rangeOfString:(NSString *)content supView:(UILabel *)superView {
    NSRange range = [originResult rangeOfString:content];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:content];
    [attribute addAttribute:NSForegroundColorAttributeName value:KEABAColorlightPink range:range];
    [superView setAttributedText:attribute];
    superView.attributedText = attribute;
}
+(UIView *)separateView {
   return [EABAUITools sampleViewWithBackgroundColor:kEABANeutralGray alpha:1];
}
#pragma mark - UI组合
+(UIView *)viewWithBackgrouncColor:(UIColor *)color alpha:(CGFloat)alpha Font:(UIFont *)font text:(NSString *)text textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment {
    UIView *view = [self sampleViewWithBackgroundColor:color alpha:alpha];
    UILabel *label = [self sampleLabelFont:font text:text textColor:textColor textAlignment:textAlignment];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(view).insets(UIEdgeInsetsMake(0, 15, 0, 15));
        make.centerY.equalTo(view);
        make.height.mas_equalTo(20);
    }];
    return view;
}

#pragma mark - logic
+(NSString *)mergeString:(NSString *)top name:(NSString *)name {
    return [NSString stringWithFormat:@"%@｜%@",top,name];
}
+(CGSize)autolayoutText:(NSString *)text maxSize:(CGSize)maxSize byFont:(UIFont *)font{
    NSDictionary *dicA = @{NSFontAttributeName:font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dicA context:nil].size;
}
+(void)addGetsture:(UIView *)superView target:(id)target action:(SEL)action{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [superView addGestureRecognizer:tap];
}
+(void)addAlphaActionAppearanceView:(UIView *)view {
    view.alpha = 0.5;
    [self performSelector:@selector(reBackView:) withObject:view afterDelay:0.05];
}
+(void)reBackView:(UIView *)view {
    view.alpha = 1;
}
+(NSString *)leftNum:(NSInteger)leftNum rightNum:(NSInteger)rightNum {
    return [NSString stringWithFormat:@"(%zi/%zi)",leftNum,rightNum];
}
+(void)addcornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth superView:(UIView *)superView {
    superView.layer.masksToBounds = YES;
    superView.layer.cornerRadius = cornerRadius;
    superView.layer.borderColor = borderColor.CGColor;
    superView.layer.borderWidth = borderWidth;
}

+ (NSMutableAttributedString*)attributrStringWithSendArea:(NSString*)sendArea  title:(NSString*)title imageName:(NSString*)imageName{
    if (imageName.length != 0) {
        return [[NSMutableAttributedString alloc]initWithString:title];
    }
    
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:title];
    
    if (sendArea.length != 0) {
        NSString *Area =[NSString string];
        Area = [NSString stringWithFormat:@"【%@】",sendArea];
        NSAttributedString *sendAreaString = [[NSAttributedString alloc]initWithString:Area];
        [attri insertAttributedString:sendAreaString atIndex:0];
        
    }
    //label中插入图片
    
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    
    NSURL *imgURL = [NSURL URLWithString:imageName];
    NSData *data = [NSData dataWithContentsOfURL:imgURL];
    // 表情图片
    attch.image = [UIImage imageWithData:data];
    
    // 设置图片大小
    attch.bounds = CGRectMake(4, -2, 22.5, 14);
    
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    NSAttributedString *spaceString = [[NSAttributedString alloc]initWithString:@" "];
    [attri insertAttributedString:spaceString atIndex:0];
    
    //     [attri appendAttributedString:string];
    [attri insertAttributedString:string atIndex:0];
    
    
    return attri;

}

@end
