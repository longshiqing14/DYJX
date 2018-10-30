//
//  XYConfirmOrderInvoiceVC.h
//  user
//
//  Created by xingyun on 2017/10/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBestVC.h"

@protocol XYConfirmOrderInvoiceVCDelegate <NSObject>

/** 上传发票成功 */
- (void)updateInvoiceSuccess;

@end

@interface XYConfirmOrderInvoiceVC : XYBestVC

@property (nonatomic, weak) id<XYConfirmOrderInvoiceVCDelegate> delegate;

@property (nonatomic, copy) NSString * needInvoiceKey;

@property (nonatomic, copy) NSString * invoice_id;


@end
