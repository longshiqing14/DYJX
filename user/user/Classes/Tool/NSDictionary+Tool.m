//
//  NSDictionary+Tool.m
//  JLYP
//
//  Created by liu_yakai on 17/6/23.
//  Copyright © 2017年 liu_yakai. All rights reserved.
//

#import "NSDictionary+Tool.h"

@implementation NSDictionary (Tool)
- (NSString *)dictionaryToJSON
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return jsonStr;
}




@end
