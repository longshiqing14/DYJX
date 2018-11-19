//
//  JXDeliverWayVC.h
//  user
//
//  Created by 岩  熊 on 2018/3/14.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseViewController.h"
#import "JXSelectAdressListModel.h"

@protocol XYDeliveryWayPopViewDelegate <NSObject>

@optional
/** 选中返回方式*/
-(void)selectWay:(NSString *)way adressID:(NSString*)adressID;

@end

@interface JXDeliverWayVC : BaseViewController
@property(assign,nonatomic) id<XYDeliveryWayPopViewDelegate> delegate;
@property (nonatomic, copy) NSString *selectWayText;
//@property (nonatomic, copy) NSString *AdressName;
@property (nonatomic, strong)JXAdressModel *model;
@end
