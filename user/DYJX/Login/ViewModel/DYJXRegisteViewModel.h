//
//  DYJXGetAuthorizationCodeViewModel.h
//  user
//
//  Created by 岩  熊 on 2018/10/28.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYJXRegisteViewModel : NSObject
@property (nonatomic,strong) NSMutableDictionary *requestDic;
- (void)getAuthorizationCodeWithPhoneNumber:(NSString*)phoneNumber Success:(void(^)(NSString *randCode))success failed:(void(^)(NSString *errorMsg))fail;
- (void)registeWithPhoneNumber:(NSString*)phoneNumber AuthorizationCode:(NSString*)code ranCode:(NSString*)ranCode password:(NSString*)password  Success:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;
@end
