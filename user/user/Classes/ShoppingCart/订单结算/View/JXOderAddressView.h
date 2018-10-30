//
//  JXOderAddressView.h
//  user
//  地址选择
//  Created by liu_yakai on 2018/3/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXOderSettlementModel.h"

@interface JXOderAddressView : UIView
@property(nonatomic,copy)void (^ SelectAddressClock)();
//收货人
@property (weak, nonatomic) IBOutlet UILabel *oderConsigneeLable;

//收货人地址
@property (weak, nonatomic) IBOutlet UILabel *oderConsigneeAddressLable;

//收货人联系方式
@property (weak, nonatomic) IBOutlet UILabel *oderContactNumberLable;

-(void)oderAddress:(JXOderDeliveryAddressModel *)model;
@end
