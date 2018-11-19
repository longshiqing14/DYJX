//
//	DJJSRelation.m
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJSRelation.h"

NSString *const kDJJSRelationInBlacklist = @"InBlacklist";
NSString *const kDJJSRelationIsAdmin = @"IsAdmin";
NSString *const kDJJSRelationIsContact = @"IsContact";
NSString *const kDJJSRelationIsFriend = @"IsFriend";
NSString *const kDJJSRelationIsMember = @"IsMember";
NSString *const kDJJSRelationIsOwner = @"IsOwner";
NSString *const kDJJSRelationIsParentAdmin = @"IsParentAdmin";
NSString *const kDJJSRelationIsParentOwner = @"IsParentOwner";
NSString *const kDJJSRelationManaged = @"Managed";

@interface DJJSRelation ()
@end
@implementation DJJSRelation




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJSRelationInBlacklist] isKindOfClass:[NSNull class]]){
		self.InBlacklist = [dictionary[kDJJSRelationInBlacklist] boolValue];
	}

	if(![dictionary[kDJJSRelationIsAdmin] isKindOfClass:[NSNull class]]){
		self.IsAdmin = [dictionary[kDJJSRelationIsAdmin] boolValue];
	}

	if(![dictionary[kDJJSRelationIsContact] isKindOfClass:[NSNull class]]){
		self.IsContact = [dictionary[kDJJSRelationIsContact] boolValue];
	}

	if(![dictionary[kDJJSRelationIsFriend] isKindOfClass:[NSNull class]]){
		self.IsFriend = [dictionary[kDJJSRelationIsFriend] boolValue];
	}

	if(![dictionary[kDJJSRelationIsMember] isKindOfClass:[NSNull class]]){
		self.IsMember = [dictionary[kDJJSRelationIsMember] boolValue];
	}

	if(![dictionary[kDJJSRelationIsOwner] isKindOfClass:[NSNull class]]){
		self.IsOwner = [dictionary[kDJJSRelationIsOwner] boolValue];
	}

	if(![dictionary[kDJJSRelationIsParentAdmin] isKindOfClass:[NSNull class]]){
		self.IsParentAdmin = [dictionary[kDJJSRelationIsParentAdmin] boolValue];
	}

	if(![dictionary[kDJJSRelationIsParentOwner] isKindOfClass:[NSNull class]]){
		self.IsParentOwner = [dictionary[kDJJSRelationIsParentOwner] boolValue];
	}

	if(![dictionary[kDJJSRelationManaged] isKindOfClass:[NSNull class]]){
		self.Managed = [dictionary[kDJJSRelationManaged] boolValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kDJJSRelationInBlacklist] = @(self.InBlacklist);
	dictionary[kDJJSRelationIsAdmin] = @(self.IsAdmin);
	dictionary[kDJJSRelationIsContact] = @(self.IsContact);
	dictionary[kDJJSRelationIsFriend] = @(self.IsFriend);
	dictionary[kDJJSRelationIsMember] = @(self.IsMember);
	dictionary[kDJJSRelationIsOwner] = @(self.IsOwner);
	dictionary[kDJJSRelationIsParentAdmin] = @(self.IsParentAdmin);
	dictionary[kDJJSRelationIsParentOwner] = @(self.IsParentOwner);
	dictionary[kDJJSRelationManaged] = @(self.Managed);
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
	[aCoder encodeObject:@(self.InBlacklist) forKey:kDJJSRelationInBlacklist];	[aCoder encodeObject:@(self.IsAdmin) forKey:kDJJSRelationIsAdmin];	[aCoder encodeObject:@(self.IsContact) forKey:kDJJSRelationIsContact];	[aCoder encodeObject:@(self.IsFriend) forKey:kDJJSRelationIsFriend];	[aCoder encodeObject:@(self.IsMember) forKey:kDJJSRelationIsMember];	[aCoder encodeObject:@(self.IsOwner) forKey:kDJJSRelationIsOwner];	[aCoder encodeObject:@(self.IsParentAdmin) forKey:kDJJSRelationIsParentAdmin];	[aCoder encodeObject:@(self.IsParentOwner) forKey:kDJJSRelationIsParentOwner];	[aCoder encodeObject:@(self.Managed) forKey:kDJJSRelationManaged];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.InBlacklist = [[aDecoder decodeObjectForKey:kDJJSRelationInBlacklist] boolValue];
	self.IsAdmin = [[aDecoder decodeObjectForKey:kDJJSRelationIsAdmin] boolValue];
	self.IsContact = [[aDecoder decodeObjectForKey:kDJJSRelationIsContact] boolValue];
	self.IsFriend = [[aDecoder decodeObjectForKey:kDJJSRelationIsFriend] boolValue];
	self.IsMember = [[aDecoder decodeObjectForKey:kDJJSRelationIsMember] boolValue];
	self.IsOwner = [[aDecoder decodeObjectForKey:kDJJSRelationIsOwner] boolValue];
	self.IsParentAdmin = [[aDecoder decodeObjectForKey:kDJJSRelationIsParentAdmin] boolValue];
	self.IsParentOwner = [[aDecoder decodeObjectForKey:kDJJSRelationIsParentOwner] boolValue];
	self.Managed = [[aDecoder decodeObjectForKey:kDJJSRelationManaged] boolValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJSRelation *copy = [DJJSRelation new];

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