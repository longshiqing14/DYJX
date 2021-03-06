//
//  DataBaseManager.h
//  YTKKeyValueStore
//
//  Created by longshiqing on 2018/12/16.
//  Copyright © 2018年 TangQiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCIMMessage.h"

NS_ASSUME_NONNULL_BEGIN

@interface DataBaseManager : NSObject

+ (DataBaseManager *)shared;

// 标记播放过
-(void)playModel:(RCIMMessage *)model identifyId:(NSString *)identifyId conversionId:(NSString *)conversionId;

-(NSArray *)getModel:(RCIMMessage *)model identifyId:(NSString *)identifyId conversionId:(NSString *)conversionId;

-(BOOL)findModel:(RCIMMessage *)model identifyId:(NSString *)identifyId conversionId:(NSString *)conversionId;

-(void)insertModel:(RCIMMessage *)model identifyId:(NSString *)identifyId conversionId:(NSString *)conversionId;

-(void)delegateModel:(RCIMMessage *)model identifyId:(NSString *)identifyId conversionId:(NSString *)conversionId;

-(void)remarkAllReadIdentifyId:(NSString *)identifyId conversionId:(NSString *)conversionId;
-(void)saveUnreadConversionId:(NSString *)conversionId byIdentityId:(NSString *)identityId;

-(NSInteger)unreadCountIdentifyId:(NSString *)identifyId conversionId:(NSString *)conversionId;
-(NSInteger)unreadCountIdentifyId:(NSString *)identifyId;
-(NSInteger)allUnreadCount;

@property (nonatomic) dispatch_semaphore_t semaphore;


@end

NS_ASSUME_NONNULL_END
