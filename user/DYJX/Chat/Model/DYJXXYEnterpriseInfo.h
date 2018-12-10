//
//	DYJXXYEnterpriseInfo.h
//
//	Create by 岩 熊 on 7/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DYJXXYEnterpriseInfo : NSObject

@property (nonatomic, assign) BOOL adminSay;
@property (nonatomic, assign) BOOL canNotSearch;
@property (nonatomic, strong) NSString * companyName;
@property (nonatomic, strong) NSString * companyShortName;
@property (nonatomic, strong) NSString * headImgUrl;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * images;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end