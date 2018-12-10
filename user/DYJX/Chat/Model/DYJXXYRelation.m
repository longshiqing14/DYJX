//
//	DYJXXYRelation.m
//
//	Create by 岩 熊 on 7/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYJXXYRelation.h"

NSString *const kDYJXXYRelationInBlacklist = @"InBlacklist";
NSString *const kDYJXXYRelationIsAdmin = @"IsAdmin";
NSString *const kDYJXXYRelationIsContact = @"IsContact";
NSString *const kDYJXXYRelationIsFriend = @"IsFriend";
NSString *const kDYJXXYRelationIsMember = @"IsMember";
NSString *const kDYJXXYRelationIsOwner = @"IsOwner";
NSString *const kDYJXXYRelationIsParentAdmin = @"IsParentAdmin";
NSString *const kDYJXXYRelationIsParentOwner = @"IsParentOwner";
NSString *const kDYJXXYRelationManaged = @"Managed";

@interface DYJXXYRelation ()
@end
@implementation DYJXXYRelation




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYJXXYRelationInBlacklist] isKindOfClass:[NSNull class]]){
		self.inBlacklist = [dictionary[kDYJXXYRelationInBlacklist] boolValue];
	}

	if(![dictionary[kDYJXXYRelationIsAdmin] isKindOfClass:[NSNull class]]){
		self.isAdmin = [dictionary[kDYJXXYRelationIsAdmin] boolValue];
	}

	if(![dictionary[kDYJXXYRelationIsContact] isKindOfClass:[NSNull class]]){
		self.isContact = [dictionary[kDYJXXYRelationIsContact] boolValue];
	}

	if(![dictionary[kDYJXXYRelationIsFriend] isKindOfClass:[NSNull class]]){
		self.isFriend = [dictionary[kDYJXXYRelationIsFriend] boolValue];
	}

	if(![dictionary[kDYJXXYRelationIsMember] isKindOfClass:[NSNull class]]){
		self.isMember = [dictionary[kDYJXXYRelationIsMember] boolValue];
	}

	if(![dictionary[kDYJXXYRelationIsOwner] isKindOfClass:[NSNull class]]){
		self.isOwner = [dictionary[kDYJXXYRelationIsOwner] boolValue];
	}

	if(![dictionary[kDYJXXYRelationIsParentAdmin] isKindOfClass:[NSNull class]]){
		self.isParentAdmin = [dictionary[kDYJXXYRelationIsParentAdmin] boolValue];
	}

	if(![dictionary[kDYJXXYRelationIsParentOwner] isKindOfClass:[NSNull class]]){
		self.isParentOwner = [dictionary[kDYJXXYRelationIsParentOwner] boolValue];
	}

	if(![dictionary[kDYJXXYRelationManaged] isKindOfClass:[NSNull class]]){
		self.managed = [dictionary[kDYJXXYRelationManaged] boolValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kDYJXXYRelationInBlacklist] = @(self.inBlacklist);
	dictionary[kDYJXXYRelationIsAdmin] = @(self.isAdmin);
	dictionary[kDYJXXYRelationIsContact] = @(self.isContact);
	dictionary[kDYJXXYRelationIsFriend] = @(self.isFriend);
	dictionary[kDYJXXYRelationIsMember] = @(self.isMember);
	dictionary[kDYJXXYRelationIsOwner] = @(self.isOwner);
	dictionary[kDYJXXYRelationIsParentAdmin] = @(self.isParentAdmin);
	dictionary[kDYJXXYRelationIsParentOwner] = @(self.isParentOwner);
	dictionary[kDYJXXYRelationManaged] = @(self.managed);
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
	[aCoder encodeObject:@(self.inBlacklist) forKey:kDYJXXYRelationInBlacklist];	[aCoder encodeObject:@(self.isAdmin) forKey:kDYJXXYRelationIsAdmin];	[aCoder encodeObject:@(self.isContact) forKey:kDYJXXYRelationIsContact];	[aCoder encodeObject:@(self.isFriend) forKey:kDYJXXYRelationIsFriend];	[aCoder encodeObject:@(self.isMember) forKey:kDYJXXYRelationIsMember];	[aCoder encodeObject:@(self.isOwner) forKey:kDYJXXYRelationIsOwner];	[aCoder encodeObject:@(self.isParentAdmin) forKey:kDYJXXYRelationIsParentAdmin];	[aCoder encodeObject:@(self.isParentOwner) forKey:kDYJXXYRelationIsParentOwner];	[aCoder encodeObject:@(self.managed) forKey:kDYJXXYRelationManaged];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.inBlacklist = [[aDecoder decodeObjectForKey:kDYJXXYRelationInBlacklist] boolValue];
	self.isAdmin = [[aDecoder decodeObjectForKey:kDYJXXYRelationIsAdmin] boolValue];
	self.isContact = [[aDecoder decodeObjectForKey:kDYJXXYRelationIsContact] boolValue];
	self.isFriend = [[aDecoder decodeObjectForKey:kDYJXXYRelationIsFriend] boolValue];
	self.isMember = [[aDecoder decodeObjectForKey:kDYJXXYRelationIsMember] boolValue];
	self.isOwner = [[aDecoder decodeObjectForKey:kDYJXXYRelationIsOwner] boolValue];
	self.isParentAdmin = [[aDecoder decodeObjectForKey:kDYJXXYRelationIsParentAdmin] boolValue];
	self.isParentOwner = [[aDecoder decodeObjectForKey:kDYJXXYRelationIsParentOwner] boolValue];
	self.managed = [[aDecoder decodeObjectForKey:kDYJXXYRelationManaged] boolValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXXYRelation *copy = [DYJXXYRelation new];

	copy.inBlacklist = self.inBlacklist;
	copy.isAdmin = self.isAdmin;
	copy.isContact = self.isContact;
	copy.isFriend = self.isFriend;
	copy.isMember = self.isMember;
	copy.isOwner = self.isOwner;
	copy.isParentAdmin = self.isParentAdmin;
	copy.isParentOwner = self.isParentOwner;
	copy.managed = self.managed;

	return copy;
}
@end