//
//	DYJXXYRelation.m
//
//	Create by 岩 熊 on 12/12/2018
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
		self.InBlacklist = [dictionary[kDYJXXYRelationInBlacklist] boolValue];
	}

	if(![dictionary[kDYJXXYRelationIsAdmin] isKindOfClass:[NSNull class]]){
		self.IsAdmin = [dictionary[kDYJXXYRelationIsAdmin] boolValue];
	}

	if(![dictionary[kDYJXXYRelationIsContact] isKindOfClass:[NSNull class]]){
		self.IsContact = [dictionary[kDYJXXYRelationIsContact] boolValue];
	}

	if(![dictionary[kDYJXXYRelationIsFriend] isKindOfClass:[NSNull class]]){
		self.IsFriend = [dictionary[kDYJXXYRelationIsFriend] boolValue];
	}

	if(![dictionary[kDYJXXYRelationIsMember] isKindOfClass:[NSNull class]]){
		self.IsMember = [dictionary[kDYJXXYRelationIsMember] boolValue];
	}

	if(![dictionary[kDYJXXYRelationIsOwner] isKindOfClass:[NSNull class]]){
		self.IsOwner = [dictionary[kDYJXXYRelationIsOwner] boolValue];
	}

	if(![dictionary[kDYJXXYRelationIsParentAdmin] isKindOfClass:[NSNull class]]){
		self.IsParentAdmin = [dictionary[kDYJXXYRelationIsParentAdmin] boolValue];
	}

	if(![dictionary[kDYJXXYRelationIsParentOwner] isKindOfClass:[NSNull class]]){
		self.IsParentOwner = [dictionary[kDYJXXYRelationIsParentOwner] boolValue];
	}

	if(![dictionary[kDYJXXYRelationManaged] isKindOfClass:[NSNull class]]){
		self.Managed = [dictionary[kDYJXXYRelationManaged] boolValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kDYJXXYRelationInBlacklist] = @(self.InBlacklist);
	dictionary[kDYJXXYRelationIsAdmin] = @(self.IsAdmin);
	dictionary[kDYJXXYRelationIsContact] = @(self.IsContact);
	dictionary[kDYJXXYRelationIsFriend] = @(self.IsFriend);
	dictionary[kDYJXXYRelationIsMember] = @(self.IsMember);
	dictionary[kDYJXXYRelationIsOwner] = @(self.IsOwner);
	dictionary[kDYJXXYRelationIsParentAdmin] = @(self.IsParentAdmin);
	dictionary[kDYJXXYRelationIsParentOwner] = @(self.IsParentOwner);
	dictionary[kDYJXXYRelationManaged] = @(self.Managed);
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
	[aCoder encodeObject:@(self.InBlacklist) forKey:kDYJXXYRelationInBlacklist];	[aCoder encodeObject:@(self.IsAdmin) forKey:kDYJXXYRelationIsAdmin];	[aCoder encodeObject:@(self.IsContact) forKey:kDYJXXYRelationIsContact];	[aCoder encodeObject:@(self.IsFriend) forKey:kDYJXXYRelationIsFriend];	[aCoder encodeObject:@(self.IsMember) forKey:kDYJXXYRelationIsMember];	[aCoder encodeObject:@(self.IsOwner) forKey:kDYJXXYRelationIsOwner];	[aCoder encodeObject:@(self.IsParentAdmin) forKey:kDYJXXYRelationIsParentAdmin];	[aCoder encodeObject:@(self.IsParentOwner) forKey:kDYJXXYRelationIsParentOwner];	[aCoder encodeObject:@(self.Managed) forKey:kDYJXXYRelationManaged];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.InBlacklist = [[aDecoder decodeObjectForKey:kDYJXXYRelationInBlacklist] boolValue];
	self.IsAdmin = [[aDecoder decodeObjectForKey:kDYJXXYRelationIsAdmin] boolValue];
	self.IsContact = [[aDecoder decodeObjectForKey:kDYJXXYRelationIsContact] boolValue];
	self.IsFriend = [[aDecoder decodeObjectForKey:kDYJXXYRelationIsFriend] boolValue];
	self.IsMember = [[aDecoder decodeObjectForKey:kDYJXXYRelationIsMember] boolValue];
	self.IsOwner = [[aDecoder decodeObjectForKey:kDYJXXYRelationIsOwner] boolValue];
	self.IsParentAdmin = [[aDecoder decodeObjectForKey:kDYJXXYRelationIsParentAdmin] boolValue];
	self.IsParentOwner = [[aDecoder decodeObjectForKey:kDYJXXYRelationIsParentOwner] boolValue];
	self.Managed = [[aDecoder decodeObjectForKey:kDYJXXYRelationManaged] boolValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXXYRelation *copy = [DYJXXYRelation new];

	copy.InBlacklist = self.InBlacklist;
	copy.IsAdmin = self.IsAdmin;
	copy.IsContact = self.IsContact;
	copy.IsFriend = self.IsFriend;
	copy.IsMember = self.IsMember;
	copy.IsOwner = self.IsOwner;
	copy.IsParentAdmin = self.IsParentAdmin;
	copy.IsParentOwner = self.IsParentOwner;
	copy.Managed = self.Managed;

	return copy;
}
@end