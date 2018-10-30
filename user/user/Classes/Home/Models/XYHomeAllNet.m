//
//  XYHomeAllNet.m
//  user
//
//  Created by xingyun on 2017/9/7.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYHomeAllNet.h"

@implementation XYHomeAllNet

/**
 *  获取小区列表
 *  lat 纬度
 *  lng  经度
 */
+ (void)netCommuityListWithLat:(NSString*)lat
                           lng:(NSString*)lng
                         block:(infoBlockNet)block
{
    
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
//    urlDict[@"lat"] = lat;
//    urlDict[@"lng"] = lng;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_commuityList request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                
                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
                block(nil,error);
            }
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_CODE] code:100000 userInfo:nil];
            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        block(nil,error);
    }];
}


/**
 *  获取选择 城市
 *  cityId  城市 id
 */
+ (void)netSelectCommuityWithCityId:(NSString*)cityId
                      theMerchantId:(NSString*)theMerchantId
                              block:(infoBlockNet)block
{
    
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"cityId"] = cityId;
    urlDict[@"theMerchantId"] = theMerchantId;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_selectCommuity request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                
                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                
//                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_CODE] code:100000 userInfo:nil];
                block(nil,error);
            }
            
        }else{
//            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        block(nil,error);
    }];
}



/**
 *  获取热销商品列表
 */
+ (void)netHotGoodsListblock:(infoBlockNet)block
{
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
//    urlDict[@"lat"] = lat;
//    urlDict[@"lng"] = lng;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_indexProductList request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                
                if ([responseObject objectForKey:RETURN_DATA] != nil) {
                    block([responseObject objectForKey:RETURN_DATA],nil);
                }else{
                    NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_DESC]  code:100000 userInfo:nil];
                    block(nil,error);
                }
                
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_DESC] code:100000 userInfo:nil];
                block(nil,error);
            }
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        block(nil,error);
    }];
    
}

/**
 * 获取未读信息数量
 */
+(void)netMessageUnreadBlock:(infoBlockNet)block
{
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];

    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_messageUnreadCount request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                
                if ([responseObject objectForKey:RETURN_DATA] != nil) {
                    block([responseObject objectForKey:RETURN_DATA],nil);
                }else{
                    NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_DESC]  code:100000 userInfo:nil];
                    block(nil,error);
                }
                
            }else{
                
//                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_DESC] code:100000 userInfo:nil];
                block(nil,error);
            }
            
        }else{
//            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
//        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        block(nil,error);
    }];
    
}

@end
