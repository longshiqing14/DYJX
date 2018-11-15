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

NS_ASSUME_NONNULL_BEGIN

@protocol XYJSExport <JSExport>

+(NSString*)getCertificateId;
+(NSString *)getClientId;


@end

@interface JSExtension : PGPlugin<XYJSExport>

+ (JSExtension *)shared;
@property (nonatomic, copy)NSString *myClientId;
@property (nonatomic, copy)NSString *myIdentityId;

@end

NS_ASSUME_NONNULL_END
