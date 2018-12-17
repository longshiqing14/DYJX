//
//	DYJXXYResult.h
//
//	Create by 岩 熊 on 12/12/2018
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

@property (nonatomic, strong) NSArray * AdminUserIds;
@property (nonatomic, strong) NSArray * AdminUsers;
@property (nonatomic, strong) NSArray * AllMemberIds;
@property (nonatomic, assign) BOOL CanNotSearch;
@property (nonatomic, strong) NSArray * Children;
@property (nonatomic, strong) NSString * CreateBy;
@property (nonatomic, strong) NSString * CreateOn;
@property (nonatomic, strong) DYJXXYCreator * Creator;
@property (nonatomic, strong) NSString * CreatorId;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, strong) DYJXXYEnterpriseInfo * EnterpriseInfo;
@property (nonatomic, strong) NSString * GroupHeadImg;
@property (nonatomic, strong) NSString * GroupName;
@property (nonatomic, strong) NSString * GroupNumber;
@property (nonatomic, assign) NSInteger GroupType;
@property (nonatomic, strong) NSString * IdField;
@property (nonatomic, assign) BOOL IsPart;
@property (nonatomic, strong) NSArray<NSString*> * MemberIds;
@property (nonatomic, strong) NSArray * Members;
@property (nonatomic, assign) BOOL NotAllowJoinFree;
@property (nonatomic, assign) BOOL NotAllowMemberInvite;
@property (nonatomic, assign) BOOL NotAllowSay;
@property (nonatomic, assign) NSInteger Number;
@property (nonatomic, strong) NSString * NumberString;
@property (nonatomic, strong) DYJXXYCreator * Owner;
@property (nonatomic, strong) NSString * OwnerId;
@property (nonatomic, assign) NSInteger PartType;
@property (nonatomic, strong) DYJXXYRelation * Relation;
@property (nonatomic, strong) NSArray * SilenceUserIds;
@property (nonatomic, strong) NSString * UpdateBy;
@property (nonatomic, strong) NSString * UpdateOn;
@property (nonatomic, assign) NSInteger WildType;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
