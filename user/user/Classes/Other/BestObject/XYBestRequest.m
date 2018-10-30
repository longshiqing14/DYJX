//
//  XYBestRequest.m
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBestRequest.h"

#import "XYCommon.h"

#import<CommonCrypto/CommonDigest.h>

@implementation XYBestRequest

static NSString * const app_token = @"39461b2aee2abc26c3c783e2bd5cfccb";
static NSString * const key = @"1c76e21f733cf731d35a18065ac41d24";


//static NSString * const Api_ID = @"Api_ID";
//static NSString * const Sign_Method = @"Sign_Method";
//static NSString * const Sign = @"Sign";
//static NSString * const Serial_No = @"Serial_No";
//static NSString * const App_Token = @"App_Token";
//static NSString * const Time_Stamp = @"Time_Stamp";


+ (NSMutableDictionary*)requestAllDataWithApi_ID:(NSString*)api_ID
                         request_data:(NSDictionary*)request_data
{
    
    NSString * apiid = [NSString stringWithFormat:@"com.xiaopeng.%@",api_ID];
    
    NSString * dataString = [XYCommon dictionaryToJson:request_data];
    dataString = [dataString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    dataString = [dataString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    
    NSMutableString * serial_No = [NSMutableString string];
    
    [serial_No appendFormat:@"11%ld",random()%10];
    [serial_No appendFormat:@"%ld",random()%10];
    [serial_No appendFormat:@"%ld",random()%10];
    [serial_No appendFormat:@"%ld",random()%10];
    [serial_No appendFormat:@"%ld",random()%10];
    [serial_No appendFormat:@"%ld",random()%10];
    [serial_No appendFormat:@"%ld",random()%10];
    [serial_No appendFormat:@"%ld",random()%10];
    
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString * DateTime = [formatter stringFromDate:date];
    
    NSMutableString * md5String = [NSMutableString string];
    
    [md5String appendFormat:@"Api_ID=%@",apiid];
    [md5String appendFormat:@"&App_Token=%@",app_token];
    [md5String appendFormat:@"&REQUEST_DATA=%@",dataString];
    [md5String appendFormat:@"&Serial_No=%@",serial_No];
    [md5String appendString:@"&Sign_Method=MD5"];
    [md5String appendFormat:@"&Time_Stamp=%@",DateTime];
    [md5String appendFormat:@"&%@",key];
    
//    [md5String appendString:@"Api_ID=com.xiaopeng.banner.list&App_Token=39461b2aee2abc26c3c783e2bd5cfccb&REQUEST_DATA={}&Serial_No=1234567890&Sign_Method=MD5&Time_Stamp=2017-10-30 02:46:28&1c76e21f733cf731d35a18065ac41d24"];
    
    
    
    NSString * md5 = [[self class] md5:md5String];
    
    
    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
    attrs[@"Api_ID"] = apiid;
    attrs[@"Sign_Method"] = @"MD5";
    attrs[@"Sign"] = md5;
    attrs[@"Serial_No"] = serial_No;
    attrs[@"App_Token"] = app_token;
    attrs[@"Time_Stamp"] = DateTime;
    

    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    
    dict[@"REQUEST_ATTRS"] = attrs;
    dict[@"REQUEST_DATA"] = request_data;
    
    
    return dict;
}



+ (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (int)strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}



@end
