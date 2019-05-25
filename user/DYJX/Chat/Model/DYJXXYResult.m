//
//	DYJXXYResult.m
//
//	Create by 岩 熊 on 12/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYJXXYResult.h"

NSString *const kDYJXXYResultAdminUserIds = @"AdminUserIds";
NSString *const kDYJXXYResultAdminUsers = @"AdminUsers";
NSString *const kDYJXXYResultAllMemberIds = @"AllMemberIds";
NSString *const kDYJXXYResultCanNotSearch = @"CanNotSearch";
NSString *const kDYJXXYResultChildren = @"Children";
NSString *const kDYJXXYResultCreateBy = @"CreateBy";
NSString *const kDYJXXYResultCreateOn = @"CreateOn";
NSString *const kDYJXXYResultCreator = @"Creator";
NSString *const kDYJXXYResultCreatorId = @"CreatorId";
NSString *const kDYJXXYResultDeleted = @"Deleted";
NSString *const kDYJXXYResultDisabled = @"Disabled";
NSString *const kDYJXXYResultEnterpriseInfo = @"EnterpriseInfo";
NSString *const kDYJXXYResultGroupHeadImg = @"GroupHeadImg";
NSString *const kDYJXXYResultGroupName = @"GroupName";
NSString *const kDYJXXYResultGroupInfo = @"GroupInfo";
NSString *const kDYJXXYResultGroupNumber = @"GroupNumber";
NSString *const kDYJXXYResultGroupType = @"GroupType";
NSString *const kDYJXXYResultId = @"Id";
NSString *const kDYJXXYResultIsPart = @"IsPart";
NSString *const kDYJXXYResultMemberIds = @"MemberIds";
NSString *const kDYJXXYResultMembers = @"Members";
NSString *const kDYJXXYResultNotAllowJoinFree = @"NotAllowJoinFree";
NSString *const kDYJXXYResultNotAllowMemberInvite = @"NotAllowMemberInvite";
NSString *const kDYJXXYResultNotAllowSay = @"NotAllowSay";
NSString *const kDYJXXYResultNumber = @"Number";
NSString *const kDYJXXYResultNumberString = @"NumberString";
NSString *const kDYJXXYResultOwner = @"Owner";
NSString *const kDYJXXYResultOwnerId = @"OwnerId";
NSString *const kDYJXXYResultPartType = @"PartType";
NSString *const kDYJXXYResultRelation = @"Relation";
NSString *const kDYJXXYResultSilenceUserIds = @"SilenceUserIds";
NSString *const kDYJXXYResultUpdateBy = @"UpdateBy";
NSString *const kDYJXXYResultUpdateOn = @"UpdateOn";
NSString *const kDYJXXYResultWildType = @"WildType";
NSString *const kDYJXXYResultParentEnterpriseId = @"ParentEnterpriseId";

@interface DYJXXYResult ()
@end
@implementation DYJXXYResult



