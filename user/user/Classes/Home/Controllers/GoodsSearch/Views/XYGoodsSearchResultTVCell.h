//
//  XYGoodsSearchResultTVCell.h
//  user
//
//  Created by xingyun on 2017/10/19.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYGoodsSearchResultModel;

@interface XYGoodsSearchResultTVCell : UITableViewCell

/** 数据 */
@property (nonatomic, strong) XYGoodsSearchResultModel * searchResultModel;

/** 创建 cell */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
