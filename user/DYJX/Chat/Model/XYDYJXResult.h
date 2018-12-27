//
//	XYDYJXResult.h
//
//	Create by 岩 熊 on 18/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "XYDYJXIMUser.h"

@interface XYDYJXResult : NSObject

@property (nonatomic, strong) NSString * BelongEnterprise;
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
@property (nonatomic, strong) NSString * IdField;
@property (nonatomic, assign) NSInteger Number;
@property (nonatomic, strong) NSString * NumberString;
@property (nonatomic, assign) NSInteger ProvinceID;
@property (nonatomic, assign) NSInteger Resource;
@property (nonatomic, strong) NSString * UpdateBy;
@property (nonatomic, strong) NSString * UpdateOn;
@property (nonatomic, strong) NSString * UserId;
@property (nonatomic, strong) NSString * UserName;
@property (nonatomic, assign) NSInteger UserType;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end