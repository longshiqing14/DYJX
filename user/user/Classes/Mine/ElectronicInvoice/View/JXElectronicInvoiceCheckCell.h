//
//  JXElectronicInvoiceCheckCell.h
//  user
//
//  Created by 岩  熊 on 2018/3/1.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^confirmBlock)();
@interface JXElectronicInvoiceCheckCell : UITableViewCell
@property (nonatomic,strong) UIButton *confirmBNT;
@property (nonatomic,copy) confirmBlock confirmBlock;
@property (nonatomic, strong) UIView *line;
@end
