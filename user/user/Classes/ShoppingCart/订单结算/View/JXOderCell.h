//
//  JXOderCell.h
//  user
//  订单cell
//  Created by liu_yakai on 2018/3/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseCell.h"

@interface JXOderCell : BaseCell
@property(nonatomic,copy)void (^ ClockPop)();
//标题
@property (weak, nonatomic) IBOutlet UILabel *cellTitleLable;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;

//副标题
@property (weak, nonatomic) IBOutlet UILabel *cellSubLable;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellSubWidth;

//副标题提示标题
@property (weak, nonatomic) IBOutlet UILabel *cellSubPopLable;
-(void)cell_init:(NSDictionary *)dic Index:(NSInteger)index;
@end
