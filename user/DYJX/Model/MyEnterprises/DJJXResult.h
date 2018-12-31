//
//	DJJXResult.h
//
//	Create by longshiqing on 17/11/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DJJXAdminUsers.h"
#import "DJJXCreator.h"
#import "DJJXEnterpriseInfo.h"
#import "DJJXMembers.h"
#import "DJJXCreator.h"

@interface DJJXResult : NSObject

@property (nonatomic, strong) NSArray <NSString *>* AdminUserIds;
@property (nonatomic, strong) NSArray * AdminUsers;
@property (nonatomic, strong) NSArray * AllMemberIds;
@property (nonatomic, assign) BOOL CanNotSearch;
@property (nonatomic, strong) NSArray <DJJXResult *> * Children;
@property (nonatomic, copy) NSString * CreateBy;
@property (nonatomic, copy) NSString * CreateOn;
@property (nonatomic, strong) DJJXCreator * Creator;
@property (nonatomic, copy) NSString * CreatorId;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, strong) DJJXEnterpriseInfo * EnterpriseInfo;
@property (nonatomic, copy) NSString * GroupHeadImg;
@property (nonatomic, copy) NSString * GroupName;
@property (nonatomic, copy) NSString * GroupNumber;
@property (nonatomic, assign) NSInteger GroupType;
@property (nonatomic, copy) NSString * Id;
@property (nonatomic, assign) BOOL IsPart;
@property (nonatomic, strong) NSArray * MemberIds;
@property (nonatomic, strong) NSArray * Members;
@property (nonatomic, assign) BOOL NotAllowJoinFree;
@property (nonatomic, assign) BOOL NotAllowMemberInvite;
@property (nonatomic, assign) BOOL NotAllowSay;
@property (nonatomic, assign) NSInteger Number;
@property (nonatomic, copy) NSString * NumberString;
@property (nonatomic, strong) DJJXCreator * Owner;
@property (nonatomic, copy) NSString * OwnerId;
@property (nonatomic, assign) NSInteger PartType;
@property (nonatomic, strong) NSArray * SilenceUserIds;
@property (nonatomic, copy) NSString * UpdateBy;
@property (nonatomic, copy) NSString * UpdateOn;
@property (nonatomic, assign) NSInteger WildType;

#pragma mark - addBySelf
// 管理者和参与者 查看userId 是否在AdminUserIds 之中
@property (nonatomic, assign)BOOL isManager; // 是否是管理者

// 管理者和参与者 查看Number 是否在Number 相等
@property (nonatomic, assign)BOOL isSelf; // 是否是本人详情

// 管理者和参与者 是否在是公司详情还是子公司详情
@property (nonatomic, assign)BOOL inCompany; // 是否是本人详情

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
