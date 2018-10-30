//
//  JXCouponDetailHeaderView.m
//  user
//
//  Created by 岩  熊 on 2017/12/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXCouponDetailHeaderView.h"
#import "JXCouponDetailModel.h"
@implementation JXCouponDetailHeaderView
-(void)heat_init:(NSInteger)tag  ImageName:(NSString *)imageName couponModel:(JXCouponDetailModel*)model{


//    [self.immediatelyButton setTitle:[NSString stringWithFormat:@"%@张",model.amount] forState:(UIControlStateNormal)];
    //    优惠券面额
    self.moneyLable.attributedText=[self string:@"￥" Value:model.amount];
    //    优惠券类型
    self.userTypeLable.text= model.outerName;
    self.thresHoldLb.text = model.threshold;
    self.voucherLable.text =  model.range;
    
    self.vocherTime.text = [self getStartTimeAndEndTimeWithStart:model.activeDateStart end:model.activeDateEnd];
    if ([model.statu isEqualToString:@"0"]) {
       [self.immediatelyButton setTitle:@"立即领取" forState:(UIControlStateNormal)];
        self.immediatelyButton.backgroundColor = [UIColor colorWithHexString:@"#EC3B2C"];
        [self.immediatelyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else if ([model.statu isEqualToString:@"1"]){
       [self.immediatelyButton setTitle:@"去使用" forState:(UIControlStateNormal)];
        self.immediatelyButton.backgroundColor = [UIColor whiteColor];
        [self.immediatelyButton setTitleColor:[UIColor colorWithHexString:@"#EC3B2C"] forState:UIControlStateNormal];
        self.immediatelyButton.layer.borderWidth = 1.0;
        self.immediatelyButton.layer.borderColor = [UIColor colorWithHexString:@"#EC3B2C"].CGColor;
    }else if ([model.statu isEqualToString:@"2"]){
        [self.immediatelyButton setTitle:@"已使用" forState:(UIControlStateNormal)];
        self.immediatelyButton.backgroundColor = [UIColor whiteColor];
        [self.immediatelyButton setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
        self.immediatelyButton.layer.borderWidth = 1.0;
        self.immediatelyButton.layer.borderColor = [UIColor colorWithHexString:@"#999999"].CGColor;
    }
   
    /*
     
     */
}


-(NSAttributedString *)string:(NSString *)keyStr Value:(NSString *)value{
    NSString *str=[NSString stringWithFormat:@"<html><body><font face=\"PingFang-SC-Regular\" size=\"5\" color=\"#EC3B2C\">%@ </font><font face=\"PingFang-SC-Regular\" size=\"8\" color=\"#EC3B2C\">%@ </font></body></html>",keyStr,value];
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    return attrStr;
}

//立即使用
- (IBAction)immediatelyClock:(id)sender {
    if (self.UseClock) {
        self.UseClock();
    }
}


- (NSString*)getStartTimeAndEndTimeWithStart:(NSString*)start end:(NSString*)end{
    NSString *startStr =nil;
    NSString *endStr =nil;
    if (start.length >= 10) {
        startStr = [start substringToIndex:10];
    }else{
        startStr = start;
    }
    startStr = [startStr stringByReplacingOccurrencesOfString:@"-" withString:@"."];
    
    if (end.length >= 10) {
        endStr = [end substringToIndex:10];
    }else{
        endStr = end;
    }
    endStr = [endStr stringByReplacingOccurrencesOfString:@"-" withString:@"."];
    return [NSString stringWithFormat:@"%@-%@",startStr,endStr];
}

@end
