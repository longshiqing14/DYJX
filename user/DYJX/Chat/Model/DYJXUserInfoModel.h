//
//  DYJXUserInfoModel.h
//  user
//
//  Created by 岩  熊 on 2018/10/31.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYJXIdentitySwitchingModel.h"
@class DYJXUserInfoRelationModel;

@interface DYJXUserInfoModel : NSObject
@property(nonatomic, assign)int Number;
@property(nonatomic, copy)NSString *NumberString;
@property(nonatomic, copy)NSString *Cellphone;
@property(nonatomic, assign)int Type;
@property(nonatomic, copy)NSString *UserName;
@property(nonatomic, strong)DYJXIdentitySwitchingCreatorBusinessModel *Business;
@property(nonatomic, copy)NSString *RongCloudToken;
@property(nonatomic, copy)NSString *BelongEnterprise;
@property(nonatomic, strong)DYJXUserInfoRelationModel *Relation;
@property(nonatomic, copy)NSString *DisplayName;
@property(nonatomic, copy)NSString *CreateOn;
@property(nonatomic, assign)BOOL Deleted;
@property(nonatomic, assign)BOOL Disabled;
@property(nonatomic, copy)NSString *Id;

@end

@interface DYJXUserInfoRelationModel : NSObject
@property(nonatomic, assign)BOOL IsFriend;
@property(nonatomic, assign)BOOL IsContact;
@property(nonatomic, assign)BOOL InBlacklist;
@property(nonatomic, assign)BOOL IsMember;
@property(nonatomic, assign)BOOL IsAdmin;
@property(nonatomic, assign)BOOL IsOwner;
@property(nonatomic, assign)BOOL IsParentAdmin;
@property(nonatomic, assign)BOOL IsParentOwner;
@property(nonatomic, assign)BOOL Managed;
@end
