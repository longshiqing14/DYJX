//
//	DYJXXYBusines.h
//
//	Create by 岩 熊 on 7/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DYJXXYIMInfo.h"

@interface DYJXXYBusines : NSObject

@property (nonatomic, strong) NSString * createOn;
@property (nonatomic, assign) BOOL deleted;
@property (nonatomic, assign) BOOL disabled;
@property (nonatomic, strong) DYJXXYIMInfo * iMInfo;
@property (nonatomic, strong) NSString * idField;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end