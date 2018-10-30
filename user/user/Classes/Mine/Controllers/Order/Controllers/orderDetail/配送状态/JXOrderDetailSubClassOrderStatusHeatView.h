//
//  JXOrderDetailSubClassOrderStatusHeatView.h
//  user
//
//  Created by liu_yakai on 2017/12/26.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYOrderDetailOrderStatusModel.h"

@interface JXOrderDetailSubClassOrderStatusHeatView : UIView
@property (weak, nonatomic) IBOutlet UILabel *orderNumber;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *waybillNumber;
-(void)heat_init:(JXOrderStatusModel *)model;
@end
