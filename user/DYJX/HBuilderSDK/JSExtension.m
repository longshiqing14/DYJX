//
//  JSExtension.m
//  user
//
//  Created by longshiqing on 2018/11/14.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JSExtension.h"

@implementation JSExtension

+ (JSExtension *)shared{
    static JSExtension *singler;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (singler == NULL) {
            singler = [[JSExtension alloc] init];
            singler.semaphore = dispatch_semaphore_create(1);
        }
    });
    return singler;
}

+(NSString*)getCertificateId {
    return [[JSExtension shared] myIdentityId];
}
+(NSString *)getClientId {
    return [[JSExtension shared] myClientId];
}
+(void)plusBack{
    [[XYCommon getCurrentVC].navigationController popViewControllerAnimated:YES];
}

- (NSArray<NIMMessageModel *> *)modelsWithMessages:(NSArray<RCIMMessage *> *)messages
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NIMMessage *message in messages) {
        NIMMessageModel *model = [[NIMMessageModel alloc] initWithMessage:message];
        [array addObject:model];
    }
    return array;
}


-(RCIMMessage *)changeObject:(RCIMMessage *)model {
    NSDictionary *extraDic = nil;
    // 处理未读消息
    if ([model.content isKindOfClass:[RCTextMessage class]]) {
        RCTextMessage *textMessage = (RCTextMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
    }
    else if ([model.content isKindOfClass:[RCImageMessage class]]) {
        RCImageMessage *textMessage = (RCImageMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        NIMImageObject *imageObject = [[NIMImageObject alloc] initWithFilepath:model.LocalPath];
        NSData *data = [NSData dataWithContentsOfFile:model.LocalPath];
        model.image = [UIImage imageWithData:data];
        if (!model.image) {
            model.image = [UIImage imageNamed:@"dyjx_default_img"];
        }
        imageObject.size = model.image.size;
        model.messageObject = imageObject;
    }
    else if ([model.content isKindOfClass:[RCVoiceMessage class]]) {
        RCVoiceMessage *textMessage = (RCVoiceMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
//        NSString *path = [self getPathFromModel:model identifyId:[JSExtension shared].myIdentityId conversationId:extraDic[@"ConversationId"]];
        NIMAudioObject *imageObject = [[NIMAudioObject alloc] initWithSourcePath:model.LocalPath];
        imageObject.duration = textMessage.duration;
        model.messageObject = imageObject;
    }
    else if ([model.content isKindOfClass:[RCLocationMessage class]]) {
        RCLocationMessage *textMessage = (RCLocationMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
    }
    else {
        RCMessage *textMessage = (RCMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        model.sentTime = 0;
        model.receivedTime = 0;
    }

    return model;
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

-(NSArray<RCIMMessage *> *)dataArray {
    NSArray *dictorys = [[DataBaseManager shared] getModel:[RCIMMessage new] identifyId:self.myIdentityId conversionId:self.conversionId];
    return [self fromDictory:dictorys];
}

//-(NSArray<NIMMessageModel *> *)dataArray {
//    NSArray *dictorys = [[DataBaseManager shared] getModel:[RCIMMessage new] identifyId:self.myIdentityId conversionId:self.conversionId];
//    return [self fromDictory:dictorys];
////    return [self modelsWithMessages:[self fromDictory:dictorys]];
//}


-(NSArray< RCIMMessage *> *)fromDictory:(NSArray <NSDictionary * > *)dictorys {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i < dictorys.count; i++) {
        NSDictionary *dictory = dictorys[i];
        RCIMMessage *message = [[RCIMMessage alloc] init];
        message.sentTime = [NSString stringWithFormat:@"%@",dictory[@"sendTime"]].longLongValue;
        message.receivedTime = [NSString stringWithFormat:@"%@",dictory[@"receivedTime"]].longLongValue;
        message.amrBase64Content = dictory[@"amrBase64Content"];
        message.LocalPath = dictory[@"LocalPath"];
        message.isMySend = [NSString stringWithFormat:@"%@",dictory[@"isMySend"]].boolValue;
        message.isPlayed = [NSString stringWithFormat:@"%@",dictory[@"isPlayed"]].boolValue;
        message.isOutgoingMsg = [NSString stringWithFormat:@"%@",dictory[@"isOutgoingMsg"]].boolValue;
        message.isOutgoingMsg = [NSString stringWithFormat:@"%@",dictory[@"isOutgoingMsg"]].boolValue;
        message.conversionId = dictory[@"conversionId"];
        if ([NSString stringWithFormat:@"%@",dictory[@"conversationType"]].integerValue == 0) {
            message.conversationType = ConversationType_PRIVATE;
        }
        else {
            message.conversationType = ConversationType_GROUP;
        }
        message.targetId = dictory[@"targetId"];
        message.messageId = [NSString stringWithFormat:@"%@",dictory[@"messageId"]].longValue;
        message.senderUserId = dictory[@"senderUserId"];
        if ([NSString stringWithFormat:@"%@",dictory[@"receivedStatus"]].integerValue == 0) {
            message.receivedStatus = ReceivedStatus_UNREAD;
        }
        else {
            message.receivedStatus = ReceivedStatus_READ;
        }
        message.sentStatus = [NSString stringWithFormat:@"%@",dictory[@"sentStatus"]].integerValue;
        message.objectName = dictory[@"objectName"];

        NSMutableDictionary *extraDic = [[NSMutableDictionary alloc] init];

        if ([NSString stringWithFormat:@"%@",dictory[@"extraMessageType"]].integerValue == 0) {
            RCTextMessage *textMessage = [[RCTextMessage alloc] init];
            textMessage.content = dictory[@"content"];
            extraDic[@"Id"] = dictory[@"extraId"];
            extraDic[@"ConversationId"] = dictory[@"extraConversationId"];
            extraDic[@"FromId"] = dictory[@"extraFromId"];
            extraDic[@"FromName"] = dictory[@"extraFromName"];
            extraDic[@"FromHeadImg"] = dictory[@"extraFromHeadImg"];
            extraDic[@"FromCertifyId"] = dictory[@"extraFromCertifyId"];
            extraDic[@"FromCertifyName"] = dictory[@"extraFromCertifyName"];
            extraDic[@"FromCertifyHeadImg"] = dictory[@"extraFromCertifyHeadImg"];
            extraDic[@"TargetId"] = dictory[@"extraTargetId"];
            extraDic[@"TargetName"] = dictory[@"extraTargetName"];
            extraDic[@"TargetHeadImg"] = dictory[@"extraTargetHeadImg"];
            extraDic[@"TargetType"] = dictory[@"extraTargetType"];
            extraDic[@"GType"] = dictory[@"extraGType"];
            extraDic[@"GMembers"] = dictory[@"extraGMembers"];
            extraDic[@"MessageType"] = dictory[@"extraMessageType"];
            extraDic[@"ImKey"] = dictory[@"extraImKey"];
            extraDic[@"Keywords"] = dictory[@"extraKeywords"];
            extraDic[@"MsgTime"] = dictory[@"extraMsgTime"];
            textMessage.extra = extraDic.mj_JSONString;
            message.content = textMessage;
            message.extraDic = extraDic;
        }
        else  if ([NSString stringWithFormat:@"%@",dictory[@"extraMessageType"]].integerValue == 1) {
            RCImageMessage *textMessage = [[RCImageMessage alloc] init];
            message.imageSize = CGSizeMake([NSString stringWithFormat:@"%@",dictory[@"width"]].floatValue, [NSString stringWithFormat:@"%@",dictory[@"height"]].floatValue);
            textMessage.imageUrl = dictory[@"content"];
            if (message.LocalPath.length) {
                message.image = [UIImage imageWithContentsOfFile:message.LocalPath];
            }
            extraDic[@"Id"] = dictory[@"extraId"];
            extraDic[@"ConversationId"] = dictory[@"extraConversationId"];
            extraDic[@"FromId"] = dictory[@"extraFromId"];
            extraDic[@"FromName"] = dictory[@"extraFromName"];
            extraDic[@"FromHeadImg"] = dictory[@"extraFromHeadImg"];
            extraDic[@"FromCertifyId"] = dictory[@"extraFromCertifyId"];
            extraDic[@"FromCertifyName"] = dictory[@"extraFromCertifyName"];
            extraDic[@"FromCertifyHeadImg"] = dictory[@"extraFromCertifyHeadImg"];
            extraDic[@"TargetId"] = dictory[@"extraTargetId"];
            extraDic[@"TargetName"] = dictory[@"extraTargetName"];
            extraDic[@"TargetHeadImg"] = dictory[@"extraTargetHeadImg"];
            extraDic[@"TargetType"] = dictory[@"extraTargetType"];
            extraDic[@"GType"] = dictory[@"extraGType"];
            extraDic[@"GMembers"] = dictory[@"extraGMembers"];
            extraDic[@"MessageType"] = dictory[@"extraMessageType"];
            extraDic[@"ImKey"] = dictory[@"extraImKey"];
            extraDic[@"Keywords"] = dictory[@"extraKeywords"];
            extraDic[@"MsgTime"] = dictory[@"extraMsgTime"];
            textMessage.extra = extraDic.mj_JSONString;
            message.content = textMessage;
            message.extraDic = extraDic;
        }
        else  if ([NSString stringWithFormat:@"%@",dictory[@"extraMessageType"]].integerValue == 3) {
            RCVoiceMessage *textMessage = [[RCVoiceMessage alloc] init];
            message.amrBase64Content = dictory[@"content"];
            textMessage.duration = [NSString stringWithFormat:@"%@",dictory[@"contentDuration"]].longValue;
            extraDic[@"Id"] = dictory[@"extraId"];
            extraDic[@"ConversationId"] = dictory[@"extraConversationId"];
            extraDic[@"FromId"] = dictory[@"extraFromId"];
            extraDic[@"FromName"] = dictory[@"extraFromName"];
            extraDic[@"FromHeadImg"] = dictory[@"extraFromHeadImg"];
            extraDic[@"FromCertifyId"] = dictory[@"extraFromCertifyId"];
            extraDic[@"FromCertifyName"] = dictory[@"extraFromCertifyName"];
            extraDic[@"FromCertifyHeadImg"] = dictory[@"extraFromCertifyHeadImg"];
            extraDic[@"TargetId"] = dictory[@"extraTargetId"];
            extraDic[@"TargetName"] = dictory[@"extraTargetName"];
            extraDic[@"TargetHeadImg"] = dictory[@"extraTargetHeadImg"];
            extraDic[@"TargetType"] = dictory[@"extraTargetType"];
            extraDic[@"GType"] = dictory[@"extraGType"];
            extraDic[@"GMembers"] = dictory[@"extraGMembers"];
            extraDic[@"MessageType"] = dictory[@"extraMessageType"];
            extraDic[@"ImKey"] = dictory[@"extraImKey"];
            extraDic[@"Keywords"] = dictory[@"extraKeywords"];
            extraDic[@"MsgTime"] = dictory[@"extraMsgTime"];
            textMessage.extra = extraDic.mj_JSONString;
            message.content = textMessage;
            message.extraDic = extraDic;
        }
        else  if ([NSString stringWithFormat:@"%@",dictory[@"extraMessageType"]].integerValue == 4 || [NSString stringWithFormat:@"%@",dictory[@"extraMessageType"]].integerValue == 5) {
            RCLocationMessage *textMessage = [[RCLocationMessage alloc] init];
            textMessage.locationName = dictory[@"contentLocationName"];
            textMessage.location = CLLocationCoordinate2DMake([NSString stringWithFormat:@"%@",dictory[@"latitude"]].doubleValue, [NSString stringWithFormat:@"%@",dictory[@"longitude"]].doubleValue);
            extraDic[@"Id"] = dictory[@"extraId"];
            extraDic[@"ConversationId"] = dictory[@"extraConversationId"];
            extraDic[@"FromId"] = dictory[@"extraFromId"];
            extraDic[@"FromName"] = dictory[@"extraFromName"];
            extraDic[@"FromHeadImg"] = dictory[@"extraFromHeadImg"];
            extraDic[@"FromCertifyId"] = dictory[@"extraFromCertifyId"];
            extraDic[@"FromCertifyName"] = dictory[@"extraFromCertifyName"];
            extraDic[@"FromCertifyHeadImg"] = dictory[@"extraFromCertifyHeadImg"];
            extraDic[@"TargetId"] = dictory[@"extraTargetId"];
            extraDic[@"TargetName"] = dictory[@"extraTargetName"];
            extraDic[@"TargetHeadImg"] = dictory[@"extraTargetHeadImg"];
            extraDic[@"TargetType"] = dictory[@"extraTargetType"];
            extraDic[@"GType"] = dictory[@"extraGType"];
            extraDic[@"GMembers"] = dictory[@"extraGMembers"];
            extraDic[@"MessageType"] = dictory[@"extraMessageType"];
            extraDic[@"ImKey"] = dictory[@"extraImKey"];
            extraDic[@"Keywords"] = dictory[@"extraKeywords"];
            extraDic[@"MsgTime"] = dictory[@"extraMsgTime"];
            textMessage.extra = extraDic.mj_JSONString;
            message.content = textMessage;
            message.extraDic = extraDic;
        }
        else {
            RCMessage *textMessage = [[RCMessage alloc] init];
            extraDic[@"Id"] = dictory[@"extraId"];
            extraDic[@"ConversationId"] = dictory[@"extraConversationId"];
            extraDic[@"FromId"] = dictory[@"extraFromId"];
            extraDic[@"FromName"] = dictory[@"extraFromName"];
            extraDic[@"FromHeadImg"] = dictory[@"extraFromHeadImg"];
            extraDic[@"FromCertifyId"] = dictory[@"extraFromCertifyId"];
            extraDic[@"FromCertifyName"] = dictory[@"extraFromCertifyName"];
            extraDic[@"FromCertifyHeadImg"] = dictory[@"extraFromCertifyHeadImg"];
            extraDic[@"TargetId"] = dictory[@"extraTargetId"];
            extraDic[@"TargetName"] = dictory[@"extraTargetName"];
            extraDic[@"TargetHeadImg"] = dictory[@"extraTargetHeadImg"];
            extraDic[@"TargetType"] = dictory[@"extraTargetType"];
            extraDic[@"GType"] = dictory[@"extraGType"];
            extraDic[@"GMembers"] = dictory[@"extraGMembers"];
            extraDic[@"MessageType"] = dictory[@"extraMessageType"];
            extraDic[@"ImKey"] = dictory[@"extraImKey"];
            extraDic[@"Keywords"] = dictory[@"extraKeywords"];
            extraDic[@"MsgTime"] = dictory[@"extraMsgTime"];
            textMessage.extra = extraDic.mj_JSONString;
            message.content = textMessage;
            message.extraDic = extraDic;
        }
        message.messageUId = dictory[@"messageUId"];

        if ([NSString stringWithFormat:@"%@",dictory[@"messageDirection"]].integerValue == 1) {
            message.messageDirection = MessageDirection_SEND;
        }
        else {
            message.messageDirection = MessageDirection_RECEIVE;
        }

//        if ([NSString stringWithFormat:@"%@",dictory[@"mySend"]].integerValue == 1) {
//            message.isMySend = YES;
//        }
//        else {
//            message.isMySend = NO;
//        }

        message.readReceiptInfo.isReceiptRequestMessage = [NSString stringWithFormat:@"%@",dictory[@"isReceiptRequestMessage"]].boolValue;
        message.readReceiptInfo.hasRespond = [NSString stringWithFormat:@"%@",dictory[@"hasRespond"]].boolValue;
        message.readReceiptInfo.userIdList = dictory[@"userIdList"];

        message.sentStatus = [NSString stringWithFormat:@"%@",dictory[@"sentStatus"]].integerValue;
        message.deliveryState = [NSString stringWithFormat:@"%@",dictory[@"deliveryState"]].integerValue;

        [array addObject:[self changeObject:message]];
    }
    return array;
}

@end
