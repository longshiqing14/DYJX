//
//  JXPopExplainView.m
//  user
//
//  Created by liu_yakai on 2018/3/14.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXPopExplainView.h"

@implementation JXPopExplainView

-(void)setPop:(NSString *)popStr{
    [self reat:5];
//    popStr=[NSString stringWithFormat:@"<html><body><font face=\"PingFang-SC-Regular\" size=\"4\" color=\"#99999\">99999 </font><font face=\"PingFang-SC-Regular\" size=\"7\" color=\"#88888\">999999 </font></body></html>"];
    _popExplainTextView.editable = NO;

    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[popStr dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    _popExplainTextView.attributedText=attrStr;
}

- (IBAction)dismissPOPClock:(id)sender {
    if(self.Diss){
        self.Diss();
    }
}

@end
