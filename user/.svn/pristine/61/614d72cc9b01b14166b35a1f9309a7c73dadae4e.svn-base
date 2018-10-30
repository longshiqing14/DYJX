//
//  JXMyOderDetailsFootView.h
//  user
//
//  Created by liu_yakai on 2018/2/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXMyOrderDetailsModel.h"

@interface JXMyOderDetailsFootView : UIView
//收件人
@property (weak, nonatomic) IBOutlet UILabel *footConsigneeLable;
//地址
@property (weak, nonatomic) IBOutlet UILabel *footAddressLable;
//联系电话
@property (weak, nonatomic) IBOutlet UILabel *footContactNumberLable;
//需付实付根据订单状态
-(void)footMoneyInit:(NSString *)totalOrderNeedPayPrice MyProcessStateInfoModel:(JXMyProcessStateInfoModel *)model;
//用户送货信息并不是自提点
-(void)footAddressInit:(JXMyBuyerInfoModel *)model;
@end
