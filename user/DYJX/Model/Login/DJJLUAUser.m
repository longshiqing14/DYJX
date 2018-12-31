//
//	DJJLUAUser.m
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJLUAUser.h"

NSString *const kDJJLUAUserBusiness = @"Business";
NSString *const kDJJLUAUserContactType = @"ContactType";
NSString *const kDJJLUAUserCreateOn = @"CreateOn";
NSString *const kDJJLUAUserCreateUAUrl = @"CreateUAUrl";
NSString *const kDJJLUAUserDeleted = @"Deleted";
NSString *const kDJJLUAUserDisabled = @"Disabled";
NSString *const kDJJLUAUserId = @"Id";
NSString *const kDJJLUAUserMember = @"Member";
NSString *const kDJJLUAUserNumber = @"Number";
NSString *const kDJJLUAUserNumberString = @"NumberString";
NSString *const kDJJLUAUserStatus = @"Status";
NSString *const kDJJLUAUserType = @"Type";

@interface DJJLUAUser ()
@end
@implementation DJJLUAUser




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJLUAUserBusiness] isKindOfClass:[NSNull class]]){
		self.Business = [[DJJLBusines alloc] initWithDictionary:dictionary[kDJJLUAUserBusiness]];
	}

	if(![dictionary[kDJJLUAUserContactType] isKindOfClass:[NSNull class]]){
		self.ContactType = [dictionary[kDJJLUAUserContactType] integerValue];
	}

	if(![dictionary[kDJJLUAUserCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDJJLUAUserCreateOn];
	}	
	if(![dictionary[kDJJLUAUserCreateUAUrl] isKindOfClass:[NSNull class]]){
		self.CreateUAUrl = dictionary[kDJJLUAUserCreateUAUrl];
	}	
	if(![dictionary[kDJJLUAUserDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDJJLUAUserDeleted] boolValue];
	}

	if(![dictionary[kDJJLUAUserDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDJJLUAUserDisabled] boolValue];
	}

	if(![dictionary[kDJJLUAUserId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDJJLUAUserId];
	}	
	if(![dictionary[kDJJLUAUserMember] isKindOfClass:[NSNull class]]){
		self.Member = [[DJJLMember alloc] initWithDictionary:dictionary[kDJJLUAUserMember]];
	}

	if(![dictionary[kDJJLUAUserNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kDJJLUAUserNumber] integerValue];
	}

	if(![dictionary[kDJJLUAUserNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kDJJLUAUserNumberString];
	}	
	if(![dictionary[kDJJLUAUserStatus] isKindOfClass:[NSNull class]]){
		self.Status = [dictionary[kDJJLUAUserStatus] integerValue];
	}

	if(![dictionary[kDJJLUAUserType] isKindOfClass:[NSNull class]]){
		self.Type = [dictionary[kDJJLUAUserType] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.Business != nil){
		dictionary[kDJJLUAUserBusiness] = [self.Business toDictionary];
	}
	dictionary[kDJJLUAUserContactType] = @(self.ContactType);
	if(self.CreateOn != nil){
		dictionary[kDJJLUAUserCreateOn] = self.CreateOn;
	}
	if(self.CreateUAUrl != nil){
		dictionary[kDJJLUAUserCreateUAUrl] = self.CreateUAUrl;
	}
	dictionary[kDJJLUAUserDeleted] = @(self.Deleted);
	dictionary[kDJJLUAUserDisabled] = @(self.Disabled);
	if(self.Id != nil){
		dictionary[kDJJLUAUserId] = self.Id;
	}
	if(self.Member != nil){
		dictionary[kDJJLUAUserMember] = [self.Member toDictionary];
	}
	dictionary[kDJJLUAUserNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kDJJLUAUserNumberString] = self.NumberString;
	}
	dictionary[kDJJLUAUserStatus] = @(self.Status);
	dictionary[kDJJLUAUserType] = @(self.Type);
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
	if(self.Business != nil){
		[aCoder encodeObject:self.Business forKey:kDJJLUAUserBusiness];
	}
	[aCoder encodeObject:@(self.ContactType) forKey:kDJJLUAUserContactType];	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDJJLUAUserCreateOn];
	}
	if(self.CreateUAUrl != nil){
		[aCoder encodeObject:self.CreateUAUrl forKey:kDJJLUAUserCreateUAUrl];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDJJLUAUserDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDJJLUAUserDisabled];	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDJJLUAUserId];
	}
	if(self.Member != nil){
		[aCoder encodeObject:self.Member forKey:kDJJLUAUserMember];
	}
	[aCoder encodeObject:@(self.Number) forKey:kDJJLUAUserNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kDJJLUAUserNumberString];
	}
	[aCoder encodeObject:@(self.Status) forKey:kDJJLUAUserStatus];	[aCoder encodeObject:@(self.Type) forKey:kDJJLUAUserType];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.Business = [aDecoder decodeObjectForKey:kDJJLUAUserBusiness];
	self.ContactType = [[aDecoder decodeObjectForKey:kDJJLUAUserContactType] integerValue];
	self.CreateOn = [aDecoder decodeObjectForKey:kDJJLUAUserCreateOn];
	self.CreateUAUrl = [aDecoder decodeObjectForKey:kDJJLUAUserCreateUAUrl];
	self.Deleted = [[aDecoder decodeObjectForKey:kDJJLUAUserDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDJJLUAUserDisabled] boolValue];
	self.Id = [aDecoder decodeObjectForKey:kDJJLUAUserId];
	self.Member = [aDecoder decodeObjectForKey:kDJJLUAUserMember];
	self.Number = [[aDecoder decodeObjectForKey:kDJJLUAUserNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kDJJLUAUserNumberString];
	self.Status = [[aDecoder decodeObjectForKey:kDJJLUAUserStatus] integerValue];
	self.Type = [[aDecoder decodeObjectForKey:kDJJLUAUserType] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJLUAUser *copy = [DJJLUAUser new];

	copy.Business = [self.Business copy];
	copy.ContactType = self.ContactType;
	copy.CreateOn = [self.CreateOn copy];
	copy.CreateUAUrl = [self.CreateUAUrl copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.Id = [self.Id copy];
	copy.Member = [self.Member copy];
	copy.Number = self.Number;
	copy.NumberString = [self.NumberString copy];
	copy.Status = self.Status;
	copy.Type = self.Type;

	return copy;
}
@end
