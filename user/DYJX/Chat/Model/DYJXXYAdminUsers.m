//
//	DYJXXYAdminUsers.m
//
//	Create by 岩 熊 on 12/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYJXXYAdminUsers.h"

NSString *const kDYJXXYAdminUsersBelongEnterprise = @"BelongEnterprise";
NSString *const kDYJXXYAdminUsersBusiness = @"Business";
NSString *const kDYJXXYAdminUsersCellphone = @"Cellphone";
NSString *const kDYJXXYAdminUsersCreateOn = @"CreateOn";
NSString *const kDYJXXYAdminUsersDeleted = @"Deleted";
NSString *const kDYJXXYAdminUsersDisabled = @"Disabled";
NSString *const kDYJXXYAdminUsersDisplayName = @"DisplayName";
NSString *const kDYJXXYAdminUsersDisplayTel = @"DisplayTel";
NSString *const kDYJXXYAdminUsersId = @"Id";
NSString *const kDYJXXYAdminUsersNumber = @"Number";
NSString *const kDYJXXYAdminUsersNumberString = @"NumberString";
NSString *const kDYJXXYAdminUsersRongCloudToken = @"RongCloudToken";
NSString *const kDYJXXYAdminUsersType = @"Type";
NSString *const kDYJXXYAdminUsersUpdateBy = @"UpdateBy";
NSString *const kDYJXXYAdminUsersUpdateOn = @"UpdateOn";
NSString *const kDYJXXYAdminUsersUserName = @"UserName";

