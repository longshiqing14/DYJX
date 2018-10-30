//
//  JXMyAfterSaleDetailsReasonsCell.m
//  user
//
//  Created by liu_yakai on 2018/4/26.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyAfterSaleDetailsReasonsCell.h"

@implementation JXMyAfterSaleDetailsReasonsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cell_init:(NSDictionary *)dic{
    self.titleLable.text=[NSString stringWithFormat:@"%@",[dic valueForKey:@"title"]];
    self.subLable.text=[dic valueForKey:@"value"];
}

@end
