//
//  XYEWalletPreDepositReturnListTVCell.h
//  user
//
//  Created by xingyun on 2017/10/19.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYEWalletPreDepositReturnListModel;

@interface XYEWalletPreDepositReturnListTVCell : UITableViewCell


/** 标题 */
@property (nonatomic, strong) UILabel * titleLB;
/** 时间 */
@property (nonatomic, strong) UILabel * timeLB;
/** 金额 */
@property (nonatomic, strong) UILabel * moneyLB;


@property (nonatomic, strong) XYEWalletPreDepositReturnListModel * listModel;


#pragma mark - 创建 cell
+ (instancetype)cellWithTableView:(UITableView *)tableView;



@end
