//
//  XYPlayModel.h
//  user
//
//  Created by liu_yakai on 2017/11/3.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBaseModel.h"

@interface XYPlayModel : NSObject

@property(nonatomic,strong)NSString *orderIds;
@property(nonatomic,strong)NSString *totalNeedPayPrice;

@end

@interface XYPlaAlBBModel : NSObject
@property(nonatomic,strong)NSString *memo;
@property(nonatomic,strong)NSString *result;
@property(nonatomic,strong)NSString *resultStatus;
@end

@interface XYPlayInfoModel : XYBaseModel

@property(nonatomic,strong)NSString *androidPayInfo;

@end


@interface XYWXPaySignModel : NSObject

@property(nonatomic,strong)NSString *appid;
@property(nonatomic,strong)NSString *noncestr;
@property(nonatomic,strong)NSString *package;
@property(nonatomic,strong)NSString *partnerid;
@property(nonatomic,strong)NSString *prepayid;
@property(nonatomic,strong)NSString *sign;
@property(assign)UInt32 timestamp;

@end

@interface XYWXPayModel : NSObject

@property(nonatomic,strong)XYWXPaySignModel *paySign;

@end
