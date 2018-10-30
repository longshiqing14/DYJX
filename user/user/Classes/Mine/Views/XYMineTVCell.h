//
//  XYMineTVCell.h
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYMineListModel;

@interface XYMineTVCell : UITableViewCell

/** 数据 */
@property (nonatomic, strong) XYMineListModel * buttonModel;

/** 创建 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
