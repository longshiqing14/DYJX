//
//  JXOrderDetailSubClassOrderStatusHeatView.m
//  user
//
//  Created by liu_yakai on 2017/12/26.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXOrderDetailSubClassOrderStatusHeatView.h"

@implementation JXOrderDetailSubClassOrderStatusHeatView

-(void)heat_init:(JXOrderStatusModel *)model{
    self.orderNumber.text=[NSString stringWithFormat:@"订单编号:%@",model.orderNo.length>0?model.orderNo:@""];
    self.userName.text=[NSString stringWithFormat:@"承运方:%@",model.billName.length>0?model.billName:@""];
    
//    NSString *strUrl = [model.billNo stringByReplacingOccurrencesOfString:@"," withString:@"<br/>"];
//    NSString * contentText=[NSString stringWithFormat:@"<html><body> <font face=\"PingFang-SC-Regular\" size=\"3\" color=\"#666666\">运单号:88888888888888888888888888888888%@</font> </body></html>",strUrl];
//    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[contentText dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
//    self.waybillNumber.attributedText=attrStr;
    self.waybillNumber.text=[NSString stringWithFormat:@"%@",model.billNo.length>0?model.billNo:@""];
}

@end
