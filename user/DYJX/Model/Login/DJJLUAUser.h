//
//	DJJLUAUser.h
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DJJLBusines.h"
#import "DJJLMember.h"

@interface DJJLUAUser : NSObject

@property (nonatomic, strong) DJJLBusines * Business;
@property (nonatomic, assign) NSInteger ContactType;
@property (nonatomic, strong) NSString * CreateOn;
@property (nonatomic, strong) NSString * CreateUAUrl;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, strong) NSString * IdField;
@property (nonatomic, strong) DJJLMember * Member;
@property (nonatomic, assign) NSInteger Number;
@property (nonatomic, strong) NSString * NumberString;
@property (nonatomic, assign) NSInteger Status;
@property (nonatomic, assign) NSInteger Type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end