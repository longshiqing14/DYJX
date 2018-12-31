//
//	XYDYJXResult.m
//
//	Create by 岩 熊 on 18/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "XYDYJXResult.h"

NSString *const kXYDYJXResultBelongEnterprise = @"BelongEnterprise";
NSString *const kXYDYJXResultBindUserId = @"BindUserId";
NSString *const kXYDYJXResultCellphone = @"Cellphone";
NSString *const kXYDYJXResultCityID = @"CityID";
NSString *const kXYDYJXResultContactEnterprise = @"ContactEnterprise";
NSString *const kXYDYJXResultContactType = @"ContactType";
NSString *const kXYDYJXResultCreateBy = @"CreateBy";
NSString *const kXYDYJXResultCreateOn = @"CreateOn";
NSString *const kXYDYJXResultDeleted = @"Deleted";
NSString *const kXYDYJXResultDisabled = @"Disabled";
NSString *const kXYDYJXResultDistrictID = @"DistrictID";
NSString *const kXYDYJXResultIMUser = @"IMUser";
NSString *const kXYDYJXResultId = @"Id";
NSString *const kXYDYJXResultNumber = @"Number";
NSString *const kXYDYJXResultNumberString = @"NumberString";
NSString *const kXYDYJXResultProvinceID = @"ProvinceID";
NSString *const kXYDYJXResultResource = @"Resource";
NSString *const kXYDYJXResultUpdateBy = @"UpdateBy";
NSString *const kXYDYJXResultUpdateOn = @"UpdateOn";
NSString *const kXYDYJXResultUserId = @"UserId";
NSString *const kXYDYJXResultUserName = @"UserName";
NSString *const kXYDYJXResultUserType = @"UserType";

