//
//  JXOrderPricelCell.h
//  user
//
//  Created by liu_yakai on 2018/4/2.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseCell.h"

@interface JXOrderPricelCell : BaseCell

@property (weak, nonatomic) IBOutlet UILabel *cellTitleLable;

@property (weak, nonatomic) IBOutlet UILabel *cellSubLable;
-(void)cell_init:(NSDictionary *)dic IndexPath:(NSIndexPath *)indexPath;
@end
