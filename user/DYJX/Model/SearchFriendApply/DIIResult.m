//
//	DIIResult.m
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DIIResult.h"

NSString *const kDIIResultApplyContent = @"ApplyContent";
NSString *const kDIIResultApplyType = @"ApplyType";
NSString *const kDIIResultCreateBy = @"CreateBy";
NSString *const kDIIResultCreateOn = @"CreateOn";
NSString *const kDIIResultDeleted = @"Deleted";
NSString *const kDIIResultDisabled = @"Disabled";
NSString *const kDIIResultFromBelongEnterprise = @"FromBelongEnterprise";
NSString *const kDIIResultGroupID = @"GroupID";
NSString *const kDIIResultId = @"Id";
NSString *const kDIIResultIsAgree = @"IsAgree";
NSString *const kDIIResultIsProcess = @"IsProcess";
NSString *const kDIIResultMemberFrom = @"MemberFrom";
NSString *const kDIIResultMemberIDFrom = @"MemberIDFrom";
NSString *const kDIIResultMemberIDTo = @"MemberIDTo";
NSString *const kDIIResultMemberTo = @"MemberTo";
NSString *const kDIIResultToBelongEnterprise = @"ToBelongEnterprise";
NSString *const kDIIResultUpdateBy = @"UpdateBy";
NSString *const kDIIResultUpdateOn = @"UpdateOn";

