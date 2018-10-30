//
//  JXHomeCommodityCell.m
//  user
//
//  Created by liu_yakai on 2017/12/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXHomeCommodityCell.h"

@implementation JXHomeCommodityCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)cell_init:(HomelRecommendListModel *)model{
    [self.commodityButton reat:5];
    [self.cellImageView sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:SETIMAGENAME(@"placeholder")];
    self.sellingPointTextLable.text=model.sellingPointText;
    self.cellPrice.text=[NSString stringWithFormat:@"￥%@",model.memberPrice];
    self.cellTitle.text=model.productName;
}
- (IBAction)addShopCarClock:(id)sender {
//    UIButton *button=(UIButton *)sender;
//    if (self.AddShopCar) {
//        self.AddShopCar(button.frame);
//    }
    
    UIButton *button=(UIButton *)sender;
    CGPoint startPoint = [self convertPoint:button.center toView:XYKeyWindow.rootViewController.view];
    if (self.AddShopCarClock) {
        self.AddShopCarClock(startPoint);
    }
}

@end