@interface DYJXXYAdminUsers ()
@end
@implementation DYJXXYAdminUsers




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYJXXYAdminUsersBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.BelongEnterprise = dictionary[kDYJXXYAdminUsersBelongEnterprise];
	}	
	if(![dictionary[kDYJXXYAdminUsersBusiness] isKindOfClass:[NSNull class]]){
		self.Business = [[DYJXXYBusines alloc] initWithDictionary:dictionary[kDYJXXYAdminUsersBusiness]];
	}

	if(![dictionary[kDYJXXYAdminUsersCellphone] isKindOfClass:[NSNull class]]){
		self.Cellphone = dictionary[kDYJXXYAdminUsersCellphone];
	}	
	if(![dictionary[kDYJXXYAdminUsersCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDYJXXYAdminUsersCreateOn];
	}	
	if(![dictionary[kDYJXXYAdminUsersDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDYJXXYAdminUsersDeleted] boolValue];
	}

	if(![dictionary[kDYJXXYAdminUsersDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDYJXXYAdminUsersDisabled] boolValue];
	}

	if(![dictionary[kDYJXXYAdminUsersDisplayName] isKindOfClass:[NSNull class]]){
		self.DisplayName = dictionary[kDYJXXYAdminUsersDisplayName];
	}	
	if(![dictionary[kDYJXXYAdminUsersDisplayTel] isKindOfClass:[NSNull class]]){
		self.DisplayTel = dictionary[kDYJXXYAdminUsersDisplayTel];
	}	
	if(![dictionary[kDYJXXYAdminUsersId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDYJXXYAdminUsersId];
	}	
	if(![dictionary[kDYJXXYAdminUsersNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kDYJXXYAdminUsersNumber] integerValue];
	}

	if(![dictionary[kDYJXXYAdminUsersNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kDYJXXYAdminUsersNumberString];
	}	
	if(![dictionary[kDYJXXYAdminUsersRongCloudToken] isKindOfClass:[NSNull class]]){
		self.RongCloudToken = dictionary[kDYJXXYAdminUsersRongCloudToken];
	}	
	if(![dictionary[kDYJXXYAdminUsersType] isKindOfClass:[NSNull class]]){
		self.Type = [dictionary[kDYJXXYAdminUsersType] integerValue];
	}

	if(![dictionary[kDYJXXYAdminUsersUpdateBy] isKindOfClass:[NSNull class]]){
		self.UpdateBy = dictionary[kDYJXXYAdminUsersUpdateBy];
	}	
	if(![dictionary[kDYJXXYAdminUsersUpdateOn] isKindOfClass:[NSNull class]]){
		self.UpdateOn = dictionary[kDYJXXYAdminUsersUpdateOn];
	}	
	if(![dictionary[kDYJXXYAdminUsersUserName] isKindOfClass:[NSNull class]]){
		self.UserName = dictionary[kDYJXXYAdminUsersUserName];
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
		dictionary[kDYJXXYAdminUsersBelongEnterprise] = self.BelongEnterprise;
	}
	if(self.Business != nil){
		dictionary[kDYJXXYAdminUsersBusiness] = [self.Business toDictionary];
	}
	if(self.Cellphone != nil){
		dictionary[kDYJXXYAdminUsersCellphone] = self.Cellphone;
	}
	if(self.CreateOn != nil){
		dictionary[kDYJXXYAdminUsersCreateOn] = self.CreateOn;
	}
	dictionary[kDYJXXYAdminUsersDeleted] = @(self.Deleted);
	dictionary[kDYJXXYAdminUsersDisabled] = @(self.Disabled);
	if(self.DisplayName != nil){
		dictionary[kDYJXXYAdminUsersDisplayName] = self.DisplayName;
	}
	if(self.DisplayTel != nil){
		dictionary[kDYJXXYAdminUsersDisplayTel] = self.DisplayTel;
	}
	if(self.Id != nil){
		dictionary[kDYJXXYAdminUsersId] = self.Id;
	}
	dictionary[kDYJXXYAdminUsersNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kDYJXXYAdminUsersNumberString] = self.NumberString;
	}
	if(self.RongCloudToken != nil){
		dictionary[kDYJXXYAdminUsersRongCloudToken] = self.RongCloudToken;
	}
	dictionary[kDYJXXYAdminUsersType] = @(self.Type);
	if(self.UpdateBy != nil){
		dictionary[kDYJXXYAdminUsersUpdateBy] = self.UpdateBy;
	}
	if(self.UpdateOn != nil){
		dictionary[kDYJXXYAdminUsersUpdateOn] = self.UpdateOn;
	}
	if(self.UserName != nil){
		dictionary[kDYJXXYAdminUsersUserName] = self.UserName;
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
		[aCoder encodeObject:self.BelongEnterprise forKey:kDYJXXYAdminUsersBelongEnterprise];
	}
	if(self.Business != nil){
		[aCoder encodeObject:self.Business forKey:kDYJXXYAdminUsersBusiness];
	}
	if(self.Cellphone != nil){
		[aCoder encodeObject:self.Cellphone forKey:kDYJXXYAdminUsersCellphone];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDYJXXYAdminUsersCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDYJXXYAdminUsersDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDYJXXYAdminUsersDisabled];	if(self.DisplayName != nil){
		[aCoder encodeObject:self.DisplayName forKey:kDYJXXYAdminUsersDisplayName];
	}
	if(self.DisplayTel != nil){
		[aCoder encodeObject:self.DisplayTel forKey:kDYJXXYAdminUsersDisplayTel];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDYJXXYAdminUsersId];
	}
	[aCoder encodeObject:@(self.Number) forKey:kDYJXXYAdminUsersNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kDYJXXYAdminUsersNumberString];
	}
	if(self.RongCloudToken != nil){
		[aCoder encodeObject:self.RongCloudToken forKey:kDYJXXYAdminUsersRongCloudToken];
	}
	[aCoder encodeObject:@(self.Type) forKey:kDYJXXYAdminUsersType];	if(self.UpdateBy != nil){
		[aCoder encodeObject:self.UpdateBy forKey:kDYJXXYAdminUsersUpdateBy];
	}
	if(self.UpdateOn != nil){
		[aCoder encodeObject:self.UpdateOn forKey:kDYJXXYAdminUsersUpdateOn];
	}
	if(self.UserName != nil){
		[aCoder encodeObject:self.UserName forKey:kDYJXXYAdminUsersUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.BelongEnterprise = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersBelongEnterprise];
	self.Business = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersBusiness];
	self.Cellphone = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersCellphone];
	self.CreateOn = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDYJXXYAdminUsersDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDYJXXYAdminUsersDisabled] boolValue];
	self.DisplayName = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersDisplayName];
	self.DisplayTel = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersDisplayTel];
	self.Id = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersId];
	self.Number = [[aDecoder decodeObjectForKey:kDYJXXYAdminUsersNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersNumberString];
	self.RongCloudToken = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersRongCloudToken];
	self.Type = [[aDecoder decodeObjectForKey:kDYJXXYAdminUsersType] integerValue];
	self.UpdateBy = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersUpdateBy];
	self.UpdateOn = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersUpdateOn];
	self.UserName = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXXYAdminUsers *copy = [DYJXXYAdminUsers new];

	copy.BelongEnterprise = [self.BelongEnterprise copy];
	copy.Business = [self.Business copy];
	copy.Cellphone = [self.Cellphone copy];
	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.DisplayName = [self.DisplayName copy];
	copy.DisplayTel = [self.DisplayTel copy];
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
