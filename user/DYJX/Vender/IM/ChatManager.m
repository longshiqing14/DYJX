//
//  ChatManager.m
//  user
//
//  Created by longshiqing on 2018/12/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "ChatManager.h"
#import "JSExtension.h"
#import "IMSDK.h"
#import "DYJXSendMsgReq.h"
#import "DYJXData.h"

@interface ChatManager()


@end

@implementation ChatManager

-(instancetype)init {
    if (self = [super init]) {
        //设置接收消息代理
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceiveMessageNotification:)
                                                     name:XY_IM_InsertModel
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

-(RCIMMessage *)defaultSendMessage:(NSInteger)type sendObject:(id)sender {
    RCIMMessage *message = [[RCIMMessage alloc] init];
    message.isMySend = YES;
    message.isPlayed = YES;
    message.isOutgoingMsg = YES;
    if([JSExtension shared].type == 0) {
        message.conversationType = ConversationType_PRIVATE;
    }
    else {
        message.conversationType = ConversationType_GROUP;
    }
    message.session = [JSExtension shared].session;
    message.session.sessionId = [JSExtension shared].targetId;
    message.conversionId = [JSExtension shared].conversionId;
    message.targetId = [JSExtension shared].targetId;
    message.messageDirection = MessageDirection_SEND;
    message.senderUserId = [UserManager shared].getUserModel.UserID;
    message.sentStatus = SentStatus_SENDING;
    message.deliveryState = NIMMessageDeliveryStateDelivering;
    NSArray *types = @[@"RC:TxtMsg",@"RC:ImgMsg",@"RC:FileMsg",@"RC:VcMsg",@"RC:LBSMsg",@"DY:LBS",@"DY:Cancel"];
    NSMutableDictionary *dictory = [[NSMutableDictionary alloc] init];
    if ([JSExtension shared].conversionId.length) {
        dictory[@"ConversationId"] = [JSExtension shared].conversionId;
    }
    if ([UserManager shared].getUserModel.UserID.length) {
        dictory[@"FromId"] = [UserManager shared].getUserModel.UserID;
    }
    if ([UserManager shared].getUserModel.Result.UserName.length) {
        dictory[@"FromName"] = [UserManager shared].getUserModel.Result.DisplayName;
    }
    if ([[UserManager shared].getUserModel.Result.Business.IMInfo.HeadImgUrl XYImageURL].length) {
        dictory[@"FromHeadImg"] = [[UserManager shared].getUserModel.Result.Business.IMInfo.HeadImgUrl XYImageURL];
    }
    if ([JSExtension shared].myIdentityId.length) {
        dictory[@"FromCertifyId"] = [JSExtension shared].myIdentityId;
    }
    if ([UserManager shared].swichModel.GroupName.length) {
        dictory[@"FromCertifyName"] = [UserManager shared].swichModel.GroupName;
    }
    if ([UserManager shared].swichModel.GroupHeadImg.length) {
        dictory[@"FromCertifyHeadImg"] = [UserManager shared].swichModel.GroupHeadImg;
    }
    if ([JSExtension shared].targetId.length) {
        dictory[@"TargetId"] = [JSExtension shared].targetId;
    }
    if ([JSExtension shared].targetName.length) {
        dictory[@"TargetName"] = [JSExtension shared].targetName;
    }
    if ([JSExtension shared].targetImg.length) {
        dictory[@"TargetHeadImg"] = [JSExtension shared].targetImg;
    }
    dictory[@"TargetType"] = [JSExtension shared].type ? @(1) : @(0);
    dictory[@"MessageType"] = @(type);
    dictory[@"ImKey"] = @"RongCloud";
    message.objectName = type < 7 ? types[type] : @"";
    if (type == 0) {
        RCTextMessage *textMessage = [[RCTextMessage alloc] init];
        textMessage.content = (NSString *)sender; // 待取值
        dictory[@"Keywords"] = (NSString *)sender;
        textMessage.extra = dictory.mj_JSONString;
        message.content = textMessage;
    }
    else if (type == 1) {
        RCImageMessage *textMessage = [[RCImageMessage alloc] init];
        message.image = (UIImage *)sender;
        message.imageSize = message.image.size;
        textMessage.extra = dictory.mj_JSONString;
        message.content = textMessage;
    }
    else if (type == 3) {
        RCVoiceMessage *textMessage = [[RCVoiceMessage alloc] init];
        NSData *data = [NSData dataWithContentsOfFile:(NSString *)sender];
        message.amrBase64Content = [data base64EncodedStringWithOptions:0];
        textMessage.extra = dictory.mj_JSONString;
        message.content = textMessage;
        message.LocalPath = (NSString *)sender;
    }
    else if (type == 4 ) {
        RCLocationMessage *textMessage = [[RCLocationMessage alloc] init];
        NSArray *array = (NSArray *)sender;
        message.location = CLLocationCoordinate2DMake([NSString stringWithFormat:@"%@",array.firstObject].doubleValue, [NSString stringWithFormat:@"%@",array.lastObject].doubleValue);
        textMessage.extra = dictory.mj_JSONString;
        message.content = textMessage;
    }
    else if (type == 5 ) {
        RCLocationMessage *textMessage = [[RCLocationMessage alloc] init];
        NSArray *array = (NSArray *)sender;
        message.location = CLLocationCoordinate2DMake([NSString stringWithFormat:@"%@",array.firstObject].doubleValue, [NSString stringWithFormat:@"%@",array.lastObject].doubleValue);
        textMessage.extra = dictory.mj_JSONString;
        message.content = textMessage;
    }
    else if (type == 6 ) {
        message.isDeleted = YES;
    }
    message.extraDic = dictory;
    message.messageUId = [NSString stringWithFormat:@"%lf",[[NSDate date] timeIntervalSince1970]*1000];
    message.sentTime = [[NSDate date] timeIntervalSince1970]*1000;

    return [self changeObject:message];
}

#pragma mark - 收到消息监听
- (void)didReceiveMessageNotification:(NSNotification *)notification {

    dispatch_semaphore_wait([IMSDK sharedManager].semaphore, 5);
    //处理好友请求
    RCIMMessage *model = notification.object;

    NSDictionary *extraDic = nil;
    NSString *type = nil;
    NSLog(@"%@",([UserManager shared].dataArray.firstObject.Id));
    // 处理未读消息
    if ([model.content isKindOfClass:[RCTextMessage class]]) {
        RCTextMessage *textMessage = (RCTextMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
    }
    else if ([model.content isKindOfClass:[RCImageMessage class]]) {
        RCImageMessage *textMessage = (RCImageMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        NSArray *typeArray = [textMessage.imageUrl componentsSeparatedByString:@"."];
        type = typeArray.lastObject;
    }
    else if ([model.content isKindOfClass:[RCVoiceMessage class]]) {
        RCVoiceMessage *textMessage = (RCVoiceMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
    }
    else if ([model.content isKindOfClass:[RCLocationMessage class]]) {
        RCLocationMessage *textMessage = (RCLocationMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
    }
    else  {
        RCMessage *textMessage = (RCMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        model.sentTime = 0;
        model.receivedTime = 0;
    }

    if ([NSString stringWithFormat:@"%@",extraDic[@"TargetType"]].integerValue == 0) { // 单聊
        if ([extraDic[@"TargetId"] isEqualToString:[UserManager shared].getUserModel.UserID]) {
            if ([[JSExtension shared].myIdentityId isEqualToString:extraDic[@"TargetId"]]) {
                if ([self.session.sessionId isEqualToString:extraDic[@"ConversationId"]]) {
                    if ([_delegate respondsToSelector:@selector(onRecvMessages:)]) {

                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self.delegate onRecvMessages:[self changeObject:model]];
                        });
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
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
                            dispatch_async(dispatch_get_main_queue(), ^{
                                [self.delegate onRecvMessages:[self changeObject:model]];
                            });
                            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
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
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self.delegate onRecvMessages:[self changeObject:model]];
                        });
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
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
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self.delegate onRecvMessages:[self changeObject:model]];
                        });
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [[DataBaseManager shared] remarkAllReadIdentifyId:[JSExtension shared].myIdentityId conversionId:extraDic[@"ConversationId"]];
                        });
                    }
                }
            }
        }
    }

    dispatch_semaphore_signal([IMSDK sharedManager].semaphore);
}

