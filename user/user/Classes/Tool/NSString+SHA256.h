//
//  NSString+SHA256.h
//  PCBStrore
//
//  Created by 岩  熊 on 2017/10/18.
//  Copyright © 2017年 xiongyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SHA256)
- (NSString *)getSha256String:(NSString *)srcString ;
@end
