//
//  YWDTools.m
//  EA_CloudStoreBiz
//
//  Created by Benson on 8/12/15.
//  Copyright (c) 2015 ruiqin.li. All rights reserved.
//

#import "YWDTools.h"
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>
#import "ShoppingCartTool.h"
#import "XYShoppingCartNet.h"

@implementation YWDTools

// 判空
+ (BOOL)isNil:(NSString *)pStr
{
    if (![pStr isKindOfClass:[NSString class]]) {
        return pStr == nil;
    }
    if (pStr == nil || pStr == NULL || [pStr isEqual:[NSNull null]] || [pStr isEqualToString:@"null"] || [pStr isEqualToString:@"(null)"]
        ||[pStr isEqualToString:@""]
        ||[pStr isKindOfClass:[NSNull class]]
        ||[[pStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0)
    {
        return YES;
    }
    return NO;
}

// 手机号码的有效性判断
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{   //最新的手机号码正则
    if (mobileNum.length != 11)
    {
        return NO;
    }
    
    if (![self isNumber:mobileNum]) {
        return NO;
    }
    
    return YES;
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
//    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
//    /**
//     * 中国移动：China Mobile
//     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
//     */
//    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
//    /**
//     * 中国联通：China Unicom
//     * 130,131,132,155,156,185,186,145,176,1709
//     */
//    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
//    /**
//     * 中国电信：China Telecom
//     * 133,153,180,181,189,177,1700
//     */
//    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
//    
//    
//    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
//    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
//    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
//    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
//    
//    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
//        || ([regextestcm evaluateWithObject:mobileNum] == YES)
//        || ([regextestct evaluateWithObject:mobileNum] == YES)
//        || ([regextestcu evaluateWithObject:mobileNum] == YES))
//    {
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }

}

// 银行卡号的有效性判断
+ (BOOL)isBankCardNumber:(NSString *)bankCardNum
{
    NSString *bankCard = @"\\d*$";
    NSPredicate *regextestiph = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", bankCard];
    if ([regextestiph evaluateWithObject:bankCardNum]) {
        return YES;
    } else {
        return NO;
    }
}

// 输入数字的有效性判断
+ (BOOL)isNumber:(NSString *)num
{
    NSString *number = @"^[1-9]\\d*$";
    NSPredicate *regextestiph = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
    if ([regextestiph evaluateWithObject:num]) {
        return YES;
    } else {
        return NO;
    }
}

+(void)getLableCgrect:(UITableViewCell *)cell withLable:(UILabel *)lab{
    CGRect rect = [lab.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 13) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil];
    [cell addConstraint:[NSLayoutConstraint constraintWithItem:lab attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:rect.size.width+5]];
}

// 取得系统路径位置
+ (NSString *)SystemDocumentsDir
{
    NSString *documentsDirectory;
    
#if TARGET_IPHONE_SIMULATOR
    // 模拟器环境 DB保存路径
    documentsDirectory = @"/Users/Shared";
#else
    // 真机环境 DB保存路径
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //documentsDirectory = [paths objectAtIndex:0];
    documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
#endif
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:documentsDirectory]) {
        // 创建文件夹路径
        [fileManager createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return documentsDirectory;
}

// 保存图片至沙盒
+ (void)saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 1.0);
    
    // 获取沙盒目录
    NSString *fullPath = [[YWDTools SystemDocumentsDir] stringByAppendingPathComponent:imageName];
    
    // 将图片写入文件
    [imageData writeToFile:fullPath atomically:NO];
}

// 设置圆形头像
+ (void)getRoundImageView:(UIImageView *)imgView
{
    [imgView.layer setCornerRadius:(imgView.frame.size.height/2)];
    [imgView.layer setMasksToBounds:YES];
    [imgView setContentMode:UIViewContentModeScaleAspectFill];
    [imgView setClipsToBounds:YES];
    imgView.layer.shadowColor = [UIColor whiteColor].CGColor;
    imgView.layer.shadowOffset = CGSizeMake(4, 4);
    imgView.layer.shadowOpacity = 0.5;
    imgView.layer.shadowRadius = 2.0;
    //imgView.layer.borderColor = [[UIColor whiteColor] CGColor];
    //imgView.layer.borderWidth = 2.0f;
    //imgView.userInteractionEnabled = YES;
    //imgView.backgroundColor = [UIColor whiteColor];
}

