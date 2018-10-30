//
//  XYPreDepositTVCHeaderView.h
//  user
//
//  Created by xingyun on 2017/9/14.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYPreDepositTVCHeaderView : UITableViewHeaderFooterView

/** 底图 */
@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UILabel * titleLB;

/** headerview 创建 */
+ (instancetype)headerWithTableView:(UITableView *)tableView;

@end
