//
//  JXOderGoodsCell.m
//  user
//
//  Created by liu_yakai on 2018/3/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXOderGoodsCell.h"
#import "NSString+Tool.h"

@implementation JXOderGoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cell_init:(JXOderBuyItemsModel *)model{
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    [self.cellGoodsImageView reat:5];
    [self.cellGoodsImageView sideLine:1 SideLineColor:XYRGBAColor(228, 228, 228, 1)];
    [self.cellGoodsImageView sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:SETIMAGENAME(@"placeholder")];
    self.cellTitleLable.text=model.productName;
    if ([model.marketUnitPrice isEqualToString:model.unitDiscountedPrice]) {
         self.cellFavorablePriceLable.text=[NSString stringWithFormat:@"￥%@",model.unitDiscountedPrice];
        self.cellOriginalPriceLable.text=@"";
    }else{
       self.cellFavorablePriceLable.text=[NSString stringWithFormat:@"￥%@",model.unitDiscountedPrice]; self.cellOriginalPriceLable.attributedText=[[NSString stringWithFormat:@"￥%@",model.marketUnitPrice] crossed];
    }
    self.cellGoodsNumberLable.text=[NSString stringWithFormat:@"x%@",model.amount];
}

@end
