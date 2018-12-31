//
//	XYDYJXIMUser.m
//
//	Create by 岩 熊 on 18/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "XYDYJXIMUser.h"

NSString *const kXYDYJXIMUserBelongEnterprise = @"BelongEnterprise";
NSString *const kXYDYJXIMUserBusiness = @"Business";
NSString *const kXYDYJXIMUserCellphone = @"Cellphone";
NSString *const kXYDYJXIMUserCreateOn = @"CreateOn";
NSString *const kXYDYJXIMUserDeleted = @"Deleted";
NSString *const kXYDYJXIMUserDisabled = @"Disabled";
NSString *const kXYDYJXIMUserDisplayName = @"DisplayName";
NSString *const kXYDYJXIMUserDisplayTel = @"DisplayTel";
NSString *const kXYDYJXIMUserId = @"Id";
NSString *const kXYDYJXIMUserNumber = @"Number";
NSString *const kXYDYJXIMUserNumberString = @"NumberString";
NSString *const kXYDYJXIMUserRongCloudToken = @"RongCloudToken";
NSString *const kXYDYJXIMUserType = @"Type";
NSString *const kXYDYJXIMUserUserName = @"UserName";

@interface XYDYJXIMUser ()
@end
@implementation XYDYJXIMUser




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kXYDYJXIMUserBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.BelongEnterprise = dictionary[kXYDYJXIMUserBelongEnterprise];
	}	
	if(![dictionary[kXYDYJXIMUserBusiness] isKindOfClass:[NSNull class]]){
		self.Business = [[XYDYJXBusines alloc] initWithDictionary:dictionary[kXYDYJXIMUserBusiness]];
	}

	if(![dictionary[kXYDYJXIMUserCellphone] isKindOfClass:[NSNull class]]){
		self.Cellphone = dictionary[kXYDYJXIMUserCellphone];
	}	
	if(![dictionary[kXYDYJXIMUserCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kXYDYJXIMUserCreateOn];
	}	
	if(![dictionary[kXYDYJXIMUserDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kXYDYJXIMUserDeleted] boolValue];
	}

	if(![dictionary[kXYDYJXIMUserDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kXYDYJXIMUserDisabled] boolValue];
	}

	if(![dictionary[kXYDYJXIMUserDisplayName] isKindOfClass:[NSNull class]]){
		self.DisplayName = dictionary[kXYDYJXIMUserDisplayName];
	}	
	if(![dictionary[kXYDYJXIMUserDisplayTel] isKindOfClass:[NSNull class]]){
		self.DisplayTel = dictionary[kXYDYJXIMUserDisplayTel];
	}	
	if(![dictionary[kXYDYJXIMUserId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kXYDYJXIMUserId];
	}	
	if(![dictionary[kXYDYJXIMUserNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kXYDYJXIMUserNumber] integerValue];
	}

	if(![dictionary[kXYDYJXIMUserNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kXYDYJXIMUserNumberString];
	}	
	if(![dictionary[kXYDYJXIMUserRongCloudToken] isKindOfClass:[NSNull class]]){
		self.RongCloudToken = dictionary[kXYDYJXIMUserRongCloudToken];
	}	
	if(![dictionary[kXYDYJXIMUserType] isKindOfClass:[NSNull class]]){
		self.Type = [dictionary[kXYDYJXIMUserType] integerValue];
	}

	if(![dictionary[kXYDYJXIMUserUserName] isKindOfClass:[NSNull class]]){
		self.UserName = dictionary[kXYDYJXIMUserUserName];
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
		dictionary[kXYDYJXIMUserBelongEnterprise] = self.BelongEnterprise;
	}
	if(self.Business != nil){
		dictionary[kXYDYJXIMUserBusiness] = [self.Business toDictionary];
	}
	if(self.Cellphone != nil){
		dictionary[kXYDYJXIMUserCellphone] = self.Cellphone;
	}
	if(self.CreateOn != nil){
		dictionary[kXYDYJXIMUserCreateOn] = self.CreateOn;
	}
	dictionary[kXYDYJXIMUserDeleted] = @(self.Deleted);
	dictionary[kXYDYJXIMUserDisabled] = @(self.Disabled);
	if(self.DisplayName != nil){
		dictionary[kXYDYJXIMUserDisplayName] = self.DisplayName;
	}
	if(self.DisplayTel != nil){
		dictionary[kXYDYJXIMUserDisplayTel] = self.DisplayTel;
	}
	if(self.Id != nil){
		dictionary[kXYDYJXIMUserId] = self.Id;
	}
	dictionary[kXYDYJXIMUserNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kXYDYJXIMUserNumberString] = self.NumberString;
	}
	if(self.RongCloudToken != nil){
		dictionary[kXYDYJXIMUserRongCloudToken] = self.RongCloudToken;
	}
	dictionary[kXYDYJXIMUserType] = @(self.Type);
	if(self.UserName != nil){
		dictionary[kXYDYJXIMUserUserName] = self.UserName;
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
		[aCoder encodeObject:self.BelongEnterprise forKey:kXYDYJXIMUserBelongEnterprise];
	}
	if(self.Business != nil){
		[aCoder encodeObject:self.Business forKey:kXYDYJXIMUserBusiness];
	}
	if(self.Cellphone != nil){
		[aCoder encodeObject:self.Cellphone forKey:kXYDYJXIMUserCellphone];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kXYDYJXIMUserCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kXYDYJXIMUserDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kXYDYJXIMUserDisabled];	if(self.DisplayName != nil){
		[aCoder encodeObject:self.DisplayName forKey:kXYDYJXIMUserDisplayName];
	}
	if(self.DisplayTel != nil){
		[aCoder encodeObject:self.DisplayTel forKey:kXYDYJXIMUserDisplayTel];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kXYDYJXIMUserId];
	}
	[aCoder encodeObject:@(self.Number) forKey:kXYDYJXIMUserNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kXYDYJXIMUserNumberString];
	}
	if(self.RongCloudToken != nil){
		[aCoder encodeObject:self.RongCloudToken forKey:kXYDYJXIMUserRongCloudToken];
	}
	[aCoder encodeObject:@(self.Type) forKey:kXYDYJXIMUserType];	if(self.UserName != nil){
		[aCoder encodeObject:self.UserName forKey:kXYDYJXIMUserUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.BelongEnterprise = [aDecoder decodeObjectForKey:kXYDYJXIMUserBelongEnterprise];
	self.Business = [aDecoder decodeObjectForKey:kXYDYJXIMUserBusiness];
	self.Cellphone = [aDecoder decodeObjectForKey:kXYDYJXIMUserCellphone];
	self.CreateOn = [aDecoder decodeObjectForKey:kXYDYJXIMUserCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kXYDYJXIMUserDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kXYDYJXIMUserDisabled] boolValue];
	self.DisplayName = [aDecoder decodeObjectForKey:kXYDYJXIMUserDisplayName];
	self.DisplayTel = [aDecoder decodeObjectForKey:kXYDYJXIMUserDisplayTel];
	self.Id = [aDecoder decodeObjectForKey:kXYDYJXIMUserId];
	self.Number = [[aDecoder decodeObjectForKey:kXYDYJXIMUserNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kXYDYJXIMUserNumberString];
	self.RongCloudToken = [aDecoder decodeObjectForKey:kXYDYJXIMUserRongCloudToken];
	self.Type = [[aDecoder decodeObjectForKey:kXYDYJXIMUserType] integerValue];
	self.UserName = [aDecoder decodeObjectForKey:kXYDYJXIMUserUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	XYDYJXIMUser *copy = [XYDYJXIMUser new];

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
	copy.UserName = [self.UserName copy];

	return copy;
}
@end
