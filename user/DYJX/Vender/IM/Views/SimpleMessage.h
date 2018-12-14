//
//  SimpleMessage.h
//  user
//
//  Created by longshiqing on 2018/12/12.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <RongIMLib/RongIMLib.h>
#import <RongIMLib/RCMessageContentView.h>

#define RCLocalMessageTypeIdentifier @"RC:TstMsg"


NS_ASSUME_NONNULL_BEGIN

@interface SimpleMessage : RCMessageContent<NSCoding>

@property(nonatomic, strong) NSString* content;

/**
 * 附加信息
 */
@property(nonatomic, strong) NSString* extra;

/**
 * 根据参数创建文本消息对象
 * @param content 文本消息内容
 */
+(instancetype)messageWithContent:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
