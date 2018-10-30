//
//  JXHomeRechargeCell.m
//  user
//
//  Created by liu_yakai on 2017/12/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXHomeRechargeCell.h"
//#import "UIImageView+WebCache "

@implementation JXHomeRechargeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)cell_init:(HomelCarouselModel *)model{
    [self.rechargeImageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]
       placeholderImage:SETIMAGENAME(@"placeholder")];
    self.rechargeImageView.clipsToBounds = YES;
    self.rechargeImageView.contentMode =UIViewContentModeScaleAspectFill;
}

@end
