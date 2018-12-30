//
//	DLLIMInfo.h
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DLLIMInfo : NSObject

@property (nonatomic, assign) BOOL AdminSay;
@property (nonatomic, assign) BOOL CanNotSearch;
@property (nonatomic, strong) NSString * HeadImgUrl;
@property (nonatomic, strong) NSString * IdField;
@property (nonatomic, strong) NSString * Images;
@property (nonatomic, strong) NSString * PersonBank;
@property (nonatomic, strong) NSString * PersonBankCardNo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end