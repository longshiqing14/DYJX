//
//  JXMyOderDeailsStateCell.h
//  user
//
//  Created by liu_yakai on 2018/4/12.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseCell.h"

@interface JXMyOderDeailsStateCell : BaseCell
@property (weak, nonatomic) IBOutlet UILabel *cellTitleLable;
@property (weak, nonatomic) IBOutlet UILabel *cellSubLable;
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;

-(void)initCell:(NSDictionary *)dict;
@end
