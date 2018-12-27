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

@property (nonatomic, copy) NSString * BelongEnterprise;
@property (nonatomic, strong) DJJSBusines * Business;
@property (nonatomic, copy) NSString * Cellphone;
@property (nonatomic, copy) NSString * CreateOn;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, copy) NSString * DisplayName;
@property (nonatomic, copy) NSString * IdField;
@property (nonatomic, assign) NSInteger Number;
@property (nonatomic, copy) NSString * NumberString;
@property (nonatomic, strong) DJJSRelation * Relation;
@property (nonatomic, copy) NSString * RongCloudToken;
@property (nonatomic, assign) NSInteger Type;
@property (nonatomic, copy) NSString * UserName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
