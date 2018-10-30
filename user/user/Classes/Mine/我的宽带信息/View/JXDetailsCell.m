//
//  JXDetailsCell.m
//  user
//
//  Created by liu_yakai on 2017/11/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXDetailsCell.h"

@implementation JXDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cell_init:(NSString *)title Subtitle:(NSString *)subtitle{
    self.cellTitle.text=title;
    self.cellSubtitle.text=subtitle;
}

@end