+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"Children":[DYJXXYResult class],
             };
}
/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYJXXYResultAdminUserIds] isKindOfClass:[NSNull class]]){
		self.AdminUserIds = dictionary[kDYJXXYResultAdminUserIds];
	}	
	if(dictionary[kDYJXXYResultAdminUsers] != nil && [dictionary[kDYJXXYResultAdminUsers] isKindOfClass:[NSArray class]]){
		NSArray * AdminUsersDictionaries = dictionary[kDYJXXYResultAdminUsers];
		NSMutableArray * AdminUsersItems = [NSMutableArray array];
		for(NSDictionary * AdminUsersDictionary in AdminUsersDictionaries){
			DYJXXYAdminUsers * AdminUsersItem = [[DYJXXYAdminUsers alloc] initWithDictionary:AdminUsersDictionary];
			[AdminUsersItems addObject:AdminUsersItem];
		}
		self.AdminUsers = AdminUsersItems;
	}
	if(![dictionary[kDYJXXYResultAllMemberIds] isKindOfClass:[NSNull class]]){
		self.AllMemberIds = dictionary[kDYJXXYResultAllMemberIds];
	}	
	if(![dictionary[kDYJXXYResultCanNotSearch] isKindOfClass:[NSNull class]]){
		self.CanNotSearch = [dictionary[kDYJXXYResultCanNotSearch] boolValue];
	}

	if(![dictionary[kDYJXXYResultChildren] isKindOfClass:[NSNull class]]){
		self.Children = dictionary[kDYJXXYResultChildren];
	}	
	if(![dictionary[kDYJXXYResultCreateBy] isKindOfClass:[NSNull class]]){
		self.CreateBy = dictionary[kDYJXXYResultCreateBy];
	}	
	if(![dictionary[kDYJXXYResultCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDYJXXYResultCreateOn];
	}	
	if(![dictionary[kDYJXXYResultCreator] isKindOfClass:[NSNull class]]){
		self.Creator = [[DYJXXYCreator alloc] initWithDictionary:dictionary[kDYJXXYResultCreator]];
	}

	if(![dictionary[kDYJXXYResultCreatorId] isKindOfClass:[NSNull class]]){
		self.CreatorId = dictionary[kDYJXXYResultCreatorId];
	}	
	if(![dictionary[kDYJXXYResultDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDYJXXYResultDeleted] boolValue];
	}

	if(![dictionary[kDYJXXYResultDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDYJXXYResultDisabled] boolValue];
	}

	if(![dictionary[kDYJXXYResultEnterpriseInfo] isKindOfClass:[NSNull class]]){
		self.EnterpriseInfo = [[DYJXXYEnterpriseInfo alloc] initWithDictionary:dictionary[kDYJXXYResultEnterpriseInfo]];
	}

	if(![dictionary[kDYJXXYResultGroupHeadImg] isKindOfClass:[NSNull class]]){
		self.GroupHeadImg = dictionary[kDYJXXYResultGroupHeadImg];
	}	
	if(![dictionary[kDYJXXYResultGroupName] isKindOfClass:[NSNull class]]){
		self.GroupName = dictionary[kDYJXXYResultGroupName];
	}
    if(![dictionary[kDYJXXYResultGroupInfo] isKindOfClass:[NSNull class]]){
        self.GroupName = dictionary[kDYJXXYResultGroupInfo];
    }
	if(![dictionary[kDYJXXYResultGroupNumber] isKindOfClass:[NSNull class]]){
		self.GroupNumber = dictionary[kDYJXXYResultGroupNumber];
	}	
	if(![dictionary[kDYJXXYResultGroupType] isKindOfClass:[NSNull class]]){
		self.GroupType = [dictionary[kDYJXXYResultGroupType] integerValue];
	}

	if(![dictionary[kDYJXXYResultId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDYJXXYResultId];
	}	
	if(![dictionary[kDYJXXYResultIsPart] isKindOfClass:[NSNull class]]){
		self.IsPart = [dictionary[kDYJXXYResultIsPart] boolValue];
	}

	if(![dictionary[kDYJXXYResultMemberIds] isKindOfClass:[NSNull class]]){
		self.MemberIds = dictionary[kDYJXXYResultMemberIds];
	}	
	if(dictionary[kDYJXXYResultMembers] != nil && [dictionary[kDYJXXYResultMembers] isKindOfClass:[NSArray class]]){
		NSArray * MembersDictionaries = dictionary[kDYJXXYResultMembers];
		NSMutableArray * MembersItems = [NSMutableArray array];
		for(NSDictionary * MembersDictionary in MembersDictionaries){
			DYJXXYAdminUsers * MembersItem = [[DYJXXYAdminUsers alloc] initWithDictionary:MembersDictionary];
			[MembersItems addObject:MembersItem];
		}
		self.Members = MembersItems;
	}
	if(![dictionary[kDYJXXYResultNotAllowJoinFree] isKindOfClass:[NSNull class]]){
		self.NotAllowJoinFree = [dictionary[kDYJXXYResultNotAllowJoinFree] boolValue];
	}

	if(![dictionary[kDYJXXYResultNotAllowMemberInvite] isKindOfClass:[NSNull class]]){
		self.NotAllowMemberInvite = [dictionary[kDYJXXYResultNotAllowMemberInvite] boolValue];
	}

	if(![dictionary[kDYJXXYResultNotAllowSay] isKindOfClass:[NSNull class]]){
		self.NotAllowSay = [dictionary[kDYJXXYResultNotAllowSay] boolValue];
	}

	if(![dictionary[kDYJXXYResultNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kDYJXXYResultNumber] integerValue];
	}

	if(![dictionary[kDYJXXYResultNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kDYJXXYResultNumberString];
	}	
	if(![dictionary[kDYJXXYResultOwner] isKindOfClass:[NSNull class]]){
		self.Owner = [[DYJXXYCreator alloc] initWithDictionary:dictionary[kDYJXXYResultOwner]];
	}

	if(![dictionary[kDYJXXYResultOwnerId] isKindOfClass:[NSNull class]]){
		self.OwnerId = dictionary[kDYJXXYResultOwnerId];
	}	
	if(![dictionary[kDYJXXYResultPartType] isKindOfClass:[NSNull class]]){
		self.PartType = [dictionary[kDYJXXYResultPartType] integerValue];
	}

	if(![dictionary[kDYJXXYResultRelation] isKindOfClass:[NSNull class]]){
		self.Relation = [[DYJXXYRelation alloc] initWithDictionary:dictionary[kDYJXXYResultRelation]];
	}

	if(![dictionary[kDYJXXYResultSilenceUserIds] isKindOfClass:[NSNull class]]){
		self.SilenceUserIds = dictionary[kDYJXXYResultSilenceUserIds];
	}	
	if(![dictionary[kDYJXXYResultUpdateBy] isKindOfClass:[NSNull class]]){
		self.UpdateBy = dictionary[kDYJXXYResultUpdateBy];
	}	
	if(![dictionary[kDYJXXYResultUpdateOn] isKindOfClass:[NSNull class]]){
		self.UpdateOn = dictionary[kDYJXXYResultUpdateOn];
	}	
	if(![dictionary[kDYJXXYResultWildType] isKindOfClass:[NSNull class]]){
		self.WildType = [dictionary[kDYJXXYResultWildType] integerValue];
	}
    if(![dictionary[kDYJXXYResultParentEnterpriseId] isKindOfClass:[NSNull class]]){
        self.ParentEnterpriseId = dictionary[kDYJXXYResultParentEnterpriseId];
    }

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.AdminUserIds != nil){
		dictionary[kDYJXXYResultAdminUserIds] = self.AdminUserIds;
	}
	if(self.AdminUsers != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(DYJXXYAdminUsers * AdminUsersElement in self.AdminUsers){
			[dictionaryElements addObject:[AdminUsersElement toDictionary]];
		}
		dictionary[kDYJXXYResultAdminUsers] = dictionaryElements;
	}
	if(self.AllMemberIds != nil){
		dictionary[kDYJXXYResultAllMemberIds] = self.AllMemberIds;
	}
	dictionary[kDYJXXYResultCanNotSearch] = @(self.CanNotSearch);
	if(self.Children != nil){
		dictionary[kDYJXXYResultChildren] = self.Children;
	}
	if(self.CreateBy != nil){
		dictionary[kDYJXXYResultCreateBy] = self.CreateBy;
	}
	if(self.CreateOn != nil){
		dictionary[kDYJXXYResultCreateOn] = self.CreateOn;
	}
	if(self.Creator != nil){
		dictionary[kDYJXXYResultCreator] = [self.Creator toDictionary];
	}
	if(self.CreatorId != nil){
		dictionary[kDYJXXYResultCreatorId] = self.CreatorId;
	}
	dictionary[kDYJXXYResultDeleted] = @(self.Deleted);
	dictionary[kDYJXXYResultDisabled] = @(self.Disabled);
	if(self.EnterpriseInfo != nil){
		dictionary[kDYJXXYResultEnterpriseInfo] = [self.EnterpriseInfo toDictionary];
	}
	if(self.GroupHeadImg != nil){
		dictionary[kDYJXXYResultGroupHeadImg] = self.GroupHeadImg;
	}
	if(self.GroupName != nil){
		dictionary[kDYJXXYResultGroupName] = self.GroupName;
	}
    if(self.GroupInfo != nil){
        dictionary[kDYJXXYResultGroupInfo] = self.GroupInfo;
    }
	if(self.GroupNumber != nil){
		dictionary[kDYJXXYResultGroupNumber] = self.GroupNumber;
	}
	dictionary[kDYJXXYResultGroupType] = @(self.GroupType);
	if(self.Id != nil){
		dictionary[kDYJXXYResultId] = self.Id;
	}
	dictionary[kDYJXXYResultIsPart] = @(self.IsPart);
	if(self.MemberIds != nil){
		dictionary[kDYJXXYResultMemberIds] = self.MemberIds;
	}
	if(self.Members != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(DYJXXYAdminUsers * MembersElement in self.Members){
			[dictionaryElements addObject:[MembersElement toDictionary]];
		}
		dictionary[kDYJXXYResultMembers] = dictionaryElements;
	}
	dictionary[kDYJXXYResultNotAllowJoinFree] = @(self.NotAllowJoinFree);
	dictionary[kDYJXXYResultNotAllowMemberInvite] = @(self.NotAllowMemberInvite);
	dictionary[kDYJXXYResultNotAllowSay] = @(self.NotAllowSay);
	dictionary[kDYJXXYResultNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kDYJXXYResultNumberString] = self.NumberString;
	}
	if(self.Owner != nil){
		dictionary[kDYJXXYResultOwner] = [self.Owner toDictionary];
	}
	if(self.OwnerId != nil){
		dictionary[kDYJXXYResultOwnerId] = self.OwnerId;
	}
	dictionary[kDYJXXYResultPartType] = @(self.PartType);
	if(self.Relation != nil){
		dictionary[kDYJXXYResultRelation] = [self.Relation toDictionary];
	}
	if(self.SilenceUserIds != nil){
		dictionary[kDYJXXYResultSilenceUserIds] = self.SilenceUserIds;
	}
	if(self.UpdateBy != nil){
		dictionary[kDYJXXYResultUpdateBy] = self.UpdateBy;
	}
	if(self.UpdateOn != nil){
		dictionary[kDYJXXYResultUpdateOn] = self.UpdateOn;
	}
	dictionary[kDYJXXYResultWildType] = @(self.WildType);
    if(self.ParentEnterpriseId != nil){
        dictionary[kDYJXXYResultParentEnterpriseId] = self.ParentEnterpriseId;
    }
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.AdminUserIds != nil){
		[aCoder encodeObject:self.AdminUserIds forKey:kDYJXXYResultAdminUserIds];
	}
	if(self.AdminUsers != nil){
		[aCoder encodeObject:self.AdminUsers forKey:kDYJXXYResultAdminUsers];
	}
	if(self.AllMemberIds != nil){
		[aCoder encodeObject:self.AllMemberIds forKey:kDYJXXYResultAllMemberIds];
	}
	[aCoder encodeObject:@(self.CanNotSearch) forKey:kDYJXXYResultCanNotSearch];	if(self.Children != nil){
		[aCoder encodeObject:self.Children forKey:kDYJXXYResultChildren];
	}
	if(self.CreateBy != nil){
		[aCoder encodeObject:self.CreateBy forKey:kDYJXXYResultCreateBy];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDYJXXYResultCreateOn];
	}
	if(self.Creator != nil){
		[aCoder encodeObject:self.Creator forKey:kDYJXXYResultCreator];
	}
	if(self.CreatorId != nil){
		[aCoder encodeObject:self.CreatorId forKey:kDYJXXYResultCreatorId];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDYJXXYResultDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDYJXXYResultDisabled];	if(self.EnterpriseInfo != nil){
		[aCoder encodeObject:self.EnterpriseInfo forKey:kDYJXXYResultEnterpriseInfo];
	}
	if(self.GroupHeadImg != nil){
		[aCoder encodeObject:self.GroupHeadImg forKey:kDYJXXYResultGroupHeadImg];
	}
	if(self.GroupName != nil){
		[aCoder encodeObject:self.GroupName forKey:kDYJXXYResultGroupName];
	}
    if(self.GroupInfo != nil){
        [aCoder encodeObject:self.GroupInfo forKey:kDYJXXYResultGroupInfo];
    }
	if(self.GroupNumber != nil){
		[aCoder encodeObject:self.GroupNumber forKey:kDYJXXYResultGroupNumber];
	}
	[aCoder encodeObject:@(self.GroupType) forKey:kDYJXXYResultGroupType];	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDYJXXYResultId];
	}
	[aCoder encodeObject:@(self.IsPart) forKey:kDYJXXYResultIsPart];	if(self.MemberIds != nil){
		[aCoder encodeObject:self.MemberIds forKey:kDYJXXYResultMemberIds];
	}
	if(self.Members != nil){
		[aCoder encodeObject:self.Members forKey:kDYJXXYResultMembers];
	}
	[aCoder encodeObject:@(self.NotAllowJoinFree) forKey:kDYJXXYResultNotAllowJoinFree];	[aCoder encodeObject:@(self.NotAllowMemberInvite) forKey:kDYJXXYResultNotAllowMemberInvite];	[aCoder encodeObject:@(self.NotAllowSay) forKey:kDYJXXYResultNotAllowSay];	[aCoder encodeObject:@(self.Number) forKey:kDYJXXYResultNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kDYJXXYResultNumberString];
	}
	if(self.Owner != nil){
		[aCoder encodeObject:self.Owner forKey:kDYJXXYResultOwner];
	}
	if(self.OwnerId != nil){
		[aCoder encodeObject:self.OwnerId forKey:kDYJXXYResultOwnerId];
	}
	[aCoder encodeObject:@(self.PartType) forKey:kDYJXXYResultPartType];	if(self.Relation != nil){
		[aCoder encodeObject:self.Relation forKey:kDYJXXYResultRelation];
	}
	if(self.SilenceUserIds != nil){
		[aCoder encodeObject:self.SilenceUserIds forKey:kDYJXXYResultSilenceUserIds];
	}
	if(self.UpdateBy != nil){
		[aCoder encodeObject:self.UpdateBy forKey:kDYJXXYResultUpdateBy];
	}
	if(self.UpdateOn != nil){
		[aCoder encodeObject:self.UpdateOn forKey:kDYJXXYResultUpdateOn];
	}
	[aCoder encodeObject:@(self.WildType) forKey:kDYJXXYResultWildType];
    if(self.ParentEnterpriseId != nil){
        [aCoder encodeObject:self.ParentEnterpriseId forKey:kDYJXXYResultParentEnterpriseId];
    }
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.AdminUserIds = [aDecoder decodeObjectForKey:kDYJXXYResultAdminUserIds];
	self.AdminUsers = [aDecoder decodeObjectForKey:kDYJXXYResultAdminUsers];
	self.AllMemberIds = [aDecoder decodeObjectForKey:kDYJXXYResultAllMemberIds];
	self.CanNotSearch = [[aDecoder decodeObjectForKey:kDYJXXYResultCanNotSearch] boolValue];
	self.Children = [aDecoder decodeObjectForKey:kDYJXXYResultChildren];
	self.CreateBy = [aDecoder decodeObjectForKey:kDYJXXYResultCreateBy];
	self.CreateOn = [aDecoder decodeObjectForKey:kDYJXXYResultCreateOn];
	self.Creator = [aDecoder decodeObjectForKey:kDYJXXYResultCreator];
	self.CreatorId = [aDecoder decodeObjectForKey:kDYJXXYResultCreatorId];
	self.Deleted = [[aDecoder decodeObjectForKey:kDYJXXYResultDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDYJXXYResultDisabled] boolValue];
	self.EnterpriseInfo = [aDecoder decodeObjectForKey:kDYJXXYResultEnterpriseInfo];
	self.GroupHeadImg = [aDecoder decodeObjectForKey:kDYJXXYResultGroupHeadImg];
	self.GroupName = [aDecoder decodeObjectForKey:kDYJXXYResultGroupName];
    self.GroupInfo = [aDecoder decodeObjectForKey:kDYJXXYResultGroupInfo];
	self.GroupNumber = [aDecoder decodeObjectForKey:kDYJXXYResultGroupNumber];
	self.GroupType = [[aDecoder decodeObjectForKey:kDYJXXYResultGroupType] integerValue];
	self.Id = [aDecoder decodeObjectForKey:kDYJXXYResultId];
	self.IsPart = [[aDecoder decodeObjectForKey:kDYJXXYResultIsPart] boolValue];
	self.MemberIds = [aDecoder decodeObjectForKey:kDYJXXYResultMemberIds];
	self.Members = [aDecoder decodeObjectForKey:kDYJXXYResultMembers];
	self.NotAllowJoinFree = [[aDecoder decodeObjectForKey:kDYJXXYResultNotAllowJoinFree] boolValue];
	self.NotAllowMemberInvite = [[aDecoder decodeObjectForKey:kDYJXXYResultNotAllowMemberInvite] boolValue];
	self.NotAllowSay = [[aDecoder decodeObjectForKey:kDYJXXYResultNotAllowSay] boolValue];
	self.Number = [[aDecoder decodeObjectForKey:kDYJXXYResultNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kDYJXXYResultNumberString];
	self.Owner = [aDecoder decodeObjectForKey:kDYJXXYResultOwner];
	self.OwnerId = [aDecoder decodeObjectForKey:kDYJXXYResultOwnerId];
	self.PartType = [[aDecoder decodeObjectForKey:kDYJXXYResultPartType] integerValue];
	self.Relation = [aDecoder decodeObjectForKey:kDYJXXYResultRelation];
	self.SilenceUserIds = [aDecoder decodeObjectForKey:kDYJXXYResultSilenceUserIds];
	self.UpdateBy = [aDecoder decodeObjectForKey:kDYJXXYResultUpdateBy];
	self.UpdateOn = [aDecoder decodeObjectForKey:kDYJXXYResultUpdateOn];
	self.WildType = [[aDecoder decodeObjectForKey:kDYJXXYResultWildType] integerValue];
    self.ParentEnterpriseId = [aDecoder decodeObjectForKey:kDYJXXYResultParentEnterpriseId];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXXYResult *copy = [DYJXXYResult new];

	copy.AdminUserIds = [self.AdminUserIds copy];
	copy.AdminUsers = [self.AdminUsers copy];
	copy.AllMemberIds = [self.AllMemberIds copy];
	copy.CanNotSearch = self.CanNotSearch;
	copy.Children = [self.Children copy];
	copy.CreateBy = [self.CreateBy copy];
	copy.CreateOn = [self.CreateOn copy];
	copy.Creator = [self.Creator copy];
	copy.CreatorId = [self.CreatorId copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.EnterpriseInfo = [self.EnterpriseInfo copy];
	copy.GroupHeadImg = [self.GroupHeadImg copy];
	copy.GroupName = [self.GroupName copy];
    copy.GroupInfo = [self.GroupInfo copy];
	copy.GroupNumber = [self.GroupNumber copy];
	copy.GroupType = self.GroupType;
	copy.Id = [self.Id copy];
	copy.IsPart = self.IsPart;
	copy.MemberIds = [self.MemberIds copy];
	copy.Members = [self.Members copy];
	copy.NotAllowJoinFree = self.NotAllowJoinFree;
	copy.NotAllowMemberInvite = self.NotAllowMemberInvite;
	copy.NotAllowSay = self.NotAllowSay;
	copy.Number = self.Number;
	copy.NumberString = [self.NumberString copy];
	copy.Owner = [self.Owner copy];
	copy.OwnerId = [self.OwnerId copy];
	copy.PartType = self.PartType;
	copy.Relation = [self.Relation copy];
	copy.SilenceUserIds = [self.SilenceUserIds copy];
	copy.UpdateBy = [self.UpdateBy copy];
	copy.UpdateOn = [self.UpdateOn copy];
	copy.WildType = self.WildType;
    copy.ParentEnterpriseId = [self.ParentEnterpriseId copy];
	return copy;
}
@end
