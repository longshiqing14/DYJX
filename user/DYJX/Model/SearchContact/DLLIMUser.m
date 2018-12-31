//
//	DLLIMUser.m
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DLLIMUser.h"

NSString *const kDLLIMUserBelongEnterprise = @"BelongEnterprise";
NSString *const kDLLIMUserBusiness = @"Business";
NSString *const kDLLIMUserCellphone = @"Cellphone";
NSString *const kDLLIMUserCreateOn = @"CreateOn";
NSString *const kDLLIMUserDeleted = @"Deleted";
NSString *const kDLLIMUserDisabled = @"Disabled";
NSString *const kDLLIMUserDisplayName = @"DisplayName";
NSString *const kDLLIMUserDisplayTel = @"DisplayTel";
NSString *const kDLLIMUserId = @"Id";
NSString *const kDLLIMUserNumber = @"Number";
NSString *const kDLLIMUserNumberString = @"NumberString";
NSString *const kDLLIMUserRongCloudToken = @"RongCloudToken";
NSString *const kDLLIMUserType = @"Type";
NSString *const kDLLIMUserUpdateBy = @"UpdateBy";
NSString *const kDLLIMUserUpdateOn = @"UpdateOn";
NSString *const kDLLIMUserUserName = @"UserName";

@interface DLLIMUser ()
@end
@implementation DLLIMUser




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDLLIMUserBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.BelongEnterprise = dictionary[kDLLIMUserBelongEnterprise];
	}	
	if(![dictionary[kDLLIMUserBusiness] isKindOfClass:[NSNull class]]){
		self.Business = [[DLLBusines alloc] initWithDictionary:dictionary[kDLLIMUserBusiness]];
	}

	if(![dictionary[kDLLIMUserCellphone] isKindOfClass:[NSNull class]]){
		self.Cellphone = dictionary[kDLLIMUserCellphone];
	}	
	if(![dictionary[kDLLIMUserCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDLLIMUserCreateOn];
	}	
	if(![dictionary[kDLLIMUserDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDLLIMUserDeleted] boolValue];
	}

	if(![dictionary[kDLLIMUserDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDLLIMUserDisabled] boolValue];
	}

	if(![dictionary[kDLLIMUserDisplayName] isKindOfClass:[NSNull class]]){
		self.DisplayName = dictionary[kDLLIMUserDisplayName];
	}	
	if(![dictionary[kDLLIMUserDisplayTel] isKindOfClass:[NSNull class]]){
		self.DisplayTel = dictionary[kDLLIMUserDisplayTel];
	}	
	if(![dictionary[kDLLIMUserId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDLLIMUserId];
	}	
	if(![dictionary[kDLLIMUserNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kDLLIMUserNumber] integerValue];
	}

	if(![dictionary[kDLLIMUserNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kDLLIMUserNumberString];
	}	
	if(![dictionary[kDLLIMUserRongCloudToken] isKindOfClass:[NSNull class]]){
		self.RongCloudToken = dictionary[kDLLIMUserRongCloudToken];
	}	
	if(![dictionary[kDLLIMUserType] isKindOfClass:[NSNull class]]){
		self.Type = [dictionary[kDLLIMUserType] integerValue];
	}

	if(![dictionary[kDLLIMUserUpdateBy] isKindOfClass:[NSNull class]]){
		self.UpdateBy = dictionary[kDLLIMUserUpdateBy];
	}	
	if(![dictionary[kDLLIMUserUpdateOn] isKindOfClass:[NSNull class]]){
		self.UpdateOn = dictionary[kDLLIMUserUpdateOn];
	}	
	if(![dictionary[kDLLIMUserUserName] isKindOfClass:[NSNull class]]){
		self.UserName = dictionary[kDLLIMUserUserName];
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
		dictionary[kDLLIMUserBelongEnterprise] = self.BelongEnterprise;
	}
	if(self.Business != nil){
		dictionary[kDLLIMUserBusiness] = [self.Business toDictionary];
	}
	if(self.Cellphone != nil){
		dictionary[kDLLIMUserCellphone] = self.Cellphone;
	}
	if(self.CreateOn != nil){
		dictionary[kDLLIMUserCreateOn] = self.CreateOn;
	}
	dictionary[kDLLIMUserDeleted] = @(self.Deleted);
	dictionary[kDLLIMUserDisabled] = @(self.Disabled);
	if(self.DisplayName != nil){
		dictionary[kDLLIMUserDisplayName] = self.DisplayName;
	}
	if(self.DisplayTel != nil){
		dictionary[kDLLIMUserDisplayTel] = self.DisplayTel;
	}
	if(self.Id != nil){
		dictionary[kDLLIMUserId] = self.Id;
	}
	dictionary[kDLLIMUserNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kDLLIMUserNumberString] = self.NumberString;
	}
	if(self.RongCloudToken != nil){
		dictionary[kDLLIMUserRongCloudToken] = self.RongCloudToken;
	}
	dictionary[kDLLIMUserType] = @(self.Type);
	if(self.UpdateBy != nil){
		dictionary[kDLLIMUserUpdateBy] = self.UpdateBy;
	}
	if(self.UpdateOn != nil){
		dictionary[kDLLIMUserUpdateOn] = self.UpdateOn;
	}
	if(self.UserName != nil){
		dictionary[kDLLIMUserUserName] = self.UserName;
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
		[aCoder encodeObject:self.BelongEnterprise forKey:kDLLIMUserBelongEnterprise];
	}
	if(self.Business != nil){
		[aCoder encodeObject:self.Business forKey:kDLLIMUserBusiness];
	}
	if(self.Cellphone != nil){
		[aCoder encodeObject:self.Cellphone forKey:kDLLIMUserCellphone];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDLLIMUserCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDLLIMUserDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDLLIMUserDisabled];	if(self.DisplayName != nil){
		[aCoder encodeObject:self.DisplayName forKey:kDLLIMUserDisplayName];
	}
	if(self.DisplayTel != nil){
		[aCoder encodeObject:self.DisplayTel forKey:kDLLIMUserDisplayTel];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDLLIMUserId];
	}
	[aCoder encodeObject:@(self.Number) forKey:kDLLIMUserNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kDLLIMUserNumberString];
	}
	if(self.RongCloudToken != nil){
		[aCoder encodeObject:self.RongCloudToken forKey:kDLLIMUserRongCloudToken];
	}
	[aCoder encodeObject:@(self.Type) forKey:kDLLIMUserType];	if(self.UpdateBy != nil){
		[aCoder encodeObject:self.UpdateBy forKey:kDLLIMUserUpdateBy];
	}
	if(self.UpdateOn != nil){
		[aCoder encodeObject:self.UpdateOn forKey:kDLLIMUserUpdateOn];
	}
	if(self.UserName != nil){
		[aCoder encodeObject:self.UserName forKey:kDLLIMUserUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.BelongEnterprise = [aDecoder decodeObjectForKey:kDLLIMUserBelongEnterprise];
	self.Business = [aDecoder decodeObjectForKey:kDLLIMUserBusiness];
	self.Cellphone = [aDecoder decodeObjectForKey:kDLLIMUserCellphone];
	self.CreateOn = [aDecoder decodeObjectForKey:kDLLIMUserCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDLLIMUserDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDLLIMUserDisabled] boolValue];
	self.DisplayName = [aDecoder decodeObjectForKey:kDLLIMUserDisplayName];
	self.DisplayTel = [aDecoder decodeObjectForKey:kDLLIMUserDisplayTel];
	self.Id = [aDecoder decodeObjectForKey:kDLLIMUserId];
	self.Number = [[aDecoder decodeObjectForKey:kDLLIMUserNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kDLLIMUserNumberString];
	self.RongCloudToken = [aDecoder decodeObjectForKey:kDLLIMUserRongCloudToken];
	self.Type = [[aDecoder decodeObjectForKey:kDLLIMUserType] integerValue];
	self.UpdateBy = [aDecoder decodeObjectForKey:kDLLIMUserUpdateBy];
	self.UpdateOn = [aDecoder decodeObjectForKey:kDLLIMUserUpdateOn];
	self.UserName = [aDecoder decodeObjectForKey:kDLLIMUserUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DLLIMUser *copy = [DLLIMUser new];

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
