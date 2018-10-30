//
//  JXHomeActivityCell.m
//  user
//
//  Created by liu_yakai on 2017/12/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXHomeActivityCell.h"

@implementation JXHomeActivityCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)cell_init:(HomelRotateaModel *)model{
    [self.cellImageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl] placeholderImage:SETIMAGENAME(@"placeholder")];
    self.cellImageView.clipsToBounds = YES;
    self.cellImageView.contentMode =UIViewContentModeScaleAspectFill;
}

@end
