//
//  XYDelieveryAddressVC.h
//  user
//
//  Created by xingyun on 2017/9/21.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBestVC.h"
#import "XYAddressListModel.h"
@protocol XYDelieveryAddressVCDelegate <NSObject>
@optional
-(void)selectAddressWith:(XYAddressListModel*)model;

@end

@interface XYDelieveryAddressVC : XYBestVC


@property(assign,nonatomic) id<XYDelieveryAddressVCDelegate>delegate ;

/**1是从购物车进的*/
@property(copy,nonatomic) NSString *type ;

@end
