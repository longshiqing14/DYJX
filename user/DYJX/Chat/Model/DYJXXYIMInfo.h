//
//	DYJXXYIMInfo.h
//
//	Create by 岩 熊 on 12/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DYJXXYIMInfo : NSObject

@property (nonatomic, assign) BOOL AdminSay;
@property (nonatomic, assign) BOOL CanNotSearch;
@property (nonatomic, copy) NSString * HeadImgUrl;
@property (nonatomic, copy) NSString * IdField;
@property (nonatomic, copy) NSString * Images;
@property (nonatomic, copy) NSString * PersonBank;
@property (nonatomic, copy) NSString * PersonBankCardNo;
@property (nonatomic, copy) NSString * PersonRemark;
@property (nonatomic, copy) NSString * NickName;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
