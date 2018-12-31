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
@property (nonatomic, strong) NSMutableArray<DYJXXYResult*> * Children;
@property (nonatomic, copy) NSString * CreateBy;
@property (nonatomic, copy) NSString * CreateOn;
@property (nonatomic, strong) DYJXXYCreator * Creator;
@property (nonatomic, copy) NSString * CreatorId;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, strong) DYJXXYEnterpriseInfo * EnterpriseInfo;
@property (nonatomic, copy) NSString * GroupHeadImg;
@property (nonatomic, copy) NSString * GroupName;
@property (nonatomic, copy) NSString * GroupNumber;
@property (nonatomic, assign) NSInteger GroupType;
@property (nonatomic, copy) NSString * Id;
@property (nonatomic, assign) BOOL IsPart;
@property (nonatomic, strong) NSArray<NSString*> * MemberIds;
@property (nonatomic, strong) NSArray * Members;
@property (nonatomic, assign) BOOL NotAllowJoinFree;
@property (nonatomic, assign) BOOL NotAllowMemberInvite;
@property (nonatomic, assign) BOOL NotAllowSay;
@property (nonatomic, assign) NSInteger Number;
@property (nonatomic, copy) NSString * NumberString;
@property (nonatomic, strong) DYJXXYCreator * Owner;
@property (nonatomic, copy) NSString * OwnerId;
@property (nonatomic, assign) NSInteger PartType;
@property (nonatomic, strong) DYJXXYRelation * Relation;
@property (nonatomic, strong) NSArray * SilenceUserIds;
@property (nonatomic, copy) NSString * UpdateBy;
@property (nonatomic, copy) NSString * UpdateOn;
@property (nonatomic, assign) NSInteger WildType;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