// 设置圆形头像
+ (void)getRoundImageViewWithBorder:(UIImageView *)imgView
{
    [imgView.layer setCornerRadius:(imgView.frame.size.height/2)];
    [imgView.layer setMasksToBounds:YES];
    [imgView setContentMode:UIViewContentModeScaleAspectFill];
    [imgView setClipsToBounds:YES];
//    imgView.layer.shadowColor = [UIColor whiteColor].CGColor;
//    imgView.layer.shadowOffset = CGSizeMake(4, 4);
//    imgView.layer.shadowOpacity = 0.5;
//    imgView.layer.shadowRadius = 2.0;
    imgView.layer.borderColor = [[UIColor whiteColor] CGColor];
    imgView.layer.borderWidth = 1.3f;
    imgView.userInteractionEnabled = YES;
    imgView.backgroundColor = [UIColor whiteColor];
}

// 改变图片大小
+ (UIImage*)resizeImage:(UIImage *)image toSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

// 圆形
+ (void)getRoundView:(UIView *)view
{
    [view.layer setCornerRadius:(view.frame.size.height/2)];
    [view.layer setMasksToBounds:YES];
    [view setClipsToBounds:YES];
}

// 去掉各种空
+ (NSString *)replaceNull:(NSString *)source
{
    NSString *result = [NSString stringWithFormat:@"%@", source];
    if ([result length] == 0) {
        return @"";
    }
    if (result != nil && (NSNull *)result != [NSNull null]) {
        if ([result isEqualToString:@"<null>"]) {
            return @"";
        } else if ([result isEqualToString:@"(null)"]) {
            return @"";
        } else {
            return result;
        }
    } else {
        return @"";
    }
}

+ (NSString *)md5FromString:(NSString*)string
{
    if(string == nil || [string length] == 0)
        return nil;
    
    const char *value = [string UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return outputString;
}

//验证密码有效性(8-16位数字和字母)
+ (BOOL)isPwdValid:(NSString *)pwdTxt
{
    NSString *regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:pwdTxt];
}

// 去掉表情emoji
+ (NSString *)disableEmoji:(NSString *)text
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:text
                                                               options:0
                                                                 range:NSMakeRange(0, [text length])
                                                          withTemplate:@""];
    return modifiedString;
}

+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    
    return returnValue;
}

//计算文本的宽度和高度
+(CGSize)string:(NSString *)strText constrainedToSize:(CGSize)fitSize withFont:(UIFont *)theFont
{
    CGSize textSize = CGSizeZero;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    textSize = [strText boundingRectWithSize:fitSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:theFont,NSParagraphStyleAttributeName:paragraphStyle.copy} context:nil].size;
    return textSize;
}

