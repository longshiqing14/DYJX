//
//  XYMineOrderListTVCell.h
//  user
//
//  Created by xingyun on 2017/9/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYOrderListModel;

@interface XYMineOrderListTVCell : UITableViewCell


/** 数据 */
@property (nonatomic, strong) XYOrderListModel * listModel;

/** 创建 cell */
+ (instancetype)cellWithTableView:(UITableView *)tableView;
//确认收货回调
@property(nonatomic,copy)void(^ ClockConfirmationReceipt)();
@end
