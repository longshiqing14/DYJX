//
//  JXOderPromptView.m
//  user
//  提示信息
//  Created by liu_yakai on 2018/3/14.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXOderPromptView.h"

@implementation JXOderPromptView

-(void)oderPrpmpInit:(JXOderOcsModel *)model{
    if ([model.selectedDeliveryRuleName  isEqualToString:@"送货上门"]) {
        self.oderPromptLable.text=model.deliveryRuleTips;
    }else{
        self.oderPromptLable.text=@" 提示:到店自提订单,需订单状态为”待收货“才能到店提货！";
    }
}

@end
