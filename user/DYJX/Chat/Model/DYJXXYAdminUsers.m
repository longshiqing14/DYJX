//
//	DYJXXYAdminUsers.m
//
//	Create by 岩 熊 on 7/12/2018
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
NSString *const kDYJXXYAdminUsersIdField = @"Id";
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
		self.belongEnterprise = dictionary[kDYJXXYAdminUsersBelongEnterprise];
	}	
	if(![dictionary[kDYJXXYAdminUsersBusiness] isKindOfClass:[NSNull class]]){
		self.business = [[DYJXXYBusines alloc] initWithDictionary:dictionary[kDYJXXYAdminUsersBusiness]];
	}

	if(![dictionary[kDYJXXYAdminUsersCellphone] isKindOfClass:[NSNull class]]){
		self.cellphone = dictionary[kDYJXXYAdminUsersCellphone];
	}	
	if(![dictionary[kDYJXXYAdminUsersCreateOn] isKindOfClass:[NSNull class]]){
		self.createOn = dictionary[kDYJXXYAdminUsersCreateOn];
	}	
	if(![dictionary[kDYJXXYAdminUsersDeleted] isKindOfClass:[NSNull class]]){
		self.deleted = [dictionary[kDYJXXYAdminUsersDeleted] boolValue];
	}

	if(![dictionary[kDYJXXYAdminUsersDisabled] isKindOfClass:[NSNull class]]){
		self.disabled = [dictionary[kDYJXXYAdminUsersDisabled] boolValue];
	}

	if(![dictionary[kDYJXXYAdminUsersDisplayName] isKindOfClass:[NSNull class]]){
		self.displayName = dictionary[kDYJXXYAdminUsersDisplayName];
	}	
	if(![dictionary[kDYJXXYAdminUsersDisplayTel] isKindOfClass:[NSNull class]]){
		self.displayTel = dictionary[kDYJXXYAdminUsersDisplayTel];
	}	
	if(![dictionary[kDYJXXYAdminUsersIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kDYJXXYAdminUsersIdField];
	}	
	if(![dictionary[kDYJXXYAdminUsersNumber] isKindOfClass:[NSNull class]]){
		self.number = [dictionary[kDYJXXYAdminUsersNumber] integerValue];
	}

	if(![dictionary[kDYJXXYAdminUsersNumberString] isKindOfClass:[NSNull class]]){
		self.numberString = dictionary[kDYJXXYAdminUsersNumberString];
	}	
	if(![dictionary[kDYJXXYAdminUsersRongCloudToken] isKindOfClass:[NSNull class]]){
		self.rongCloudToken = dictionary[kDYJXXYAdminUsersRongCloudToken];
	}	
	if(![dictionary[kDYJXXYAdminUsersType] isKindOfClass:[NSNull class]]){
		self.type = [dictionary[kDYJXXYAdminUsersType] integerValue];
	}

	if(![dictionary[kDYJXXYAdminUsersUpdateBy] isKindOfClass:[NSNull class]]){
		self.updateBy = dictionary[kDYJXXYAdminUsersUpdateBy];
	}	
	if(![dictionary[kDYJXXYAdminUsersUpdateOn] isKindOfClass:[NSNull class]]){
		self.updateOn = dictionary[kDYJXXYAdminUsersUpdateOn];
	}	
	if(![dictionary[kDYJXXYAdminUsersUserName] isKindOfClass:[NSNull class]]){
		self.userName = dictionary[kDYJXXYAdminUsersUserName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.belongEnterprise != nil){
		dictionary[kDYJXXYAdminUsersBelongEnterprise] = self.belongEnterprise;
	}
	if(self.business != nil){
		dictionary[kDYJXXYAdminUsersBusiness] = [self.business toDictionary];
	}
	if(self.cellphone != nil){
		dictionary[kDYJXXYAdminUsersCellphone] = self.cellphone;
	}
	if(self.createOn != nil){
		dictionary[kDYJXXYAdminUsersCreateOn] = self.createOn;
	}
	dictionary[kDYJXXYAdminUsersDeleted] = @(self.deleted);
	dictionary[kDYJXXYAdminUsersDisabled] = @(self.disabled);
	if(self.displayName != nil){
		dictionary[kDYJXXYAdminUsersDisplayName] = self.displayName;
	}
	if(self.displayTel != nil){
		dictionary[kDYJXXYAdminUsersDisplayTel] = self.displayTel;
	}
	if(self.idField != nil){
		dictionary[kDYJXXYAdminUsersIdField] = self.idField;
	}
	dictionary[kDYJXXYAdminUsersNumber] = @(self.number);
	if(self.numberString != nil){
		dictionary[kDYJXXYAdminUsersNumberString] = self.numberString;
	}
	if(self.rongCloudToken != nil){
		dictionary[kDYJXXYAdminUsersRongCloudToken] = self.rongCloudToken;
	}
	dictionary[kDYJXXYAdminUsersType] = @(self.type);
	if(self.updateBy != nil){
		dictionary[kDYJXXYAdminUsersUpdateBy] = self.updateBy;
	}
	if(self.updateOn != nil){
		dictionary[kDYJXXYAdminUsersUpdateOn] = self.updateOn;
	}
	if(self.userName != nil){
		dictionary[kDYJXXYAdminUsersUserName] = self.userName;
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
	if(self.belongEnterprise != nil){
		[aCoder encodeObject:self.belongEnterprise forKey:kDYJXXYAdminUsersBelongEnterprise];
	}
	if(self.business != nil){
		[aCoder encodeObject:self.business forKey:kDYJXXYAdminUsersBusiness];
	}
	if(self.cellphone != nil){
		[aCoder encodeObject:self.cellphone forKey:kDYJXXYAdminUsersCellphone];
	}
	if(self.createOn != nil){
		[aCoder encodeObject:self.createOn forKey:kDYJXXYAdminUsersCreateOn];
	}
	[aCoder encodeObject:@(self.deleted) forKey:kDYJXXYAdminUsersDeleted];	[aCoder encodeObject:@(self.disabled) forKey:kDYJXXYAdminUsersDisabled];	if(self.displayName != nil){
		[aCoder encodeObject:self.displayName forKey:kDYJXXYAdminUsersDisplayName];
	}
	if(self.displayTel != nil){
		[aCoder encodeObject:self.displayTel forKey:kDYJXXYAdminUsersDisplayTel];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kDYJXXYAdminUsersIdField];
	}
	[aCoder encodeObject:@(self.number) forKey:kDYJXXYAdminUsersNumber];	if(self.numberString != nil){
		[aCoder encodeObject:self.numberString forKey:kDYJXXYAdminUsersNumberString];
	}
	if(self.rongCloudToken != nil){
		[aCoder encodeObject:self.rongCloudToken forKey:kDYJXXYAdminUsersRongCloudToken];
	}
	[aCoder encodeObject:@(self.type) forKey:kDYJXXYAdminUsersType];	if(self.updateBy != nil){
		[aCoder encodeObject:self.updateBy forKey:kDYJXXYAdminUsersUpdateBy];
	}
	if(self.updateOn != nil){
		[aCoder encodeObject:self.updateOn forKey:kDYJXXYAdminUsersUpdateOn];
	}
	if(self.userName != nil){
		[aCoder encodeObject:self.userName forKey:kDYJXXYAdminUsersUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.belongEnterprise = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersBelongEnterprise];
	self.business = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersBusiness];
	self.cellphone = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersCellphone];
	self.createOn = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersCreateOn];
	self.deleted = [[aDecoder decodeObjectForKey:kDYJXXYAdminUsersDeleted] boolValue];
	self.disabled = [[aDecoder decodeObjectForKey:kDYJXXYAdminUsersDisabled] boolValue];
	self.displayName = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersDisplayName];
	self.displayTel = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersDisplayTel];
	self.idField = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersIdField];
	self.number = [[aDecoder decodeObjectForKey:kDYJXXYAdminUsersNumber] integerValue];
	self.numberString = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersNumberString];
	self.rongCloudToken = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersRongCloudToken];
	self.type = [[aDecoder decodeObjectForKey:kDYJXXYAdminUsersType] integerValue];
	self.updateBy = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersUpdateBy];
	self.updateOn = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersUpdateOn];
	self.userName = [aDecoder decodeObjectForKey:kDYJXXYAdminUsersUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXXYAdminUsers *copy = [DYJXXYAdminUsers new];

	copy.belongEnterprise = [self.belongEnterprise copy];
	copy.business = [self.business copy];
	copy.cellphone = [self.cellphone copy];
	copy.createOn = [self.createOn copy];
	copy.deleted = self.deleted;
	copy.disabled = self.disabled;
	copy.displayName = [self.displayName copy];
	copy.displayTel = [self.displayTel copy];
	copy.idField = [self.idField copy];
	copy.number = self.number;
	copy.numberString = [self.numberString copy];
	copy.rongCloudToken = [self.rongCloudToken copy];
	copy.type = self.type;
	copy.updateBy = [self.updateBy copy];
	copy.updateOn = [self.updateOn copy];
	copy.userName = [self.userName copy];

	return copy;
}
@end