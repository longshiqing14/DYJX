//
//  JXMyBroadbandAccountCell.h
//  user
//
//  Created by liu_yakai on 2017/11/15.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "BaseCell.h"

@interface JXMyBroadbandAccountCell : BaseCell
//宽带账号
@property (weak, nonatomic) IBOutlet UILabel *cellAccountLable;
//申请时间
@property (weak, nonatomic) IBOutlet UILabel *cellTimeLable;
//地区
@property (weak, nonatomic) IBOutlet UILabel *cellAddressLable;
//状态
@property (weak, nonatomic) IBOutlet UILabel *cellStateLable;

@end
