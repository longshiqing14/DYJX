//
//  XYNetWorking.h
//  XYNetWorking
//
//  Created by xingyun on 2017/7/13.
//  Copyright © 2017年 xingyun. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  宏定义请求成功的block
 *
 *  @param responseObject 请求成功返回的数据
 */
typedef void (^XYResponseSuccess)(NSURLSessionDataTask * task,id responseObject);

/**
 *  宏定义请求失败的block
 *
 *  @param error 报错信息
 */
typedef void (^XYResponseFail)(NSURLSessionDataTask * task, NSError * error);

/**
 *  上传或者下载的进度
 *
 *  @param progress 进度
 */
typedef void (^XYProgress)(NSProgress *progress);


@interface XYNetWorking : NSObject



/**
 *  普通get方法请求网络数据
 *
 *  @param url     请求网址路径
 *  @param params  请求参数
 *  @param success 成功回调
 *  @param fail    失败回调
 */
+(void)XYGET:(NSString *)url
      params:(id)params
     success:(XYResponseSuccess)success
        fail:(XYResponseFail)fail;


/**
 *  普通post方法请求网络数据
 *
 *  @param url     请求网址路径
 *  @param params  请求参数
 *  @param success 成功回调
 *  @param fail    失败回调
 */
+(void)XYPOST:(NSString *)url
       params:(id)params
      success:(XYResponseSuccess)success
         fail:(XYResponseFail)fail;



/**
 *  普通路径上传文件
 *
 *  @param url      请求网址路径
 *  @param params   请求参数
 *  @param filedata 文件
 *  @param name     指定参数名
 *  @param filename 文件名（要有后缀名）
 *  @param mimeType 文件类型
 *  @param progress 上传进度
 *  @param success  成功回调
 *  @param fail     失败回调
 */
+(void)XYuploadWithURL:(NSString *)url
                params:(NSDictionary *)params
              fileData:(NSData *)filedata
                  name:(NSString *)name
              fileName:(NSString *)filename
              mimeType:(NSString *) mimeType
              progress:(XYProgress)progress
               success:(XYResponseSuccess)success
                  fail:(XYResponseFail)fail;


/**
 *  下载文件
 *
 *  @param url      请求网络路径
 *  @param fileURL  保存文件url
 *  @param progress 下载进度
 *  @param success  成功回调
 *  @param fail     失败回调
 *
 *  @return 返回NSURLSessionDownloadTask实例，可用于暂停继续，暂停调用suspend方法，重新开启下载调用resume方法
 */
+(NSURLSessionDownloadTask *)downloadWithURL:(NSString *)url
                                 savePathURL:(NSURL *)fileURL
                                    progress:(XYProgress )progress
                                     success:(void (^)(NSURLResponse *, NSURL *))success
                                        fail:(void (^)(NSError *))fail;





@end
