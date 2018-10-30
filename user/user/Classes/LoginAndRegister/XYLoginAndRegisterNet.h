//
//  XYLoginAndRegisterNet.h
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XYBestAllNet.h"


@interface XYLoginAndRegisterNet : XYBestAllNet



/**
 *  获取 验证码
 *  mobile 电话
 */
+ (void)netGetVcodeWithMobile:(NSString*)mobile
                        block:(infoBlockNet)block;

/** 登录 */
+ (void)netUserLoginByCodeWithMobile:(NSString*)mobile
                               vcode:(NSString*)vcode
                               block:(infoBlockNet)block;

/**
 *  获取  SessionId
 */
+ (void)netGetSessionIdWithForce:(NSString*)force WithBlock:(infoBlockNet)block;

/**
 *  获取 个人信息
 */
+ (void)netGetUserInfoListBlock:(infoBlockNet)block;

/**
 *  绑定 极光 cid
 */
+ (void)netUpdateCIDBindBlock:(infoBlockNet)block;


@end