-(RCIMMessage *)changeObject:(RCIMMessage *)model {
    NSDictionary *extraDic = nil;
    NSString *type = nil;
    // 处理未读消息
    if ([model.content isKindOfClass:[RCTextMessage class]]) {
        RCTextMessage *textMessage = (RCTextMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
    }
    else if ([model.content isKindOfClass:[RCImageMessage class]]) {
        RCImageMessage *textMessage = (RCImageMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        if (textMessage.imageUrl.length) {
            NSArray *typeArray = [textMessage.imageUrl componentsSeparatedByString:@"."];
            type = typeArray.lastObject;
            NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSString *imagePath = [NSString stringWithFormat:@"%@/%@%@%@.%@",docDir,[JSExtension shared].myIdentityId,extraDic[@"ConversationId"],model.messageUId,type];
            NIMImageObject *imageObject = [[NIMImageObject alloc] initWithFilepath:imagePath];
            NSData *data = [NSData dataWithContentsOfFile:imagePath];
            model.image = [UIImage imageWithData:data];
            if (!model.image) {
                model.image = [UIImage imageNamed:@"dyjx_default_img"];
            }
            imageObject.size = model.image.size;
            model.messageObject = imageObject;
        }
        else {
            NIMImageObject *imageObject = [[NIMImageObject alloc] initWithImage:model.image];
            if (!model.image) {
                model.image = [UIImage imageNamed:@"dyjx_default_img"];
            }
            imageObject.size = model.image.size;
            model.messageObject = imageObject;
        }
    }
    else if ([model.content isKindOfClass:[RCVoiceMessage class]]) {
        RCVoiceMessage *textMessage = (RCVoiceMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        NSString *path = [self getPathFromModel:model identifyId:[JSExtension shared].myIdentityId conversationId:extraDic[@"ConversationId"]];
        NIMAudioObject *imageObject = [[NIMAudioObject alloc] initWithSourcePath:path];
        imageObject.duration = textMessage.duration;
        model.messageObject = imageObject;
    }
    else if ([model.content isKindOfClass:[RCLocationMessage class]]) {
        RCLocationMessage *textMessage = (RCLocationMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
    }
    else  {
        RCMessage *textMessage = (RCMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        model.sentTime = 0;
        model.receivedTime = 0;
    }


    return model;
}

-(NSString *)getPathFromModel:(RCIMMessage *)message identifyId:(NSString *)identifyId conversationId:(NSString *)ConversationId{
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [NSString stringWithFormat:@"%@/%@%@%@.amr",docDir,identifyId,ConversationId,message.messageUId];
}

-(void)resetMessage:(RCIMMessage *)message success:(void(^)(id  _Nullable responseObject))success failed:(void(^)(NSString *errorMsg))fail {
    RCIMMessage *model = (RCIMMessage *)message;
    NSMutableDictionary *extraDic = nil;
    NSMutableDictionary *mutDic = nil;
    NSString *type = nil;
    DYJXSendMsgReq *request = [[DYJXSendMsgReq alloc] init];
    request.ClientId = [JSExtension shared].myClientId;
    request.Device = @"iOS";
    request.DeviceToken = [UserManager shared].login.ObjResult;
    request.CertificateId = [JSExtension shared].myIdentityId;
    DYJXData *sendData = [[DYJXData alloc] init];
    sendData.MessageType = 6;
    NSMutableDictionary *bodyDictory = [[NSMutableDictionary alloc] init];
    bodyDictory[@"content"] = message.messageUId;
    if ([model.content isKindOfClass:[RCTextMessage class]]) {
        RCTextMessage *textMessage = (RCTextMessage *)(model.content);
        extraDic = [[self dictionaryWithJsonString:textMessage.extra] mutableCopy];
        extraDic[@"MessageType"] = @(6);
        textMessage.extra = extraDic.mj_JSONString;
    }
    else if ([model.content isKindOfClass:[RCImageMessage class]]) {
        RCImageMessage *textMessage = (RCImageMessage *)(model.content);
        extraDic = [[self dictionaryWithJsonString:textMessage.extra] mutableCopy];
        bodyDictory[@"imageUri"] = textMessage.imageUrl;
        extraDic[@"MessageType"] = @(6);
        textMessage.extra = extraDic.mj_JSONString;
    }
    else if ([model.content isKindOfClass:[RCVoiceMessage class]]) {
        RCVoiceMessage *textMessage = (RCVoiceMessage *)(model.content);
        extraDic = [[self dictionaryWithJsonString:textMessage.extra] mutableCopy];
        bodyDictory[@"duration"] = @(textMessage.duration);
        extraDic[@"MessageType"] = @(6);
        textMessage.extra = extraDic.mj_JSONString;
    }
    else if ([model.content isKindOfClass:[RCLocationMessage class]] || [message.objectName isEqualToString:@"DY:LBS"]) {
        RCLocationMessage *textMessage = (RCLocationMessage *)(model.content);
        extraDic = [[self dictionaryWithJsonString:textMessage.extra] mutableCopy];
        bodyDictory[@"contentLocationName"] = textMessage.locationName;
        bodyDictory[@"latitude"] = @(textMessage.location.latitude);
        bodyDictory[@"longitude"] = @(textMessage.location.longitude);
        extraDic[@"MessageType"] = @(6);
        textMessage.extra = extraDic.mj_JSONString;
    }
    else  {
        RCMessage *textMessage = (RCMessage *)(model.content);
        extraDic = [[self dictionaryWithJsonString:textMessage.extra] mutableCopy];
        extraDic[@"MessageType"] = @(6);
        textMessage.extra = extraDic.mj_JSONString;
        model.sentTime = 0;
        model.receivedTime = 0;
    }
    model.extraDic = extraDic;
    sendData.Body =  bodyDictory.modelToJSONString;
    sendData.ConversationId = extraDic[@"ConversationId"];
    sendData.CreateBy = extraDic[@"FromName"];
    sendData.DeleteBy = extraDic[@"FromName"];
    sendData.UpdateBy = extraDic[@"FromName"];
    sendData.Deleted = YES;
    sendData.ConversationId = extraDic[@"ConversationId"];
    sendData.ConversationId = extraDic[@"ConversationId"];
    sendData.FromCertifyId = [JSExtension shared].myIdentityId;
    sendData.FromId = [UserManager shared].getUserModel.UserID;
    sendData.IdField = extraDic[@"Id"];
    sendData.SendType = 4;
    sendData.Target = [JSExtension shared].targetId;
    sendData.TargetId = [JSExtension shared].targetId;
    sendData.TargetType = [JSExtension shared].type;

    model.session = [[NIMSession alloc] init];
    model.extraDic = [NSDictionary dictionaryWithDictionary:extraDic];
    model.isPlayed = YES;
    model.isMySend = YES;
    model.messageDirection = MessageDirection_SEND;
    model.isOutgoingMsg = YES;
    model.conversionId = [JSExtension shared].conversionId;

    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[@"Data"] = sendData.toDictionary;
    params[@"ClientId"] = request.ClientId;
    params[@"Device"] = request.Device;
    params[@"DeviceToken"] = request.DeviceToken;
    params[@"CertificateId"] = request.CertificateId;

    __block RCIMMessage *blockMessage = model;
    [XYNetWorking XYPOST:@"SendMsg" params:params success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([NSString stringWithFormat:@"%@",responseObject[@"Succeed"]].boolValue) {
            NSDictionary *dics = [self dictionaryWithJsonString:responseObject[@"Result"][@"RowData"] ? responseObject[@"Result"][@"RowData"] : @""];
//            if ([blockMessage.content isKindOfClass:[RCTextMessage class]]) {
//                RCTextMessage *textMessage = (RCTextMessage *)(model.content);
//                textMessage.extra = [NSString stringWithFormat:@"%@",dics[@"extra"]];
//                blockMessage.extraDic = [self dictionaryWithJsonString:textMessage.extra];
//            }
//            else if ([blockMessage.content isKindOfClass:[RCImageMessage class]]) {
//                RCImageMessage *textMessage = (RCImageMessage *)(model.content);
//                textMessage.extra = [NSString stringWithFormat:@"%@",dics[@"extra"]];
//                blockMessage.extraDic = [self dictionaryWithJsonString:textMessage.extra];
//            }
//            else if ([blockMessage.content isKindOfClass:[RCVoiceMessage class]]) {
//                RCVoiceMessage *textMessage = (RCVoiceMessage *)(model.content);
//                textMessage.extra = [NSString stringWithFormat:@"%@",dics[@"extra"]];
//                blockMessage.extraDic = [self dictionaryWithJsonString:textMessage.extra];
//                bodyDictory[@"duration"] = @(textMessage.duration);
//            }
//            else if ([blockMessage.content isKindOfClass:[RCLocationMessage class]] || [message.objectName isEqualToString:@"DY:LBS"]) {
//                RCLocationMessage *textMessage = (RCLocationMessage *)(model.content);
//                textMessage.extra = [NSString stringWithFormat:@"%@",dics[@"extra"]];
//                blockMessage.extraDic = [self dictionaryWithJsonString:textMessage.extra];
//            }
//            blockMessage.messageUId = blockMessage.extraDic[@"Id"];
            blockMessage.sentTime = [[NSDate date] timeIntervalSince1970]*1000;
            blockMessage.sentStatus = SentStatus_SENT;
            blockMessage.deliveryState = NIMMessageDeliveryStateDeliveried;
            if ([blockMessage.content isKindOfClass:[RCImageMessage class]]) {
                RCImageMessage *textMessage = (RCImageMessage *)(message.content);
                NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                NSArray *imageTypes = [textMessage.imageUrl componentsSeparatedByString:@"."];
                NSString *type = imageTypes.lastObject;
                NSString *imagePath = [NSString stringWithFormat:@"%@/%@%@%@.%@",docDir,[JSExtension shared].myIdentityId,[JSExtension shared].conversionId,blockMessage.messageUId,type];
                blockMessage.LocalPath = imagePath;
            }
            else if ([blockMessage.content isKindOfClass:[RCVoiceMessage class]]) {
                //                RCVoiceMessage *textMessage = (RCVoiceMessage *)(message.content);
                //                blockMessage.LocalPath = [self getPathFromModel:blockMessage identifyId:[JSExtension shared].myIdentityId conversationId:[JSExtension shared].conversionId];
            }
        }
        else {
            blockMessage.messageUId = [NSString stringWithFormat:@"%lf",[[NSDate date] timeIntervalSince1970]*1000];
            blockMessage.sentTime = [[NSDate date] timeIntervalSince1970]*1000;
            blockMessage.sentStatus = SentStatus_FAILED;
            blockMessage.deliveryState = NIMMessageDeliveryStateFailed;
        }
        [self storeSourceWithContent:blockMessage identifyId:[JSExtension shared].myIdentityId conversationId:[JSExtension shared].conversionId];
        [[DataBaseManager shared] insertModel:blockMessage identifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId];
        if (success) {
            blockMessage.sentTime = 0;
            blockMessage.receivedTime = 0;
            success([self changeObject:blockMessage]);
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[DataBaseManager shared] remarkAllReadIdentifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId];
        });
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        blockMessage.sentTime = [[NSDate date] timeIntervalSince1970]*1000;
        blockMessage.sentStatus = SentStatus_FAILED;
        blockMessage.deliveryState = NIMMessageDeliveryStateFailed;
        if ([blockMessage.content isKindOfClass:[RCImageMessage class]]) {
            RCImageMessage *textMessage = (RCImageMessage *)(message.content);
            NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSArray *imageTypes = [textMessage.imageUrl componentsSeparatedByString:@"."];
            NSString *type = imageTypes.lastObject;
            NSString *imagePath = [NSString stringWithFormat:@"%@/%@%@%@.%@",docDir,[JSExtension shared].myIdentityId,[JSExtension shared].conversionId,blockMessage.messageUId,type];
            blockMessage.LocalPath = imagePath;
        }
        [self storeSourceWithContent:blockMessage identifyId:[JSExtension shared].myIdentityId conversationId:[JSExtension shared].conversionId];
        [[DataBaseManager shared] insertModel:blockMessage identifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId];
        if (success) {
            blockMessage.sentTime = 0;
            blockMessage.receivedTime = 0;
            success([self changeObject:blockMessage]);
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[DataBaseManager shared] remarkAllReadIdentifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId];
        });
    }];
}

