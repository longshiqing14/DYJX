//
//  NetWorkTool.m
//  JLYP
//
//  Created by liu_yakai on 17/6/23.
//  Copyright © 2017年 liu_yakai. All rights reserved.
//

#import "NetWorkTool.h"
#import "XYBestRequest.h"
#import "XYNetWorking.h"
#import "JXBaseModel.h"
#import <UIKit/UIKit.h>
#import "NoNetworkView.h"

@implementation NetWorkTool
static NetWorkTool* netWorkTool = nil;
+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        netWorkTool = [[super allocWithZone:NULL] init] ;
    }) ;
    return netWorkTool ;
}

//网络请求数据
+ (void)postRequest:(NSDictionary *)parse relativePath:(NSString *)url ShowAndDismiss:(BOOL)showAndDismiss success:(void (^)(id responseObject))success failure:(void (^)())failure  UnusualFailure:(void (^)())unusualFailure{
    if (showAndDismiss) {
        [XYProgressHUD show];
    }
    
//    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中···" dismissTimeInterval:1.0];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:url request_data:parse];
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@",responseObject);
        
       
        JXBaseModel *baseModel=[JXBaseModel modelWithJSON:responseObject];
        if ([baseModel.RETURN_CODE isEqualToString:@"S0A00000"]) {
            success(baseModel.RETURN_DATA);
            if (showAndDismiss) {
                [XYProgressHUD svHUDDismiss];
            }
            if (!baseModel.RETURN_DATA) {
//                [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:baseModel.RETURN_DESC dismissTimeInterval:1.0];
            }
            
        }else{
             [YDBAlertView showToast:baseModel.RETURN_DESC dismissDelay:1.0];
            
            failure();
        }
        
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
//        if (showAndDismiss) {
//            [XYProgressHUD svHUDDismiss];
//        }

        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        unusualFailure();
       
    }];
}


////网络请求数据
//+ (void)getParameter:(id )parse relativePath:(NSString *)url success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
//
//    //    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:1];
//    //    [dict addEntriesFromDictionary:bodyDic];
//    //    if ([parse isKindOfClass:[NSDictionary class]]) {
//    //        NSDictionary *dic=(NSDictionary *)parse;
//    //        parse=@{@"paramStr":[[dic dictionaryToJSON] replaceString]};
//    //    }else if([parse isKindOfClass:[NSArray class]]){
//    //         NSArray *array=(NSArray *)parse;
//    //        parse=@{@"paramStr":[[array arrayToJSON] replaceString]};
//    //    }else if([parse isKindOfClass:[NSString class]]){
//    //        NSString *str=(NSString *)parse;
//    //        parse=@{@"paramStr":str};
//    //    }
//
//    //    拼接url
//    NSString *urlStr = [NSString stringWithFormat:@"%@%@",BEST_URL,url];
//
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//
//    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
//    manager.requestSerializer.timeoutInterval = 30.f;
//    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
//
//    [manager GET:urlStr parameters:parse progress:^(NSProgress * _Nonnull uploadProgress) {
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//
//            if ([responseObject isKindOfClass:[NSData class]]) {
//                id jsonObject = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//                success(jsonObject);
//            }else{
//                success(responseObject);
//            }
//        });
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            failure(error);
//        });
//    }];
//}
//
//+(void)uplod{
//    NSArray * _imageArr = @[@"2.png",@"3.png"];
//
//    NSArray *dic =@[@"gtjhg",@"htyh"];
//
//    NSString *jsonStr = [dic arrayToJSON];
//    NSString *strUrl = [jsonStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    strUrl = [strUrl stringByReplacingOccurrencesOfString:@" " withString:@""];
//    NSDictionary *paramDic = @{@"paramStr":strUrl};
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer.timeoutInterval = 20;
////    NSMutableArray *arrayimage=[[NSMutableArray alloc]init];
////    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain",@"multipart/form-data"]];
//    [manager POST:@"http://192.168.1.2:8080/api/v1/merchant/uploadimg" parameters:paramDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//
//        for (int i=0; i<_imageArr.count; i++) {
//
//
//            UIImage * image =[UIImage  imageNamed:_imageArr[i]];
//            NSDate *date = [NSDate date];
//            NSDateFormatter *formormat = [[NSDateFormatter alloc]init];
//            [formormat setDateFormat:@"HHmmss"];
//            NSString *dateString = [formormat stringFromDate:date];
//
//            NSString *fileName = [NSString  stringWithFormat:@"%@.png",dateString];
//            NSData *imageData = UIImageJPEGRepresentation(image, 1);
//            double scaleNum = (double)300*1024/imageData.length;
//            NSLog(@"图片压缩率：%f",scaleNum);
//
//
//
//            if(scaleNum <1){
//
//                imageData = UIImageJPEGRepresentation(image, scaleNum);
//            }else{
//
//                imageData = UIImageJPEGRepresentation(image, 0.1);
//
//            }
////            [arrayimage addObject:imageData];
//            [formData  appendPartWithFileData:imageData name:@"headPic" fileName:fileName mimeType:@"image/png"];
//
//
//        }
//
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//
//        NSLog(@"---%@",uploadProgress);
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        NSLog(@"`````````%@",responseObject);
////        NSDictionary *datas = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
//
//        //
////        NSLog(@"请求成功%@",datas);
//
//
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//        NSLog(@"%@",error.userInfo);
//    }];
//}
//
//
//
//
////上传图片方法
//- (void) imageUpload:(UIImage *) image{
//    //把图片转换成imageDate格式
//    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
//    //传送路径
//    NSString *urlString = @"http://116.7.245.98:8841/cmd.svc/System/SystemManager/UploadImage/0/png";
//    //建立请求对象
//    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] init];
//    //设置请求路径
//    [request setURL:[NSURL URLWithString:urlString]];
//    //请求方式
//    [request setHTTPMethod:@"POST"];
//    //一连串上传头标签
//    NSString *boundary = @"---------------------------14737809831466499882746641449";
//    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
//    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
//    NSMutableData *body = [NSMutableData data];
//    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[@"Content-Disposition: form-data; name=\"FlowData\"; filename=\"vim_go.jpg\"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[NSData dataWithData:imageData]];
//    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [request setHTTPBody:body];
//    //上传文件开始
//    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    //获得返回值
//    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",returnString);
//}
//
//-(void)kk{
//    NSLog(@"00000");
//}
//-(void)second{
//    [self performSelector:@selector(kk) withObject:nil afterDelay:0.1];
//}
//
//
//+(NSAttributedString *)contextAttributedString:(NSString *)AttributedString{
//    return   [[NSAttributedString alloc] initWithData:[AttributedString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
//
//}
+(NSString *)stringManipulation:(NSString *)manipulation{
    manipulation=manipulation.length>0? manipulation:@"0";
    if (!manipulation) {
        return @"";
    }
    if ([manipulation isEqualToString:@"0.00"]||[manipulation isEqualToString:@"0"]) {
        return @"";
    }
    return manipulation;
}

+(NSString *)stringfilter:(NSString *)filterStr{
    if (filterStr) {
        filterStr=filterStr.length>0? filterStr:@"";
        if ([filterStr isEqualToString:@"null"]) {
            return @"";
        }
        return filterStr;
    }
    return @"";
    
}

@end
