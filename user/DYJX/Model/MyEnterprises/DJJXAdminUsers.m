//
//	DJJXAdminUsers.m
//
//	Create by longshiqing on 17/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJXAdminUsers.h"

NSString *const kDJJXAdminUsersBelongEnterprise = @"BelongEnterprise";
NSString *const kDJJXAdminUsersBusiness = @"Business";
NSString *const kDJJXAdminUsersCellphone = @"Cellphone";
NSString *const kDJJXAdminUsersCreateOn = @"CreateOn";
NSString *const kDJJXAdminUsersDeleted = @"Deleted";
NSString *const kDJJXAdminUsersDisabled = @"Disabled";
NSString *const kDJJXAdminUsersDisplayName = @"DisplayName";
NSString *const kDJJXAdminUsersId = @"Id";
NSString *const kDJJXAdminUsersNumber = @"Number";
NSString *const kDJJXAdminUsersNumberString = @"NumberString";
NSString *const kDJJXAdminUsersRongCloudToken = @"RongCloudToken";
NSString *const kDJJXAdminUsersType = @"Type";
NSString *const kDJJXAdminUsersUpdateBy = @"UpdateBy";
NSString *const kDJJXAdminUsersUpdateOn = @"UpdateOn";
NSString *const kDJJXAdminUsersUserName = @"UserName";

