//
//	XYDYJXBusines.h
//
//	Create by 岩 熊 on 18/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "XYDYJXIMInfo.h"

@interface XYDYJXBusines : NSObject

@property (nonatomic, strong) NSString * CreateOn;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, strong) XYDYJXIMInfo * IMInfo;
@property (nonatomic, strong) NSString * IdField;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end