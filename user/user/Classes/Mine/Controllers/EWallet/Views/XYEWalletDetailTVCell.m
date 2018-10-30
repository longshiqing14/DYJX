//
//  XYEWalletDetailTVCell.m
//  user
//
//  Created by xingyun on 2017/9/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYEWalletDetailTVCell.h"

@implementation XYEWalletDetailTVCell









#pragma mark - 创建 cell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYEWalletDetailTVCell";
    XYEWalletDetailTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XYEWalletDetailTVCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
