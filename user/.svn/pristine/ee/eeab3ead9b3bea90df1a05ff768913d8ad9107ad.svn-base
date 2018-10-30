//
//  NSUserDefaults+Tool.m
//  ARP
//
//  Created by liu_yakai on 2017/11/5.
//  Copyright © 2017年 liu_yakai. All rights reserved.
//

#import "NSUserDefaults+Tool.h"

@implementation NSUserDefaults(Tool)

-(void)setUserDefault:(NSString *)key Value:(NSString *)value{
    [[NSUserDefaults standardUserDefaults]setObject:value forKey:key];
}

-(NSString *)getUserDefault:(NSString *)key{
    return [[NSUserDefaults standardUserDefaults]objectForKey:key];
    
}

-(NSString *)isNil:(NSString *)key{
    if ([self getUserDefault:key]!=NULL) {
        return [self getUserDefault:key];
    }
    return @"";
}

@end
