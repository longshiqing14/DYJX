//
//  JXDetailsModel.h
//  user
//
//  Created by liu_yakai on 2017/11/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXDetailsBroadbandModel : NSObject
@property(nonatomic,strong)NSString *createTimeFormat;
@property(nonatomic,strong)NSString *infoState;
@property(nonatomic,strong)NSString *orderId;
@property(nonatomic,strong)NSString *orderState;
@property(nonatomic,strong)NSString *productName;

@end

@interface JXDetailsDataModel : NSObject
@property(nonatomic,strong)NSString *address;
@property(nonatomic,strong)NSString *allAddress;
@property(nonatomic,strong)NSString *broadbandID;
@property(nonatomic,strong)NSString *idNum;
@property(nonatomic,strong)NSString *mobilePhone;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *sex;
@property(nonatomic,strong)NSString *sexName;
@property(nonatomic,strong)NSString *typeName;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *serviceNum;
@end

@interface JXDetailsModel : NSObject
@property(nonatomic,strong)JXDetailsDataModel *broadband;
@property(nonatomic,strong)JXDetailsBroadbandModel *order;
@end
