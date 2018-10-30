//
//  YWDTools.h
//  EA_CloudStoreBiz
//
//  Created by Benson on 8/12/15.
//  Copyright (c) 2015 ruiqin.li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/* 测试代码性能
  TICK;
  
 你要测试的代码
 
 TOCK;
*/
#define TICK   NSDate *startTime = [NSDate date]
#define TOCK   NSLog(@"Time: %f", -[startTime timeIntervalSinceNow])


typedef void(^finishImageUrlcallBackBlock)(UIImage *image);

@interface YWDTools : NSObject

// 判空
+ (BOOL)isNil:(NSString *)pStr;

// 手机号码的有效性判断
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

// 取得系统路径位置
+ (NSString *)SystemDocumentsDir;

// 保存图片至沙盒
+ (void)saveImage:(UIImage *)currentImage withName:(NSString *)imageName;

// 圆形
+ (void)getRoundView:(UIView *)view;

// 设置圆形头像
+ (void)getRoundImageView:(UIImageView *)imgView;

// 设置圆形头像
+ (void)getRoundImageViewWithBorder:(UIImageView *)imgView;

// 改变图片大小
+ (UIImage*)resizeImage:(UIImage *)image toSize:(CGSize)newSize;

// 去掉各种空
+ (NSString *)replaceNull:(NSString *)source;

+ (NSString *)md5FromString:(NSString*)string;

//验证密码有效性
+ (BOOL)isPwdValid:(NSString *)pwdTxt;

// 银行卡号的有效性判断
+ (BOOL)isBankCardNumber:(NSString *)bankCardNum;

// 输入密码的有效性判断
+ (BOOL)isPwdNumber:(NSString *)num;

// 身份证号的有效性判断
+ (BOOL)isIDCardNumber:(NSString *)IDCardNum;

// 输入提现金额的有效性判断
+ (BOOL)isCashNumber:(NSString *)num;

// 配送费金额的有效性判断，5位整数，2位小数
+ (BOOL)isSelfSaleInitMoney:(NSString *)num;

// 输入起送金额的有效性判断
+ (BOOL)isSelfSaleMoney:(NSString *)num;

//判断是否为整形
+ (BOOL)isPureInt:(NSString *)string;

// 输入数字的有效性判断
+ (BOOL)isNumber:(NSString *)num;

// 去掉表情emoji
+ (NSString *)disableEmoji:(NSString *)text;

// 判断字符串是否包含emoji
+ (BOOL)stringContainsEmoji:(NSString *)string;

+(void)getLableCgrect:(UITableViewCell *)cell withLable:(UILabel *)lab;

// 计算文本的宽度和高度
+ (CGSize)string:(NSString *)strText constrainedToSize:(CGSize)fitSize withFont:(UIFont *)theFont;

//字符串转时间格式转换
+(NSString *)dateFormateFromString:(NSString *)dateStr;

// 时间格式转换
+(NSString *)dateFormateConvertFromString:(NSString *)dateStr;

+ (CIImage *)createQRForString:(NSString *)qrString;

// 生成二维码
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size;

// 转换秒数为日期
+ (NSString *)timeIntervalToDate:(long long)timeInterval compareWithToday:(BOOL)bCompare timeType:(NSString *)timeFormater;

// 电话号码中间部分用*替换
+ (NSString *)clippedMobileNo:(NSString *)mobile;

// 判断字符串是否包含另一个字符串
+ (BOOL)string:(NSString *)string searchString:(NSString *)searchString;

// 异步加载图片
+ (void)asyncDownLoadImageUrl:(NSString *)imgUrl image:(UIImage *)image placeHoderImageName:(NSString *)defaultImageName block:(finishImageUrlcallBackBlock)block;

// 创建一个列表
+ (void)label:(UILabel *)label color:(UIColor *)color text:(NSString *)text superView:(UIView *)superView;
//获取当前时间戳
+(NSString *)getNowTimeTimestamp;

//字典按key的ASCII码排序后，拼接为字符串
+ (NSString *)getSignStringByDic:(NSDictionary *)dic;

+ (NSString *)getiPhoneName;

//判断字符串是否为空若为空返回@""若不为空返回自己
+(NSString *)isNilStr:(NSString *)str;

+ (CGSize)getSizeWithText:(NSString*)text;

/** 添加 购物车的动画 */
+ (void)addCartAnimationWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint goodsImage:(NSString*)imageUrl productId:(NSString*)productId animation:(BOOL)animation;

/** 图片合成 */
+ (UIImage *) combineWithLeftImg:(UIImage*)leftImage rightImg:(UIImage*)rightImage withMargin:(NSInteger)margin;
+ (UIImage *) combineWithTopImg:(UIImage*)topImage bottomImg:(UIImage*)bottomImage withMargin:(NSInteger)margin;
//获得某个范围内的屏幕图像
+ (UIImage *)imageFromView: (UIView *) theView;
//获取截屏图像
+ (UIImage *)imageWithScreenshot;
//合成属性字符串
+ (NSMutableAttributedString*)combineAttributeStr:(NSString*)firstStr color:(NSString*)firstColor secondAttributeStr:(NSString*)secondStr color:(NSString*)secondColor;
@end
