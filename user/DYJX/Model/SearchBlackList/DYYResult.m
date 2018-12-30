//
//	DYYResult.m
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYYResult.h"

NSString *const kDYYResultBelongBlackUserEnterprise = @"BelongBlackUserEnterprise";
NSString *const kDYYResultBelongEnterprise = @"BelongEnterprise";
NSString *const kDYYResultBlackObj = @"BlackObj";
NSString *const kDYYResultBlackUserId = @"BlackUserId";
NSString *const kDYYResultCreateBy = @"CreateBy";
NSString *const kDYYResultCreateOn = @"CreateOn";
NSString *const kDYYResultDeleted = @"Deleted";
NSString *const kDYYResultDisabled = @"Disabled";
NSString *const kDYYResultIdField = @"Id";
NSString *const kDYYResultUserId = @"UserId";

@interface DYYResult ()
@end
@implementation DYYResult




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYYResultBelongBlackUserEnterprise] isKindOfClass:[NSNull class]]){
		self.BelongBlackUserEnterprise = dictionary[kDYYResultBelongBlackUserEnterprise];
	}	
	if(![dictionary[kDYYResultBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.BelongEnterprise = dictionary[kDYYResultBelongEnterprise];
	}	
	if(![dictionary[kDYYResultBlackObj] isKindOfClass:[NSNull class]]){
		self.BlackObj = [[DYYBlackObj alloc] initWithDictionary:dictionary[kDYYResultBlackObj]];
	}

	if(![dictionary[kDYYResultBlackUserId] isKindOfClass:[NSNull class]]){
		self.BlackUserId = dictionary[kDYYResultBlackUserId];
	}	
	if(![dictionary[kDYYResultCreateBy] isKindOfClass:[NSNull class]]){
		self.CreateBy = dictionary[kDYYResultCreateBy];
	}	
	if(![dictionary[kDYYResultCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDYYResultCreateOn];
	}	
	if(![dictionary[kDYYResultDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDYYResultDeleted] boolValue];
	}

	if(![dictionary[kDYYResultDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDYYResultDisabled] boolValue];
	}

	if(![dictionary[kDYYResultIdField] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDYYResultIdField];
	}	
	if(![dictionary[kDYYResultUserId] isKindOfClass:[NSNull class]]){
		self.UserId = dictionary[kDYYResultUserId];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.BelongBlackUserEnterprise != nil){
		dictionary[kDYYResultBelongBlackUserEnterprise] = self.BelongBlackUserEnterprise;
	}
	if(self.BelongEnterprise != nil){
		dictionary[kDYYResultBelongEnterprise] = self.BelongEnterprise;
	}
	if(self.BlackObj != nil){
		dictionary[kDYYResultBlackObj] = [self.BlackObj toDictionary];
	}
	if(self.BlackUserId != nil){
		dictionary[kDYYResultBlackUserId] = self.BlackUserId;
	}
	if(self.CreateBy != nil){
		dictionary[kDYYResultCreateBy] = self.CreateBy;
	}
	if(self.CreateOn != nil){
		dictionary[kDYYResultCreateOn] = self.CreateOn;
	}
	dictionary[kDYYResultDeleted] = @(self.Deleted);
	dictionary[kDYYResultDisabled] = @(self.Disabled);
	if(self.Id != nil){
		dictionary[kDYYResultIdField] = self.Id;
	}
	if(self.UserId != nil){
		dictionary[kDYYResultUserId] = self.UserId;
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
	if(self.BelongBlackUserEnterprise != nil){
		[aCoder encodeObject:self.BelongBlackUserEnterprise forKey:kDYYResultBelongBlackUserEnterprise];
	}
	if(self.BelongEnterprise != nil){
		[aCoder encodeObject:self.BelongEnterprise forKey:kDYYResultBelongEnterprise];
	}
	if(self.BlackObj != nil){
		[aCoder encodeObject:self.BlackObj forKey:kDYYResultBlackObj];
	}
	if(self.BlackUserId != nil){
		[aCoder encodeObject:self.BlackUserId forKey:kDYYResultBlackUserId];
	}
	if(self.CreateBy != nil){
		[aCoder encodeObject:self.CreateBy forKey:kDYYResultCreateBy];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDYYResultCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDYYResultDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDYYResultDisabled];	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDYYResultIdField];
	}
	if(self.UserId != nil){
		[aCoder encodeObject:self.UserId forKey:kDYYResultUserId];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.BelongBlackUserEnterprise = [aDecoder decodeObjectForKey:kDYYResultBelongBlackUserEnterprise];
	self.BelongEnterprise = [aDecoder decodeObjectForKey:kDYYResultBelongEnterprise];
	self.BlackObj = [aDecoder decodeObjectForKey:kDYYResultBlackObj];
	self.BlackUserId = [aDecoder decodeObjectForKey:kDYYResultBlackUserId];
	self.CreateBy = [aDecoder decodeObjectForKey:kDYYResultCreateBy];
	self.CreateOn = [aDecoder decodeObjectForKey:kDYYResultCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDYYResultDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDYYResultDisabled] boolValue];
	self.Id = [aDecoder decodeObjectForKey:kDYYResultIdField];
	self.UserId = [aDecoder decodeObjectForKey:kDYYResultUserId];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYYResult *copy = [DYYResult new];

	copy.BelongBlackUserEnterprise = [self.BelongBlackUserEnterprise copy];
	copy.BelongEnterprise = [self.BelongEnterprise copy];
	copy.BlackObj = [self.BlackObj copy];
	copy.BlackUserId = [self.BlackUserId copy];
	copy.CreateBy = [self.CreateBy copy];
	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.Id = [self.Id copy];
	copy.UserId = [self.UserId copy];

	return copy;
}
@end
