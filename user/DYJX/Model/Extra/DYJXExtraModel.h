//
//	DYJXExtraModel.h
//
//	Create by longshiqing on 14/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DYJXExtraModel : NSObject

@property (nonatomic, copy) NSString * conversationId;
@property (nonatomic, strong) NSObject * fromCertifyHeadImg;
@property (nonatomic, copy) NSString * fromCertifyId;
@property (nonatomic, copy) NSString * fromCertifyName;
@property (nonatomic, strong) NSObject * fromHeadImg;
@property (nonatomic, copy) NSString * fromId;
@property (nonatomic, copy) NSString * fromName;
@property (nonatomic, strong) NSObject * gMembers;
@property (nonatomic, assign) NSInteger gType;
@property (nonatomic, copy) NSString * idField;
@property (nonatomic, copy) NSString * imKey;
@property (nonatomic, copy) NSString * keywords;
@property (nonatomic, assign) NSInteger messageType;
@property (nonatomic, copy) NSString * msgTime;
@property (nonatomic, copy) NSString * targetHeadImg;
@property (nonatomic, copy) NSString * targetId;
@property (nonatomic, copy) NSString * targetName;
@property (nonatomic, assign) NSInteger targetType;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