+(NSString *)dateFormateFromString:(NSString *)dateStr{
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *inputDate = [timeFormatter dateFromString:dateStr];
    [timeFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *str = [timeFormatter stringFromDate:inputDate];
    
    return str;
    
}

// 输入提现金额的有效性判断
+ (BOOL)isCashNumber:(NSString *)num
{
    NSString * number = @"^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){1,2})?$";
    NSPredicate *regextestiph = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
    if ([regextestiph evaluateWithObject:num] == YES)
    {
        return YES;
    }else
    {
        return NO;
    }
}

// 配送费金额的有效性判断，5位整数，2位小数
+ (BOOL)isSelfSaleInitMoney:(NSString *)num
{
    NSString * number = @"^(([1-9]{1}\\d{0,4})|([0]{1}))(\\.(\\d){1,2})?$";
    NSPredicate *regextestiph = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
    if ([regextestiph evaluateWithObject:num] == YES)
    {
        return YES;
    }else
    {
        return NO;
    }
}

// 输入起送金额的有效性判断
+ (BOOL)isSelfSaleMoney:(NSString *)num
{
    NSString * number = @"^([1-9]{1}\\d{0,4}$)";
    NSPredicate *regextestiph = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
    if ([regextestiph evaluateWithObject:num] == YES)
    {
        return YES;
    }else
    {
        return NO;
    }
}

//判断是否为整形
+ (BOOL)isPureInt:(NSString *)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//时间格式转换
+(NSString *)dateFormateConvertFromString:(NSString *)dateStr
{
    if ([YWDTools isNil:dateStr])
    {
        return @"";
    } else
    {
        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
         [timeFormatter setDateFormat:@"yyyyMMddHHmmss"];
         NSDate *inputDate = [timeFormatter dateFromString:dateStr];
        [timeFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
         NSString *str = [timeFormatter stringFromDate:inputDate];
        return str;
    }
}

// 身份证号的有效性判断/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
+ (BOOL)isIDCardNumber:(NSString *)IDCardNum
{
    NSString * IDCard = @"(\\d{15}$)|(\\d{18}$)|(\\d{17}(\\d|X|x)$)";
    NSPredicate *regextestiph = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", IDCard];
    if ([regextestiph evaluateWithObject:IDCardNum] == YES)
    {
        return YES;
    }else
    {
        return NO;
    }
}

// 输入密码的有效性判断
+ (BOOL)isPwdNumber:(NSString *)num
{
    NSString * number = @"\\d{6}$";
    NSPredicate *regextestiph = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
    if ([regextestiph evaluateWithObject:num] == YES)
    {
        return YES;
    }else
    {
        return NO;
    }
}

// 生成二维码
+ (CIImage *)createQRForString:(NSString *)qrString {
    NSData *stringData = [qrString dataUsingEncoding:NSUTF8StringEncoding];
    // 创建filter
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 设置内容和纠错级别
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
    // 返回CIImage
    return qrFilter.outputImage;
}


// 生成二维码装欢CIIMage - > UIImage

+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // 创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

/*
 * 转换秒数为日期
 * timeType 1:yyyy-MM-dd HH:mm:ss   2:yyyy-MM-dd HH:mm   3:MM-dd HH:mm   4:MM-dd   5:HH:mm   6:yyyy年MM月dd日 HH:mm
 *          7:yyyy年MM月dd日   8:yyyy-MM-dd EEEE   9:EEEE(代表完整的星期几)
 * compareWithToday 和今天比较，是今天则只返回 HH:mm，昨天则返回: 昨天，其他则返回 MM月dd日
 */
+ (NSString *)timeIntervalToDate:(long long)timeInterval compareWithToday:(BOOL)bCompare timeType:(NSString *)timeFormater
{
    NSDate *compareDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    //NSTimeInterval secondsPerDay2 = 24 * 60 * 60 * 2;
    NSDate *beforeDate1 = [NSDate dateWithTimeIntervalSinceNow:-secondsPerDay]; // 昨天
    //NSDate *beforeDate2 = [NSDate dateWithTimeIntervalSinceNow:-secondsPerDay2]; // 前天
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *now = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateNow = [cal components:unitFlags fromDate:now];
    NSDateComponents *dateCompare = [cal components:unitFlags fromDate:compareDate];
    NSDateComponents *dateBefore1 = [cal components:unitFlags fromDate:beforeDate1];
    //NSDateComponents *dateBefore2 = [cal components:unitFlags fromDate:beforeDate2];
    
    if (bCompare) {
        if ([dateBefore1 year] == [dateCompare year] && [dateBefore1 month] == [dateCompare month] && [dateBefore1 day] == [dateCompare day]) {
            return @"昨天";
        }
        
        if ([dateNow year] == [dateCompare year] && [dateNow month] == [dateCompare month] && [dateNow day] == [dateCompare day]) {
            [dateFormat setDateFormat:@"HH:mm"];
            return [dateFormat stringFromDate:compareDate];
        } else {
            [dateFormat setDateFormat:@"MM月dd日"];
            return [dateFormat stringFromDate:compareDate];
        }
    } else {
        [dateFormat setDateFormat:timeFormater];
        return [dateFormat stringFromDate:compareDate];
    }
}

// 电话号码中间部分用*替换
+ (NSString *)clippedMobileNo:(NSString *)mobile
{
    if (![self isMobileNumber:mobile]) {
        return mobile;
    }
    
    return [mobile stringByReplacingCharactersInRange:NSMakeRange(3, 5) withString:@"*****"];
}

// 判断字符串是否包含另一个字符串
+ (BOOL)string:(NSString *)string searchString:(NSString *)searchString{
    if([string rangeOfString:searchString].location == NSNotFound)
    {
        return YES;
    }
    return NO;
}

// 异步加载图片
+ (void)asyncDownLoadImageUrl:(NSString *)imgUrl image:(UIImage *)image placeHoderImageName:(NSString *)defaultImageName block:(finishImageUrlcallBackBlock)block {
    dispatch_queue_t queue = dispatch_queue_create("com.warrior.network.image", nil);
    __block UIImage *img = image;
    dispatch_async(queue, ^{
        img =  [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setPlaceHoldImageName:defaultImageName image:img block:block];
        });
    });
}

+ (void)setPlaceHoldImageName:(NSString *)defaultImage image:(UIImage *)image block:(finishImageUrlcallBackBlock)block {
    if (!image) {
        image = [UIImage imageNamed:defaultImage];
    }
    //  回调方法
    block(image);
}

// 创建一个UIlabel
+ (void)label:(UILabel *)label color:(UIColor *)color text:(NSString *)text superView:(UIView *)superView {
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:13];
    label.opaque = YES;
    label.backgroundColor = [UIColor whiteColor];
    label.text = text;
    label.textColor = color;
    [superView addSubview:label];
}