-(void)sendMessage:(RCIMMessage *)message ToConversion:(RCConversationModel *)conversion success:(void(^)(id  _Nullable responseObject))success failed:(void(^)(NSString *errorMsg))fail {
    RCIMMessage *model = (RCIMMessage *)message;
    NSDictionary *extraDic = nil;
    NSMutableDictionary *mutDic = nil;
    NSString *type = nil;
    DYJXSendMsgReq *request = [[DYJXSendMsgReq alloc] init];
    request.ClientId = [JSExtension shared].myClientId;
    request.Device = @"iOS";
    request.DeviceToken = [UserManager shared].login.ObjResult;
    request.CertificateId = [JSExtension shared].myIdentityId;
    DYJXData *sendData = [[DYJXData alloc] init];
    NSMutableDictionary *bodyDictory = [[NSMutableDictionary alloc] init];
    if ([model.content isKindOfClass:[RCTextMessage class]]) {
        RCTextMessage *textMessage = (RCTextMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        bodyDictory[@"content"] = textMessage.content;
        sendData.MessageType = 0;
    }
    else if ([model.content isKindOfClass:[RCImageMessage class]]) {
        RCImageMessage *textMessage = (RCImageMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        bodyDictory[@"imageUri"] = textMessage.imageUrl;
        if (model.image) {
            bodyDictory[@"content"] = UIImagePNGRepresentation(model.image);
        }
        sendData.MessageType = 1;
    }
    else if ([model.content isKindOfClass:[RCVoiceMessage class]]) {
        RCVoiceMessage *textMessage = (RCVoiceMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        bodyDictory[@"duration"] = @(textMessage.duration);
        NSData *data = [NSData dataWithContentsOfFile:model.LocalPath];
        bodyDictory[@"content"] = [data base64EncodedStringWithOptions:0];
        //        NSData *base64Data = [data base64EncodedDataWithOptions:0];
        //         = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];;
        //        model.amrBase64Content = bodyDictory[@"content"];
        sendData.MessageType = 3;
    }
    else if ([model.content isKindOfClass:[RCLocationMessage class]] || [message.objectName isEqualToString:@"DY:LBS"]) {
        RCLocationMessage *textMessage = (RCLocationMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        bodyDictory[@"contentLocationName"] = textMessage.locationName;
        bodyDictory[@"latitude"] = @(textMessage.location.latitude);
        bodyDictory[@"longitude"] = @(textMessage.location.longitude);
        if ([message.objectName isEqualToString:@"DY:LBS"]) {
            sendData.MessageType = 5;
        }
        else {
            sendData.MessageType = 4;
        }
    }
    else  {
        RCMessage *textMessage = (RCMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        sendData.MessageType = 6;
        model.sentTime = 0;
        model.receivedTime = 0;
    }


    NSMutableDictionary *dictory = [[NSMutableDictionary alloc] init];

    if ([UserManager shared].getUserModel.Result.UserName.length) {
        dictory[@"FromName"] = [UserManager shared].getUserModel.Result.DisplayName;
    }
    if ([[UserManager shared].getUserModel.Result.Business.IMInfo.HeadImgUrl XYImageURL].length) {
        dictory[@"FromHeadImg"] = [[UserManager shared].getUserModel.Result.Business.IMInfo.HeadImgUrl XYImageURL];
    }
    if ([JSExtension shared].myIdentityId.length) {
        dictory[@"FromCertifyId"] = [JSExtension shared].myIdentityId;
    }
    if ([UserManager shared].swichModel.GroupName.length) {
        dictory[@"FromCertifyName"] = [UserManager shared].swichModel.GroupName;
    }
    if ([UserManager shared].swichModel.GroupHeadImg.length) {
        dictory[@"FromCertifyHeadImg"] = [UserManager shared].swichModel.GroupHeadImg;
    }
    if ([JSExtension shared].targetId.length) {
        dictory[@"TargetId"] = [JSExtension shared].targetId;
    }
    if ([JSExtension shared].targetName.length) {
        dictory[@"TargetName"] = [JSExtension shared].targetName;
    }
    if ([JSExtension shared].targetImg.length) {
        dictory[@"TargetHeadImg"] = [JSExtension shared].targetImg;
    }

    sendData.Body =  bodyDictory.modelToJSONString;
    sendData.ConversationId = conversion.targetId;
    sendData.CreateBy = [UserManager shared].getUserModel.Result.DisplayName;
    sendData.DeleteBy = [UserManager shared].getUserModel.Result.DisplayName;
    sendData.UpdateBy = [UserManager shared].getUserModel.Result.DisplayName;
    sendData.Deleted = model.isDeleted;
    sendData.ConversationId = conversion.targetId;
    sendData.FromCertifyId = [JSExtension shared].myIdentityId;
    sendData.FromId = [UserManager shared].getUserModel.UserID;
    sendData.IdField = @"";
    sendData.SendType = 4;
    sendData.Target = [JSExtension shared].targetId;
    sendData.TargetId = [JSExtension shared].targetId;

    NSDictionary *dict = (NSDictionary *)conversion.extend;

    if ([dict[@"type"] isEqualToString:@"1"]) {
        sendData.TargetType = 1;
        sendData.TargetId = conversion.extend[@"targetId"];
        sendData.Target = conversion.extend[@"targetId"];
    }
    else if ([dict[@"type"] isEqualToString:@"0"]) {
        sendData.TargetType = 0;
        sendData.TargetId = conversion.extend[@"targetId"];
        sendData.Target = conversion.extend[@"targetId"];
    }
    model.session = [[NIMSession alloc] init];
    model.extraDic = [NSDictionary dictionaryWithDictionary:extraDic];
    model.isPlayed = YES;
    model.isMySend = YES;
    model.messageDirection = MessageDirection_SEND;
    model.isOutgoingMsg = YES;
    model.conversionId = conversion.targetId;

    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[@"Data"] = sendData.toDictionary;
    params[@"ClientId"] = request.ClientId;
    params[@"Device"] = request.Device;
    params[@"DeviceToken"] = request.DeviceToken;
    params[@"CertificateId"] = request.CertificateId;

    __block RCIMMessage *blockMessage = message;
    [XYNetWorking XYPOST:@"SendMsg" params:params success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([NSString stringWithFormat:@"%@",responseObject[@"Succeed"]].boolValue) {
            NSDictionary *dics = [self dictionaryWithJsonString:responseObject[@"Result"][@"RowData"] ? responseObject[@"Result"][@"RowData"] : @""];
            if ([blockMessage.content isKindOfClass:[RCTextMessage class]]) {
                RCTextMessage *textMessage = (RCTextMessage *)(model.content);
                textMessage.extra = [NSString stringWithFormat:@"%@",dics[@"extra"]];
                blockMessage.extraDic = [self dictionaryWithJsonString:textMessage.extra];
            }
            else if ([blockMessage.content isKindOfClass:[RCImageMessage class]]) {
                RCImageMessage *textMessage = (RCImageMessage *)(model.content);
                textMessage.extra = [NSString stringWithFormat:@"%@",dics[@"extra"]];
                blockMessage.extraDic = [self dictionaryWithJsonString:textMessage.extra];
            }
            else if ([blockMessage.content isKindOfClass:[RCVoiceMessage class]]) {
                RCVoiceMessage *textMessage = (RCVoiceMessage *)(model.content);
                textMessage.extra = [NSString stringWithFormat:@"%@",dics[@"extra"]];
                blockMessage.extraDic = [self dictionaryWithJsonString:textMessage.extra];
                bodyDictory[@"duration"] = @(textMessage.duration);
            }
            else if ([blockMessage.content isKindOfClass:[RCLocationMessage class]] || [message.objectName isEqualToString:@"DY:LBS"]) {
                RCLocationMessage *textMessage = (RCLocationMessage *)(model.content);
                textMessage.extra = [NSString stringWithFormat:@"%@",dics[@"extra"]];
                blockMessage.extraDic = [self dictionaryWithJsonString:textMessage.extra];
            }
            blockMessage.messageUId = blockMessage.extraDic[@"Id"];
            blockMessage.sentTime = [[NSDate date] timeIntervalSince1970]*1000;
            blockMessage.sentStatus = SentStatus_SENT;
            blockMessage.deliveryState = NIMMessageDeliveryStateDeliveried;
            if ([blockMessage.content isKindOfClass:[RCImageMessage class]]) {
                RCImageMessage *textMessage = (RCImageMessage *)(message.content);
                NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                NSArray *imageTypes = [textMessage.imageUrl componentsSeparatedByString:@"."];
                NSString *type = imageTypes.lastObject;
                NSString *imagePath = [NSString stringWithFormat:@"%@/%@%@%@.%@",docDir,[JSExtension shared].myIdentityId,blockMessage.extraDic[@"ConversationId"],blockMessage.messageUId,type];
                blockMessage.LocalPath = imagePath;
            }
            else if ([blockMessage.content isKindOfClass:[RCVoiceMessage class]]) {
                //                RCVoiceMessage *textMessage = (RCVoiceMessage *)(message.content);
                //                blockMessage.LocalPath = [self getPathFromModel:blockMessage identifyId:[JSExtension shared].myIdentityId conversationId:[JSExtension shared].conversionId];
            }
        }
        else {
            blockMessage.messageUId = [NSString stringWithFormat:@"%lf",[[NSDate date] timeIntervalSince1970]*1000];
            blockMessage.sentTime = [[NSDate date] timeIntervalSince1970]*1000;
            blockMessage.sentStatus = SentStatus_FAILED;
            blockMessage.deliveryState = NIMMessageDeliveryStateFailed;
        }
        [self storeSourceWithContent:blockMessage identifyId:[JSExtension shared].myIdentityId conversationId:[JSExtension shared].conversionId];
        [[DataBaseManager shared] insertModel:blockMessage identifyId:[JSExtension shared].myIdentityId conversionId:blockMessage.extraDic[@"ConversationId"]];
        if (success) {
            success([self changeObject:blockMessage]);
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([blockMessage.extraDic[@"ConversationId"] isEqualToString:[JSExtension shared].conversionId]) {
                [[DataBaseManager shared] remarkAllReadIdentifyId:[JSExtension shared].myIdentityId conversionId:blockMessage.extraDic[@"ConversationId"]];
            }
        });
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        blockMessage.sentTime = [[NSDate date] timeIntervalSince1970]*1000;
        blockMessage.sentStatus = SentStatus_FAILED;
        blockMessage.deliveryState = NIMMessageDeliveryStateFailed;
        if ([blockMessage.content isKindOfClass:[RCImageMessage class]]) {
            RCImageMessage *textMessage = (RCImageMessage *)(message.content);
            NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSArray *imageTypes = [textMessage.imageUrl componentsSeparatedByString:@"."];
            NSString *type = imageTypes.lastObject;
            NSString *imagePath = [NSString stringWithFormat:@"%@/%@%@%@.%@",docDir,[JSExtension shared].myIdentityId,blockMessage.extraDic[@"ConversationId"],blockMessage.messageUId,type];
            blockMessage.LocalPath = imagePath;
        }
        [self storeSourceWithContent:blockMessage identifyId:[JSExtension shared].myIdentityId conversationId:blockMessage.extraDic[@"ConversationId"]];
        [[DataBaseManager shared] insertModel:blockMessage identifyId:[JSExtension shared].myIdentityId conversionId:blockMessage.extraDic[@"ConversationId"]];
        if (success) {
            success([self changeObject:blockMessage]);
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([blockMessage.extraDic[@"ConversationId"] isEqualToString:[JSExtension shared].conversionId]) {
                [[DataBaseManager shared] remarkAllReadIdentifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId];
            }
        });
    }];
}


-(void)sendMessage:(RCIMMessage *)message success:(void(^)(id  _Nullable responseObject))success failed:(void(^)(NSString *errorMsg))fail {
    RCIMMessage *model = (RCIMMessage *)message;
    NSDictionary *extraDic = nil;
    NSMutableDictionary *mutDic = nil;
    NSString *type = nil;
    DYJXSendMsgReq *request = [[DYJXSendMsgReq alloc] init];
    request.ClientId = [JSExtension shared].myClientId;
    request.Device = @"iOS";
    request.DeviceToken = [UserManager shared].login.ObjResult;
    request.CertificateId = [JSExtension shared].myIdentityId;
    DYJXData *sendData = [[DYJXData alloc] init];
    NSMutableDictionary *bodyDictory = [[NSMutableDictionary alloc] init];
    if ([model.content isKindOfClass:[RCTextMessage class]]) {
        RCTextMessage *textMessage = (RCTextMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        bodyDictory[@"content"] = textMessage.content;
        sendData.MessageType = 0;
    }
    else if ([model.content isKindOfClass:[RCImageMessage class]]) {
        RCImageMessage *textMessage = (RCImageMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        bodyDictory[@"imageUri"] = textMessage.imageUrl;
        if (model.image) {
            bodyDictory[@"content"] = UIImagePNGRepresentation(model.image);
        }
        sendData.MessageType = 1;
    }
    else if ([model.content isKindOfClass:[RCVoiceMessage class]]) {
        RCVoiceMessage *textMessage = (RCVoiceMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        bodyDictory[@"duration"] = @(textMessage.duration);
        NSData *data = [NSData dataWithContentsOfFile:model.LocalPath];
        bodyDictory[@"content"] = [data base64EncodedStringWithOptions:0];
//        NSData *base64Data = [data base64EncodedDataWithOptions:0];
//         = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];;
//        model.amrBase64Content = bodyDictory[@"content"];
        sendData.MessageType = 3;
    }
    else if ([model.content isKindOfClass:[RCLocationMessage class]] || [message.objectName isEqualToString:@"DY:LBS"]) {
        RCLocationMessage *textMessage = (RCLocationMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        bodyDictory[@"contentLocationName"] = textMessage.locationName;
        bodyDictory[@"latitude"] = @(textMessage.location.latitude);
        bodyDictory[@"longitude"] = @(textMessage.location.longitude);
        if ([message.objectName isEqualToString:@"DY:LBS"]) {
            sendData.MessageType = 5;
        }
        else {
            sendData.MessageType = 4;
        }
    }
    else  {
        RCMessage *textMessage = (RCMessage *)(model.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        sendData.MessageType = 6;
        model.sentTime = 0;
        model.receivedTime = 0;
    }


    sendData.Body =  bodyDictory.modelToJSONString;
    sendData.ConversationId = extraDic[@"ConversationId"];
    sendData.CreateBy = extraDic[@"FromName"];
    sendData.DeleteBy = extraDic[@"FromName"];
    sendData.UpdateBy = extraDic[@"FromName"];
    sendData.Deleted = model.isDeleted;
    sendData.ConversationId = extraDic[@"ConversationId"];
    sendData.ConversationId = extraDic[@"ConversationId"];
    sendData.FromCertifyId = [JSExtension shared].myIdentityId;
    sendData.FromId = [UserManager shared].getUserModel.UserID;
    sendData.IdField = extraDic[@"Id"];
    sendData.SendType = 4;
    sendData.Target = [JSExtension shared].targetId;
    sendData.TargetId = [JSExtension shared].targetId;
    sendData.TargetType = [JSExtension shared].type;

    model.session = [[NIMSession alloc] init];
    model.extraDic = [NSDictionary dictionaryWithDictionary:extraDic];
    model.isPlayed = YES;
    model.isMySend = YES;
    model.messageDirection = MessageDirection_SEND;
    model.isOutgoingMsg = YES;
    model.conversionId = [JSExtension shared].conversionId;

    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[@"Data"] = sendData.toDictionary;
    params[@"ClientId"] = request.ClientId;
    params[@"Device"] = request.Device;
    params[@"DeviceToken"] = request.DeviceToken;
    params[@"CertificateId"] = request.CertificateId;

    __block RCIMMessage *blockMessage = message;
    [XYNetWorking XYPOST:@"SendMsg" params:params success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([NSString stringWithFormat:@"%@",responseObject[@"Succeed"]].boolValue) {
            NSDictionary *dics = [self dictionaryWithJsonString:responseObject[@"Result"][@"RowData"] ? responseObject[@"Result"][@"RowData"] : @""];
            if ([blockMessage.content isKindOfClass:[RCTextMessage class]]) {
                RCTextMessage *textMessage = (RCTextMessage *)(model.content);
                textMessage.extra = [NSString stringWithFormat:@"%@",dics[@"extra"]];
                blockMessage.extraDic = [self dictionaryWithJsonString:textMessage.extra];
            }
            else if ([blockMessage.content isKindOfClass:[RCImageMessage class]]) {
                RCImageMessage *textMessage = (RCImageMessage *)(model.content);
                textMessage.extra = [NSString stringWithFormat:@"%@",dics[@"extra"]];
                blockMessage.extraDic = [self dictionaryWithJsonString:textMessage.extra];
            }
            else if ([blockMessage.content isKindOfClass:[RCVoiceMessage class]]) {
                RCVoiceMessage *textMessage = (RCVoiceMessage *)(model.content);
                textMessage.extra = [NSString stringWithFormat:@"%@",dics[@"extra"]];
                blockMessage.extraDic = [self dictionaryWithJsonString:textMessage.extra];
                bodyDictory[@"duration"] = @(textMessage.duration);
            }
            else if ([blockMessage.content isKindOfClass:[RCLocationMessage class]] || [message.objectName isEqualToString:@"DY:LBS"]) {
                RCLocationMessage *textMessage = (RCLocationMessage *)(model.content);
                textMessage.extra = [NSString stringWithFormat:@"%@",dics[@"extra"]];
                blockMessage.extraDic = [self dictionaryWithJsonString:textMessage.extra];
            }
            blockMessage.messageUId = blockMessage.extraDic[@"Id"];
            blockMessage.sentTime = [[NSDate date] timeIntervalSince1970]*1000;
            blockMessage.sentStatus = SentStatus_SENT;
            blockMessage.deliveryState = NIMMessageDeliveryStateDeliveried;
            if ([blockMessage.content isKindOfClass:[RCImageMessage class]]) {
                RCImageMessage *textMessage = (RCImageMessage *)(message.content);
                NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                NSArray *imageTypes = [textMessage.imageUrl componentsSeparatedByString:@"."];
                NSString *type = imageTypes.lastObject;
                NSString *imagePath = [NSString stringWithFormat:@"%@/%@%@%@.%@",docDir,[JSExtension shared].myIdentityId,[JSExtension shared].conversionId,blockMessage.messageUId,type];
                blockMessage.LocalPath = imagePath;
            }
            else if ([blockMessage.content isKindOfClass:[RCVoiceMessage class]]) {
//                RCVoiceMessage *textMessage = (RCVoiceMessage *)(message.content);
//                blockMessage.LocalPath = [self getPathFromModel:blockMessage identifyId:[JSExtension shared].myIdentityId conversationId:[JSExtension shared].conversionId];
            }
        }
        else {
            blockMessage.messageUId = [NSString stringWithFormat:@"%lf",[[NSDate date] timeIntervalSince1970]*1000];
            blockMessage.sentTime = [[NSDate date] timeIntervalSince1970]*1000;
            blockMessage.sentStatus = SentStatus_FAILED;
            blockMessage.deliveryState = NIMMessageDeliveryStateFailed;
        }
        [self storeSourceWithContent:blockMessage identifyId:[JSExtension shared].myIdentityId conversationId:[JSExtension shared].conversionId];
        [[DataBaseManager shared] insertModel:blockMessage identifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId];
        if (success) {
            success([self changeObject:blockMessage]);
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[DataBaseManager shared] remarkAllReadIdentifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId];
        });
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        blockMessage.sentTime = [[NSDate date] timeIntervalSince1970]*1000;
        blockMessage.sentStatus = SentStatus_FAILED;
        blockMessage.deliveryState = NIMMessageDeliveryStateFailed;
        if ([blockMessage.content isKindOfClass:[RCImageMessage class]]) {
            RCImageMessage *textMessage = (RCImageMessage *)(message.content);
            NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSArray *imageTypes = [textMessage.imageUrl componentsSeparatedByString:@"."];
            NSString *type = imageTypes.lastObject;
            NSString *imagePath = [NSString stringWithFormat:@"%@/%@%@%@.%@",docDir,[JSExtension shared].myIdentityId,[JSExtension shared].conversionId,blockMessage.messageUId,type];
            blockMessage.LocalPath = imagePath;
        }
        [self storeSourceWithContent:blockMessage identifyId:[JSExtension shared].myIdentityId conversationId:[JSExtension shared].conversionId];
        [[DataBaseManager shared] insertModel:blockMessage identifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId];
        if (success) {
            success([self changeObject:blockMessage]);
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[DataBaseManager shared] remarkAllReadIdentifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId];
        });
    }];
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

//上传图片
- (void)uploadFile:(UIImage*)image model:(RCIMMessage *)model progress:(nullable void (^)(NSProgress * _Nonnull progress))Progress Success:(void(^)(id  _Nullable responseObject))success failed:(void(^)(NSString *errorMsg))fail {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         nil];
    manager.requestSerializer= [AFHTTPRequestSerializer serializer];
    manager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    RCIMMessage *message = (RCIMMessage *)model;
    message.image = image;
    message.imageSize = image.size;
    __block RCIMMessage *blockMessage = message;
    [manager POST:[BEST_URL stringByAppendingString:kDYJXAPI_user_UploadFile] parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *data = UIImageJPEGRepresentation(image, 0.2);
        //上传的参数(上传图片，以文件流的格式)
        [formData appendPartWithFileData:data
                                    name:@"file"
                                fileName:@"name.png"
                                mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        Progress(uploadProgress);

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"上传成功");
        if ([blockMessage.content isKindOfClass:[RCImageMessage class]]) {
            RCImageMessage *textMessage = (RCImageMessage *)(blockMessage.content);
            textMessage.imageUrl = responseObject[@"SavedFileName"];
        }
        [self sendMessage:blockMessage success:^(id  _Nullable responseObject) {
            if (success) {
                success([self changeObject:(RCIMMessage *)responseObject]);
            }
        } failed:^(NSString * _Nonnull errorMsg) {
        }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        blockMessage.sentTime = [[NSDate date] timeIntervalSince1970]*1000;
        blockMessage.sentStatus = SentStatus_FAILED;
        blockMessage.deliveryState = NIMMessageDeliveryStateFailed;
        if ([blockMessage.content isKindOfClass:[RCImageMessage class]]) {
            RCImageMessage *textMessage = (RCImageMessage *)(message.content);
            NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSArray *imageTypes = [textMessage.imageUrl componentsSeparatedByString:@"."];
            NSString *type = imageTypes.lastObject;
            NSString *imagePath = [NSString stringWithFormat:@"%@/%@%@%@.%@",docDir,[JSExtension shared].myIdentityId,[JSExtension shared].conversionId,blockMessage.messageUId,type];
            blockMessage.LocalPath = imagePath;
        }
        [self storeSourceWithContent:blockMessage identifyId:[JSExtension shared].myIdentityId conversationId:[JSExtension shared].conversionId];
        [[DataBaseManager shared] insertModel:blockMessage identifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId];
        if (success) {
            success([self changeObject:blockMessage]);
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[DataBaseManager shared] remarkAllReadIdentifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId];
        });
        NSLog(@"上传失败%@",error);
    }];
}


