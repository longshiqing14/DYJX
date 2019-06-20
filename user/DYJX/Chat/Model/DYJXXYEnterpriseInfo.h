//
//	DYJXXYEnterpriseInfo.h
//
//	Create by 岩 熊 on 12/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DYJXXYEnterpriseInfo : NSObject

@property (nonatomic, assign) BOOL AdminSay;
@property (nonatomic, assign) BOOL CanNotSearch;
@property (nonatomic, copy) NSString * CompanyName;
@property (nonatomic, copy) NSString * CompanyShortName;
@property (nonatomic, copy) NSString * HeadImgUrl;
@property (nonatomic, copy) NSString * Id;
@property (nonatomic, copy) NSString * Images;
@property (nonatomic, copy) NSString * CompanyBankName;

@property (nonatomic, copy) NSString * CompanyWeiXin;
@property (nonatomic, copy) NSString * PCDName;
@property (nonatomic, copy) NSString * CompanyAlipay;
@property (nonatomic, copy) NSString * WebSite;
@property (nonatomic, copy) NSString * CompanyBank;
@property (nonatomic, copy) NSString * CompanyEmail;
@property (nonatomic, copy) NSString * CompanyLinkManQQ;
@property (nonatomic, copy) NSString * CompanyTel;
@property (nonatomic, copy) NSString * CompanyBankCardNO;
@property (nonatomic, copy) NSString * CompanyLinkMan;
@property (nonatomic, copy) NSString * CompanyLinkManCellphone;
@property (nonatomic, copy) NSString * Address;
@property (nonatomic, copy) NSString * CompanyLinkManWeiXin;
@property (nonatomic, copy) NSString * CompanyInfo;
@property (nonatomic, copy) NSString * SociologyCredit;
@property (nonatomic, copy) NSString * GPSAddress;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
