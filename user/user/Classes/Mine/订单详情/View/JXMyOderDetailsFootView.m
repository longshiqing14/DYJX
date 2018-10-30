//
//  JXMyOderDetailsFootView.m
//  user
//
//  Created by liu_yakai on 2018/2/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyOderDetailsFootView.h"
#import "NSString+Tool.h"

@implementation JXMyOderDetailsFootView
//需付
-(void)footMoneyInit:(NSString *)totalOrderNeedPayPrice MyProcessStateInfoModel:(JXMyProcessStateInfoModel *)model{
    NSString *orderNeedPayPrice;
    if ([model.state isEqualToString:JX_PAYMENT_ODERSTATE_PENDINGPAYMENT]) {
        
        orderNeedPayPrice=[NSString stringWithFormat:@"需付：¥%@",totalOrderNeedPayPrice];
        
    }else{
        orderNeedPayPrice=[NSString stringWithFormat:@"实付：¥%@",totalOrderNeedPayPrice];
    }
    self.footContactNumberLable.attributedText=[orderNeedPayPrice changeColour:[NSString stringWithFormat:@"¥%@",totalOrderNeedPayPrice] FountColour:XYRGBAColor(236,59,44, 1)];
}


-(void)footAddressInit:(JXMyBuyerInfoModel *)model{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"收件人:%@",model.userName]];
    [string addAttribute:NSForegroundColorAttributeName value:XYRGBAColor(153,153,153, 1) range:NSMakeRange(0, 3)];
    self.footConsigneeLable.attributedText=string;
    self.footAddressLable.text=model.address;
    self.footContactNumberLable.text=model.mobile;
}
@end
