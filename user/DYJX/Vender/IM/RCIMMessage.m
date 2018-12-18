//
//  RCIMMessage.m
//  user
//
//  Created by longshiqing on 2018/12/18.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "RCIMMessage.h"

@implementation RCIMMessage

+(instancetype)copyRCModel:(RCMessage *)message {
    RCIMMessage *model = [[RCIMMessage alloc] init];
    model.message = message;
    model.conversationType = message.conversationType;
    model.targetId = message.targetId;
    model.messageId = message.messageId;
    model.messageDirection = message.messageDirection;
    model.senderUserId = message.senderUserId;
    model.receivedStatus = message.receivedStatus;
    model.sentStatus = message.sentStatus;
    model.receivedTime = message.receivedTime;
    model.sentTime = message.sentTime;
    model.objectName = message.objectName;
    model.content = message.content;
    model.extra = message.extra;
    model.messageUId = message.messageUId;
    model.readReceiptInfo = message.readReceiptInfo;
    return model;
}

@end
