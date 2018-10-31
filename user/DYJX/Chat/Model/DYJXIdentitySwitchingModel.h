//
//  DYJXIdentitySwitchingModel.h
//  user
//
//  Created by 岩  熊 on 2018/10/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DYJXIdentitySwitchingEnterpriseInfoModel;
@class DYJXIdentitySwitchingCreatorModel;
@class DYJXIdentitySwitchingCreatorBusinessModel;
@class DYJXIdentitySwitchingCreatorBusinessIMInfoModel;
@class DYJXIdentitySwitchingChildrenModel;

@interface DYJXIdentitySwitchingModel : NSObject
@property(nonatomic, assign)int Number;
@property(nonatomic, copy)NSString *NumberString;
@property(nonatomic, copy)NSString *GroupName;
@property(nonatomic, copy)NSString *GroupNumber;
@property(nonatomic, copy)NSString *GroupType;
@property(nonatomic, copy)NSString *CreatorId;
@property(nonatomic, copy)NSString *OwnerId;
@property(nonatomic, assign)BOOL IsPart;
@property(nonatomic, assign)int PartType;
@property(nonatomic, assign)int WildType;
@property(nonatomic, copy)NSString *GroupHeadImg;
@property(nonatomic, assign)BOOL NotAllowMemberInvite;
@property(nonatomic, assign)BOOL NotAllowJoinFree;
@property(nonatomic, assign)BOOL NotAllowSay;
@property(nonatomic, assign)BOOL CanNotSearch;
@property(nonatomic, strong)NSArray *SilenceUserIds;
@property(nonatomic, strong)DYJXIdentitySwitchingEnterpriseInfoModel *EnterpriseInfo;
@property(nonatomic, strong)NSArray<NSString*> *AdminUserIds;
@property(nonatomic, strong)NSArray<NSString*> *MemberIds;
@property(nonatomic, strong)NSArray<NSString*> *AllMemberIds;
@property(nonatomic, strong)DYJXIdentitySwitchingCreatorModel *Creator;
@property(nonatomic, strong)DYJXIdentitySwitchingCreatorModel *Owner;
@property(nonatomic, strong)NSArray<DYJXIdentitySwitchingChildrenModel*> *Children;
@property(nonatomic, assign)BOOL Deleted;
@property(nonatomic, assign)BOOL Disabled;
@property(nonatomic, copy)NSString *CreateOn;
@property(nonatomic, copy)NSString *CreateBy;
@property(nonatomic, copy)NSString *UpdateOn;
@property(nonatomic, copy)NSString *UpdateBy;
@property(nonatomic, copy)NSString *Id;
@end

@interface DYJXIdentitySwitchingChildrenModel : NSObject
@property(nonatomic, copy)NSString *NumberString;
@property(nonatomic, copy)NSString *GroupName;
@property(nonatomic, copy)NSString *GroupNumber;
@property(nonatomic, copy)NSString *GroupType;
@property(nonatomic, copy)NSString *CreatorId;
@property(nonatomic, copy)NSString *OwnerId;
@property(nonatomic, assign)BOOL IsPart;
@property(nonatomic, assign)int PartType;
@property(nonatomic, assign)int WildType;
@property(nonatomic, copy)NSString *GroupHeadImg;
@property(nonatomic, assign)BOOL NotAllowMemberInvite;
@property(nonatomic, assign)BOOL NotAllowJoinFree;
@property(nonatomic, assign)BOOL NotAllowSay;
@property(nonatomic, assign)BOOL CanNotSearch;
@property(nonatomic, strong)NSArray *SilenceUserIds;
@property(nonatomic, strong)DYJXIdentitySwitchingEnterpriseInfoModel *EnterpriseInfo;
@property(nonatomic, strong)NSArray<NSString*> *AdminUserIds;
@property(nonatomic, strong)NSArray<NSString*> *MemberIds;
@property(nonatomic, strong)NSArray<NSString*> *AllMemberIds;
@property(nonatomic, strong)DYJXIdentitySwitchingCreatorModel *Creator;
@property(nonatomic, strong)DYJXIdentitySwitchingCreatorModel *Owner;
@property(nonatomic, strong)NSArray<DYJXIdentitySwitchingChildrenModel*> *Children;
@property(nonatomic, assign)BOOL Deleted;
@property(nonatomic, assign)BOOL Disabled;
@property(nonatomic, copy)NSString *CreateOn;
@property(nonatomic, copy)NSString *CreateBy;
@property(nonatomic, copy)NSString *UpdateOn;
@property(nonatomic, copy)NSString *UpdateBy;
@property(nonatomic, copy)NSString *Id;
@end

@interface DYJXIdentitySwitchingEnterpriseInfoModel : NSObject
@property(nonatomic, copy)NSString *CompanyShortName;
@property(nonatomic, copy)NSString *CompanyLinkMan;
@property(nonatomic, copy)NSString *CompanyTel;
@property(nonatomic, assign)BOOL AdminSay;
@property(nonatomic, copy)NSString *CompanyName;
@property(nonatomic, assign)BOOL *CanNotSearch;
@property(nonatomic, copy)NSString *HeadImgUrl;
@property(nonatomic, assign)int ProvinceId;
@property(nonatomic, assign)int CityId;
@property(nonatomic, assign)int DistrictId;
@property(nonatomic, copy)NSString *PCDName;
@property(nonatomic, strong)NSArray *Images;
@property(nonatomic, copy)NSString *Id;
@end

@interface DYJXIdentitySwitchingCreatorModel : NSObject
@property(nonatomic, assign)int Number;
@property(nonatomic, copy)NSString *NumberString;
@property(nonatomic, copy)NSString *Cellphone;
@property(nonatomic, assign)int Type;
@property(nonatomic, copy)NSString *UserName;
@property(nonatomic, strong)DYJXIdentitySwitchingCreatorBusinessModel *Business;
@property(nonatomic, copy)NSString *RongCloudToken;
@property(nonatomic, copy)NSString *BelongEnterprise;
@property(nonatomic, copy)NSString *DisplayName;
@property(nonatomic, assign)BOOL Deleted;
@property(nonatomic, assign)BOOL Disabled;
@property(nonatomic, copy)NSString *CreateOn;
@property(nonatomic, copy)NSString *Id;
@end

@interface DYJXIdentitySwitchingCreatorBusinessModel : NSObject
@property(nonatomic, strong)DYJXIdentitySwitchingCreatorBusinessIMInfoModel *IMInfo;
@property(nonatomic, assign)BOOL Deleted;
@property(nonatomic, assign)BOOL Disabled;
@property(nonatomic, copy)NSString *CreateOn;
@property(nonatomic, copy)NSString *Id;
@end

@interface DYJXIdentitySwitchingCreatorBusinessIMInfoModel : NSObject
@property(nonatomic, assign)BOOL AdminSay;
@property(nonatomic, assign)BOOL CanNotSearch;
@property(nonatomic, copy)NSString *NickName;
@property(nonatomic, copy)NSString *PersonRemark;
@property(nonatomic, copy)NSString *HeadImgUrl;
@property(nonatomic, strong)NSArray *Images;
@property(nonatomic, copy)NSString *Id;
@end
