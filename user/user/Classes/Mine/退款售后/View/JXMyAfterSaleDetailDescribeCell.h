//
//  JXMyAfterSaleDetailDescribeCell.h
//  user
//
//  Created by liu_yakai on 2018/4/18.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseCell.h"

@interface JXMyAfterSaleDetailDescribeCell : BaseCell
@property (weak, nonatomic) IBOutlet UILabel *cellContentLable;
@property (weak, nonatomic) IBOutlet UILabel *cellTitleLable;

-(void)cell_init:(NSDictionary *)dic Index:(NSInteger)index;
@end
