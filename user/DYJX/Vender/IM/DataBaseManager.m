//
//  DataBaseManager.m
//  YTKKeyValueStore
//
//  Created by longshiqing on 2018/12/16.
//  Copyright © 2018年 TangQiao. All rights reserved.
//

#import "DataBaseManager.h"
#import "YTKKeyValueStore.h"
#import "JSExtension.h"

#define firstString @"my"
#define lockSemaphore dispatch_semaphore_wait([DataBaseManager shared].semaphore, 5.0)
#define unlockSemaphore dispatch_semaphore_signal([DataBaseManager shared].semaphore)

@interface DataBaseManager()

@property (nonatomic, strong)YTKKeyValueStore *store;

@end

@implementation DataBaseManager

+ (DataBaseManager *)shared {
    static DataBaseManager *singler;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (singler == NULL) {
            singler = [[DataBaseManager alloc] init];
            singler.semaphore = dispatch_semaphore_create(1);
        }
    });
    return singler;
}

-(NSArray *)getModel:(RCIMMessage *)model identifyId:(NSString *)identifyId conversionId:(NSString *)conversionId {
    NSString *tempIdentifyId = [identifyId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    NSString *tempConversionId = [conversionId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:[NSString stringWithFormat:@"%@.db",[UserManager shared].getUserModel.UserID]];
    NSString *tableName = [NSString stringWithFormat:@"%@%@%@",firstString,tempIdentifyId,tempConversionId];
    [store createTableWithName:tableName];
    lockSemaphore;
    NSMutableArray *array = [store getObjectById:tableName fromTable:tableName];
    if (!array || !array.count) {
        array = [[NSMutableArray alloc] init];
    }
    unlockSemaphore;
    return array;
}

-(BOOL)findModel:(RCIMMessage *)model identifyId:(NSString *)identifyId conversionId:(NSString *)conversionId {
    NSString *tempIdentifyId = [identifyId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    NSString *tempConversionId = [conversionId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:[NSString stringWithFormat:@"%@.db",[UserManager shared].getUserModel.UserID]];
    NSString *tableName = [NSString stringWithFormat:@"%@%@%@",firstString,tempIdentifyId,tempConversionId];
    [store createTableWithName:tableName];
    lockSemaphore;
    NSMutableArray *array = [store getObjectById:tableName fromTable:tableName];
    if (array && array.count) {
        array = [array mutableCopy];
    }
    else {
        array = [[NSMutableArray alloc] init];
    }
    NSArray *models = [array copy];
    int count = 0;
    for (NSDictionary *dic in models) {
        if ([dic[@"messageUId"] isEqualToString:model.messageUId]) {
            return YES;
        }
        count++;
    }
    return NO;
    unlockSemaphore;
}


-(void)playModel:(RCIMMessage *)model identifyId:(NSString *)identifyId conversionId:(NSString *)conversionId {
    NSString *tempIdentifyId = [identifyId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    NSString *tempConversionId = [conversionId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:[NSString stringWithFormat:@"%@.db",[UserManager shared].getUserModel.UserID]];
    NSString *tableName = [NSString stringWithFormat:@"%@%@%@",firstString,tempIdentifyId,tempConversionId];
    [store createTableWithName:tableName];
    lockSemaphore;
    NSMutableArray *array = [store getObjectById:tableName fromTable:tableName];
    if (array && array.count) {
        array = [array mutableCopy];
    }
    else {
        array = [[NSMutableArray alloc] init];
    }
    NSArray *models = [array copy];
    int count = 0;
    for (NSDictionary *dic in models) {
        if ([dic[@"messageUId"] isEqualToString:model.messageUId]) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:dic];
            dict[@"isPlayed"] = @(YES);
            [array replaceObjectAtIndex:count withObject:dict];
        }
        count++;
    }

    [store putObject:array withId:tableName intoTable:tableName];
    unlockSemaphore;
}

-(void)insertModel:(RCIMMessage *)model identifyId:(NSString *)identifyId conversionId:(NSString *)conversionId {
    NSString *tempIdentifyId = [identifyId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    NSString *tempConversionId = [conversionId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:[NSString stringWithFormat:@"%@.db",[UserManager shared].getUserModel.UserID]];
    NSString *tableName = [NSString stringWithFormat:@"%@%@%@",firstString,tempIdentifyId,tempConversionId];
    [store createTableWithName:tableName];
    lockSemaphore;
    NSMutableArray *array = [store getObjectById:tableName fromTable:tableName];
    if (array && array.count) {
        array = [array mutableCopy];
    }
    else {
        array = [[NSMutableArray alloc] init];
    }
    [array addObject:[self fromModel:model]];
    if (array.count >= 2) { // 去重
        for (int j = 0; j < array.count - 1; j++) {
            NSDictionary *someDic = [array objectAtIndex:j];
            if ([someDic[@"messageUId"] isEqualToString:array.lastObject[@"messageUId"]]) {
                [array removeObjectAtIndex:j];
            }
        }
    }

//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:XY_IM_InsertModel object:model];
//    });
    [store putObject:array withId:tableName intoTable:tableName];
    [self saveUnreadConversionId:tempConversionId byIdentityId:tempIdentifyId]; // 标记未读
    unlockSemaphore;
}

-(void)delegateModel:(RCIMMessage *)model identifyId:(NSString *)identifyId conversionId:(NSString *)conversionId {
    NSString *tempIdentifyId = [identifyId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    NSString *tempConversionId = [conversionId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:[NSString stringWithFormat:@"%@.db",[UserManager shared].getUserModel.UserID]];
    NSString *tableName = [NSString stringWithFormat:@"%@%@%@",firstString,tempIdentifyId,tempConversionId];
    [store createTableWithName:tableName];
    lockSemaphore;
    NSMutableArray *array = [store getObjectById:tableName fromTable:tableName];

    if (array && array.count) {
        array = [array mutableCopy];
    }
    else {
        array = [[NSMutableArray alloc] init];
    }
    NSArray *models = [array copy];
    int count = 0;
    for (NSDictionary *dic in models) {
        if ([dic[@"messageUId"] isEqualToString:model.messageUId]) {
            [array removeObjectAtIndex:count];
        }
        count++;
    }
    [store putObject:array withId:tableName intoTable:tableName];
    unlockSemaphore;
}
-(void)saveUnreadConversionId:(NSString *)conversionId byIdentityId:(NSString *)identityId {
    NSString *tempIdentifyId = [identityId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    NSString *tempConversionId = [conversionId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:[NSString stringWithFormat:@"%@.db",[UserManager shared].getUserModel.UserID]];
    NSString *tableName = [NSString stringWithFormat:@"%@%@",firstString,tempIdentifyId];
    [store createTableWithName:tableName];
    lockSemaphore;
    NSMutableDictionary *dictory = [store getObjectById:tempIdentifyId fromTable:tableName];
    if (dictory && dictory.count) {
        dictory = [dictory mutableCopy];
    }
    else {
        dictory = [[NSMutableDictionary alloc] init];
    }
    if (dictory[tempConversionId]) { // 存在
        long long unreadCount = [NSString stringWithFormat:@"%@",dictory[tempConversionId]].longLongValue;
        unreadCount++;
        dictory[tempConversionId] = @(unreadCount);
    }
    else {
        dictory[tempConversionId] = @(1);
    }
    NSLog(@"%@",dictory);
    [store putObject:dictory withId:tempIdentifyId intoTable:tableName];
    unlockSemaphore;
}

-(void)remarkAllReadIdentifyId:(NSString *)identifyId conversionId:(NSString *)conversionId {
    NSString *tempIdentifyId = [identifyId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    NSString *tempConversionId = [conversionId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:[NSString stringWithFormat:@"%@.db",[UserManager shared].getUserModel.UserID]];
    NSString *tableName = [NSString stringWithFormat:@"%@%@",firstString,tempIdentifyId];
    [store createTableWithName:tableName];
    lockSemaphore;
    NSMutableDictionary *dictory = [store getObjectById:tempIdentifyId fromTable:tableName];
    if (dictory && dictory.count) {
        dictory = [dictory mutableCopy];
    }
    else {
        dictory = [[NSMutableDictionary alloc] init];
    }
    dictory[tempConversionId] = @(0);
    [store putObject:dictory withId:tempIdentifyId intoTable:tableName];
    unlockSemaphore;
    [[NSNotificationCenter defaultCenter] postNotificationName:XY_IM_AlreadRead object:nil];
}

-(NSDictionary *)fromModel:(RCIMMessage *)message {
    NSMutableDictionary *dictory = [[NSMutableDictionary alloc] init];
    dictory[@"sendTime"] = @(message.sentTime);
    dictory[@"receivedTime"] = @(message.receivedTime);
    if (message.amrBase64Content.length) {
        dictory[@"amrBase64Content"] = message.amrBase64Content;
    }
    if (message.LocalPath.length) {
        dictory[@"LocalPath"] = message.LocalPath;
    }
    dictory[@"isMySend"] = @(message.isMySend);
    dictory[@"isPlayed"] = @(message.isPlayed);
    dictory[@"isOutgoingMsg"] = @(message.isOutgoingMsg);
    dictory[@"conversionId"] = message.conversionId;
    if (message.conversationType == ConversationType_GROUP) {
        dictory[@"conversationType"] = @1; // 组聊
    }
    else {
        dictory[@"conversationType"] = @0;
    }
    dictory[@"targetId"] = message.targetId;
    dictory[@"messageId"] = @(message.messageId);
    dictory[@"senderUserId"] = message.senderUserId;
    if (message.receivedStatus == ReceivedStatus_UNREAD) {
        dictory[@"receivedStatus"] = @0; // 未读
    }
    else {
        dictory[@"receivedStatus"] = @1;
    }
    dictory[@"sentStatus"] = @(message.sentStatus);
    dictory[@"objectName"] = message.objectName;
    NSDictionary *extraDic = nil;
    //  针对content的解析
    if ([message.content isKindOfClass:[RCTextMessage class]]) {
        RCTextMessage *textMessage = (RCTextMessage *)(message.content);
        dictory[@"content"] = textMessage.content;
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        dictory[@"extraId"] = extraDic[@"Id"];
        dictory[@"extraConversationId"] = extraDic[@"ConversationId"];
        dictory[@"extraFromId"] = extraDic[@"FromId"];
        dictory[@"extraFromName"] = extraDic[@"FromName"];
        dictory[@"extraFromHeadImg"] = extraDic[@"FromHeadImg"];
        dictory[@"extraFromCertifyId"] = extraDic[@"FromCertifyId"];
        dictory[@"extraFromCertifyName"] = extraDic[@"FromCertifyName"];
        dictory[@"extraFromCertifyHeadImg"] = extraDic[@"FromCertifyHeadImg"];
        dictory[@"extraTargetId"] = extraDic[@"TargetId"];
        dictory[@"extraTargetName"] = extraDic[@"TargetName"];
        dictory[@"extraTargetHeadImg"] = extraDic[@"TargetHeadImg"];
        dictory[@"extraTargetType"] = extraDic[@"TargetType"];
        dictory[@"extraGType"] = extraDic[@"GType"];
        dictory[@"extraGMembers"] = extraDic[@"GMembers"];
        dictory[@"extraMessageType"] = extraDic[@"MessageType"];
        dictory[@"extraImKey"] = extraDic[@"ImKey"];
        dictory[@"extraKeywords"] = extraDic[@"Keywords"];
        dictory[@"extraMsgTime"] = extraDic[@"MsgTime"];
    }
    else if ([message.content isKindOfClass:[RCImageMessage class]]) {
        RCImageMessage *textMessage = (RCImageMessage *)(message.content);
        dictory[@"content"] = textMessage.imageUrl;
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        dictory[@"extraId"] = extraDic[@"Id"];
        dictory[@"extraConversationId"] = extraDic[@"ConversationId"];
        dictory[@"extraFromId"] = extraDic[@"FromId"];
        dictory[@"extraFromName"] = extraDic[@"FromName"];
        dictory[@"extraFromHeadImg"] = extraDic[@"FromHeadImg"];
        dictory[@"extraFromCertifyId"] = extraDic[@"FromCertifyId"];
        dictory[@"extraFromCertifyName"] = extraDic[@"FromCertifyName"];
        dictory[@"extraFromCertifyHeadImg"] = extraDic[@"FromCertifyHeadImg"];
        dictory[@"extraTargetId"] = extraDic[@"TargetId"];
        dictory[@"extraTargetName"] = extraDic[@"TargetName"];
        dictory[@"extraTargetHeadImg"] = extraDic[@"TargetHeadImg"];
        dictory[@"extraTargetType"] = extraDic[@"TargetType"];
        dictory[@"extraGType"] = extraDic[@"GType"];
        dictory[@"extraGMembers"] = extraDic[@"GMembers"];
        dictory[@"extraMessageType"] = extraDic[@"MessageType"];
        dictory[@"extraImKey"] = extraDic[@"ImKey"];
        dictory[@"extraKeywords"] = extraDic[@"Keywords"];
        dictory[@"extraMsgTime"] = extraDic[@"MsgTime"];
        dictory[@"width"] = @(message.imageSize.width);
        dictory[@"height"] = @(message.imageSize.height);
    }
    else if ([message.content isKindOfClass:[RCVoiceMessage class]]) {
        RCVoiceMessage *textMessage = (RCVoiceMessage *)(message.content);
        dictory[@"content"] = textMessage.amrBase64Content;
        dictory[@"contentDuration"] = @(textMessage.duration);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        dictory[@"extraId"] = extraDic[@"Id"];
        dictory[@"extraConversationId"] = extraDic[@"ConversationId"];
        dictory[@"extraFromId"] = extraDic[@"FromId"];
        dictory[@"extraFromName"] = extraDic[@"FromName"];
        dictory[@"extraFromHeadImg"] = extraDic[@"FromHeadImg"];
        dictory[@"extraFromCertifyId"] = extraDic[@"FromCertifyId"];
        dictory[@"extraFromCertifyName"] = extraDic[@"FromCertifyName"];
        dictory[@"extraFromCertifyHeadImg"] = extraDic[@"FromCertifyHeadImg"];
        dictory[@"extraTargetId"] = extraDic[@"TargetId"];
        dictory[@"extraTargetName"] = extraDic[@"TargetName"];
        dictory[@"extraTargetHeadImg"] = extraDic[@"TargetHeadImg"];
        dictory[@"extraTargetType"] = extraDic[@"TargetType"];
        dictory[@"extraGType"] = extraDic[@"GType"];
        dictory[@"extraGMembers"] = extraDic[@"GMembers"];
        dictory[@"extraMessageType"] = extraDic[@"MessageType"];
        dictory[@"extraImKey"] = extraDic[@"ImKey"];
        dictory[@"extraKeywords"] = extraDic[@"Keywords"];
        dictory[@"extraMsgTime"] = extraDic[@"MsgTime"];
    }
    else if ([message.content isKindOfClass:[RCLocationMessage class]]) {
        RCLocationMessage *textMessage = (RCLocationMessage *)(message.content);
        dictory[@"contentLocationName"] = textMessage.locationName;
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        dictory[@"latitude"] = @(textMessage.location.latitude);
        dictory[@"longitude"] = @(textMessage.location.longitude);
        dictory[@"extraId"] = extraDic[@"Id"];
        dictory[@"extraConversationId"] = extraDic[@"ConversationId"];
        dictory[@"extraFromId"] = extraDic[@"FromId"];
        dictory[@"extraFromName"] = extraDic[@"FromName"];
        dictory[@"extraFromHeadImg"] = extraDic[@"FromHeadImg"];
        dictory[@"extraFromCertifyId"] = extraDic[@"FromCertifyId"];
        dictory[@"extraFromCertifyName"] = extraDic[@"FromCertifyName"];
        dictory[@"extraFromCertifyHeadImg"] = extraDic[@"FromCertifyHeadImg"];
        dictory[@"extraTargetId"] = extraDic[@"TargetId"];
        dictory[@"extraTargetName"] = extraDic[@"TargetName"];
        dictory[@"extraTargetHeadImg"] = extraDic[@"TargetHeadImg"];
        dictory[@"extraTargetType"] = extraDic[@"TargetType"];
        dictory[@"extraGType"] = extraDic[@"GType"];
        dictory[@"extraGMembers"] = extraDic[@"GMembers"];
        dictory[@"extraMessageType"] = extraDic[@"MessageType"];
        dictory[@"extraImKey"] = extraDic[@"ImKey"];
        dictory[@"extraKeywords"] = extraDic[@"Keywords"];
        dictory[@"extraMsgTime"] = extraDic[@"MsgTime"];
    }
    dictory[@"messageUId"] = message.messageUId;

    if ([NSString stringWithFormat:@"%@",extraDic[@"TargetType"]].integerValue == 0) {
        if (![extraDic[@"TargetId"] isEqualToString:[JSExtension shared].myIdentityId]) {
            if (![[UserManager shared].getUserModel.UserID isEqualToString:[JSExtension shared].myIdentityId]) {
                if ([[UserManager shared].getUserModel.UserID isEqualToString:extraDic[@"FromId"]]) { // 用户发送
                    dictory[@"messageDirection"] = @(MessageDirection_SEND);
                    dictory[@"mySend"] = @(1);
                }
                else {
                    dictory[@"messageDirection"] = @(MessageDirection_SEND);
                    dictory[@"mySend"] = @(0);
                }
            }
            else {
                dictory[@"messageDirection"] = @(MessageDirection_RECEIVE);
            }
        }
        else {
            dictory[@"messageDirection"] = @(MessageDirection_RECEIVE);

        }
    }
    else {
        if ([extraDic[@"FromCertifyId"] isEqualToString:[JSExtension shared].myIdentityId]) {
            if (![[UserManager shared].getUserModel.UserID isEqualToString:[JSExtension shared].myIdentityId]) {
                if ([[UserManager shared].getUserModel.UserID isEqualToString:extraDic[@"FromId"]]) { // 用户发送
                    dictory[@"messageDirection"] = @(MessageDirection_SEND);
                    dictory[@"mySend"] = @(1);
                }
                else {
                    dictory[@"messageDirection"] = @(MessageDirection_SEND);
                    dictory[@"mySend"] = @(0);
                }
            }
            else {
                dictory[@"messageDirection"] = @(MessageDirection_RECEIVE);
            }
        }
        else {
            dictory[@"messageDirection"] = @(MessageDirection_RECEIVE);
        }
    }

    dictory[@"sentStatus"] = @(message.sentStatus);
    dictory[@"deliveryState"] = @(message.deliveryState);

    dictory[@"isReceiptRequestMessage"] = @(message.readReceiptInfo.isReceiptRequestMessage);
    dictory[@"hasRespond"] = @(message.readReceiptInfo.hasRespond);
    dictory[@"userIdList"] = message.readReceiptInfo.userIdList;
    return dictory;
}

-(NSInteger)unreadCountIdentifyId:(NSString *)identifyId conversionId:(NSString *)conversionId {
    NSString *tempIdentifyId = [identifyId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    NSString *tempConversionId = [conversionId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:[NSString stringWithFormat:@"%@.db",[UserManager shared].getUserModel.UserID]];
    long count = 0;
    lockSemaphore;
    NSString *tableName = [NSString stringWithFormat:@"%@%@",firstString,tempIdentifyId];
    [store createTableWithName:tableName];
    NSMutableDictionary *dictory = [store getObjectById:tempIdentifyId fromTable:tableName];
    if (dictory[tempConversionId]) {
        count += [NSString stringWithFormat:@"%@",dictory[tempConversionId]].longValue;
    }
    unlockSemaphore;
    return count;
}

-(NSInteger)unreadCountIdentifyId:(NSString *)identifyId {
    NSString *tempIdentifyId = [identifyId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:[NSString stringWithFormat:@"%@.db",[UserManager shared].getUserModel.UserID]];
    long count = 0;
    lockSemaphore;
    NSString *tableName = [NSString stringWithFormat:@"%@%@",firstString,tempIdentifyId];
    [store createTableWithName:tableName];
    NSMutableDictionary *dictory = [store getObjectById:tempIdentifyId fromTable:tableName];
    for (NSString *identId in dictory.allKeys) {
        NSString *tempyId = [identId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
        if (dictory[tempyId]) {
            count += [NSString stringWithFormat:@"%@",dictory[tempyId]].longValue;
        }
    }
    unlockSemaphore;
    return count;
}

-(NSInteger)allUnreadCount {
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:[NSString stringWithFormat:@"%@.db",[UserManager shared].getUserModel.UserID]];
    long count = 0;
    lockSemaphore;
    for (DYJXIdentitySwitchingModel *model in [UserManager shared].dataArray) {
        NSString *tempIdentifyId = [model.Id stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
        NSString *tableName = [NSString stringWithFormat:@"%@%@",firstString,tempIdentifyId];
        [store createTableWithName:tableName];
        NSMutableDictionary *dictory = [store getObjectById:tempIdentifyId fromTable:tableName];
        for (NSString *identifyId in dictory.allKeys) {
            NSString *tempyId = [identifyId stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
            if (dictory[tempyId]) {
                count += [NSString stringWithFormat:@"%@",dictory[tempyId]].longValue;
            }
        }
    }
    unlockSemaphore;
    return count;
}

-(NSString *)getKey:(RCMessage *)message {
    return [NSString stringWithFormat:@"%lld",message.receivedTime];
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
