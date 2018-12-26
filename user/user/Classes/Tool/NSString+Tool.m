//
//  NSString+Tool.m
//  JLYP
//
//  Created by liu_yakai on 17/6/23.
//  Copyright © 2017年 liu_yakai. All rights reserved.
//

#import "NSString+Tool.h"

@implementation NSString (Tool)
-(NSString *)replaceString{
    if (self.length==0) {
        return @"";
    }
    NSString *strUrl = [self stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    strUrl=[self stringByReplacingOccurrencesOfString:@"null" withString:@""];
    strUrl=[self stringByReplacingOccurrencesOfString:@"nill" withString:@""];
    return [strUrl stringByReplacingOccurrencesOfString:@" " withString:@""];
}

-(BOOL)isStrnil{
    if (self==nil) {
        return NO;
    }
    return self.length==0?NO:YES;
}



-(NSDictionary *)parseJSONStringToNSDictionary {
    NSError *error;
    NSData *JSONData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:&error];
    if (!error) {
        return responseJSON;
    }
    return nil;
}

-(NSArray *)parseJSONStringToNSArray {
    NSError *error;
    NSData *JSONData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:&error];
    if (!error) {
        return responseJSON;
    }
    return nil;
}

- (BOOL)isUrl
{
    
    NSString *regex =@"[a-zA-z]+://[^\\s]*";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:self];
}

-(NSArray *)readplish{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:self ofType:@"plist"];
    return [[NSMutableArray alloc] initWithContentsOfFile:filePath];
}

//划线lable
-(NSMutableAttributedString *)crossed{
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle], NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)};
    return [[NSMutableAttributedString alloc]initWithString:self attributes:attribtDic];
}

//变色lable
-(NSMutableAttributedString *)changeColour:(NSString *)changeColourtext FountColour:(UIColor *)fountColour{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange range1 = [[str string] rangeOfString:changeColourtext];
    [str addAttribute:NSForegroundColorAttributeName value:fountColour range:range1];
    return str;
}

-(NSAttributedString *)attributedStringHTML{
    return [[NSAttributedString alloc] initWithData:[self dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
}

- (NSString *)XYImageURL{
    if (!self.length || [self isKindOfClass:[NSNull class]]) {
        return @"";
    }
    NSString *firstString = [self substringWithRange:NSMakeRange(0, 1)];
    
    NSString *secondString = [self substringWithRange:NSMakeRange(1, 2)];
    return [NSString stringWithFormat:@"%@%@/%@/%@",BEST_IMAGE_URL,firstString,secondString,self];
}

+ (NSString *)imageURLWithTargetId:(NSString *)targetId type:(NSInteger)type{
    return [NSString stringWithFormat:@"%@Id=%@&Type=%ld",BEST_GET_URL,targetId,(long)type];
}

-(NSDictionary *)stringToDictionary {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
   return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}
@end
