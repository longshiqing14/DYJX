//
//  DYJXAddCompanyPageCell.h
//  user
//
//  Created by YP on 2019/4/22.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DYJXAddCompanyPageCell : UITableViewCell

@property (nonatomic, strong) LPXNewCustomerCellModel *model;
@property (nonatomic, copy) void (^nextBtnBlock)(DYJXAddCompanyPageCell *cell);
@end

NS_ASSUME_NONNULL_END
