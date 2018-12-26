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
@property (nonatomic, copy) NSString * CompanyName;
@property (nonatomic, copy) NSString * CompanyShortName;
@property (nonatomic, copy) NSString * HeadImgUrl;
@property (nonatomic, copy) NSString * IdField;
@property (nonatomic, copy) NSString * Images;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
