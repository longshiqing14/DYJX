//
//	DYJXXYCreator.h
//
//	Create by 岩 熊 on 7/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DYJXXYBusines.h"

@interface DYJXXYCreator : NSObject

@property (nonatomic, strong) NSString * belongEnterprise;
@property (nonatomic, strong) DYJXXYBusines * business;
@property (nonatomic, strong) NSString * cellphone;
@property (nonatomic, strong) NSString * createOn;
@property (nonatomic, assign) BOOL deleted;
@property (nonatomic, assign) BOOL disabled;
@property (nonatomic, strong) NSString * displayName;
@property (nonatomic, strong) NSString * displayTel;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) NSString * numberString;
@property (nonatomic, strong) NSString * rongCloudToken;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSString * userName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end