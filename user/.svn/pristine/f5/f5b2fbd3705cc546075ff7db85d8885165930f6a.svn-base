//
//  XYBestAllNet.m
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBestAllNet.h"

@implementation XYBestAllNet


NSString * const RETURN_CODE = @"RETURN_CODE";
NSString * const RETURN_DESC = @"RETURN_DESC";
NSString * const RETURN_STAMP = @"RETURN_STAMP";
NSString * const RETURN_DATA = @"RETURN_DATA";

NSString * const ERROR_NUM_STRING = @"S0A00000";  // 返回成功
NSString * const ERROR_NUM_NOTlOGGED = @"E1M000003";  // 未登录




+(void)commonUploadImgWith:(UIImage *)img resultBlock:(infoBlockNet)block
{

//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"上传中" dismissTimeInterval:1.0];
    [XYProgressHUD show];
    /** 裁剪 */
//    CGSize size = img.size;
////    CGSize viewsize = {300 ,300};
//    CGSize viewsize = CGSizeMake(kScreenWidth, kScreenHeight);
//    CGFloat scalex = viewsize.width / size.width;
//    CGFloat scaley = viewsize.height / size.height;
//    CGFloat scale = MAX(scalex, scaley);
//
//    UIGraphicsBeginImageContext(viewsize);
//
//    CGFloat width = size.width * scale;
//    CGFloat height = size.height * scale;
//
//    float dwidth = ((viewsize.width - width)/2.0f);
//    float dheight = ((viewsize.height - height)/2.0f);
//
//    CGRect rect = CGRectMake(dwidth, dheight, size.width * scale, size.height * scale);
//    [img drawInRect:rect];
//
//    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    
    /**  */
    NSData *data = UIImageJPEGRepresentation(img, 0.25);

    NSData *encodedImageData = [data base64EncodedDataWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    param[@"fileExt"] = @"jpg";
    param[@"imgData"] = [[NSString  alloc] initWithData:encodedImageData encoding:NSUTF8StringEncoding];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_commonPicUpload request_data:param];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                
                if ([responseObject objectForKey:RETURN_DATA] != nil) {
                    [XYProgressHUD svHUDDismiss];

                    block([responseObject objectForKey:RETURN_DATA],nil);
                }else{
                    [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];

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


+(void)commonUploadImgHeadPortraitWith:(UIImage *)img resultBlock:(infoBlockNet)block
{
    
    //    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"上传中" dismissTimeInterval:1.0];
    [XYProgressHUD show];
    /** 裁剪 */
        CGSize size = img.size;
        CGSize viewsize = {300 ,300};
//        CGSize viewsize = CGSizeMake(kScreenWidth, kScreenHeight);
        CGFloat scalex = viewsize.width / size.width;
        CGFloat scaley = viewsize.height / size.height;
        CGFloat scale = MAX(scalex, scaley);
    
        UIGraphicsBeginImageContext(viewsize);
    
        CGFloat width = size.width * scale;
        CGFloat height = size.height * scale;
    
        float dwidth = ((viewsize.width - width)/2.0f);
        float dheight = ((viewsize.height - height)/2.0f);
    
        CGRect rect = CGRectMake(dwidth, dheight, size.width * scale, size.height * scale);
        [img drawInRect:rect];
    
        UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    
    /**  */
    NSData *data = UIImageJPEGRepresentation(img, 0.6);
    
    NSData *encodedImageData = [data base64EncodedDataWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    param[@"fileExt"] = @"jpg";
    param[@"imgData"] = [[NSString  alloc] initWithData:encodedImageData encoding:NSUTF8StringEncoding];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_commonPicUpload request_data:param];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_STRING] ) {
                
                if ([responseObject objectForKey:RETURN_DATA] != nil) {
                    [XYProgressHUD svHUDDismiss];

                    block([responseObject objectForKey:RETURN_DATA],nil);
                }else{
                    [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC] dismissDelay:1.0];

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



@end
