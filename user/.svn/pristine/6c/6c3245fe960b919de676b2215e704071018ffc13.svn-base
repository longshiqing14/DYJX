//
//  JXOderInvoiceView.m
//  user
//
//  Created by liu_yakai on 2018/4/10.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXOderInvoiceView.h"
#import "NetWorkTool.h"

@implementation JXOderInvoiceView
- (IBAction)popClock:(id)sender {
    if (self.ClockPop) {
        self.ClockPop();
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.Clock) {
        self.Clock();
    }
}

-(void)invoice_init:(JXOderInvoiceInfoModel *)model{
    self.titleLable.text=@"发票信息";
    if ([model.displayInvoiceKey isEqualToString:@"0"]) {
//        宽带商品不开发票
        self.subLable.text=@"";
        self.invoicceImageView.hidden=YES;
        self.line.hidden=YES;
    }else{
        self.invoicceImageView.hidden=NO;
        if ([model.needInvoiceKey isEqualToString:@"no"]) {
            self.line.hidden=YES;
            //            没有发票信息所以显示不开发票
            self.subLable.text=@"不开发票";
        }else{
            if ([model.invoiceTypeKey isEqualToString:@"vat"]||[model.invoiceTypeKey isEqualToString:@"com"]) {
                //        vat企业   com个人
                if ([[NetWorkTool stringfilter:model.invoiceTitleType] isEqualToString:@""]) {
                    self.subLable.text=@"不开发票";
                    self.line.hidden=YES;
                }else{
                    self.line.hidden=NO;
                    self.subLable.text=model.invoiceTitleType;
                }
                
            }else{
                self.line.hidden=YES;
                //            没有发票信息所以显示不开发票
                self.subLable.text=@"不开发票";
            }
        }
        
    }

}

@end
