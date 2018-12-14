//
//	DYJXExtraModel.h
//
//	Create by longshiqing on 14/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DYJXExtraModel : NSObject

@property (nonatomic, strong) NSString * conversationId;
@property (nonatomic, strong) NSObject * fromCertifyHeadImg;
@property (nonatomic, strong) NSString * fromCertifyId;
@property (nonatomic, strong) NSString * fromCertifyName;
@property (nonatomic, strong) NSObject * fromHeadImg;
@property (nonatomic, strong) NSString * fromId;
@property (nonatomic, strong) NSString * fromName;
@property (nonatomic, strong) NSObject * gMembers;
@property (nonatomic, assign) NSInteger gType;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * imKey;
@property (nonatomic, strong) NSString * keywords;
@property (nonatomic, assign) NSInteger messageType;
@property (nonatomic, strong) NSString * msgTime;
@property (nonatomic, strong) NSString * targetHeadImg;
@property (nonatomic, strong) NSString * targetId;
@property (nonatomic, strong) NSString * targetName;
@property (nonatomic, assign) NSInteger targetType;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end