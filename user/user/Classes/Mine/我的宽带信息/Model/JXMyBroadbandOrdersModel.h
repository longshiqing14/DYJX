//
//  JXMyBroadbandOrdersModel.h
//  user
//
//  Created by liu_yakai on 2017/11/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXMyOrderListModel : NSObject
@property(nonatomic,strong)NSString *aliasCode;
@property(nonatomic,strong)NSString *boardName;
@property(nonatomic,strong)NSString *formatCreateTime;
@property(nonatomic,strong)NSString *isInstallInformationReady;
@property(nonatomic,strong)NSString *isInstallInformationReadyLabel;
@end

@interface JXMyDataOrdersModel : NSObject
@property(nonatomic,strong)NSArray *orderList;
@end


