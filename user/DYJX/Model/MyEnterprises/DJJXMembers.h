//
//	DJJXMembers.h
//
//	Create by longshiqing on 17/11/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DJJXBusines.h"

@interface DJJXMembers : NSObject
/*@property (nonatomic, strong) NSString * BelongEnterprise;
 @property (nonatomic, strong) NSString * BindUserId;
 @property (nonatomic, strong) NSString * Cellphone;
 @property (nonatomic, assign) NSInteger CityID;
 @property (nonatomic, strong) NSString * ContactEnterprise;
 @property (nonatomic, assign) NSInteger ContactType;
 @property (nonatomic, strong) NSString * CreateBy;
 @property (nonatomic, strong) NSString * CreateOn;
 @property (nonatomic, assign) BOOL Deleted;
 @property (nonatomic, assign) BOOL Disabled;
 @property (nonatomic, assign) NSInteger DistrictID;
 @property (nonatomic, strong) XYDYJXIMUser * IMUser;
 @property (nonatomic, strong) NSString * Id;
 @property (nonatomic, assign) NSInteger Number;
 @property (nonatomic, strong) NSString * NumberString;
 @property (nonatomic, assign) NSInteger ProvinceID;
 @property (nonatomic, assign) NSInteger Resource;
 @property (nonatomic, strong) NSString * UpdateBy;
 @property (nonatomic, strong) NSString * UpdateOn;
 @property (nonatomic, strong) NSString * UserId;
 @property (nonatomic, strong) NSString * UserName;
 @property (nonatomic, assign) NSInteger UserType;*/
@property (nonatomic, copy) NSString * BelongEnterprise;
@property (nonatomic, strong) DJJXBusines * Business;
@property (nonatomic, copy) NSString * Cellphone;
@property (nonatomic, copy) NSString * CreateBy;
@property (nonatomic, copy) NSString * CreateOn;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, copy) NSString * DisplayName;
@property (nonatomic, assign) NSInteger Number;
@property (nonatomic, copy) NSString * NumberString;
@property (nonatomic, copy) NSString * RongCloudToken;
@property (nonatomic, assign) NSInteger Type;
@property (nonatomic, copy) NSString * UpdateBy;
@property (nonatomic, copy) NSString * UpdateOn;
@property (nonatomic, copy) NSString * UserName;
@property (nonatomic, copy) NSString * Id;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
