//
//  JXMyRefundAfterSaleCell.h
//  user
//
//  Created by liu_yakai on 2018/4/12.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseCell.h"
#import "JXMyRefundAfterSaleModel.h"

@interface JXMyRefundAfterSaleCell : BaseCell
//订单号
@property (weak, nonatomic) IBOutlet UILabel *cellOderNumberLable;
//订单状态
@property (weak, nonatomic) IBOutlet UILabel *cellOderStateLable;
//商品图片
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView3;
//订单时间
@property (weak, nonatomic) IBOutlet UILabel *oderTimeLable;

//订单价格
@property (weak, nonatomic) IBOutlet UILabel *cellOderPriceLable;
-(void)cell_init:(JXMyRefundAfterSaleOrderRefundListModel *)model;
@end
