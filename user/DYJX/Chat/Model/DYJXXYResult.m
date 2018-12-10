//
//	DYJXXYResult.m
//
//	Create by 岩 熊 on 7/12/2018
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
NSString *const kDYJXXYResultGroupNumber = @"GroupNumber";
NSString *const kDYJXXYResultGroupType = @"GroupType";
NSString *const kDYJXXYResultIdField = @"Id";
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

@interface DYJXXYResult ()
@end
@implementation DYJXXYResult




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYJXXYResultAdminUserIds] isKindOfClass:[NSNull class]]){
		self.adminUserIds = dictionary[kDYJXXYResultAdminUserIds];
	}	
	if(dictionary[kDYJXXYResultAdminUsers] != nil && [dictionary[kDYJXXYResultAdminUsers] isKindOfClass:[NSArray class]]){
		NSArray * adminUsersDictionaries = dictionary[kDYJXXYResultAdminUsers];
		NSMutableArray * adminUsersItems = [NSMutableArray array];
		for(NSDictionary * adminUsersDictionary in adminUsersDictionaries){
			DYJXXYAdminUsers * adminUsersItem = [[DYJXXYAdminUsers alloc] initWithDictionary:adminUsersDictionary];
			[adminUsersItems addObject:adminUsersItem];
		}
		self.adminUsers = adminUsersItems;
	}
	if(![dictionary[kDYJXXYResultAllMemberIds] isKindOfClass:[NSNull class]]){
		self.allMemberIds = dictionary[kDYJXXYResultAllMemberIds];
	}	
	if(![dictionary[kDYJXXYResultCanNotSearch] isKindOfClass:[NSNull class]]){
		self.canNotSearch = [dictionary[kDYJXXYResultCanNotSearch] boolValue];
	}

	if(![dictionary[kDYJXXYResultChildren] isKindOfClass:[NSNull class]]){
		self.children = dictionary[kDYJXXYResultChildren];
	}	
	if(![dictionary[kDYJXXYResultCreateBy] isKindOfClass:[NSNull class]]){
		self.createBy = dictionary[kDYJXXYResultCreateBy];
	}	
	if(![dictionary[kDYJXXYResultCreateOn] isKindOfClass:[NSNull class]]){
		self.createOn = dictionary[kDYJXXYResultCreateOn];
	}	
	if(![dictionary[kDYJXXYResultCreator] isKindOfClass:[NSNull class]]){
		self.creator = [[DYJXXYCreator alloc] initWithDictionary:dictionary[kDYJXXYResultCreator]];
	}

	if(![dictionary[kDYJXXYResultCreatorId] isKindOfClass:[NSNull class]]){
		self.creatorId = dictionary[kDYJXXYResultCreatorId];
	}	
	if(![dictionary[kDYJXXYResultDeleted] isKindOfClass:[NSNull class]]){
		self.deleted = [dictionary[kDYJXXYResultDeleted] boolValue];
	}

	if(![dictionary[kDYJXXYResultDisabled] isKindOfClass:[NSNull class]]){
		self.disabled = [dictionary[kDYJXXYResultDisabled] boolValue];
	}

	if(![dictionary[kDYJXXYResultEnterpriseInfo] isKindOfClass:[NSNull class]]){
		self.enterpriseInfo = [[DYJXXYEnterpriseInfo alloc] initWithDictionary:dictionary[kDYJXXYResultEnterpriseInfo]];
	}

	if(![dictionary[kDYJXXYResultGroupHeadImg] isKindOfClass:[NSNull class]]){
		self.groupHeadImg = dictionary[kDYJXXYResultGroupHeadImg];
	}	
	if(![dictionary[kDYJXXYResultGroupName] isKindOfClass:[NSNull class]]){
		self.groupName = dictionary[kDYJXXYResultGroupName];
	}	
	if(![dictionary[kDYJXXYResultGroupNumber] isKindOfClass:[NSNull class]]){
		self.groupNumber = dictionary[kDYJXXYResultGroupNumber];
	}	
	if(![dictionary[kDYJXXYResultGroupType] isKindOfClass:[NSNull class]]){
		self.groupType = [dictionary[kDYJXXYResultGroupType] integerValue];
	}

	if(![dictionary[kDYJXXYResultIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kDYJXXYResultIdField];
	}	
	if(![dictionary[kDYJXXYResultIsPart] isKindOfClass:[NSNull class]]){
		self.isPart = [dictionary[kDYJXXYResultIsPart] boolValue];
	}

	if(![dictionary[kDYJXXYResultMemberIds] isKindOfClass:[NSNull class]]){
		self.memberIds = dictionary[kDYJXXYResultMemberIds];
	}	
	if(dictionary[kDYJXXYResultMembers] != nil && [dictionary[kDYJXXYResultMembers] isKindOfClass:[NSArray class]]){
		NSArray * membersDictionaries = dictionary[kDYJXXYResultMembers];
		NSMutableArray * membersItems = [NSMutableArray array];
		for(NSDictionary * membersDictionary in membersDictionaries){
			DYJXXYAdminUsers * membersItem = [[DYJXXYAdminUsers alloc] initWithDictionary:membersDictionary];
			[membersItems addObject:membersItem];
		}
		self.members = membersItems;
	}
	if(![dictionary[kDYJXXYResultNotAllowJoinFree] isKindOfClass:[NSNull class]]){
		self.notAllowJoinFree = [dictionary[kDYJXXYResultNotAllowJoinFree] boolValue];
	}

	if(![dictionary[kDYJXXYResultNotAllowMemberInvite] isKindOfClass:[NSNull class]]){
		self.notAllowMemberInvite = [dictionary[kDYJXXYResultNotAllowMemberInvite] boolValue];
	}

	if(![dictionary[kDYJXXYResultNotAllowSay] isKindOfClass:[NSNull class]]){
		self.notAllowSay = [dictionary[kDYJXXYResultNotAllowSay] boolValue];
	}

	if(![dictionary[kDYJXXYResultNumber] isKindOfClass:[NSNull class]]){
		self.number = [dictionary[kDYJXXYResultNumber] integerValue];
	}

	if(![dictionary[kDYJXXYResultNumberString] isKindOfClass:[NSNull class]]){
		self.numberString = dictionary[kDYJXXYResultNumberString];
	}	
	if(![dictionary[kDYJXXYResultOwner] isKindOfClass:[NSNull class]]){
		self.owner = [[DYJXXYCreator alloc] initWithDictionary:dictionary[kDYJXXYResultOwner]];
	}

	if(![dictionary[kDYJXXYResultOwnerId] isKindOfClass:[NSNull class]]){
		self.ownerId = dictionary[kDYJXXYResultOwnerId];
	}	
	if(![dictionary[kDYJXXYResultPartType] isKindOfClass:[NSNull class]]){
		self.partType = [dictionary[kDYJXXYResultPartType] integerValue];
	}

	if(![dictionary[kDYJXXYResultRelation] isKindOfClass:[NSNull class]]){
		self.relation = [[DYJXXYRelation alloc] initWithDictionary:dictionary[kDYJXXYResultRelation]];
	}

	if(![dictionary[kDYJXXYResultSilenceUserIds] isKindOfClass:[NSNull class]]){
		self.silenceUserIds = dictionary[kDYJXXYResultSilenceUserIds];
	}	
	if(![dictionary[kDYJXXYResultUpdateBy] isKindOfClass:[NSNull class]]){
		self.updateBy = dictionary[kDYJXXYResultUpdateBy];
	}	
	if(![dictionary[kDYJXXYResultUpdateOn] isKindOfClass:[NSNull class]]){
		self.updateOn = dictionary[kDYJXXYResultUpdateOn];
	}	
	if(![dictionary[kDYJXXYResultWildType] isKindOfClass:[NSNull class]]){
		self.wildType = [dictionary[kDYJXXYResultWildType] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.adminUserIds != nil){
		dictionary[kDYJXXYResultAdminUserIds] = self.adminUserIds;
	}
	if(self.adminUsers != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(DYJXXYAdminUsers * adminUsersElement in self.adminUsers){
			[dictionaryElements addObject:[adminUsersElement toDictionary]];
		}
		dictionary[kDYJXXYResultAdminUsers] = dictionaryElements;
	}
	if(self.allMemberIds != nil){
		dictionary[kDYJXXYResultAllMemberIds] = self.allMemberIds;
	}
	dictionary[kDYJXXYResultCanNotSearch] = @(self.canNotSearch);
	if(self.children != nil){
		dictionary[kDYJXXYResultChildren] = self.children;
	}
	if(self.createBy != nil){
		dictionary[kDYJXXYResultCreateBy] = self.createBy;
	}
	if(self.createOn != nil){
		dictionary[kDYJXXYResultCreateOn] = self.createOn;
	}
	if(self.creator != nil){
		dictionary[kDYJXXYResultCreator] = [self.creator toDictionary];
	}
	if(self.creatorId != nil){
		dictionary[kDYJXXYResultCreatorId] = self.creatorId;
	}
	dictionary[kDYJXXYResultDeleted] = @(self.deleted);
	dictionary[kDYJXXYResultDisabled] = @(self.disabled);
	if(self.enterpriseInfo != nil){
		dictionary[kDYJXXYResultEnterpriseInfo] = [self.enterpriseInfo toDictionary];
	}
	if(self.groupHeadImg != nil){
		dictionary[kDYJXXYResultGroupHeadImg] = self.groupHeadImg;
	}
	if(self.groupName != nil){
		dictionary[kDYJXXYResultGroupName] = self.groupName;
	}
	if(self.groupNumber != nil){
		dictionary[kDYJXXYResultGroupNumber] = self.groupNumber;
	}
	dictionary[kDYJXXYResultGroupType] = @(self.groupType);
	if(self.idField != nil){
		dictionary[kDYJXXYResultIdField] = self.idField;
	}
	dictionary[kDYJXXYResultIsPart] = @(self.isPart);
	if(self.memberIds != nil){
		dictionary[kDYJXXYResultMemberIds] = self.memberIds;
	}
	if(self.members != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(DYJXXYAdminUsers * membersElement in self.members){
			[dictionaryElements addObject:[membersElement toDictionary]];
		}
		dictionary[kDYJXXYResultMembers] = dictionaryElements;
	}
	dictionary[kDYJXXYResultNotAllowJoinFree] = @(self.notAllowJoinFree);
	dictionary[kDYJXXYResultNotAllowMemberInvite] = @(self.notAllowMemberInvite);
	dictionary[kDYJXXYResultNotAllowSay] = @(self.notAllowSay);
	dictionary[kDYJXXYResultNumber] = @(self.number);
	if(self.numberString != nil){
		dictionary[kDYJXXYResultNumberString] = self.numberString;
	}
	if(self.owner != nil){
		dictionary[kDYJXXYResultOwner] = [self.owner toDictionary];
	}
	if(self.ownerId != nil){
		dictionary[kDYJXXYResultOwnerId] = self.ownerId;
	}
	dictionary[kDYJXXYResultPartType] = @(self.partType);
	if(self.relation != nil){
		dictionary[kDYJXXYResultRelation] = [self.relation toDictionary];
	}
	if(self.silenceUserIds != nil){
		dictionary[kDYJXXYResultSilenceUserIds] = self.silenceUserIds;
	}
	if(self.updateBy != nil){
		dictionary[kDYJXXYResultUpdateBy] = self.updateBy;
	}
	if(self.updateOn != nil){
		dictionary[kDYJXXYResultUpdateOn] = self.updateOn;
	}
	dictionary[kDYJXXYResultWildType] = @(self.wildType);
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
	if(self.adminUserIds != nil){
		[aCoder encodeObject:self.adminUserIds forKey:kDYJXXYResultAdminUserIds];
	}
	if(self.adminUsers != nil){
		[aCoder encodeObject:self.adminUsers forKey:kDYJXXYResultAdminUsers];
	}
	if(self.allMemberIds != nil){
		[aCoder encodeObject:self.allMemberIds forKey:kDYJXXYResultAllMemberIds];
	}
	[aCoder encodeObject:@(self.canNotSearch) forKey:kDYJXXYResultCanNotSearch];	if(self.children != nil){
		[aCoder encodeObject:self.children forKey:kDYJXXYResultChildren];
	}
	if(self.createBy != nil){
		[aCoder encodeObject:self.createBy forKey:kDYJXXYResultCreateBy];
	}
	if(self.createOn != nil){
		[aCoder encodeObject:self.createOn forKey:kDYJXXYResultCreateOn];
	}
	if(self.creator != nil){
		[aCoder encodeObject:self.creator forKey:kDYJXXYResultCreator];
	}
	if(self.creatorId != nil){
		[aCoder encodeObject:self.creatorId forKey:kDYJXXYResultCreatorId];
	}
	[aCoder encodeObject:@(self.deleted) forKey:kDYJXXYResultDeleted];	[aCoder encodeObject:@(self.disabled) forKey:kDYJXXYResultDisabled];	if(self.enterpriseInfo != nil){
		[aCoder encodeObject:self.enterpriseInfo forKey:kDYJXXYResultEnterpriseInfo];
	}
	if(self.groupHeadImg != nil){
		[aCoder encodeObject:self.groupHeadImg forKey:kDYJXXYResultGroupHeadImg];
	}
	if(self.groupName != nil){
		[aCoder encodeObject:self.groupName forKey:kDYJXXYResultGroupName];
	}
	if(self.groupNumber != nil){
		[aCoder encodeObject:self.groupNumber forKey:kDYJXXYResultGroupNumber];
	}
	[aCoder encodeObject:@(self.groupType) forKey:kDYJXXYResultGroupType];	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kDYJXXYResultIdField];
	}
	[aCoder encodeObject:@(self.isPart) forKey:kDYJXXYResultIsPart];	if(self.memberIds != nil){
		[aCoder encodeObject:self.memberIds forKey:kDYJXXYResultMemberIds];
	}
	if(self.members != nil){
		[aCoder encodeObject:self.members forKey:kDYJXXYResultMembers];
	}
	[aCoder encodeObject:@(self.notAllowJoinFree) forKey:kDYJXXYResultNotAllowJoinFree];	[aCoder encodeObject:@(self.notAllowMemberInvite) forKey:kDYJXXYResultNotAllowMemberInvite];	[aCoder encodeObject:@(self.notAllowSay) forKey:kDYJXXYResultNotAllowSay];	[aCoder encodeObject:@(self.number) forKey:kDYJXXYResultNumber];	if(self.numberString != nil){
		[aCoder encodeObject:self.numberString forKey:kDYJXXYResultNumberString];
	}
	if(self.owner != nil){
		[aCoder encodeObject:self.owner forKey:kDYJXXYResultOwner];
	}
	if(self.ownerId != nil){
		[aCoder encodeObject:self.ownerId forKey:kDYJXXYResultOwnerId];
	}
	[aCoder encodeObject:@(self.partType) forKey:kDYJXXYResultPartType];	if(self.relation != nil){
		[aCoder encodeObject:self.relation forKey:kDYJXXYResultRelation];
	}
	if(self.silenceUserIds != nil){
		[aCoder encodeObject:self.silenceUserIds forKey:kDYJXXYResultSilenceUserIds];
	}
	if(self.updateBy != nil){
		[aCoder encodeObject:self.updateBy forKey:kDYJXXYResultUpdateBy];
	}
	if(self.updateOn != nil){
		[aCoder encodeObject:self.updateOn forKey:kDYJXXYResultUpdateOn];
	}
	[aCoder encodeObject:@(self.wildType) forKey:kDYJXXYResultWildType];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.adminUserIds = [aDecoder decodeObjectForKey:kDYJXXYResultAdminUserIds];
	self.adminUsers = [aDecoder decodeObjectForKey:kDYJXXYResultAdminUsers];
	self.allMemberIds = [aDecoder decodeObjectForKey:kDYJXXYResultAllMemberIds];
	self.canNotSearch = [[aDecoder decodeObjectForKey:kDYJXXYResultCanNotSearch] boolValue];
	self.children = [aDecoder decodeObjectForKey:kDYJXXYResultChildren];
	self.createBy = [aDecoder decodeObjectForKey:kDYJXXYResultCreateBy];
	self.createOn = [aDecoder decodeObjectForKey:kDYJXXYResultCreateOn];
	self.creator = [aDecoder decodeObjectForKey:kDYJXXYResultCreator];
	self.creatorId = [aDecoder decodeObjectForKey:kDYJXXYResultCreatorId];
	self.deleted = [[aDecoder decodeObjectForKey:kDYJXXYResultDeleted] boolValue];
	self.disabled = [[aDecoder decodeObjectForKey:kDYJXXYResultDisabled] boolValue];
	self.enterpriseInfo = [aDecoder decodeObjectForKey:kDYJXXYResultEnterpriseInfo];
	self.groupHeadImg = [aDecoder decodeObjectForKey:kDYJXXYResultGroupHeadImg];
	self.groupName = [aDecoder decodeObjectForKey:kDYJXXYResultGroupName];
	self.groupNumber = [aDecoder decodeObjectForKey:kDYJXXYResultGroupNumber];
	self.groupType = [[aDecoder decodeObjectForKey:kDYJXXYResultGroupType] integerValue];
	self.idField = [aDecoder decodeObjectForKey:kDYJXXYResultIdField];
	self.isPart = [[aDecoder decodeObjectForKey:kDYJXXYResultIsPart] boolValue];
	self.memberIds = [aDecoder decodeObjectForKey:kDYJXXYResultMemberIds];
	self.members = [aDecoder decodeObjectForKey:kDYJXXYResultMembers];
	self.notAllowJoinFree = [[aDecoder decodeObjectForKey:kDYJXXYResultNotAllowJoinFree] boolValue];
	self.notAllowMemberInvite = [[aDecoder decodeObjectForKey:kDYJXXYResultNotAllowMemberInvite] boolValue];
	self.notAllowSay = [[aDecoder decodeObjectForKey:kDYJXXYResultNotAllowSay] boolValue];
	self.number = [[aDecoder decodeObjectForKey:kDYJXXYResultNumber] integerValue];
	self.numberString = [aDecoder decodeObjectForKey:kDYJXXYResultNumberString];
	self.owner = [aDecoder decodeObjectForKey:kDYJXXYResultOwner];
	self.ownerId = [aDecoder decodeObjectForKey:kDYJXXYResultOwnerId];
	self.partType = [[aDecoder decodeObjectForKey:kDYJXXYResultPartType] integerValue];
	self.relation = [aDecoder decodeObjectForKey:kDYJXXYResultRelation];
	self.silenceUserIds = [aDecoder decodeObjectForKey:kDYJXXYResultSilenceUserIds];
	self.updateBy = [aDecoder decodeObjectForKey:kDYJXXYResultUpdateBy];
	self.updateOn = [aDecoder decodeObjectForKey:kDYJXXYResultUpdateOn];
	self.wildType = [[aDecoder decodeObjectForKey:kDYJXXYResultWildType] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXXYResult *copy = [DYJXXYResult new];

	copy.adminUserIds = [self.adminUserIds copy];
	copy.adminUsers = [self.adminUsers copy];
	copy.allMemberIds = [self.allMemberIds copy];
	copy.canNotSearch = self.canNotSearch;
	copy.children = [self.children copy];
	copy.createBy = [self.createBy copy];
	copy.createOn = [self.createOn copy];
	copy.creator = [self.creator copy];
	copy.creatorId = [self.creatorId copy];
	copy.deleted = self.deleted;
	copy.disabled = self.disabled;
	copy.enterpriseInfo = [self.enterpriseInfo copy];
	copy.groupHeadImg = [self.groupHeadImg copy];
	copy.groupName = [self.groupName copy];
	copy.groupNumber = [self.groupNumber copy];
	copy.groupType = self.groupType;
	copy.idField = [self.idField copy];
	copy.isPart = self.isPart;
	copy.memberIds = [self.memberIds copy];
	copy.members = [self.members copy];
	copy.notAllowJoinFree = self.notAllowJoinFree;
	copy.notAllowMemberInvite = self.notAllowMemberInvite;
	copy.notAllowSay = self.notAllowSay;
	copy.number = self.number;
	copy.numberString = [self.numberString copy];
	copy.owner = [self.owner copy];
	copy.ownerId = [self.ownerId copy];
	copy.partType = self.partType;
	copy.relation = [self.relation copy];
	copy.silenceUserIds = [self.silenceUserIds copy];
	copy.updateBy = [self.updateBy copy];
	copy.updateOn = [self.updateOn copy];
	copy.wildType = self.wildType;

	return copy;
}
@end