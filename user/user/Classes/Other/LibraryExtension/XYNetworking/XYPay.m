//
//  XYPay.m
//  user
//
//  Created by liu_yakai on 2017/11/2.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYPay.h"
#import "XYNetWorking.h"
#import "XYBestRequest.h"
#import <AlipaySDK/AlipaySDK.h>
#import "UPPaymentControl.h"

static XYPay* xYPay = nil;
@implementation XYPay
+(instancetype) shareXYPay
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        xYPay = [[super allocWithZone:NULL] init] ;
    }) ;
    return xYPay ;
}
//微信支付
+(void)wxpay:(XYWXPaySignModel *)xyWXPaySignModel{
    
 
    
    PayReq *request = [[PayReq alloc]init];
    request.partnerId = xyWXPaySignModel.partnerid;
    request.prepayId=xyWXPaySignModel.prepayid;
    request.package = xyWXPaySignModel.package;
    request.nonceStr=xyWXPaySignModel.noncestr;
    request.timeStamp=xyWXPaySignModel.timestamp;
    request.sign=xyWXPaySignModel.sign;
    [WXApi sendReq:request];
}

//微信支付回调
-(void)onResp:(BaseResp*)resp{
    if ([resp isKindOfClass:[PayResp class]]){
        PayResp*response=(PayResp*)resp;
        if (response.errCode==0) {
            NSLog(@"支付成功");
            if (self.Success) {
                self.Success(response);
            }
        }else{
            NSLog(@"支付失败，retcode=%d   %@",resp.errCode,resp.errStr);
            if (self.Failure) {
                self.Failure(resp);
            }
        }
        
    }
}


-(void) onReq:(BaseReq*)req{
    
    
}

+ (void)requestParameter:(id )parse relativePath:(NSString *)url success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中···" dismissTimeInterval:1.0];
    [XYProgressHUD show];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:url request_data:parse];
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        [XYProgressHUD svHUDDismiss];
       
        success(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        failure(error);
    }];
    
    
    
    
}



+(void)alipay:(NSString *)alipayoder success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    [[AlipaySDK defaultService] payOrder:alipayoder fromScheme:@"com.xiaopenglive.xpjx" callback:^(NSDictionary *resultDic) {
        success(resultDic);
        NSLog(@"reslut = %@",resultDic);
//        PlaAlBBModel *plaAlBBModel=[[PlaAlBBModel alloc]initWithDictionary:resultDic error:nil];
//        NSLog(@"%@",plaAlBBModel);
//        if ([plaAlBBModel.resultStatus isEqualToString:@"9000"]) {
//            [self showHint:@"支付成功" withDelegate:self];
//        }else{
//            [self showHint:@"支付失败"];
//        }
        
    }];
    
}


//银联支付
+(void)unionPay:(NSString *)unionSerialNumber ViewController:(UIViewController *)viewController{
    [[UPPaymentControl defaultControl] startPay:unionSerialNumber fromScheme:@"com.xiaopenglive.xpjx" mode:@"01" viewController:viewController];
}


@end
