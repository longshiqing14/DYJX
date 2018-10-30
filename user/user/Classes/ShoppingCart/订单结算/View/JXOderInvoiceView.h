//
//  JXOderInvoiceView.h
//  user
//
//  Created by liu_yakai on 2018/4/10.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXOderSettlementModel.h"

@interface JXOderInvoiceView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIImageView *invoicceImageView;
@property (weak, nonatomic) IBOutlet UILabel *subLable;
@property(nonatomic,copy)void (^ ClockPop)();
@property(nonatomic,copy)void (^ Clock)();
@property (weak, nonatomic) IBOutlet UILabel *line;

-(void)invoice_init:(JXOderInvoiceInfoModel *)model;
@end
