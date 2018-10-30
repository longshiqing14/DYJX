//
//  JXNotUsedView.m
//  user
//
//  Created by liu_yakai on 2017/11/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXNotUsedHeatView.h"

@implementation JXNotUsedHeatView

-(void)heat_init:(NSInteger)tag  ImageName:(NSString *)imageName couponModel:(JXCouponDetailModel*)model{
    /*//优惠券面额
     @property (weak, nonatomic) IBOutlet UILabel *moneyLable;
     //用户类型
     @property (weak, nonatomic) IBOutlet UILabel *userTypeLable;
     //优惠券类型
     @property (weak, nonatomic) IBOutlet UILabel *voucherLable;
     //优惠券时间
     @property (weak, nonatomic) IBOutlet UILabel *vocherTime;
     //背景图片
     @property (weak, nonatomic) IBOutlet UIImageView *heatImageView;
     //点View
     @property (weak, nonatomic) IBOutlet UILabel *circularLable;
     @property (weak, nonatomic) IBOutlet UILabel *circular;
     //内容
     @property (weak, nonatomic) IBOutlet UILabel *contentLable;
     @property (weak, nonatomic) IBOutlet UILabel *content;*/
    self.clockButton.tag=tag;
    self.immediatelyButton.tag=tag;
//    [self.immediatelyButton reat:5];
//    [self.immediatelyButton sideLine:1 SideLineColor:XYRGBAColor(236,59,44,1)];
    [self.circularLable reat:3];
    [self.circular reat:3];
    
    [self.immediatelyButton setTitle:[NSString stringWithFormat:@"%@张",model.amount] forState:(UIControlStateNormal)];
    //    优惠券面额
    self.moneyLable.attributedText=[self string:@"￥" Value:model.faceValue];
    //    优惠券类型
    self.userTypeLable.text= model.outerName;
    self.thresHoldLb.text = model.threshold;
    self.voucherLable.text =  model.range;
    
    self.vocherTime.text = [self getStartTimeAndEndTimeWithStart:model.activeDateStart end:model.activeDateEnd];
    
    if (model.explanationArr.count >= 1) {
        self.contentLable.text = model.explanationArr[0];
    }
    if (model.explanationArr.count >= 2){
        self.content.text = model.explanationArr[1];
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

- (IBAction)aleadyClock:(UIButton*)sender {
    
    sender.selected = !sender.selected;
    
    NSLog(@"%@",sender.selected?@"YES":@"NO");
    if (self.Clock) {
        self.Clock(sender.tag, sender.selected);
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
