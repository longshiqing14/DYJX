//
//  JXMyOderDetailsHeadView.m
//  user
//
//  Created by liu_yakai on 2018/2/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyOderDetailsHeadView.h"

@implementation JXMyOderDetailsHeadView

-(void)headInit:(JXMyProcessStateInfoModel *)model{
    if ([model.state isEqualToString:JX_PAYMENT_ODERSTATE_COMPLETED]) {
        self.headStateImageView.image=SETIMAGENAME(@"order_detail_header_success");
    }else{
        self.headStateImageView.image=SETIMAGENAME(@"order_detail_header_wait");
    }
    self.headStateTitleLable.text=model.name;
        
}

@end
