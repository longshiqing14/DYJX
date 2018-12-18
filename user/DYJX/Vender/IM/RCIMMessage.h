//
//  RCIMMessage.h
//  user
//
//  Created by longshiqing on 2018/12/18.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCIMMessage : NSObject<NSCopying, NSCoding>

+(instancetype)copyRCModel:(RCMessage *)message;

@property (nonatomic, strong)RCMessage *message;

/*!
 地理位置的二维坐标
 */
@property(nonatomic, assign) CLLocationCoordinate2D location;

/*!
 会话类型
 */
@property(nonatomic, assign) RCConversationType conversationType;

/*!
 是否是自己发送的
 */
@property(nonatomic, assign) BOOL isMySend;

// byself  兼容
@property (nonatomic, strong)  NIMSession *session;

/**
 *  消息是否被播放过
 *  @discussion 修改这个属性,后台会自动更新 db 中对应的数据。聊天室消息里，此字段无效。
 */
@property (nonatomic,assign)                BOOL isPlayed;

/**
 *  是否是往外发的消息
 *  @discussion 由于能对自己发消息，所以并不是所有来源是自己的消息都是往外发的消息，这个字段用于判断头像排版位置（是左还是右）。
 */
@property (nonatomic,assign)       BOOL isOutgoingMsg;

/**
 *  消息投递状态 仅针对发送的消息
 */
@property (nonatomic,assign)       NIMMessageDeliveryState deliveryState;


/**
 *  消息附件下载状态 仅针对收到的消息
 */
@property (nonatomic,assign)       NIMMessageAttachmentDownloadState attachmentDownloadState;


/*!
 目标会话ID
 */
@property(nonatomic, strong) NSString *targetId;

/*!
 消息的ID

 @discussion 本地存储的消息的唯一值（数据库索引唯一值）
 */
@property(nonatomic, assign) long messageId;

/*!
 消息的方向
 */
@property(nonatomic, assign) RCMessageDirection messageDirection;

/*!
 消息的发送者ID
 */
@property(nonatomic, strong) NSString *senderUserId;

/*!
 消息的接收状态
 */
@property(nonatomic, assign) RCReceivedStatus receivedStatus;

/*!
 消息的发送状态
 */
@property(nonatomic, assign) RCSentStatus sentStatus;

/*!
 消息的接收时间（Unix时间戳、毫秒）
 */
@property(nonatomic, assign) long long receivedTime;

/*!
 消息的发送时间（Unix时间戳、毫秒）
 */
@property(nonatomic, assign) long long sentTime;

/*!
 消息的类型名
 */
@property(nonatomic, strong) NSString *objectName;

/*!
 消息的内容
 */
@property(nonatomic, strong) RCMessageContent *content;

/*!
 消息的附加字段
 */
@property(nonatomic, strong) NSString *extra;

/*!
 消息的附加字段
 */
@property(nonatomic, strong) NSDictionary *extraDic;

/*!
 全局唯一ID

 @discussion 服务器消息唯一ID（在同一个Appkey下全局唯一）
 */
@property(nonatomic, copy) NSString *messageUId;

/*!
 阅读回执状态
 */
@property(nonatomic, strong) RCReadReceiptInfo *readReceiptInfo;

/*!
 RCMessage初始化方法

 @param  conversationType    会话类型
 @param  targetId            目标会话ID
 @param  messageDirection    消息的方向
 @param  messageId           消息的ID
 @param  content             消息的内容
 */
- (instancetype)initWithType:(RCConversationType)conversationType
                    targetId:(NSString *)targetId
                   direction:(RCMessageDirection)messageDirection
                   messageId:(long)messageId
                     content:(RCMessageContent *)content;

/*!
 RCMessage初始化方法（已废弃，请勿使用）

 @param jsonData    消息的JSON Dictionary
 @return            消息实体对象

 @warning **已废弃，请勿使用。**
 */
+ (instancetype)messageWithJSON:(NSDictionary *)jsonData __deprecated_msg("已废弃，请勿使用。");

@end

NS_ASSUME_NONNULL_END
