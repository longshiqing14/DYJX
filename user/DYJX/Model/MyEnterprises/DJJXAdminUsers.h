//
//	DJJXAdminUsers.h
//
//	Create by longshiqing on 17/11/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DJJXBusines.h"

@interface DJJXAdminUsers : NSObject

@property (nonatomic, copy) NSString * BelongEnterprise;
@property (nonatomic, strong) DJJXBusines * Business;
@property (nonatomic, copy) NSString * Cellphone;
@property (nonatomic, copy) NSString * CreateOn;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, copy) NSString * DisplayName;
@property (nonatomic, copy) NSString * IdField;
@property (nonatomic, assign) NSInteger Number;
@property (nonatomic, copy) NSString * NumberString;
@property (nonatomic, copy) NSString * RongCloudToken;
@property (nonatomic, assign) NSInteger Type;
@property (nonatomic, copy) NSString * UpdateBy;
@property (nonatomic, copy) NSString * UpdateOn;
@property (nonatomic, copy) NSString * UserName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