@interface DJJXAdminUsers ()
@end
@implementation DJJXAdminUsers




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJXAdminUsersBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.BelongEnterprise = dictionary[kDJJXAdminUsersBelongEnterprise];
	}	
	if(![dictionary[kDJJXAdminUsersBusiness] isKindOfClass:[NSNull class]]){
		self.Business = [[DJJXBusines alloc] initWithDictionary:dictionary[kDJJXAdminUsersBusiness]];
	}

	if(![dictionary[kDJJXAdminUsersCellphone] isKindOfClass:[NSNull class]]){
		self.Cellphone = dictionary[kDJJXAdminUsersCellphone];
	}	
	if(![dictionary[kDJJXAdminUsersCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDJJXAdminUsersCreateOn];
	}	
	if(![dictionary[kDJJXAdminUsersDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDJJXAdminUsersDeleted] boolValue];
	}

	if(![dictionary[kDJJXAdminUsersDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDJJXAdminUsersDisabled] boolValue];
	}

	if(![dictionary[kDJJXAdminUsersDisplayName] isKindOfClass:[NSNull class]]){
		self.DisplayName = dictionary[kDJJXAdminUsersDisplayName];
	}	
	if(![dictionary[kDJJXAdminUsersId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDJJXAdminUsersId];
	}	
	if(![dictionary[kDJJXAdminUsersNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kDJJXAdminUsersNumber] integerValue];
	}

	if(![dictionary[kDJJXAdminUsersNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kDJJXAdminUsersNumberString];
	}	
	if(![dictionary[kDJJXAdminUsersRongCloudToken] isKindOfClass:[NSNull class]]){
		self.RongCloudToken = dictionary[kDJJXAdminUsersRongCloudToken];
	}	
	if(![dictionary[kDJJXAdminUsersType] isKindOfClass:[NSNull class]]){
		self.Type = [dictionary[kDJJXAdminUsersType] integerValue];
	}

	if(![dictionary[kDJJXAdminUsersUpdateBy] isKindOfClass:[NSNull class]]){
		self.UpdateBy = dictionary[kDJJXAdminUsersUpdateBy];
	}	
	if(![dictionary[kDJJXAdminUsersUpdateOn] isKindOfClass:[NSNull class]]){
		self.UpdateOn = dictionary[kDJJXAdminUsersUpdateOn];
	}	
	if(![dictionary[kDJJXAdminUsersUserName] isKindOfClass:[NSNull class]]){
		self.UserName = dictionary[kDJJXAdminUsersUserName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.BelongEnterprise != nil){
		dictionary[kDJJXAdminUsersBelongEnterprise] = self.BelongEnterprise;
	}
	if(self.Business != nil){
		dictionary[kDJJXAdminUsersBusiness] = [self.Business toDictionary];
	}
	if(self.Cellphone != nil){
		dictionary[kDJJXAdminUsersCellphone] = self.Cellphone;
	}
	if(self.CreateOn != nil){
		dictionary[kDJJXAdminUsersCreateOn] = self.CreateOn;
	}
	dictionary[kDJJXAdminUsersDeleted] = @(self.Deleted);
	dictionary[kDJJXAdminUsersDisabled] = @(self.Disabled);
	if(self.DisplayName != nil){
		dictionary[kDJJXAdminUsersDisplayName] = self.DisplayName;
	}
	if(self.Id != nil){
		dictionary[kDJJXAdminUsersId] = self.Id;
	}
	dictionary[kDJJXAdminUsersNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kDJJXAdminUsersNumberString] = self.NumberString;
	}
	if(self.RongCloudToken != nil){
		dictionary[kDJJXAdminUsersRongCloudToken] = self.RongCloudToken;
	}
	dictionary[kDJJXAdminUsersType] = @(self.Type);
	if(self.UpdateBy != nil){
		dictionary[kDJJXAdminUsersUpdateBy] = self.UpdateBy;
	}
	if(self.UpdateOn != nil){
		dictionary[kDJJXAdminUsersUpdateOn] = self.UpdateOn;
	}
	if(self.UserName != nil){
		dictionary[kDJJXAdminUsersUserName] = self.UserName;
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
	if(self.BelongEnterprise != nil){
		[aCoder encodeObject:self.BelongEnterprise forKey:kDJJXAdminUsersBelongEnterprise];
	}
	if(self.Business != nil){
		[aCoder encodeObject:self.Business forKey:kDJJXAdminUsersBusiness];
	}
	if(self.Cellphone != nil){
		[aCoder encodeObject:self.Cellphone forKey:kDJJXAdminUsersCellphone];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDJJXAdminUsersCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDJJXAdminUsersDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDJJXAdminUsersDisabled];	if(self.DisplayName != nil){
		[aCoder encodeObject:self.DisplayName forKey:kDJJXAdminUsersDisplayName];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDJJXAdminUsersId];
	}
	[aCoder encodeObject:@(self.Number) forKey:kDJJXAdminUsersNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kDJJXAdminUsersNumberString];
	}
	if(self.RongCloudToken != nil){
		[aCoder encodeObject:self.RongCloudToken forKey:kDJJXAdminUsersRongCloudToken];
	}
	[aCoder encodeObject:@(self.Type) forKey:kDJJXAdminUsersType];	if(self.UpdateBy != nil){
		[aCoder encodeObject:self.UpdateBy forKey:kDJJXAdminUsersUpdateBy];
	}
	if(self.UpdateOn != nil){
		[aCoder encodeObject:self.UpdateOn forKey:kDJJXAdminUsersUpdateOn];
	}
	if(self.UserName != nil){
		[aCoder encodeObject:self.UserName forKey:kDJJXAdminUsersUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.BelongEnterprise = [aDecoder decodeObjectForKey:kDJJXAdminUsersBelongEnterprise];
	self.Business = [aDecoder decodeObjectForKey:kDJJXAdminUsersBusiness];
	self.Cellphone = [aDecoder decodeObjectForKey:kDJJXAdminUsersCellphone];
	self.CreateOn = [aDecoder decodeObjectForKey:kDJJXAdminUsersCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDJJXAdminUsersDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDJJXAdminUsersDisabled] boolValue];
	self.DisplayName = [aDecoder decodeObjectForKey:kDJJXAdminUsersDisplayName];
	self.Id = [aDecoder decodeObjectForKey:kDJJXAdminUsersId];
	self.Number = [[aDecoder decodeObjectForKey:kDJJXAdminUsersNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kDJJXAdminUsersNumberString];
	self.RongCloudToken = [aDecoder decodeObjectForKey:kDJJXAdminUsersRongCloudToken];
	self.Type = [[aDecoder decodeObjectForKey:kDJJXAdminUsersType] integerValue];
	self.UpdateBy = [aDecoder decodeObjectForKey:kDJJXAdminUsersUpdateBy];
	self.UpdateOn = [aDecoder decodeObjectForKey:kDJJXAdminUsersUpdateOn];
	self.UserName = [aDecoder decodeObjectForKey:kDJJXAdminUsersUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJXAdminUsers *copy = [DJJXAdminUsers new];

	copy.BelongEnterprise = [self.BelongEnterprise copy];
	copy.Business = [self.Business copy];
	copy.Cellphone = [self.Cellphone copy];
	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.DisplayName = [self.DisplayName copy];
	copy.Id = [self.Id copy];
	copy.Number = self.Number;
	copy.NumberString = [self.NumberString copy];
	copy.RongCloudToken = [self.RongCloudToken copy];
	copy.Type = self.Type;
	copy.UpdateBy = [self.UpdateBy copy];
	copy.UpdateOn = [self.UpdateOn copy];
	copy.UserName = [self.UserName copy];

	return copy;
}
@end
