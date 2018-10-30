//
//  JXSelectDeliverToShopPage.h
//  user
//
//  Created by 岩  熊 on 2018/3/14.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseViewController.h"
@class JXAdressModel;
typedef void(^SelectBrandItmeHandleBlock)(JXAdressModel* model);

@interface JXSelectDeliverToShopPage : BaseViewController
@property(nonatomic,strong)NSString *type;
@property (strong, nonatomic)  UITableView *otherTableView;
@property (nonatomic, copy) SelectBrandItmeHandleBlock block;
@property (nonatomic,copy) NSString *shopID;
@property (nonatomic, copy) NSString *name;
@end
