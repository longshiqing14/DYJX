//
//  XYOrderConfirmPriceTVCell.h
//  user
//
//  Created by xingyun on 2017/11/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYOrderConfirmPriceTVCell : UITableViewCell

/**  */
@property (nonatomic, strong) UILabel     * titleLB;

/**  */
@property (nonatomic, strong) UILabel     * subLB;

/** 创建 cell  */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
