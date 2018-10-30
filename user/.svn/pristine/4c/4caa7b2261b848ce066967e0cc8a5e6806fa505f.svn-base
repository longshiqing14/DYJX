//
//  UITextView+Tool.m
//  JLYP
//
//  Created by liu_yakai on 17/6/28.
//  Copyright © 2017年 liu_yakai. All rights reserved.
//

#import "UITextView+Tool.h"

@implementation UITextView (Tool)
-(UITextView *)agreementStr:(NSString *)agreement{
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[agreement dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    self.editable=NO;
    self.attributedText=attrStr;
    return self;
}
@end
