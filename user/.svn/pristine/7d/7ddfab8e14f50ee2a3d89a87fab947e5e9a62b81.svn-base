//
//  JXShareManager.h
//  user
//
//  Created by 岩  熊 on 2017/12/19.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JXShareModel.h"
@interface JXShareManager : NSObject
+ (void)getShareInfoFromSeveiceSuccess:( void(^)(JXShareModel*))success fail:( void(^)())fail ;
//截屏分享二维码
+ (void)getShotScreenInfoFromSeveiceSuccess:( void(^)(JXShareModel*))success fail:( void(^)())fail ;

//首页 商品详情 活动 分享
+ (void)getShareInfoFromSeveiceParam:(NSDictionary *)param Success:( void(^)(JXShareModel *))success fail:( void(^)())fail;
@end
