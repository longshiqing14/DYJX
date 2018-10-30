//
//  JXMyDetailsGoodsCell.h
//  user
//  订单详情商品cell
//  Created by liu_yakai on 2018/2/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseCell.h"
#import "JXMyOrderDetailsModel.h"

@interface JXMyDetailsGoodsCell : BaseCell
//商品图片
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
//商品名字
@property (weak, nonatomic) IBOutlet UILabel *cellTItleLable;
//交易价格
@property (weak, nonatomic) IBOutlet UILabel *cellTransactionPriceLable;
//原价
@property (weak, nonatomic) IBOutlet UILabel *cellOriginalPriceLable;
//商品件数
@property (weak, nonatomic) IBOutlet UILabel *cellGoodsNumberLable;


-(void)initCell:(JXMyItemsModel *)model;
@end
