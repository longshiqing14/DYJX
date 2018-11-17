//
//  NSObject+Extension.m
//  user
//
//  Created by longshiqing on 2018/11/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "NSObject+Extension.h"
#import "JSExtension.h"

@implementation NSObject (Extension)

+(void)setModel:(id)model forKey:(NSString *)key {
    dispatch_semaphore_wait([JSExtension shared].semaphore, 2);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (model == nil) {
        [defaults removeObjectForKey:key];
    }
    else {
        NSString *modelJsonString =  [model modelToJSONString];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:modelJsonString];
        [defaults setObject:data forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    dispatch_semaphore_signal([JSExtension shared].semaphore);
}

+(id)getModelWithKey:(NSString *)key Class:(Class)classA {
    dispatch_semaphore_wait([JSExtension shared].semaphore, 2);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:key];
    [defaults synchronize];
    NSString *modelJson = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    if (modelJson != nil) {
        return [classA modelWithJSON:modelJson];
    }
    return nil;
    dispatch_semaphore_signal([JSExtension shared].semaphore);
}

@end