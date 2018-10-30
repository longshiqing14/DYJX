//
//  XYBestAllNet.h
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XYNetWorking.h"
#import "XYBestRequest.h"



/**
 * array    列表数据
 * error    错误信息
 */
typedef void(^listBlockNet)(NSArray * blockArray,NSError *error);


/**
 * dictionary   信息数据
 * error        错误信息
 */
typedef void(^infoBlockNet)(NSDictionary * blockDictionary,NSError *error);

/**
 * status  状态
 * error   错误信息
 */
typedef void(^statusBlockNet)(NSString * status,NSError *error);





@interface XYBestAllNet : NSObject

extern NSString * const RETURN_CODE; //报错码
extern NSString * const RETURN_DESC; //错误信息
extern NSString * const RETURN_STAMP; //标记
extern NSString * const RETURN_DATA; //数据


extern NSString * const ERROR_NUM_STRING; //报错码 成功
extern NSString * const ERROR_NUM_NOTlOGGED; //  报错码 未登录

/**
 * 通用上传图片请求
 *
 */
+(void)commonUploadImgWith:(UIImage *)img resultBlock:(infoBlockNet)net;
//头像上传
+(void)commonUploadImgHeadPortraitWith:(UIImage *)img resultBlock:(infoBlockNet)block;
@end
