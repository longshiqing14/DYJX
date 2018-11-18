//
//	DJJXResult.m
//
//	Create by longshiqing on 17/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJXResult.h"

NSString *const kDJJXResultAdminUserIds = @"AdminUserIds";
NSString *const kDJJXResultAdminUsers = @"AdminUsers";
NSString *const kDJJXResultAllMemberIds = @"AllMemberIds";
NSString *const kDJJXResultCanNotSearch = @"CanNotSearch";
NSString *const kDJJXResultChildren = @"Children";
NSString *const kDJJXResultCreateBy = @"CreateBy";
NSString *const kDJJXResultCreateOn = @"CreateOn";
NSString *const kDJJXResultCreator = @"Creator";
NSString *const kDJJXResultCreatorId = @"CreatorId";
NSString *const kDJJXResultDeleted = @"Deleted";
NSString *const kDJJXResultDisabled = @"Disabled";
NSString *const kDJJXResultEnterpriseInfo = @"EnterpriseInfo";
NSString *const kDJJXResultGroupHeadImg = @"GroupHeadImg";
NSString *const kDJJXResultGroupName = @"GroupName";
NSString *const kDJJXResultGroupNumber = @"GroupNumber";
NSString *const kDJJXResultGroupType = @"GroupType";
NSString *const kDJJXResultIdField = @"Id";
NSString *const kDJJXResultIsPart = @"IsPart";
NSString *const kDJJXResultMemberIds = @"MemberIds";
NSString *const kDJJXResultMembers = @"Members";
NSString *const kDJJXResultNotAllowJoinFree = @"NotAllowJoinFree";
NSString *const kDJJXResultNotAllowMemberInvite = @"NotAllowMemberInvite";
NSString *const kDJJXResultNotAllowSay = @"NotAllowSay";
NSString *const kDJJXResultNumber = @"Number";
NSString *const kDJJXResultNumberString = @"NumberString";
NSString *const kDJJXResultOwner = @"Owner";
NSString *const kDJJXResultOwnerId = @"OwnerId";
NSString *const kDJJXResultPartType = @"PartType";
NSString *const kDJJXResultSilenceUserIds = @"SilenceUserIds";
NSString *const kDJJXResultUpdateBy = @"UpdateBy";
NSString *const kDJJXResultUpdateOn = @"UpdateOn";
NSString *const kDJJXResultWildType = @"WildType";

