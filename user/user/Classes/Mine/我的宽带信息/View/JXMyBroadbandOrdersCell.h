//
//  JXMyBroadbandOrdersCell.h
//  user
//
//  Created by liu_yakai on 2017/11/15.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "BaseCell.h"
#import "JXMyBroadbandOrdersModel.h"

@interface JXMyBroadbandOrdersCell : BaseCell
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *celltime;
@property (weak, nonatomic) IBOutlet UILabel *cellstate;

-(void)cell_init:(JXMyOrderListModel *)model;
@end
