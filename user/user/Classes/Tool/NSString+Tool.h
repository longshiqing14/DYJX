//
//  NSString+Tool.h
//  JLYP
//
//  Created by liu_yakai on 17/6/23.
//  Copyright © 2017年 liu_yakai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Tool)
/**
 *  字符串替换换行 空格 null nill
 *
 *  @return 返回新字符串
 */
-(NSString *)replaceString;
/**
 *  判断字符串为不为空
 *
 *  @return 返回@“no/yes”
 */
-(BOOL)isStrnil;

/**
 *  json转字典
 *
 *  @return 返回字典
 */
-(NSDictionary *)parseJSONStringToNSDictionary;
/**
 *  json转数组
 *
 *  @return 返回数组
 */
-(NSArray *)parseJSONStringToNSArray;
/**
 *  是否为url
 *
 *  @return 返回yes是url  no不是url
 */
- (BOOL)isUrl;


-(NSArray *)readplish;

-(NSMutableAttributedString *)crossed;
-(NSMutableAttributedString *)changeColour:(NSString *)changeColourtext FountColour:(UIColor *)fountColour;
-(NSAttributedString *)attributedStringHTML;

@end
