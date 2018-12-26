//
//  JSExtension.h
//  user
//
//  Created by longshiqing on 2018/11/14.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#include "PGPlugin.h"
#import "NIMMessageModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol XYJSExport <JSExport>

+(NSString*)getCertificateId;
+(NSString *)getClientId;
+(void)plusBack;

@end

@interface JSExtension : PGPlugin<XYJSExport>

+ (JSExtension *)shared;
@property (nonatomic, copy)NSString *myClientId;
@property (nonatomic, copy)NSString *myIdentityId;

@property (nonatomic, copy)NSString *targetId;
@property (nonatomic, assign)NSInteger type;
@property (nonatomic, assign)NSString *conversionId;
@property (nonatomic, strong)  NIMSession *session;
@property (nonatomic, copy)NSString *targetName;
@property (nonatomic, copy)NSString *targetImg;

@property (nonatomic, strong)NSArray <RCIMMessage *> *dataArray;

@property (nonatomic) dispatch_semaphore_t semaphore;

@end

NS_ASSUME_NONNULL_END
