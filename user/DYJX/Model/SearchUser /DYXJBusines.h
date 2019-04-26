//
//	DYXJBusines.h
//
//	Create by longshiqing on 26/4/2019
//	Copyright © 2019. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DYXJIMInfo.h"

@interface DYXJBusines : NSObject

@property (nonatomic, strong) NSString * CreateOn;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, strong) DYXJIMInfo * IMInfo;
@property (nonatomic, strong) NSString * IdField;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end