//
//  JXMyRefundAfterSaleCell.m
//  user
//
//  Created by liu_yakai on 2018/4/12.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyRefundAfterSaleCell.h"
#import "NSString+Tool.h"

@implementation JXMyRefundAfterSaleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cell_init:(JXMyRefundAfterSaleOrderRefundListModel *)model{
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    self.cellOderNumberLable.text=model.orderAliasCode;
    self.cellImageView1.alpha=0;
    self.cellImageView2.alpha=0;
    self.cellImageView3.alpha=0;
    self.oderTimeLable.text=model.createTime;
    [self.cellImageView1 sideLine:1 SideLineColor:XYRGBAColor(228, 228, 228, 1)];
    [self.cellImageView1 reat:5];
    [self.cellImageView2 sideLine:1 SideLineColor:XYRGBAColor(228, 228, 228, 1)];
    [self.cellImageView2 reat:5];
    [self.cellImageView3 sideLine:1 SideLineColor:XYRGBAColor(228, 228, 228, 1)];
    [self.cellImageView3 reat:5];
    if (model.pics.count>0) {
        self.cellImageView1.alpha=1;
        [self.cellImageView1 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.pics[0]]] placeholder:SETIMAGENAME(@"placeholder")];
    }
    if (model.pics.count>1) {
        self.cellImageView2.alpha=1;
        [self.cellImageView2 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.pics[1]]] placeholder:SETIMAGENAME(@"placeholder")];
    }
    if (model.pics.count>2) {
        self.cellImageView3.alpha=1;
        [self.cellImageView3 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.pics[2]]] placeholder:SETIMAGENAME(@"placeholder")];
    }
    NSString *price=[NSString stringWithFormat:@"¥%@",model.returnAmount]; self.cellOderPriceLable.attributedText=[[NSString stringWithFormat:@"订单金额：¥%@",model.returnAmount] changeColour:price FountColour:XYRGBAColor(236, 59, 44, 1)];
    if ([model.applyStatus isEqualToString:@"0"]) {
        self.cellOderStateLable.text=@"待审核";
    }else if ([model.applyStatus isEqualToString:@"1"]) {
        if ([model.isReturnPrice isEqualToString:@"1"]) {
            self.cellOderStateLable.text=@"已退款";
        }else if ([model.isReturnSingle isEqualToString:@"1"]){
            self.cellOderStateLable.text=@"已退货";
        }else{
            self.cellOderStateLable.text=@"退款中";
        }
    }else if([model.applyStatus isEqualToString:@"2"]){
        self.cellOderStateLable.text=@"审核不通过";

    }
//    if ([model.applyStatus isEqualToString:@"1"]) {
//        if ([model.isReturnSingle isEqualToString:@"0"]) {
//        self.cellOderStateLable.text=@"待审核";
//        }else if ([model.isReturnSingle isEqualToString:@"1"]){
//            self.cellOderStateLable.text=@"审核通过";
//        }else if ([model.isReturnSingle isEqualToString:@"2"]){
//            self.cellOderStateLable.text=@"审核失败";
//        }
//
//    }else{
//        if ([model.isReturnPrice isEqualToString:@"0"]) {
//            self.cellOderStateLable.text=@"已退货";
//        }else{
//            self.cellOderStateLable.text=@"已退款";
//        }
//    }
}

@end
