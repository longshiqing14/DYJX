//
//  NSArray+JSONString.m
//  YWD_baseFramework
//
//  Created by suger on 16/3/11.
//  Copyright © 2016年 liruiqin. All rights reserved.
//

#import "NSArray+JSONString.h"

@implementation NSArray (JSONString)

- (NSString *)JSON {
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonString;
//    if (error) {
//        return nil;
////        @throw [NSException exceptionWithName:@"error json" reason:@"" userInfo:@{@"error":error}];
//    }else{
//        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    }
}

@end
