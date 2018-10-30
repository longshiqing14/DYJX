//
//  XYPay.h
//  user
//
//  Created by liu_yakai on 2017/11/2.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WXApiObject.h"
#import "WXApi.h"
#import "XYPlayModel.h"

@interface XYPay : NSObject<WXApiDelegate>
@property(nonatomic,copy)void (^ Success)(PayResp *payResp);
@property(nonatomic,copy)void (^ Failure)(BaseResp *baseResp);

+(instancetype) shareXYPay;
//微信支付
+(void)wxpay:(XYWXPaySignModel *)xyWXPaySignModel;
//微信支付的回调
-(void)onResp:(BaseResp*)resp;

+ (void)requestParameter:(id )parse relativePath:(NSString *)url success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

//支付宝支付
+(void)alipay:(NSString *)alipayoder success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
//银联支付
+(void)unionPay:(NSString *)unionSerialNumber ViewController:(UIViewController *)viewController;
@end
