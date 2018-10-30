//
//  JXMyDetailsGoodsCell.m
//  user
//
//  Created by liu_yakai on 2018/2/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyDetailsGoodsCell.h"


@implementation JXMyDetailsGoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)initCell:(JXMyItemsModel *)model{
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    [self.cellImageView reat:5];
    [self.cellImageView sideLine:1 SideLineColor:XYRGBAColor(228,228,228, 1)];
    [self.cellImageView sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:SETIMAGENAME(@"placeholder")];
    self.cellTItleLable.text=model.name;
    self.cellTransactionPriceLable.text=[NSString stringWithFormat:@"￥%@",model.unitDiscountedPrice];
    if (![model.marketUnitPrice isEqualToString:model.unitDiscountedPrice]) {
//        原价
        NSString *marketUnitPrice=[NSString stringWithFormat:@"￥%@",model.marketUnitPrice];
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle], NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)};
        self.cellOriginalPriceLable.attributedText=[[NSMutableAttributedString alloc]initWithString:marketUnitPrice attributes:attribtDic];
    }
    
    self.cellGoodsNumberLable.text=[NSString stringWithFormat:@"X%@",model.amount];
}




@end
