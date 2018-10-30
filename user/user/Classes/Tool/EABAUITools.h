//
//  EABAUITools.h
//  EABuyerAPP
//
//  Created by longshiqing on 16/10/5.
//  Copyright © 2016年 eascs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EABAUITools : NSObject

+(UIImage *)imageWithColor:(UIColor *)color; // 颜色变图片
+(UIImageView *)sampleImageView;
+(UILabel *)sampleLabelFont:(UIFont *)font text:(NSString *)text textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment;
+(UIView *)sampleViewWithBackgroundColor:(UIColor *)color alpha:(CGFloat)alpha;
+(UITableView *)sampleTableViewFrame:(CGRect)frame backgroundColor:(UIColor *)backColor target:(id)target bounces:(BOOL)bounces;
+(UIButton *)buttonWithCustometitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backColor;
+(UIButton *)samplebuttonWithCustometitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backColor;
+(UITextField *)textFieldWithFrame:(CGRect)frame placeholders:(NSString *)placehoder;
+(UIBarButtonItem *)barButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor;
#pragma mark - 多个UI组合
+(UIView *)viewWithBackgrouncColor:(UIColor *)color alpha:(CGFloat)alpha Font:(UIFont *)font text:(NSString *)text textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment;
+(UIView *)separateView;

#pragma mark - logic
+(NSString *)mergeString:(NSString *)top name:(NSString *)name;
+(CGSize)autolayoutText:(NSString *)text maxSize:(CGSize)maxSize byFont:(UIFont *)font;
+(void)addGetsture:(UIView *)superView target:(id)target action:(SEL)action;
+(void)addAlphaActionAppearanceView:(UIView *)view;
+(void)reloadSearchOrigin:(NSString *)originResult rangeOfString:(NSString *)content supView:(UILabel *)superView;
+(NSString *)leftNum:(NSInteger)leftNum rightNum:(NSInteger)rightNum;
+(void)addcornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth superView:(UIView *)superView;
+ (NSMutableAttributedString*)attributrStringWithSendArea:(NSString*)sendArea  title:(NSString*)title imageName:(NSString*)imageName;
@end