+ (NSString *)getNowTimeTimestamp{
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval a=[dat timeIntervalSince1970] * 1000;
    
    NSString *timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型;
    
    return timeString;
    
    
}

+ (NSString *)getSignStringByDic:(NSDictionary *)dic{
    
        //将所有的key放进数组
        NSArray *allKeyArray = [dic allKeys];
        
        //序列化器对数组进行排序的block 返回值为排序后的数组
        NSArray *afterSortKeyArray = [allKeyArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id _Nonnull obj2) {
            /**
             In the compare: methods, the range argument specifies the
             subrange, rather than the whole, of the receiver to use in the
             comparison. The range is not applied to the search string.  For
             example, [@"AB" compare:@"ABC" options:0 range:NSMakeRange(0,1)]
             compares "A" to "ABC", not "A" to "A", and will return
             NSOrderedAscending. It is an error to specify a range that is
             outside of the receiver's bounds, and an exception may be raised.
             
             - (NSComparisonResult)compare:(NSString *)string;
             
             compare方法的比较原理为,依次比较当前字符串的第一个字母:
             如果不同,按照输出排序结果
             如果相同,依次比较当前字符串的下一个字母(这里是第二个)
             以此类推
             
             排序结果
             NSComparisonResult resuest = [obj1 compare:obj2];为从小到大,即升序;
             NSComparisonResult resuest = [obj2 compare:obj1];为从大到小,即降序;
             
             注意:compare方法是区分大小写的,即按照ASCII排序
             */
            //排序操作
            NSComparisonResult resuest = [obj1 compare:obj2];
            return resuest;
        }];
        NSLog(@"afterSortKeyArray:%@",afterSortKeyArray);
        
        //通过排列的key值获取value
        NSMutableArray *valueArray = [NSMutableArray array];
        for (NSString *sortsing in afterSortKeyArray) {
            NSString *valueString = [dic objectForKey:sortsing];
            [valueArray addObject:valueString];
        }
        NSLog(@"valueArray:%@",valueArray);
    
    NSMutableString *signString = [NSMutableString stringWithString:@""];
    
    for (int i = 0; i < afterSortKeyArray.count; i++) {
        NSString *tempString = [NSString stringWithFormat:@"%@=%@&",afterSortKeyArray[i],valueArray[i]];
        [signString appendString:tempString];
    }
    [signString deleteCharactersInRange:NSMakeRange(signString.length - 1, 1)];
    [signString appendString:@"&securitykey=8ee3b711ef50fa3a3a6eae"];

    return [signString sha256String];
    
    
}

+ (NSString *)getiPhoneName {
    
    return [UIDevice currentDevice].name;
    
}

+(NSString *)isNilStr:(NSString *)str{
    
    if ([YWDTools isNil:str]) {
        return @"";
    }
    return str;
}

+ (CGSize) getSizeWithText:(NSString*)text;
{
    NSMutableParagraphStyle* style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByCharWrapping;
    CGSize size = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 18) options: NSStringDrawingUsesLineFragmentOrigin   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f],NSParagraphStyleAttributeName:style} context:nil].size;
//    return CGSizeMake(size.width+20 > kScreenWidth - 30 ?kScreenWidth - 30 :size.width+20, 24);
    return size;
}

/** 添加 购物车的动画 */
+ (void)addCartAnimationWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint goodsImage:(NSString*)imageUrl productId:(NSString*)productId animation:(BOOL)animation{
    
    
    [XYShoppingCartNet netCartAddWithProductId:productId block:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            
            //     10*7     8*5;
            
            CGPoint endPoints ;
            if (endPoint.x == 0 && endPoint.y == 0 ) {
                endPoints = CGPointMake(XYScreenW/8*5, XYScreenH-34);;
                if (XYScreenH == 812) {
                    endPoints = CGPointMake(XYScreenW/8*5, XYScreenH-34-30);
                }
            }else{
                endPoints = endPoint;
            }
            
            //    UIImageView *imageView = [[UIImageView alloc]init] ;
            //    [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
            
            UIImage *image = [[UIImage alloc]init];
            if ([YWDTools isNil:imageUrl]) {
                image = [UIImage imageNamed:@"placeholder"];
            }else{
                NSURL *url = [NSURL URLWithString:imageUrl];
                NSData *data = [NSData dataWithContentsOfURL:url];
                image = [UIImage imageWithData:data];
            }
            
            if (animation) {
                [ShoppingCartTool addToShoppingCartWithGoodsImage:image
                                                       startPoint:startPoint
                                                         endPoint:endPoints
                                                       completion:^(BOOL finished) {
                                                           
                                                       }];
            }
            
        }
    }];
    
}

