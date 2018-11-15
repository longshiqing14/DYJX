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

@end
