//
//	DYXJResult.h
//
//	Create by longshiqing on 26/4/2019
//	Copyright © 2019. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DYXJBusines.h"

@interface DYXJResult : NSObject

@property (nonatomic, strong) NSString * BelongEnterprise;
@property (nonatomic, strong) DYXJBusines * Business;
@property (nonatomic, strong) NSString * Cellphone;
@property (nonatomic, strong) NSString * CreateBy;
@property (nonatomic, strong) NSString * CreateOn;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, strong) NSString * DisplayName;
@property (nonatomic, strong) NSString * DisplayTel;
@property (nonatomic, strong) NSString * Id;
@property (nonatomic, assign) NSInteger Number;
@property (nonatomic, strong) NSString * NumberString;
@property (nonatomic, strong) NSString * RongCloudToken;
@property (nonatomic, assign) NSInteger Type;
@property (nonatomic, strong) NSString * UserName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
