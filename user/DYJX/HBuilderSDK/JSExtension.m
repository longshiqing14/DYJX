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


@end
