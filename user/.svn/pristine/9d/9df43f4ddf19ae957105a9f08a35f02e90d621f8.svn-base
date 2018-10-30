//
//  XYOrderAllNet.m
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderAllNet.h"

@implementation XYOrderAllNet

/**
 *  预提交订单的信息
 */
+ (void)netOrderFormBlock:(NSString *)integralShow netBlock:(infoBlockNet)block
{
    [XYProgressHUD show];
    
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    NSString *isAutoUseCard=[user objectForKey:@"Available"];
    if (isAutoUseCard) {
        [urlDict setObject:@"0" forKey:@"isAutoUseCard"];
    }else{
        [urlDict setObject:@"1" forKey:@"isAutoUseCard"];
    }
    [urlDict setObject:integralShow forKey:@"integralShow"];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_orderForm request_data:urlDict];
    
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
 *  提交订单 支付
 *  depositPay  支付金额
 *  depositPayPwd 支付密码
 *  memo   备注
 */
+ (void)netOrderSubmitPay:(NSString*)depositPay IphoneNumber:(NSString *)iphoneNumber
                       depositPayPwd:(NSString*)depositPayPwd
                                memo:(NSString*)memo
                               Block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"支付中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"depositPay"] = depositPay;
    if(![depositPayPwd isEqualToString:@""]&&depositPayPwd!=nil){
        urlDict[@"depositPayPwd"] = depositPayPwd;
    }
    if(![iphoneNumber isEqualToString:@""]&&iphoneNumber!=nil){
        urlDict[@"gaUserId"] = iphoneNumber;
    }
    
    if (memo.length>0) {
        urlDict[@"memo"] = memo;
    }
    
    
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_orderSubmit request_data:urlDict];
    
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

+ (void)netOrderSubmitWithDepositPay:(NSString*)depositPay depositPayPwd:(NSString*)depositPayPwd
                                memo:(NSString*)memo
                               Block:(infoBlockNet)block
{
    //    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"支付中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"depositPay"] = depositPay;
    if(![depositPayPwd isEqualToString:@""]&&depositPayPwd!=nil){
        urlDict[@"depositPayPwd"] = depositPayPwd;
    }
    
    
    if (memo.length>0) {
        urlDict[@"memo"] = memo;
    }
    
    
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_orderSubmit request_data:urlDict];
    
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
 *  活动立即购买
 *  productId  立即 购买商品 id
 */
+ (void)netActivityCartBuyNowWithProductId:(NSString*)productId PartnerId:(NSString *)partnerId
                             Block:(infoBlockNet)block
{
    //    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"提交中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"productId"] = productId;
    urlDict[@"partnerId"] = productId;
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_cartBuyNow request_data:urlDict];
    
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
 *  立即购买
 *  productId  立即 购买商品 id
 */
+ (void)netCartBuyNowWithProductId:(NSString*)productId
                            Block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"提交中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"productId"] = productId;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_cartBuyNow request_data:urlDict];
    
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
 *  订单  列表  数量
 */
+ (void)netOrderCountWithBlock:(infoBlockNet)block
{
    
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userOrderCount request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
       
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                
                [XYUserDefaults writeAppDlegateOfOrderCountDict:[responseObject objectForKey:RETURN_DATA]];
                
                block([responseObject objectForKey:RETURN_DATA],nil);
                
            }else{
//                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];
                NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
                block(nil,error);
            }
        }else{
//            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
            NSError * error = [[NSError alloc]initWithDomain:@"" code:100000 userInfo:nil];
            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
//        [XYProgressHUD svHUDDismiss];
//        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        block(nil,error);
    }];
}



/**
 *  检查用户是否有设置支付密码
 */
+ (void)netOrderUserPaywdCheckBlock:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userPaywdCheck request_data:urlDict];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                [XYProgressHUD svHUDDismiss];

                block([responseObject objectForKey:RETURN_DATA],nil);
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_CODE] dismissDelay:1.0];

                NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_CODE] code:100000 userInfo:nil];
                block(nil,error);
            }
        }else{
            [YDBAlertView showToast:[responseObject objectForKey:RETURN_CODE] dismissDelay:1.0];

            NSError * error = [[NSError alloc]initWithDomain:[responseObject objectForKey:RETURN_CODE] code:100000 userInfo:nil];
            block(nil,error);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
       
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        block(nil,error);
    }];
}




/**
 *  订单  列表
 *  processState  订单类型
 */
+ (void)netOrderListWithProcessState:(NSDictionary *)processState
                               block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"加载中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
//    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
//    urlDict[@"processState"] = processState;
//    urlDict[@"page"] = processState;
//    urlDict[@"processState"] = processState;
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_orderList request_data:processState];
    
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
 *  订单 详情
 *  orderId  订单 id
 */
+ (void)netOrderDetailWithOrderid:(NSString*)orderId
                            Block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"加载中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"orderId"] = orderId;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_orderDetail request_data:urlDict];
    
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
 *  确认收货
 *  orderId  订单 id
 */
+ (void)ConfirmationReceiptOder:(NSString*)orderId
                            Block:(infoBlockNet)block
{
    //    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"加载中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"orderId"] = orderId;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_ConfirmOrder request_data:urlDict];
    
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
 *  订单 详情 状态
 *  orderId  订单 id
 */
+ (void)netOrderTrackWithOrderid:(NSString*)orderId
                            Block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"加载中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"orderId"] = orderId;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_orderTrack request_data:urlDict];
    
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
 *  订单  取消订单
 *  orderId  订单 id
 */
+ (void)netOrderCancelWithOrderid:(NSString*)orderId
                           Block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"加载中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"cancelReason"] = @"1";
    urlDict[@"orderId"] = orderId;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_userOrderCancel request_data:urlDict];
    
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





/************* 套餐订单 *************/


/**
 *  订单 套餐 列表
 *  isProductList  Y:套餐商品列表,N:预存款充值列表
 */
+ (void)netOrderPromotionsWithIsProductList:(NSString*)isProductList
                                      Block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"加载中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"isProductList"] = isProductList;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_productIndexPromotions request_data:urlDict];
    
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
 *  套餐订单 创建
 *  amount 数量
 *  payId 支付方式id
 *  productId 商品id
 *  skuId  。。。。
 */
+ (void)netOrderDirectWithAmount:(NSString*)amount
                           payId:(NSString*)payId
                       productId:(NSString*)productId
                           skuId:(NSString*)skuId
                            Block:(infoBlockNet)block
{
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"提交中..." dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"amount"] = amount;
    urlDict[@"payId"] = payId;
    urlDict[@"productId"] = productId;
    urlDict[@"skuId"] = skuId;
    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_orderDirect request_data:urlDict];
    
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
 *  套餐订单 支付  pay 测试用
 *  orderId 数量
 *  payId 支付方式id
 */
+ (void)netOrderXPPAYWithOrderId:(NSString*)orderId
                           payId:(NSString*)payId
                           Block:(infoBlockNet)block
{
    [XYProgressHUD svHUDShowStyle:XYHUDStyleMaskNone title:@"支付中..." dismissTimeInterval:1.0];
    
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    urlDict[@"orderId"] = orderId;
    urlDict[@"payId"] = payId;

    
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_orderXpPay request_data:urlDict];
    
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
