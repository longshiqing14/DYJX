//
//	DYJXXYResult.h
//
//	Create by 岩 熊 on 7/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DYJXXYAdminUsers.h"
#import "DYJXXYCreator.h"
#import "DYJXXYEnterpriseInfo.h"
#import "DYJXXYAdminUsers.h"
#import "DYJXXYCreator.h"
#import "DYJXXYRelation.h"

@interface DYJXXYResult : NSObject

@property (nonatomic, strong) NSArray * adminUserIds;
@property (nonatomic, strong) NSArray * adminUsers;
@property (nonatomic, strong) NSArray * allMemberIds;
@property (nonatomic, assign) BOOL canNotSearch;
@property (nonatomic, strong) NSArray * children;
@property (nonatomic, strong) NSString * createBy;
@property (nonatomic, strong) NSString * createOn;
@property (nonatomic, strong) DYJXXYCreator * creator;
@property (nonatomic, strong) NSString * creatorId;
@property (nonatomic, assign) BOOL deleted;
@property (nonatomic, assign) BOOL disabled;
@property (nonatomic, strong) DYJXXYEnterpriseInfo * enterpriseInfo;
@property (nonatomic, strong) NSString * groupHeadImg;
@property (nonatomic, strong) NSString * groupName;
@property (nonatomic, strong) NSString * groupNumber;
@property (nonatomic, assign) NSInteger groupType;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, assign) BOOL isPart;
@property (nonatomic, strong) NSArray * memberIds;
@property (nonatomic, strong) NSArray * members;
@property (nonatomic, assign) BOOL notAllowJoinFree;
@property (nonatomic, assign) BOOL notAllowMemberInvite;
@property (nonatomic, assign) BOOL notAllowSay;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) NSString * numberString;
@property (nonatomic, strong) DYJXXYCreator * owner;
@property (nonatomic, strong) NSString * ownerId;
@property (nonatomic, assign) NSInteger partType;
@property (nonatomic, strong) DYJXXYRelation * relation;
@property (nonatomic, strong) NSArray * silenceUserIds;
@property (nonatomic, strong) NSString * updateBy;
@property (nonatomic, strong) NSString * updateOn;
@property (nonatomic, assign) NSInteger wildType;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