@interface XYDYJXResult ()
@end
@implementation XYDYJXResult




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kXYDYJXResultBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.BelongEnterprise = dictionary[kXYDYJXResultBelongEnterprise];
	}	
	if(![dictionary[kXYDYJXResultBindUserId] isKindOfClass:[NSNull class]]){
		self.BindUserId = dictionary[kXYDYJXResultBindUserId];
	}	
	if(![dictionary[kXYDYJXResultCellphone] isKindOfClass:[NSNull class]]){
		self.Cellphone = dictionary[kXYDYJXResultCellphone];
	}	
	if(![dictionary[kXYDYJXResultCityID] isKindOfClass:[NSNull class]]){
		self.CityID = [dictionary[kXYDYJXResultCityID] integerValue];
	}

	if(![dictionary[kXYDYJXResultContactEnterprise] isKindOfClass:[NSNull class]]){
		self.ContactEnterprise = dictionary[kXYDYJXResultContactEnterprise];
	}	
	if(![dictionary[kXYDYJXResultContactType] isKindOfClass:[NSNull class]]){
		self.ContactType = [dictionary[kXYDYJXResultContactType] integerValue];
	}

	if(![dictionary[kXYDYJXResultCreateBy] isKindOfClass:[NSNull class]]){
		self.CreateBy = dictionary[kXYDYJXResultCreateBy];
	}	
	if(![dictionary[kXYDYJXResultCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kXYDYJXResultCreateOn];
	}	
	if(![dictionary[kXYDYJXResultDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kXYDYJXResultDeleted] boolValue];
	}

	if(![dictionary[kXYDYJXResultDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kXYDYJXResultDisabled] boolValue];
	}

	if(![dictionary[kXYDYJXResultDistrictID] isKindOfClass:[NSNull class]]){
		self.DistrictID = [dictionary[kXYDYJXResultDistrictID] integerValue];
	}

	if(![dictionary[kXYDYJXResultIMUser] isKindOfClass:[NSNull class]]){
		self.IMUser = [[XYDYJXIMUser alloc] initWithDictionary:dictionary[kXYDYJXResultIMUser]];
	}

	if(![dictionary[kXYDYJXResultId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kXYDYJXResultId];
	}	
	if(![dictionary[kXYDYJXResultNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kXYDYJXResultNumber] integerValue];
	}

	if(![dictionary[kXYDYJXResultNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kXYDYJXResultNumberString];
	}	
	if(![dictionary[kXYDYJXResultProvinceID] isKindOfClass:[NSNull class]]){
		self.ProvinceID = [dictionary[kXYDYJXResultProvinceID] integerValue];
	}

	if(![dictionary[kXYDYJXResultResource] isKindOfClass:[NSNull class]]){
		self.Resource = [dictionary[kXYDYJXResultResource] integerValue];
	}

	if(![dictionary[kXYDYJXResultUpdateBy] isKindOfClass:[NSNull class]]){
		self.UpdateBy = dictionary[kXYDYJXResultUpdateBy];
	}	
	if(![dictionary[kXYDYJXResultUpdateOn] isKindOfClass:[NSNull class]]){
		self.UpdateOn = dictionary[kXYDYJXResultUpdateOn];
	}	
	if(![dictionary[kXYDYJXResultUserId] isKindOfClass:[NSNull class]]){
		self.UserId = dictionary[kXYDYJXResultUserId];
	}	
	if(![dictionary[kXYDYJXResultUserName] isKindOfClass:[NSNull class]]){
		self.UserName = dictionary[kXYDYJXResultUserName];
	}	
	if(![dictionary[kXYDYJXResultUserType] isKindOfClass:[NSNull class]]){
		self.UserType = [dictionary[kXYDYJXResultUserType] integerValue];
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
		dictionary[kXYDYJXResultBelongEnterprise] = self.BelongEnterprise;
	}
	if(self.BindUserId != nil){
		dictionary[kXYDYJXResultBindUserId] = self.BindUserId;
	}
	if(self.Cellphone != nil){
		dictionary[kXYDYJXResultCellphone] = self.Cellphone;
	}
	dictionary[kXYDYJXResultCityID] = @(self.CityID);
	if(self.ContactEnterprise != nil){
		dictionary[kXYDYJXResultContactEnterprise] = self.ContactEnterprise;
	}
	dictionary[kXYDYJXResultContactType] = @(self.ContactType);
	if(self.CreateBy != nil){
		dictionary[kXYDYJXResultCreateBy] = self.CreateBy;
	}
	if(self.CreateOn != nil){
		dictionary[kXYDYJXResultCreateOn] = self.CreateOn;
	}
	dictionary[kXYDYJXResultDeleted] = @(self.Deleted);
	dictionary[kXYDYJXResultDisabled] = @(self.Disabled);
	dictionary[kXYDYJXResultDistrictID] = @(self.DistrictID);
	if(self.IMUser != nil){
		dictionary[kXYDYJXResultIMUser] = [self.IMUser toDictionary];
	}
	if(self.Id != nil){
		dictionary[kXYDYJXResultId] = self.Id;
	}
	dictionary[kXYDYJXResultNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kXYDYJXResultNumberString] = self.NumberString;
	}
	dictionary[kXYDYJXResultProvinceID] = @(self.ProvinceID);
	dictionary[kXYDYJXResultResource] = @(self.Resource);
	if(self.UpdateBy != nil){
		dictionary[kXYDYJXResultUpdateBy] = self.UpdateBy;
	}
	if(self.UpdateOn != nil){
		dictionary[kXYDYJXResultUpdateOn] = self.UpdateOn;
	}
	if(self.UserId != nil){
		dictionary[kXYDYJXResultUserId] = self.UserId;
	}
	if(self.UserName != nil){
		dictionary[kXYDYJXResultUserName] = self.UserName;
	}
	dictionary[kXYDYJXResultUserType] = @(self.UserType);
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
		[aCoder encodeObject:self.BelongEnterprise forKey:kXYDYJXResultBelongEnterprise];
	}
	if(self.BindUserId != nil){
		[aCoder encodeObject:self.BindUserId forKey:kXYDYJXResultBindUserId];
	}
	if(self.Cellphone != nil){
		[aCoder encodeObject:self.Cellphone forKey:kXYDYJXResultCellphone];
	}
	[aCoder encodeObject:@(self.CityID) forKey:kXYDYJXResultCityID];	if(self.ContactEnterprise != nil){
		[aCoder encodeObject:self.ContactEnterprise forKey:kXYDYJXResultContactEnterprise];
	}
	[aCoder encodeObject:@(self.ContactType) forKey:kXYDYJXResultContactType];	if(self.CreateBy != nil){
		[aCoder encodeObject:self.CreateBy forKey:kXYDYJXResultCreateBy];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kXYDYJXResultCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kXYDYJXResultDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kXYDYJXResultDisabled];	[aCoder encodeObject:@(self.DistrictID) forKey:kXYDYJXResultDistrictID];	if(self.IMUser != nil){
		[aCoder encodeObject:self.IMUser forKey:kXYDYJXResultIMUser];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kXYDYJXResultId];
	}
	[aCoder encodeObject:@(self.Number) forKey:kXYDYJXResultNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kXYDYJXResultNumberString];
	}
	[aCoder encodeObject:@(self.ProvinceID) forKey:kXYDYJXResultProvinceID];	[aCoder encodeObject:@(self.Resource) forKey:kXYDYJXResultResource];	if(self.UpdateBy != nil){
		[aCoder encodeObject:self.UpdateBy forKey:kXYDYJXResultUpdateBy];
	}
	if(self.UpdateOn != nil){
		[aCoder encodeObject:self.UpdateOn forKey:kXYDYJXResultUpdateOn];
	}
	if(self.UserId != nil){
		[aCoder encodeObject:self.UserId forKey:kXYDYJXResultUserId];
	}
	if(self.UserName != nil){
		[aCoder encodeObject:self.UserName forKey:kXYDYJXResultUserName];
	}
	[aCoder encodeObject:@(self.UserType) forKey:kXYDYJXResultUserType];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.BelongEnterprise = [aDecoder decodeObjectForKey:kXYDYJXResultBelongEnterprise];
	self.BindUserId = [aDecoder decodeObjectForKey:kXYDYJXResultBindUserId];
	self.Cellphone = [aDecoder decodeObjectForKey:kXYDYJXResultCellphone];
	self.CityID = [[aDecoder decodeObjectForKey:kXYDYJXResultCityID] integerValue];
	self.ContactEnterprise = [aDecoder decodeObjectForKey:kXYDYJXResultContactEnterprise];
	self.ContactType = [[aDecoder decodeObjectForKey:kXYDYJXResultContactType] integerValue];
	self.CreateBy = [aDecoder decodeObjectForKey:kXYDYJXResultCreateBy];
	self.CreateOn = [aDecoder decodeObjectForKey:kXYDYJXResultCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kXYDYJXResultDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kXYDYJXResultDisabled] boolValue];
	self.DistrictID = [[aDecoder decodeObjectForKey:kXYDYJXResultDistrictID] integerValue];
	self.IMUser = [aDecoder decodeObjectForKey:kXYDYJXResultIMUser];
	self.Id = [aDecoder decodeObjectForKey:kXYDYJXResultId];
	self.Number = [[aDecoder decodeObjectForKey:kXYDYJXResultNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kXYDYJXResultNumberString];
	self.ProvinceID = [[aDecoder decodeObjectForKey:kXYDYJXResultProvinceID] integerValue];
	self.Resource = [[aDecoder decodeObjectForKey:kXYDYJXResultResource] integerValue];
	self.UpdateBy = [aDecoder decodeObjectForKey:kXYDYJXResultUpdateBy];
	self.UpdateOn = [aDecoder decodeObjectForKey:kXYDYJXResultUpdateOn];
	self.UserId = [aDecoder decodeObjectForKey:kXYDYJXResultUserId];
	self.UserName = [aDecoder decodeObjectForKey:kXYDYJXResultUserName];
	self.UserType = [[aDecoder decodeObjectForKey:kXYDYJXResultUserType] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	XYDYJXResult *copy = [XYDYJXResult new];

	copy.BelongEnterprise = [self.BelongEnterprise copy];
	copy.BindUserId = [self.BindUserId copy];
	copy.Cellphone = [self.Cellphone copy];
	copy.CityID = self.CityID;
	copy.ContactEnterprise = [self.ContactEnterprise copy];
	copy.ContactType = self.ContactType;
	copy.CreateBy = [self.CreateBy copy];
	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.DistrictID = self.DistrictID;
	copy.IMUser = [self.IMUser copy];
	copy.Id = [self.Id copy];
	copy.Number = self.Number;
	copy.NumberString = [self.NumberString copy];
	copy.ProvinceID = self.ProvinceID;
	copy.Resource = self.Resource;
	copy.UpdateBy = [self.UpdateBy copy];
	copy.UpdateOn = [self.UpdateOn copy];
	copy.UserId = [self.UserId copy];
	copy.UserName = [self.UserName copy];
	copy.UserType = self.UserType;

	return copy;
}
@end