@interface DIIResult ()
@end
@implementation DIIResult




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDIIResultApplyContent] isKindOfClass:[NSNull class]]){
		self.ApplyContent = dictionary[kDIIResultApplyContent];
	}	
	if(![dictionary[kDIIResultApplyType] isKindOfClass:[NSNull class]]){
		self.ApplyType = [dictionary[kDIIResultApplyType] integerValue];
	}

	if(![dictionary[kDIIResultCreateBy] isKindOfClass:[NSNull class]]){
		self.CreateBy = dictionary[kDIIResultCreateBy];
	}	
	if(![dictionary[kDIIResultCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDIIResultCreateOn];
	}	
	if(![dictionary[kDIIResultDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDIIResultDeleted] boolValue];
	}

	if(![dictionary[kDIIResultDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDIIResultDisabled] boolValue];
	}

	if(![dictionary[kDIIResultFromBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.FromBelongEnterprise = dictionary[kDIIResultFromBelongEnterprise];
	}	
	if(![dictionary[kDIIResultGroupID] isKindOfClass:[NSNull class]]){
		self.GroupID = dictionary[kDIIResultGroupID];
	}	
	if(![dictionary[kDIIResultId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDIIResultId];
	}	
	if(![dictionary[kDIIResultIsAgree] isKindOfClass:[NSNull class]]){
		self.IsAgree = [dictionary[kDIIResultIsAgree] boolValue];
	}

	if(![dictionary[kDIIResultIsProcess] isKindOfClass:[NSNull class]]){
		self.IsProcess = [dictionary[kDIIResultIsProcess] boolValue];
	}

	if(![dictionary[kDIIResultMemberFrom] isKindOfClass:[NSNull class]]){
		self.MemberFrom = [[DIIMemberFrom alloc] initWithDictionary:dictionary[kDIIResultMemberFrom]];
	}

	if(![dictionary[kDIIResultMemberIDFrom] isKindOfClass:[NSNull class]]){
		self.MemberIDFrom = dictionary[kDIIResultMemberIDFrom];
	}	
	if(![dictionary[kDIIResultMemberIDTo] isKindOfClass:[NSNull class]]){
		self.MemberIDTo = dictionary[kDIIResultMemberIDTo];
	}	
	if(![dictionary[kDIIResultMemberTo] isKindOfClass:[NSNull class]]){
		self.MemberTo = [[DIIMemberTo alloc] initWithDictionary:dictionary[kDIIResultMemberTo]];
	}

	if(![dictionary[kDIIResultToBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.ToBelongEnterprise = dictionary[kDIIResultToBelongEnterprise];
	}	
	if(![dictionary[kDIIResultUpdateBy] isKindOfClass:[NSNull class]]){
		self.UpdateBy = dictionary[kDIIResultUpdateBy];
	}	
	if(![dictionary[kDIIResultUpdateOn] isKindOfClass:[NSNull class]]){
		self.UpdateOn = dictionary[kDIIResultUpdateOn];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.ApplyContent != nil){
		dictionary[kDIIResultApplyContent] = self.ApplyContent;
	}
	dictionary[kDIIResultApplyType] = @(self.ApplyType);
	if(self.CreateBy != nil){
		dictionary[kDIIResultCreateBy] = self.CreateBy;
	}
	if(self.CreateOn != nil){
		dictionary[kDIIResultCreateOn] = self.CreateOn;
	}
	dictionary[kDIIResultDeleted] = @(self.Deleted);
	dictionary[kDIIResultDisabled] = @(self.Disabled);
	if(self.FromBelongEnterprise != nil){
		dictionary[kDIIResultFromBelongEnterprise] = self.FromBelongEnterprise;
	}
	if(self.GroupID != nil){
		dictionary[kDIIResultGroupID] = self.GroupID;
	}
	if(self.Id != nil){
		dictionary[kDIIResultId] = self.Id;
	}
	dictionary[kDIIResultIsAgree] = @(self.IsAgree);
	dictionary[kDIIResultIsProcess] = @(self.IsProcess);
	if(self.MemberFrom != nil){
		dictionary[kDIIResultMemberFrom] = [self.MemberFrom toDictionary];
	}
	if(self.MemberIDFrom != nil){
		dictionary[kDIIResultMemberIDFrom] = self.MemberIDFrom;
	}
	if(self.MemberIDTo != nil){
		dictionary[kDIIResultMemberIDTo] = self.MemberIDTo;
	}
	if(self.MemberTo != nil){
		dictionary[kDIIResultMemberTo] = [self.MemberTo toDictionary];
	}
	if(self.ToBelongEnterprise != nil){
		dictionary[kDIIResultToBelongEnterprise] = self.ToBelongEnterprise;
	}
	if(self.UpdateBy != nil){
		dictionary[kDIIResultUpdateBy] = self.UpdateBy;
	}
	if(self.UpdateOn != nil){
		dictionary[kDIIResultUpdateOn] = self.UpdateOn;
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
	if(self.ApplyContent != nil){
		[aCoder encodeObject:self.ApplyContent forKey:kDIIResultApplyContent];
	}
	[aCoder encodeObject:@(self.ApplyType) forKey:kDIIResultApplyType];	if(self.CreateBy != nil){
		[aCoder encodeObject:self.CreateBy forKey:kDIIResultCreateBy];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDIIResultCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDIIResultDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDIIResultDisabled];	if(self.FromBelongEnterprise != nil){
		[aCoder encodeObject:self.FromBelongEnterprise forKey:kDIIResultFromBelongEnterprise];
	}
	if(self.GroupID != nil){
		[aCoder encodeObject:self.GroupID forKey:kDIIResultGroupID];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDIIResultId];
	}
	[aCoder encodeObject:@(self.IsAgree) forKey:kDIIResultIsAgree];	[aCoder encodeObject:@(self.IsProcess) forKey:kDIIResultIsProcess];	if(self.MemberFrom != nil){
		[aCoder encodeObject:self.MemberFrom forKey:kDIIResultMemberFrom];
	}
	if(self.MemberIDFrom != nil){
		[aCoder encodeObject:self.MemberIDFrom forKey:kDIIResultMemberIDFrom];
	}
	if(self.MemberIDTo != nil){
		[aCoder encodeObject:self.MemberIDTo forKey:kDIIResultMemberIDTo];
	}
	if(self.MemberTo != nil){
		[aCoder encodeObject:self.MemberTo forKey:kDIIResultMemberTo];
	}
	if(self.ToBelongEnterprise != nil){
		[aCoder encodeObject:self.ToBelongEnterprise forKey:kDIIResultToBelongEnterprise];
	}
	if(self.UpdateBy != nil){
		[aCoder encodeObject:self.UpdateBy forKey:kDIIResultUpdateBy];
	}
	if(self.UpdateOn != nil){
		[aCoder encodeObject:self.UpdateOn forKey:kDIIResultUpdateOn];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ApplyContent = [aDecoder decodeObjectForKey:kDIIResultApplyContent];
	self.ApplyType = [[aDecoder decodeObjectForKey:kDIIResultApplyType] integerValue];
	self.CreateBy = [aDecoder decodeObjectForKey:kDIIResultCreateBy];
	self.CreateOn = [aDecoder decodeObjectForKey:kDIIResultCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDIIResultDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDIIResultDisabled] boolValue];
	self.FromBelongEnterprise = [aDecoder decodeObjectForKey:kDIIResultFromBelongEnterprise];
	self.GroupID = [aDecoder decodeObjectForKey:kDIIResultGroupID];
	self.Id = [aDecoder decodeObjectForKey:kDIIResultId];
	self.IsAgree = [[aDecoder decodeObjectForKey:kDIIResultIsAgree] boolValue];
	self.IsProcess = [[aDecoder decodeObjectForKey:kDIIResultIsProcess] boolValue];
	self.MemberFrom = [aDecoder decodeObjectForKey:kDIIResultMemberFrom];
	self.MemberIDFrom = [aDecoder decodeObjectForKey:kDIIResultMemberIDFrom];
	self.MemberIDTo = [aDecoder decodeObjectForKey:kDIIResultMemberIDTo];
	self.MemberTo = [aDecoder decodeObjectForKey:kDIIResultMemberTo];
	self.ToBelongEnterprise = [aDecoder decodeObjectForKey:kDIIResultToBelongEnterprise];
	self.UpdateBy = [aDecoder decodeObjectForKey:kDIIResultUpdateBy];
	self.UpdateOn = [aDecoder decodeObjectForKey:kDIIResultUpdateOn];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DIIResult *copy = [DIIResult new];

	copy.ApplyContent = [self.ApplyContent copy];
	copy.ApplyType = self.ApplyType;
	copy.CreateBy = [self.CreateBy copy];
	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.FromBelongEnterprise = [self.FromBelongEnterprise copy];
	copy.GroupID = [self.GroupID copy];
	copy.Id = [self.Id copy];
	copy.IsAgree = self.IsAgree;
	copy.IsProcess = self.IsProcess;
	copy.MemberFrom = [self.MemberFrom copy];
	copy.MemberIDFrom = [self.MemberIDFrom copy];
	copy.MemberIDTo = [self.MemberIDTo copy];
	copy.MemberTo = [self.MemberTo copy];
	copy.ToBelongEnterprise = [self.ToBelongEnterprise copy];
	copy.UpdateBy = [self.UpdateBy copy];
	copy.UpdateOn = [self.UpdateOn copy];

	return copy;
}
@end
