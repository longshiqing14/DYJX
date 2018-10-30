//
//  XYNoticePushModel.h
//  user
//
//  Created by xingyun on 2017/10/14.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYNoticePushModel : NSObject


/** 推送 类型 */
@property (nonatomic ,copy) NSString * msgType;

/** 数据 json */
@property (nonatomic ,copy) NSString * data;

/**  */
@property (nonatomic ,copy) NSString * jiGuangPushId;


@end
