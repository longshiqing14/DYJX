//
//  JXOderAddressView.m
//  user
//
//  Created by liu_yakai on 2018/3/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXOderAddressView.h"

@implementation JXOderAddressView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)oderAddress:(JXOderDeliveryAddressModel *)model{
    if (model.address.length>0) {
       self.oderConsigneeAddressLable.textColor=XYRGBAColor(153, 153, 153, 1); self.oderConsigneeAddressLable.text=model.address;
    }else{
        self.oderConsigneeAddressLable.textColor=XYRGBAColor(51, 51, 51, 1);
    }
    self.oderConsigneeLable.text=model.userName;
    
    self.oderContactNumberLable.text=model.mobile;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.SelectAddressClock) {
        self.SelectAddressClock();
    }
}

@end
