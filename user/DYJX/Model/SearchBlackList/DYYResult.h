//
//	DYYResult.h
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DYYBlackObj.h"

@interface DYYResult : NSObject

@property (nonatomic, strong) NSString * BelongBlackUserEnterprise;
@property (nonatomic, strong) NSString * BelongEnterprise;
@property (nonatomic, strong) DYYBlackObj * BlackObj;
@property (nonatomic, strong) NSString * BlackUserId;
@property (nonatomic, strong) NSString * CreateBy;
@property (nonatomic, strong) NSString * CreateOn;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString * UserId;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
