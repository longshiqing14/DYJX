//
//  JXOderIntegralCell.h
//  user
//
//  Created by liu_yakai on 2018/3/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseCell.h"

@interface JXOderIntegralCell : BaseCell
@property(nonatomic,copy)void (^ ClockPop)();
@property(nonatomic,copy)void (^ ClockSwitch)(BOOL openAndClose);
//标题
@property (weak, nonatomic) IBOutlet UILabel *cellTitleLable;
//描述
@property (weak, nonatomic) IBOutlet UILabel *cellSubLable;

//开关
@property (weak, nonatomic) IBOutlet UISwitch *cellSwitch;
-(void)cell_init:(NSDictionary *)dic;
@end