@interface DJJXResult ()
@end
@implementation DJJXResult




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJXResultAdminUserIds] isKindOfClass:[NSNull class]]){
		self.AdminUserIds = dictionary[kDJJXResultAdminUserIds];
	}	
	if(dictionary[kDJJXResultAdminUsers] != nil && [dictionary[kDJJXResultAdminUsers] isKindOfClass:[NSArray class]]){
		NSArray * AdminUsersDictionaries = dictionary[kDJJXResultAdminUsers];
		NSMutableArray * AdminUsersItems = [NSMutableArray array];
		for(NSDictionary * AdminUsersDictionary in AdminUsersDictionaries){
			DJJXAdminUsers * AdminUsersItem = [[DJJXAdminUsers alloc] initWithDictionary:AdminUsersDictionary];
			[AdminUsersItems addObject:AdminUsersItem];
		}
		self.AdminUsers = AdminUsersItems;
	}
	if(![dictionary[kDJJXResultAllMemberIds] isKindOfClass:[NSNull class]]){
		self.AllMemberIds = dictionary[kDJJXResultAllMemberIds];
	}	
	if(![dictionary[kDJJXResultCanNotSearch] isKindOfClass:[NSNull class]]){
		self.CanNotSearch = [dictionary[kDJJXResultCanNotSearch] boolValue];
	}

	if(![dictionary[kDJJXResultChildren] isKindOfClass:[NSNull class]]){
		self.Children = dictionary[kDJJXResultChildren];
	}	
	if(![dictionary[kDJJXResultCreateBy] isKindOfClass:[NSNull class]]){
		self.CreateBy = dictionary[kDJJXResultCreateBy];
	}	
	if(![dictionary[kDJJXResultCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDJJXResultCreateOn];
	}	
	if(![dictionary[kDJJXResultCreator] isKindOfClass:[NSNull class]]){
		self.Creator = [[DJJXCreator alloc] initWithDictionary:dictionary[kDJJXResultCreator]];
	}

	if(![dictionary[kDJJXResultCreatorId] isKindOfClass:[NSNull class]]){
		self.CreatorId = dictionary[kDJJXResultCreatorId];
	}	
	if(![dictionary[kDJJXResultDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDJJXResultDeleted] boolValue];
	}

	if(![dictionary[kDJJXResultDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDJJXResultDisabled] boolValue];
	}

	if(![dictionary[kDJJXResultEnterpriseInfo] isKindOfClass:[NSNull class]]){
		self.EnterpriseInfo = [[DJJXEnterpriseInfo alloc] initWithDictionary:dictionary[kDJJXResultEnterpriseInfo]];
	}

	if(![dictionary[kDJJXResultGroupHeadImg] isKindOfClass:[NSNull class]]){
		self.GroupHeadImg = dictionary[kDJJXResultGroupHeadImg];
	}	
	if(![dictionary[kDJJXResultGroupName] isKindOfClass:[NSNull class]]){
		self.GroupName = dictionary[kDJJXResultGroupName];
	}	
	if(![dictionary[kDJJXResultGroupNumber] isKindOfClass:[NSNull class]]){
		self.GroupNumber = dictionary[kDJJXResultGroupNumber];
	}	
	if(![dictionary[kDJJXResultGroupType] isKindOfClass:[NSNull class]]){
		self.GroupType = [dictionary[kDJJXResultGroupType] integerValue];
	}

	if(![dictionary[kDJJXResultIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kDJJXResultIdField];
	}	
	if(![dictionary[kDJJXResultIsPart] isKindOfClass:[NSNull class]]){
		self.IsPart = [dictionary[kDJJXResultIsPart] boolValue];
	}

	if(![dictionary[kDJJXResultMemberIds] isKindOfClass:[NSNull class]]){
		self.MemberIds = dictionary[kDJJXResultMemberIds];
	}	
	if(dictionary[kDJJXResultMembers] != nil && [dictionary[kDJJXResultMembers] isKindOfClass:[NSArray class]]){
		NSArray * MembersDictionaries = dictionary[kDJJXResultMembers];
		NSMutableArray * MembersItems = [NSMutableArray array];
		for(NSDictionary * MembersDictionary in MembersDictionaries){
			DJJXMembers * MembersItem = [[DJJXMembers alloc] initWithDictionary:MembersDictionary];
			[MembersItems addObject:MembersItem];
		}
		self.Members = MembersItems;
	}
	if(![dictionary[kDJJXResultNotAllowJoinFree] isKindOfClass:[NSNull class]]){
		self.NotAllowJoinFree = [dictionary[kDJJXResultNotAllowJoinFree] boolValue];
	}

	if(![dictionary[kDJJXResultNotAllowMemberInvite] isKindOfClass:[NSNull class]]){
		self.NotAllowMemberInvite = [dictionary[kDJJXResultNotAllowMemberInvite] boolValue];
	}

	if(![dictionary[kDJJXResultNotAllowSay] isKindOfClass:[NSNull class]]){
		self.NotAllowSay = [dictionary[kDJJXResultNotAllowSay] boolValue];
	}

	if(![dictionary[kDJJXResultNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kDJJXResultNumber] integerValue];
	}

	if(![dictionary[kDJJXResultNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kDJJXResultNumberString];
	}	
	if(![dictionary[kDJJXResultOwner] isKindOfClass:[NSNull class]]){
		self.Owner = [[DJJXCreator alloc] initWithDictionary:dictionary[kDJJXResultOwner]];
	}

	if(![dictionary[kDJJXResultOwnerId] isKindOfClass:[NSNull class]]){
		self.OwnerId = dictionary[kDJJXResultOwnerId];
	}	
	if(![dictionary[kDJJXResultPartType] isKindOfClass:[NSNull class]]){
		self.PartType = [dictionary[kDJJXResultPartType] integerValue];
	}

	if(![dictionary[kDJJXResultSilenceUserIds] isKindOfClass:[NSNull class]]){
		self.SilenceUserIds = dictionary[kDJJXResultSilenceUserIds];
	}	
	if(![dictionary[kDJJXResultUpdateBy] isKindOfClass:[NSNull class]]){
		self.UpdateBy = dictionary[kDJJXResultUpdateBy];
	}	
	if(![dictionary[kDJJXResultUpdateOn] isKindOfClass:[NSNull class]]){
		self.UpdateOn = dictionary[kDJJXResultUpdateOn];
	}	
	if(![dictionary[kDJJXResultWildType] isKindOfClass:[NSNull class]]){
		self.WildType = [dictionary[kDJJXResultWildType] integerValue];
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
		dictionary[kDJJXResultAdminUserIds] = self.AdminUserIds;
	}
	if(self.AdminUsers != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(DJJXAdminUsers * AdminUsersElement in self.AdminUsers){
			[dictionaryElements addObject:[AdminUsersElement toDictionary]];
		}
		dictionary[kDJJXResultAdminUsers] = dictionaryElements;
	}
	if(self.AllMemberIds != nil){
		dictionary[kDJJXResultAllMemberIds] = self.AllMemberIds;
	}
	dictionary[kDJJXResultCanNotSearch] = @(self.CanNotSearch);
	if(self.Children != nil){
		dictionary[kDJJXResultChildren] = self.Children;
	}
	if(self.CreateBy != nil){
		dictionary[kDJJXResultCreateBy] = self.CreateBy;
	}
	if(self.CreateOn != nil){
		dictionary[kDJJXResultCreateOn] = self.CreateOn;
	}
	if(self.Creator != nil){
		dictionary[kDJJXResultCreator] = [self.Creator toDictionary];
	}
	if(self.CreatorId != nil){
		dictionary[kDJJXResultCreatorId] = self.CreatorId;
	}
	dictionary[kDJJXResultDeleted] = @(self.Deleted);
	dictionary[kDJJXResultDisabled] = @(self.Disabled);
	if(self.EnterpriseInfo != nil){
		dictionary[kDJJXResultEnterpriseInfo] = [self.EnterpriseInfo toDictionary];
	}
	if(self.GroupHeadImg != nil){
		dictionary[kDJJXResultGroupHeadImg] = self.GroupHeadImg;
	}
	if(self.GroupName != nil){
		dictionary[kDJJXResultGroupName] = self.GroupName;
	}
	if(self.GroupNumber != nil){
		dictionary[kDJJXResultGroupNumber] = self.GroupNumber;
	}
	dictionary[kDJJXResultGroupType] = @(self.GroupType);
	if(self.IdField != nil){
		dictionary[kDJJXResultIdField] = self.IdField;
	}
	dictionary[kDJJXResultIsPart] = @(self.IsPart);
	if(self.MemberIds != nil){
		dictionary[kDJJXResultMemberIds] = self.MemberIds;
	}
	if(self.Members != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(DJJXMembers * MembersElement in self.Members){
			[dictionaryElements addObject:[MembersElement toDictionary]];
		}
		dictionary[kDJJXResultMembers] = dictionaryElements;
	}
	dictionary[kDJJXResultNotAllowJoinFree] = @(self.NotAllowJoinFree);
	dictionary[kDJJXResultNotAllowMemberInvite] = @(self.NotAllowMemberInvite);
	dictionary[kDJJXResultNotAllowSay] = @(self.NotAllowSay);
	dictionary[kDJJXResultNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kDJJXResultNumberString] = self.NumberString;
	}
	if(self.Owner != nil){
		dictionary[kDJJXResultOwner] = [self.Owner toDictionary];
	}
	if(self.OwnerId != nil){
		dictionary[kDJJXResultOwnerId] = self.OwnerId;
	}
	dictionary[kDJJXResultPartType] = @(self.PartType);
	if(self.SilenceUserIds != nil){
		dictionary[kDJJXResultSilenceUserIds] = self.SilenceUserIds;
	}
	if(self.UpdateBy != nil){
		dictionary[kDJJXResultUpdateBy] = self.UpdateBy;
	}
	if(self.UpdateOn != nil){
		dictionary[kDJJXResultUpdateOn] = self.UpdateOn;
	}
	dictionary[kDJJXResultWildType] = @(self.WildType);
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
		[aCoder encodeObject:self.AdminUserIds forKey:kDJJXResultAdminUserIds];
	}
	if(self.AdminUsers != nil){
		[aCoder encodeObject:self.AdminUsers forKey:kDJJXResultAdminUsers];
	}
	if(self.AllMemberIds != nil){
		[aCoder encodeObject:self.AllMemberIds forKey:kDJJXResultAllMemberIds];
	}
	[aCoder encodeObject:@(self.CanNotSearch) forKey:kDJJXResultCanNotSearch];	if(self.Children != nil){
		[aCoder encodeObject:self.Children forKey:kDJJXResultChildren];
	}
	if(self.CreateBy != nil){
		[aCoder encodeObject:self.CreateBy forKey:kDJJXResultCreateBy];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDJJXResultCreateOn];
	}
	if(self.Creator != nil){
		[aCoder encodeObject:self.Creator forKey:kDJJXResultCreator];
	}
	if(self.CreatorId != nil){
		[aCoder encodeObject:self.CreatorId forKey:kDJJXResultCreatorId];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDJJXResultDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDJJXResultDisabled];	if(self.EnterpriseInfo != nil){
		[aCoder encodeObject:self.EnterpriseInfo forKey:kDJJXResultEnterpriseInfo];
	}
	if(self.GroupHeadImg != nil){
		[aCoder encodeObject:self.GroupHeadImg forKey:kDJJXResultGroupHeadImg];
	}
	if(self.GroupName != nil){
		[aCoder encodeObject:self.GroupName forKey:kDJJXResultGroupName];
	}
	if(self.GroupNumber != nil){
		[aCoder encodeObject:self.GroupNumber forKey:kDJJXResultGroupNumber];
	}
	[aCoder encodeObject:@(self.GroupType) forKey:kDJJXResultGroupType];	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kDJJXResultIdField];
	}
	[aCoder encodeObject:@(self.IsPart) forKey:kDJJXResultIsPart];	if(self.MemberIds != nil){
		[aCoder encodeObject:self.MemberIds forKey:kDJJXResultMemberIds];
	}
	if(self.Members != nil){
		[aCoder encodeObject:self.Members forKey:kDJJXResultMembers];
	}
	[aCoder encodeObject:@(self.NotAllowJoinFree) forKey:kDJJXResultNotAllowJoinFree];	[aCoder encodeObject:@(self.NotAllowMemberInvite) forKey:kDJJXResultNotAllowMemberInvite];	[aCoder encodeObject:@(self.NotAllowSay) forKey:kDJJXResultNotAllowSay];	[aCoder encodeObject:@(self.Number) forKey:kDJJXResultNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kDJJXResultNumberString];
	}
	if(self.Owner != nil){
		[aCoder encodeObject:self.Owner forKey:kDJJXResultOwner];
	}
	if(self.OwnerId != nil){
		[aCoder encodeObject:self.OwnerId forKey:kDJJXResultOwnerId];
	}
	[aCoder encodeObject:@(self.PartType) forKey:kDJJXResultPartType];	if(self.SilenceUserIds != nil){
		[aCoder encodeObject:self.SilenceUserIds forKey:kDJJXResultSilenceUserIds];
	}
	if(self.UpdateBy != nil){
		[aCoder encodeObject:self.UpdateBy forKey:kDJJXResultUpdateBy];
	}
	if(self.UpdateOn != nil){
		[aCoder encodeObject:self.UpdateOn forKey:kDJJXResultUpdateOn];
	}
	[aCoder encodeObject:@(self.WildType) forKey:kDJJXResultWildType];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.AdminUserIds = [aDecoder decodeObjectForKey:kDJJXResultAdminUserIds];
	self.AdminUsers = [aDecoder decodeObjectForKey:kDJJXResultAdminUsers];
	self.AllMemberIds = [aDecoder decodeObjectForKey:kDJJXResultAllMemberIds];
	self.CanNotSearch = [[aDecoder decodeObjectForKey:kDJJXResultCanNotSearch] boolValue];
	self.Children = [aDecoder decodeObjectForKey:kDJJXResultChildren];
	self.CreateBy = [aDecoder decodeObjectForKey:kDJJXResultCreateBy];
	self.CreateOn = [aDecoder decodeObjectForKey:kDJJXResultCreateOn];
	self.Creator = [aDecoder decodeObjectForKey:kDJJXResultCreator];
	self.CreatorId = [aDecoder decodeObjectForKey:kDJJXResultCreatorId];
	self.Deleted = [[aDecoder decodeObjectForKey:kDJJXResultDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDJJXResultDisabled] boolValue];
	self.EnterpriseInfo = [aDecoder decodeObjectForKey:kDJJXResultEnterpriseInfo];
	self.GroupHeadImg = [aDecoder decodeObjectForKey:kDJJXResultGroupHeadImg];
	self.GroupName = [aDecoder decodeObjectForKey:kDJJXResultGroupName];
	self.GroupNumber = [aDecoder decodeObjectForKey:kDJJXResultGroupNumber];
	self.GroupType = [[aDecoder decodeObjectForKey:kDJJXResultGroupType] integerValue];
	self.IdField = [aDecoder decodeObjectForKey:kDJJXResultIdField];
	self.IsPart = [[aDecoder decodeObjectForKey:kDJJXResultIsPart] boolValue];
	self.MemberIds = [aDecoder decodeObjectForKey:kDJJXResultMemberIds];
	self.Members = [aDecoder decodeObjectForKey:kDJJXResultMembers];
	self.NotAllowJoinFree = [[aDecoder decodeObjectForKey:kDJJXResultNotAllowJoinFree] boolValue];
	self.NotAllowMemberInvite = [[aDecoder decodeObjectForKey:kDJJXResultNotAllowMemberInvite] boolValue];
	self.NotAllowSay = [[aDecoder decodeObjectForKey:kDJJXResultNotAllowSay] boolValue];
	self.Number = [[aDecoder decodeObjectForKey:kDJJXResultNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kDJJXResultNumberString];
	self.Owner = [aDecoder decodeObjectForKey:kDJJXResultOwner];
	self.OwnerId = [aDecoder decodeObjectForKey:kDJJXResultOwnerId];
	self.PartType = [[aDecoder decodeObjectForKey:kDJJXResultPartType] integerValue];
	self.SilenceUserIds = [aDecoder decodeObjectForKey:kDJJXResultSilenceUserIds];
	self.UpdateBy = [aDecoder decodeObjectForKey:kDJJXResultUpdateBy];
	self.UpdateOn = [aDecoder decodeObjectForKey:kDJJXResultUpdateOn];
	self.WildType = [[aDecoder decodeObjectForKey:kDJJXResultWildType] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJXResult *copy = [DJJXResult new];

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
	copy.GroupNumber = [self.GroupNumber copy];
	copy.GroupType = self.GroupType;
	copy.IdField = [self.IdField copy];
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
	copy.SilenceUserIds = [self.SilenceUserIds copy];
	copy.UpdateBy = [self.UpdateBy copy];
	copy.UpdateOn = [self.UpdateOn copy];
	copy.WildType = self.WildType;

	return copy;
}
@end