//
//  JXMyAfterSaleDetailDescribeCell.m
//  user
//
//  Created by liu_yakai on 2018/4/18.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyAfterSaleDetailDescribeCell.h"

@implementation JXMyAfterSaleDetailDescribeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cell_init:(NSDictionary *)dic Index:(NSInteger)index{
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    NSString *value=[dic valueForKey:@"value"];
    if ([value isEqualToString:@""]) {
        self.cellTitleLable.text=@"";
    }else{
        if (index==2) {
            self.cellTitleLable.text=@"问题描述";
        self.cellTitleLable.textColor=XYRGBAColor(51, 51, 51, 1);
        }else if (index==7){
            self.cellTitleLable.text=@"审核留言";
        self.cellTitleLable.textColor=XYRGBAColor(153, 153, 153, 1);
        }
        
    }
    self.cellContentLable.text=[dic valueForKey:@"value"];
}

@end
