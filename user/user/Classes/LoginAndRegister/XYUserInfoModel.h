//
//  XYUserInfoModel.h
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYUserInfoModel : NSObject



/** 头像 */
@property (nonatomic, strong) NSString * userImage;
/** 名称 */
@property (nonatomic, copy) NSString * nickName;
/** 名称 */
@property (nonatomic, copy) NSString * realName;
/** 电话 */
@property (nonatomic, copy) NSString * mobile;
/** 账户 余额 */
@property (nonatomic, copy) NSString * depositBalance;
/** id */
@property (nonatomic, copy) NSString * userId;


/** 生日 */
@property (nonatomic, copy) NSString * birthday;
/** 性别 */
@property (nonatomic, copy) NSString * sex;
/**  */
@property (nonatomic, copy) NSString * hotty;
/** 邮箱 */
@property (nonatomic, copy) NSString * email;
//优惠券张数
@property (nonatomic, copy) NSString * couponCount;
//积分
@property (nonatomic, copy) NSString * points;


@end



@interface XYUserInfoRegisterModel : NSObject

/** 电话 */
@property (nonatomic, copy) NSString * mobile;
/** 标识 */
@property (nonatomic, copy) NSString * sessionId;
/** user id */
@property (nonatomic, copy) NSString * userId;


@end