-(void)storeSourceWithContent:(RCIMMessage *)message identifyId:(NSString *)identifyId conversationId:(NSString *)conversationId {
    NSDictionary *extraDic = nil;
    NSData * data = nil;
    // 处理未读消息
    if ([message.content isKindOfClass:[RCTextMessage class]]) {
        RCTextMessage *textMessage = (RCTextMessage *)(message.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
    }
    else if ([message.content isKindOfClass:[RCImageMessage class]]) {
        RCImageMessage *textMessage = (RCImageMessage *)(message.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
        UIImage *image = message.image;
        if (image) {
            data = UIImagePNGRepresentation(image);
        }
        NSArray *typeArray = [textMessage.imageUrl componentsSeparatedByString:@"."];
        if (data && data.length) {
            NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSString *imagePath = [NSString stringWithFormat:@"%@/%@%@%@.%@",docDir,identifyId,conversationId,message.messageUId,typeArray.lastObject];
            BOOL isFinish = [data writeToFile:imagePath atomically:YES];

//            UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 160)];
//            imageV.image = [UIImage imageWithContentsOfFile:imagePath].fixOrientation;
////            imageV.size = CGSizeMake(imageV.image.size.width/3.0, imageV.image.size.height/3.0);
//            [[UIApplication sharedApplication].keyWindow addSubview:imageV];

//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [imageV removeFromSuperview];
//            });

            NSLog(@"成功保存图片");
        }
    }
    else if ([message.content isKindOfClass:[RCVoiceMessage class]]) {
        RCVoiceMessage *textMessage = (RCVoiceMessage *)(message.content);
//        extraDic = [self dictionaryWithJsonString:textMessage.extra];
//        NSData *data = [[NSData alloc]initWithBase64EncodedString:textMessage.amrBase64Content options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        if (data && data.length) {
//            NSString *path = [self getPathFromModel:message identifyId:identifyId conversationId:conversationId];
//            BOOL isFinish = [data writeToFile:path atomically:YES];
//            NSLog(@"成功保存语音");
//        }
    }
    else if ([message.content isKindOfClass:[RCLocationMessage class]]) {
        RCLocationMessage *textMessage = (RCLocationMessage *)(message.content);
        extraDic = [self dictionaryWithJsonString:textMessage.extra];
    }
}




@end
