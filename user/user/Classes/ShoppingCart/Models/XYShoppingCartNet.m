//
//  XYShoppingCartNet.m
//  user
//
//  Created by xingyun on 2017/9/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYShoppingCartNet.h"

@implementation XYShoppingCartNet


/**
 *  获取 购物车列表
 */
+ (void)netShoppingCartListblock:(infoBlockNet)block
{
//    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_getCartList request_data:urlDict];
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
//        [XYProgressHUD svHUDDismiss];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_CODE] code:100000 userInfo:nil];
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
 *  添加 购物车
 *  productId  商品 id
 */
+ (void)netCartAddWithProductId:(NSString*)productId
                          block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"添加中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"productId"] = productId;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_cartAdd request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

//                [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:[responseObject objectForKey:RETURN_DESC] dismissTimeInterval:1.0];
                
                NSDictionary * countDict = [responseObject objectForKey:RETURN_DATA];
                
                if (countDict[@"count"] != nil) {
                    
                    if ([countDict[@"count"] isKindOfClass:[NSString class]]) {
                        [XYUserDefaults writeAppDlegateOfCartCountStr:countDict[@"count"]];
                    }else if ([countDict[@"count"] isKindOfClass:[NSNumber class]]){
                        [XYUserDefaults writeAppDlegateOfCartCountStr:[countDict[@"count"] stringValue]];
                    }
                    
                    [[NSNotificationCenter defaultCenter] postNotificationName:XY_notification_ItemsBadge object:countDict[@"count"]];
                }
                
                
                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
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
 *  购物车  删除
 *  items  "items": [{"itemId": "cartItem_50017","cartId": "m_50000_common"}
 */
+ (void)netCartRemoveItemWithitems:(NSArray*)items
                          block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"删除中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"items"] = items;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_cartRemoveItem request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
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
 *  购物车  修改 数量
 *  cartId 购物车id
 *  itemId
 *  toNumber
 */
+ (void)netCartChangeAmountWithCartId:(NSString*)cartId
                               itemId:(NSString*)itemId
                             toNumber:(NSString*)toNumber
                             block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"加载中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"cartId"] = cartId;
    urlDict[@"itemId"] = itemId;
    urlDict[@"toNumber"] = toNumber;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_cartChangeAmount request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
               [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
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
 *  购物车  数量
 *  "cartType": "common",     购物车 类型
 *  "theMerchantId":"m_50000",   商家ID
 */
+ (void)netCartCountWithCartType:(NSString*)cartType
                   theMerchantId:(NSString*)theMerchantId
{
    
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"cartType"] = cartType;
    urlDict[@"theMerchantId"] = theMerchantId;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_cartCount request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                
//                block([responseObject objectForKey:RETURN_DATA],nil);
                
                NSDictionary * countDict = [responseObject objectForKey:RETURN_DATA];
                
                if (countDict[@"count"] != nil) {
                    if ([countDict[@"count"] isKindOfClass:[NSString class]]) {
                        [XYUserDefaults writeAppDlegateOfCartCountStr:countDict[@"count"]];
                    }else if ([countDict[@"count"] isKindOfClass:[NSNumber class]]){
                        [XYUserDefaults writeAppDlegateOfCartCountStr:[countDict[@"count"] stringValue]];
                    }
                    
                    [[NSNotificationCenter defaultCenter] postNotificationName:XY_notification_ItemsBadge object:countDict[@"count"]];
                }
                
                
            }else{
                
//                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
//                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
//                block(nil,error);
            }
            
        }else{
//            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
//            NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
//            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
//        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
//        block(nil,error);
    }];
}


/**
 *  购物车  选中 取消
 *  cartId 购物车id
 *  checked 选中t  取消n
 *  itemId
 */
+ (void)netCartCheckItemWithCartId:(NSString*)cartId
                           checked:(NSString*)checked
                            itemId:(NSString*)itemId
                             block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"加载中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"cartId"] = cartId;
    urlDict[@"itemId"] = itemId;
    urlDict[@"checked"] = checked;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_cartCheckItem request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
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
 *  购物车  全选  全部取消
 *  cartType 购物车类型
 *  checked 选中t  取消n
 */
+ (void)netCartCheckAllWithCartType:(NSString*)cartType
                              checked:(NSString*)checked
                                block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"加载中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"cartType"] = cartType;
    urlDict[@"checked"] = checked;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_cartCheckAll request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
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


/** 切换提货方式 */
+(void)netCartChangeDeliveryWayWithDic:(NSMutableDictionary *)param block:(infoBlockNet)block
{
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_orderDeliveryRuleSelect request_data:param];
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"请求中···" dismissTimeInterval:1.0];
    [XYProgressHUD show];
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
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
 *  获取 发票 信息
 */
+ (void)netOrderInvoiceListWithBlock:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"加载中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_orderInvoiceList request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
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
 *  保存 发票 信息
 *  invoiceId       发票 id
 *  needInvoiceKey  是否需要发票  是否需要发票[yes:需要，no:不需要]
 *  invoiceTypeKey  发票类型  [com:普通发票，vat:增值税发票]
 *  invoiceTitleType发票抬头类型 [个人:个人，单位:企业]
 *  invoiceUserName 发票抬头    个人
 *  invoiceTitle    发票抬头    单位
 *  invoiceCertificate  纳税人识别码
 */
+ (void)netOrderUpdateInvoiceWithInvoiceId:(NSString*)invoiceId
                            needInvoiceKey:(NSString*)needInvoiceKey
                            invoiceTypeKey:(NSString*)invoiceTypeKey
                           invoiceUserName:(NSString*)invoiceUserName
                              invoiceTitle:(NSString*)invoiceTitle
                        invoiceCertificate:(NSString*)invoiceCertificate
                               invoiceMail:(NSString*)invoiceMail
                                     block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"上传中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    
    if (invoiceId != nil) {
        urlDict[@"invoiceId"] = invoiceId;
    }
    
    if ([needInvoiceKey isEqualToString:@"yes"]) {
        
        urlDict[@"needInvoiceKey"] = needInvoiceKey;
        
        if ([invoiceTypeKey isEqualToString:@"com"]) {
            urlDict[@"invoiceTypeKey"] = invoiceTypeKey;
            urlDict[@"invoiceTitleType"] = @"个人";
            urlDict[@"invoiceUserName"] = invoiceUserName;
            urlDict[@"invoiceMail"] = invoiceMail;
        }else{
            urlDict[@"invoiceTypeKey"] = invoiceTypeKey;
            urlDict[@"invoiceTitleType"] = @"企业";
            urlDict[@"invoiceTitle"] = invoiceTitle;
            urlDict[@"invoiceCertificate"] = invoiceCertificate;
            urlDict[@"invoiceMail"] = invoiceMail;
        }

    }else{
        
        urlDict[@"needInvoiceKey"] = needInvoiceKey;
        
    }
    
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_orderInvoiceSave request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
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






@end
