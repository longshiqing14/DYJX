//
//  XYQRCodePushCommon.h
//  user
//
//  Created by xingyun on 2017/9/15.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYQRCodePushCommon : NSObject

/** 跳转 扫描二维码 */
+ (void)pushToQRCodeTarget:(UIViewController*)target;



/** 生成 二维码 */
+ (UIImage*)createQRCodeWithString:(NSString*)text;

@end
