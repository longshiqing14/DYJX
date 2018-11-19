//
//	DJJSResult.h
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DJJSBusines.h"
#import "DJJSRelation.h"

@interface DJJSResult : NSObject

@property (nonatomic, strong) NSString * BelongEnterprise;
@property (nonatomic, strong) DJJSBusines * Business;
@property (nonatomic, strong) NSString * Cellphone;
@property (nonatomic, strong) NSString * CreateOn;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, strong) NSString * DisplayName;
@property (nonatomic, strong) NSString * IdField;
@property (nonatomic, assign) NSInteger Number;
@property (nonatomic, strong) NSString * NumberString;
@property (nonatomic, strong) DJJSRelation * Relation;
@property (nonatomic, strong) NSString * RongCloudToken;
@property (nonatomic, assign) NSInteger Type;
@property (nonatomic, strong) NSString * UserName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end