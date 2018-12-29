//
//  ChatManager.h
//  user
//
//  Created by longshiqing on 2018/12/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCIMMessage.h"

@protocol IMChatDelegate <NSObject>

- (void)onRecvMessages:(RCIMMessage *)message;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ChatManager : NSObject

-(instancetype)initWithSession:(NIMSession *)session;

@property(nonatomic, strong)NIMSession *session;

@property(nonatomic,weak) id<IMChatDelegate> delegate;

/**
 *  传输消息的进度 (发送/接受附件)
 *
 *  @param message 消息
 *
 *  @return 正在传输的消息进度,如果消息不在传输,则返回0
 */
- (float)messageTransportProgress:(RCIMMessage *)message;

-(RCIMMessage *)defaultSendMessage:(NSInteger)type sendObject:(id)sender;

-(void)sendMessage:(RCIMMessage *)message success:(void(^)(id  _Nullable responseObject))success failed:(void(^)(NSString *errorMsg))fail;

-(void)sendMessage:(RCIMMessage *)message ToConversion:(RCConversationModel *)conversion success:(void(^)(id  _Nullable responseObject))success failed:(void(^)(NSString *errorMsg))fail;


// 撤销
-(void)resetMessage:(RCIMMessage *)message success:(void(^)(id  _Nullable responseObject))success failed:(void(^)(NSString *errorMsg))fail;

- (void)uploadFile:(UIImage*)image model:(RCIMMessage *)model progress:(nullable void (^)(NSProgress * _Nonnull progress))Progress Success:(void(^)(id  _Nullable responseObject))success failed:(void(^)(NSString *errorMsg))fail;

@end

NS_ASSUME_NONNULL_END
