//
//	DYSearchContactRequest.h
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DYSearchContactRequest : NSObject

@property (nonatomic, copy) NSString * CertificateId;
@property (nonatomic, copy) NSString * ClientId;
@property (nonatomic, copy) NSString * ContactType;
@property (nonatomic, copy) NSString * Data;
@property (nonatomic, copy) NSString * Deleted;
@property (nonatomic, copy) NSString * Device;
@property (nonatomic, copy) NSString * DeviceToken;
@property (nonatomic, copy) NSString * Disabled;
@property (nonatomic, assign) NSInteger EndDateTime;
@property (nonatomic, copy) NSString * From;
@property (nonatomic, copy) NSString * IdField;
@property (nonatomic, copy) NSString * Keyword;
@property (nonatomic, copy) NSString * MemberID;
@property (nonatomic, copy) NSString * PageIndex;
@property (nonatomic, copy) NSString * PageSize;
@property (nonatomic, assign) NSInteger StartDateTime;
@property (nonatomic, copy) NSString * UserID;
@property (nonatomic, copy) NSString * UserType;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
