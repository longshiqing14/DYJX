//
//  XYOrderCommentNet.h
//  user
//
//  Created by xingyun on 2017/9/27.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBestAllNet.h"

@interface XYOrderCommentNet : XYBestAllNet

/** 获取商品评论列表 */
+(void)netGetCommentListWithParam:(NSMutableDictionary *)param resultBlock:(infoBlockNet)block;


/** 增加评论 */
+(void)netUploadCommentWithParam:(NSMutableDictionary *)param resultBlock:(infoBlockNet)block;

/** 单个商品评论详情 */
+(void)netOneProductCommentDetail:(NSMutableDictionary *)param resultBlock:(infoBlockNet)block;

@end
