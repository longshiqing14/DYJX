//
//  NSObject+Extension.h
//  user
//
//  Created by longshiqing on 2018/11/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Extension)

+(void)setModel:(id)model forKey:(NSString *)key;

+(id)getModelWithKey:(NSString *)key Class:(Class)classA;

@end

NS_ASSUME_NONNULL_END