//leftImage:左侧图片 rightImage:右侧图片 margin:两者间隔
+ (UIImage *) combineWithLeftImg:(UIImage*)leftImage rightImg:(UIImage*)rightImage withMargin:(NSInteger)margin{
    if (rightImage == nil) {
        return leftImage;
    }
    CGFloat width = leftImage.size.width + rightImage.size.width + margin;
    CGFloat height = leftImage.size.height;
    CGSize offScreenSize = CGSizeMake(width, height);
    
    // UIGraphicsBeginImageContext(offScreenSize);用这个重绘图片会模糊
    UIGraphicsBeginImageContextWithOptions(offScreenSize, NO, [UIScreen mainScreen].scale);
    
    CGRect rectL = CGRectMake(0, 0, leftImage.size.width, height);
    [leftImage drawInRect:rectL];
    
    CGRect rectR = CGRectMake(rectL.origin.x + leftImage.size.width + margin, 0, rightImage.size.width, height);
    [rightImage drawInRect:rectR];
    
    UIImage* imagez = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return imagez;
}

+ (UIImage *) combineWithTopImg:(UIImage*)topImage bottomImg:(UIImage*)bottomImage withMargin:(NSInteger)margin{
    if (bottomImage == nil) {
        return topImage;
    }
    CGFloat width = topImage.size.width;
    CGFloat height = topImage.size.height + bottomImage.size.height + margin;
    CGSize offScreenSize = CGSizeMake(width, height);
    
    // UIGraphicsBeginImageContext(offScreenSize);用这个重绘图片会模糊
    UIGraphicsBeginImageContextWithOptions(offScreenSize, NO, [UIScreen mainScreen].scale);
    
    CGRect rectL = CGRectMake(0, 0, width, topImage.size.height);
    [topImage drawInRect:rectL];
    
    CGRect rectR = CGRectMake( 0,rectL.origin.y + topImage.size.height + margin, width, height);
    [bottomImage drawInRect:rectR];
    
    UIImage* imagez = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return imagez;
}

//获得某个范围内的屏幕图像
+ (UIImage *)imageFromView: (UIView *) theView
{
    UIGraphicsBeginImageContextWithOptions(theView.bounds.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    //    UIGraphicsBeginImageContext(theView.frame.size);
    //    CGContextRef context = UIGraphicsGetCurrentContext();
    //    [theView.layer renderInContext:context];
    //    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    //    return  theImage;
}
//获取截屏图片
+ (UIImage *)imageWithScreenshot
{
    CGSize imageSize = CGSizeZero;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation))
        imageSize = [UIScreen mainScreen].bounds.size;
    else
        imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, window.center.x, window.center.y);
        CGContextConcatCTM(context, window.transform);
        CGContextTranslateCTM(context, -window.bounds.size.width * window.layer.anchorPoint.x, -window.bounds.size.height * window.layer.anchorPoint.y);
        if (orientation == UIInterfaceOrientationLandscapeLeft)
        {
            CGContextRotateCTM(context, M_PI_2);
            CGContextTranslateCTM(context, 0, -imageSize.width);
        }
        else if (orientation == UIInterfaceOrientationLandscapeRight)
        {
            CGContextRotateCTM(context, -M_PI_2);
            CGContextTranslateCTM(context, -imageSize.height, 0);
        } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
            CGContextRotateCTM(context, M_PI);
            CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
        }
        if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
        {
            [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
        }
        else
        {
            [window.layer renderInContext:context];
        }
        CGContextRestoreGState(context);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *imageData = UIImagePNGRepresentation(image);
    return [UIImage imageWithData:imageData];
}

//合成属性字符串
+ (NSMutableAttributedString*)combineAttributeStr:(NSString*)firstStr color:(NSString*)firstColor secondAttributeStr:(NSString*)secondStr color:(NSString*)secondColor{
    NSMutableAttributedString * firstPart = [[NSMutableAttributedString alloc] initWithString:firstStr];
    NSDictionary * firstAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:firstColor],};
    [firstPart setAttributes:firstAttributes range:NSMakeRange(0,firstPart.length)];
    NSMutableAttributedString * secondPart = [[NSMutableAttributedString alloc] initWithString:secondStr];
    NSDictionary * secondAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:secondColor],};
    [secondPart setAttributes:secondAttributes range:NSMakeRange(0,secondPart.length)];
    [firstPart appendAttributedString:secondPart];
    return  firstPart;
}

@end
