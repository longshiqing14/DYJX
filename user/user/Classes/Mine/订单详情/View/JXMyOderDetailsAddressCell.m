//
//  JXMyOderDetailsAddressCell.m
//  user
//
//  Created by liu_yakai on 2018/4/11.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyOderDetailsAddressCell.h"

@implementation JXMyOderDetailsAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cell_init:(NSDictionary *)dic{
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    JXMyBuyerInfoModel *model=[dic valueForKey:@"value"];
    self.titleLable.text=[NSString stringWithFormat:@"%@ %@",model.userName,model.mobile];
    self.subLable.text=model.address;
}

@end
