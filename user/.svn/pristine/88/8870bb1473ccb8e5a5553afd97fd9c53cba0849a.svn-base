//
//  JXMyOderFootView.h
//  user
//
//  Created by liu_yakai on 2018/3/5.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXMyOrderDetailsModel.h"


@interface JXMyOderClockFootView : UIView
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *layoutWidth;
@property(nonatomic,strong)NSString *oderState;
//确认收货
@property (weak, nonatomic) IBOutlet UIButton *confirmationReceiptButton;
//配送状态
@property (weak, nonatomic) IBOutlet UIButton *distributionStatusButton;
//申请退货
@property (weak, nonatomic) IBOutlet UIButton *returnGoodsButton;
//退货
@property(nonatomic,copy)void (^ ReturnButtonClock)();
//红色按钮
@property(nonatomic,copy)void (^ GulesButtonClock)(NSString *State);
//黑色按钮
@property(nonatomic,copy)void (^ BlackButtonClock)(NSString *State);

-(void)myOder_init:(JXMyProcessStateInfoModel *)model IsOrderRefund:(NSString *)isOrderRefund;
@end
