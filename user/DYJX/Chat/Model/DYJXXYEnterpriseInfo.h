//
//	DYJXXYEnterpriseInfo.h
//
//	Create by 岩 熊 on 12/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DYJXXYEnterpriseInfo : NSObject

@property (nonatomic, assign) BOOL AdminSay;
@property (nonatomic, assign) BOOL CanNotSearch;
@property (nonatomic, strong) NSString * CompanyName;
@property (nonatomic, strong) NSString * CompanyShortName;
@property (nonatomic, strong) NSString * HeadImgUrl;
@property (nonatomic, strong) NSString * IdField;
@property (nonatomic, strong) NSString * Images;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end