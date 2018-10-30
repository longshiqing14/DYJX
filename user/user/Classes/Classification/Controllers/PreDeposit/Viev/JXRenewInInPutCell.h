//
//  JXRenewInInPutCell.h
//  user
//
//  Created by liu_yakai on 2017/11/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "BaseCell.h"

@interface JXRenewInInPutCell : BaseCell
@property(nonatomic,copy)void (^ ClockCode)();
@property (weak, nonatomic) IBOutlet UILabel *cellLbale;
@property (weak, nonatomic) IBOutlet UITextField *cellTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellPosition;
@property (weak, nonatomic) IBOutlet UIButton *cellButton;
-(void)cell_init:(NSDictionary *)dic CellButtonTag:(NSInteger)tag;
@end
