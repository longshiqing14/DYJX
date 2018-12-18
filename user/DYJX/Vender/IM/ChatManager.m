//
//  ChatManager.m
//  user
//
//  Created by longshiqing on 2018/12/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "ChatManager.h"
#import "JSExtension.h"

@interface ChatManager()


@end

@implementation ChatManager

-(instancetype)init {
    if (self = [super init]) {
        //设置接收消息代理
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceiveMessageNotification:)
                                                     name:RCKitDispatchMessageNotification
                                                   object:nil];
    }
    return self;
}

-(instancetype)initWithSession:(NIMSession *)session {
    if (self = [self init]) {
        _session = session;

    }
    return self;
}

#pragma mark - 收到消息监听
- (void)didReceiveMessageNotification:(NSNotification *)notification {
    //处理好友请求
    RCMessage *message = notification.object;

    RCIMMessage *model = [RCIMMessage copyRCModel:message];

    NSDictionary *extraDic = nil;
    NSMutableDictionary *mutDic = nil;
    NSLog(@"%@",([UserManager shared].dataArray.firstObject.Id));
    // 处理未读消息
    if ([model.content isKindOfClass:[RCTextMessage class]]) {
        RCTextMessage *textMessage = (RCTextMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        mutDic = [[NSMutableDictionary alloc] initWithDictionary:extraDic];
        mutDic[@"content"] = textMessage.content;

    }
    else if ([model.content isKindOfClass:[RCImageMessage class]]) {
        RCImageMessage *textMessage = (RCImageMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        mutDic = [[NSMutableDictionary alloc] initWithDictionary:extraDic];
        mutDic[@"content"] = textMessage.imageUrl;
    }
    else if ([model.content isKindOfClass:[RCVoiceMessage class]]) {
        RCVoiceMessage *textMessage = (RCVoiceMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        mutDic = [[NSMutableDictionary alloc] initWithDictionary:extraDic];
        mutDic[@"content"] = textMessage.amrBase64Content;
        mutDic[@"contentDuration"] = @(textMessage.duration);
    }
    else if ([model.content isKindOfClass:[RCLocationMessage class]]) {
        RCLocationMessage *textMessage = (RCLocationMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        mutDic = [[NSMutableDictionary alloc] initWithDictionary:extraDic];
        mutDic[@"contentLocationName"] = textMessage.locationName;
        mutDic[@"latitude"] = @(textMessage.location.latitude);
        mutDic[@"longitude"] = @(textMessage.location.longitude);
    }

    model.session = [[NIMSession alloc] init];

    model.extraDic = [NSDictionary dictionaryWithDictionary:extraDic];


    if ([NSString stringWithFormat:@"%@",extraDic[@"TargetType"]].integerValue == 0) {
        model.session.sessionType = NIMSessionTypeP2P;
        model.session.sessionId = extraDic[@"ConversationId"];
        if (![extraDic[@"TargetId"] isEqualToString:[JSExtension shared].myIdentityId]) {
            if (![[UserManager shared].getUserModel.UserID isEqualToString:[JSExtension shared].myIdentityId]) {
                if ([[UserManager shared].getUserModel.UserID isEqualToString:extraDic[@"FromId"]]) { // 用户发送
                    model.messageDirection = MessageDirection_SEND;
                    model.isMySend = YES;
                }
                else {
                    model.messageDirection = MessageDirection_SEND;
                    model.isMySend = NO;
                }
            }
            else {
                model.messageDirection = MessageDirection_RECEIVE;
            }
        }
        else {
            model.messageDirection = MessageDirection_RECEIVE;
        }
    }
    else {
        model.session.sessionType = NIMSessionTypeTeam;
        model.session.sessionId = extraDic[@"ConversationId"];
        if ([extraDic[@"FromCertifyId"] isEqualToString:[JSExtension shared].myIdentityId]) {
            if (![[UserManager shared].getUserModel.UserID isEqualToString:[JSExtension shared].myIdentityId]) {
                if ([[UserManager shared].getUserModel.UserID isEqualToString:extraDic[@"FromId"]]) { // 用户发送
                    model.messageDirection = MessageDirection_SEND;
                    model.isMySend = YES;
                }
                else {
                    model.messageDirection = MessageDirection_SEND;
                    model.isMySend = NO;
                }
            }
            else {
                model.messageDirection = MessageDirection_RECEIVE;
            }
        }
        else {
            model.messageDirection = MessageDirection_RECEIVE;
        }
    }

    if (model.messageDirection == MessageDirection_RECEIVE) {
        model.isOutgoingMsg = NO;
    }
    else {
        model.isOutgoingMsg = YES;
    }

    if ([NSString stringWithFormat:@"%@",extraDic[@"TargetType"]].integerValue == 0) { // 单聊
        if ([extraDic[@"TargetId"] isEqualToString:[UserManager shared].getUserModel.UserID]) {
            if ([[JSExtension shared].myIdentityId isEqualToString:extraDic[@"TargetId"]]) {
                if ([self.session.sessionId isEqualToString:extraDic[@"ConversationId"]]) {
                    if ([_delegate respondsToSelector:@selector(onRecvMessages:)]) {
                        [self.delegate onRecvMessages:model];
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [[DataBaseManager shared] remarkAllReadIdentifyId:[JSExtension shared].myIdentityId conversionId:extraDic[@"ConversationId"]];
                        });
                    }
                }
            }
        }
        else { // 身份收到消息
            if ([[JSExtension shared].myIdentityId isEqualToString:extraDic[@"TargetId"]] || [[JSExtension shared].myIdentityId isEqualToString:extraDic[@"FromCertifyId"]]) {
                if ([[JSExtension shared].myIdentityId isEqualToString:extraDic[@"TargetId"]]) {
                    if ([self.session.sessionId isEqualToString:extraDic[@"ConversationId"]]) {
                        if ([_delegate respondsToSelector:@selector(onRecvMessages:)]) {
                            [self.delegate onRecvMessages:model];
                            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                [[DataBaseManager shared] remarkAllReadIdentifyId:[JSExtension shared].myIdentityId conversionId:extraDic[@"ConversationId"]];
                            });
                        }
                    }

                }
            }
        }
    }
    else {
        if ([NSString stringWithFormat:@"%@",extraDic[@"GType"]].integerValue == 1) { // 公司群群聊
            if ([[JSExtension shared].myIdentityId isEqualToString:[UserManager shared].getUserModel.UserID]) {
                if ([self.session.sessionId isEqualToString:extraDic[@"ConversationId"]]) {
                    if ([_delegate respondsToSelector:@selector(onRecvMessages:)]) {
                        [self.delegate onRecvMessages:model];
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [[DataBaseManager shared] remarkAllReadIdentifyId:[JSExtension shared].myIdentityId conversionId:extraDic[@"ConversationId"]];
                        });
                    }
                }
            }
        }
        else { // 外部群群聊
            if ([[JSExtension shared].myIdentityId isEqualToString:extraDic[@"GMembers"]]) {
                if ([self.session.sessionId isEqualToString:extraDic[@"ConversationId"]]) {
                    if ([_delegate respondsToSelector:@selector(onRecvMessages:)]) {
                        [self.delegate onRecvMessages:model];
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [[DataBaseManager shared] remarkAllReadIdentifyId:[JSExtension shared].myIdentityId conversionId:extraDic[@"ConversationId"]];
                        });
                    }
                }
            }
        }
    }
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }

    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
