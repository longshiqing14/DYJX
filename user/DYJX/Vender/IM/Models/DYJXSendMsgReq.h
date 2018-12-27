//
//	DYJXSendMsgReq.h
//
//	Create by longshiqing on 21/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DYJXData.h"

@interface DYJXSendMsgReq : NSObject

@property (nonatomic, copy) NSString * CertificateId;
@property (nonatomic, copy) NSString * ClientId;
@property (nonatomic, strong) DYJXData * Data;
@property (nonatomic, copy) NSString * Device;
@property (nonatomic, copy) NSString * DeviceToken;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
