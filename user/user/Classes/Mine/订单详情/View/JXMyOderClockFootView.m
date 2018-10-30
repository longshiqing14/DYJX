//
//  JXMyOderFootView.m
//  user
//
//  Created by liu_yakai on 2018/3/5.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyOderClockFootView.h"

@implementation JXMyOderClockFootView

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.confirmationReceiptButton reat:5];
    [self.confirmationReceiptButton sideLine:1 SideLineColor:XYRGBAColor(236,59,44, 1)];
    [self.distributionStatusButton reat:5];
    [self.distributionStatusButton sideLine:1 SideLineColor:XYRGBAColor(58,62,71, 1)];
    [self.returnGoodsButton reat:5];
    [self.returnGoodsButton sideLine:1 SideLineColor:XYRGBAColor(58,62,71, 1)];
}

-(void)myOder_init:(JXMyProcessStateInfoModel *)model IsOrderRefund:(NSString *)isOrderRefund{
    self.oderState=model.state;
    if ([model.state isEqualToString: JX_PAYMENT_ODERSTATE_PENDINGPAYMENT]) {
        self.returnGoodsButton.hidden=YES;
//        待付款
        [self.distributionStatusButton setTitle:@"取消订单" forState:(UIControlStateNormal)];
        self.layoutWidth.constant=75;
        [self.confirmationReceiptButton setTitle:@"立即支付" forState:(UIControlStateNormal)];
    }else if ([model.state isEqualToString: JX_PAYMENT_ODERSTATE_PENDINGDELIVERY]){
        self.returnGoodsButton.hidden=YES;
        if ([isOrderRefund isEqualToString:@"1"]) {
            self.distributionStatusButton.hidden=YES;
        }else{
            self.distributionStatusButton.hidden=NO;
        }
        [self.distributionStatusButton setTitle:@"申请退货/退款" forState:(UIControlStateNormal)];
        self.layoutWidth.constant=100;
        [self.confirmationReceiptButton setTitle:@"配送状态" forState:(UIControlStateNormal)];
//        待发货
    }else if ([model.state isEqualToString: JX_PAYMENT_ODERSTATE_GOODSRECEIVED]){
        self.returnGoodsButton.hidden=NO;
        if ([isOrderRefund isEqualToString:@"1"]) {
            self.returnGoodsButton.hidden=YES;
        }else{
            self.returnGoodsButton.hidden=NO;
        }
//        //待收货
        [self.distributionStatusButton setTitle:@"配送状态" forState:(UIControlStateNormal)];
        self.layoutWidth.constant=75;
        [self.confirmationReceiptButton setTitle:@"确认收货" forState:(UIControlStateNormal)];
        [self.returnGoodsButton setTitle:@"申请退货/退款" forState:UIControlStateNormal];
    }else if ([model.state isEqualToString: JX_PAYMENT_ODERSTATE_COMPLETED]){
        self.returnGoodsButton.hidden=YES;
        if ([isOrderRefund isEqualToString:@"1"]) {
            self.distributionStatusButton.hidden=YES;
        }else{
            self.distributionStatusButton.hidden=NO;
        }
//        已完成
        [self.distributionStatusButton setTitle:@"申请退货/退款" forState:(UIControlStateNormal)];
        self.layoutWidth.constant=100;
        [self.confirmationReceiptButton setTitle:@"配送状态" forState:(UIControlStateNormal)];
    }
}

//红色按钮
- (IBAction)confirmationReceiptClock:(id)sender {
    if (self.GulesButtonClock) {
        self.GulesButtonClock(self.oderState);
    }
}

//黑色按钮
- (IBAction)distributionStatusClock:(id)sender {
    if (self.BlackButtonClock) {
        self.BlackButtonClock(self.oderState);
    }
}
//退货按钮

- (IBAction)returnClock:(id)sender {
    if (self.ReturnButtonClock) {
        self.ReturnButtonClock();
    }
}


@end
