//
//  XYNetWorking.m
//  XYNetWorking
//
//  Created by xingyun on 2017/7/13.
//  Copyright © 2017年 xingyun. All rights reserved.
//

#import "XYNetWorking.h"

#import "XYAppDotNetAPIClient.h"
#import "XYBestAllNet.h"



@implementation XYNetWorking


+(void)XYGET:(NSString *)url
      params:(id)params
     success:(XYResponseSuccess)success
        fail:(XYResponseFail)fail
{
    
    AFHTTPSessionManager *manager = [XYNetWorking managerWithBaseURL:nil sessionConfiguration:NO];
//    NSString * urlString = [XYNetWorking EncryptionWithDict:params parameter:url];
    
    NSString * urlString = @"";
    
    [manager GET:[NSString stringWithFormat:@"%@%@",BEST_URL,urlString] parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        id dic = [XYNetWorking responseConfiguration:responseObject];
        
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(task,error);
    }];
}



+(void)XYPOST:(NSString *)url
       params:(id)params
      success:(XYResponseSuccess)success
         fail:(XYResponseFail)fail
{
    AFHTTPSessionManager *manager = [XYNetWorking managerWithBaseURL:nil sessionConfiguration:NO];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 60.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    [manager POST:[BEST_URL stringByAppendingString:url] parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        XYLog(@"接口返回值%@",responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:RETURN_CODE] isEqualToString:ERROR_NUM_NOTlOGGED] ) {
                
                [XYUserDefaults deleteUserDefaultsRegistered];
                [XYUserDefaults deleteUserDefaultsInfo];
//                [XYCommon setPresentViewControllerWithLoginView];
            }
        }
        
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(task,error);
    }];

}



+(void)XYuploadWithURL:(NSString *)url
                params:(NSDictionary *)params
              fileData:(NSData *)filedata
                  name:(NSString *)name
              fileName:(NSString *)filename
              mimeType:(NSString *) mimeType
              progress:(XYProgress)progress
               success:(XYResponseSuccess)success
                  fail:(XYResponseFail)fail
{
    
//    AFHTTPSessionManager *manager = [XYNetWorking managerWithBaseURL:nil sessionConfiguration:NO];

    [[XYAppDotNetAPIClient sharedClient] POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:filedata name:name fileName:name mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progress(uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //        和服务器编码不同时
        //        NSStringEncoding  gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        //        NSString *stttt = [[NSString alloc]initWithData:responseObject   encoding:gbkEncoding];
        success(task,dict);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(task,error);
    }];
}



+(NSURLSessionDownloadTask *)downloadWithURL:(NSString *)url
                                 savePathURL:(NSURL *)fileURL
                                    progress:(XYProgress )progress
                                     success:(void (^)(NSURLResponse *, NSURL *))success
                                        fail:(void (^)(NSError *))fail;
{
//    AFHTTPSessionManager *manager = [self managerWithBaseURL:nil sessionConfiguration:YES];
    
    NSURL *urlpath = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlpath];
    
    NSURLSessionDownloadTask *downloadtask = [[XYAppDotNetAPIClient sharedClient] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        return [fileURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (error) {
            fail(error);
        }else{
            
            success(response,filePath);
        }
    }];
    
    [downloadtask resume];
    
    return downloadtask;
}

#pragma mark - Private

+(AFHTTPSessionManager *)managerWithBaseURL:(NSString *)baseURL  sessionConfiguration:(BOOL)isconfiguration{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager =nil;
    
    NSURL *url = [NSURL URLWithString:baseURL];
    if (isconfiguration) {
        
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url sessionConfiguration:configuration];
    }else{
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    }
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [manager.requestSerializer setValue:@"sessionId" forHTTPHeaderField:@"acc4b23bcde25101c47bbd64095926cf60331"];
    
    NSString * sessionId = [XYUserDefaults readUserDefaultsOfSessionId];
    if (sessionId != nil) {
        [manager.requestSerializer setValue:sessionId forHTTPHeaderField:@"sessionId"];
    }
    
    manager.requestSerializer.timeoutInterval = 30;
    
    
    return manager;
}

/** 数据转换 */
+(id)responseConfiguration:(id)responseObject{
    
    NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    return dic;
    
}



@end
