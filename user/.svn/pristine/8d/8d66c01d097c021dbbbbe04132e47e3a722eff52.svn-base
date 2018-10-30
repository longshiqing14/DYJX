//
//  JXHomeRecommendCell.m
//  user
//
//  Created by liu_yakai on 2017/12/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXHomeRecommendCell.h"

@implementation JXHomeRecommendCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)cell_init:(HomelRecommendListModel *)model{
    [self.recimmendButton reat:5];
    [self.cellImgeView sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:SETIMAGENAME(@"placeholder")];
    self.sellingPointTextLable.text=model.sellingPointText;
    self.cellTitle.text=model.productName;
    self.cellPrice.text=[NSString stringWithFormat:@"￥%@",model.memberPrice];
}
- (IBAction)addShopCarClock:(id)sender {
    UIButton *button=(UIButton *)sender;
    CGPoint startPoint = [self convertPoint:button.center toView:XYKeyWindow.rootViewController.view];
    if (self.AddShopCarClock) {
        self.AddShopCarClock(startPoint);
    }
}

@end
