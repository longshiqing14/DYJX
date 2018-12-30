//
//	DLLResult.m
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DLLResult.h"

NSString *const kDLLResultBelongEnterprise = @"BelongEnterprise";
NSString *const kDLLResultBindUserId = @"BindUserId";
NSString *const kDLLResultCellphone = @"Cellphone";
NSString *const kDLLResultCityID = @"CityID";
NSString *const kDLLResultCompanyName = @"CompanyName";
NSString *const kDLLResultContactEnterprise = @"ContactEnterprise";
NSString *const kDLLResultContactType = @"ContactType";
NSString *const kDLLResultCreateBy = @"CreateBy";
NSString *const kDLLResultCreateOn = @"CreateOn";
NSString *const kDLLResultDeleted = @"Deleted";
NSString *const kDLLResultDisabled = @"Disabled";
NSString *const kDLLResultDistrictID = @"DistrictID";
NSString *const kDLLResultIMUser = @"IMUser";
NSString *const kDLLResultIdField = @"Id";
NSString *const kDLLResultNumber = @"Number";
NSString *const kDLLResultNumberString = @"NumberString";
NSString *const kDLLResultProvinceID = @"ProvinceID";
NSString *const kDLLResultResource = @"Resource";
NSString *const kDLLResultUpdateBy = @"UpdateBy";
NSString *const kDLLResultUpdateOn = @"UpdateOn";
NSString *const kDLLResultUserId = @"UserId";
NSString *const kDLLResultUserName = @"UserName";
NSString *const kDLLResultUserType = @"UserType";

@interface DLLResult ()
@end
@implementation DLLResult




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDLLResultBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.BelongEnterprise = dictionary[kDLLResultBelongEnterprise];
	}	
	if(![dictionary[kDLLResultBindUserId] isKindOfClass:[NSNull class]]){
		self.BindUserId = dictionary[kDLLResultBindUserId];
	}	
	if(![dictionary[kDLLResultCellphone] isKindOfClass:[NSNull class]]){
		self.Cellphone = dictionary[kDLLResultCellphone];
	}	
	if(![dictionary[kDLLResultCityID] isKindOfClass:[NSNull class]]){
		self.CityID = [dictionary[kDLLResultCityID] integerValue];
	}

	if(![dictionary[kDLLResultCompanyName] isKindOfClass:[NSNull class]]){
		self.CompanyName = dictionary[kDLLResultCompanyName];
	}	
	if(![dictionary[kDLLResultContactEnterprise] isKindOfClass:[NSNull class]]){
		self.ContactEnterprise = dictionary[kDLLResultContactEnterprise];
	}	
	if(![dictionary[kDLLResultContactType] isKindOfClass:[NSNull class]]){
		self.ContactType = [dictionary[kDLLResultContactType] integerValue];
	}

	if(![dictionary[kDLLResultCreateBy] isKindOfClass:[NSNull class]]){
		self.CreateBy = dictionary[kDLLResultCreateBy];
	}	
	if(![dictionary[kDLLResultCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDLLResultCreateOn];
	}	
	if(![dictionary[kDLLResultDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDLLResultDeleted] boolValue];
	}

	if(![dictionary[kDLLResultDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDLLResultDisabled] boolValue];
	}

	if(![dictionary[kDLLResultDistrictID] isKindOfClass:[NSNull class]]){
		self.DistrictID = [dictionary[kDLLResultDistrictID] integerValue];
	}

	if(![dictionary[kDLLResultIMUser] isKindOfClass:[NSNull class]]){
		self.IMUser = [[DLLIMUser alloc] initWithDictionary:dictionary[kDLLResultIMUser]];
	}

	if(![dictionary[kDLLResultIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kDLLResultIdField];
	}	
	if(![dictionary[kDLLResultNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kDLLResultNumber] integerValue];
	}

	if(![dictionary[kDLLResultNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kDLLResultNumberString];
	}	
	if(![dictionary[kDLLResultProvinceID] isKindOfClass:[NSNull class]]){
		self.ProvinceID = [dictionary[kDLLResultProvinceID] integerValue];
	}

	if(![dictionary[kDLLResultResource] isKindOfClass:[NSNull class]]){
		self.Resource = [dictionary[kDLLResultResource] integerValue];
	}

	if(![dictionary[kDLLResultUpdateBy] isKindOfClass:[NSNull class]]){
		self.UpdateBy = dictionary[kDLLResultUpdateBy];
	}	
	if(![dictionary[kDLLResultUpdateOn] isKindOfClass:[NSNull class]]){
		self.UpdateOn = dictionary[kDLLResultUpdateOn];
	}	
	if(![dictionary[kDLLResultUserId] isKindOfClass:[NSNull class]]){
		self.UserId = dictionary[kDLLResultUserId];
	}	
	if(![dictionary[kDLLResultUserName] isKindOfClass:[NSNull class]]){
		self.UserName = dictionary[kDLLResultUserName];
	}	
	if(![dictionary[kDLLResultUserType] isKindOfClass:[NSNull class]]){
		self.UserType = [dictionary[kDLLResultUserType] integerValue];
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
		dictionary[kDLLResultBelongEnterprise] = self.BelongEnterprise;
	}
	if(self.BindUserId != nil){
		dictionary[kDLLResultBindUserId] = self.BindUserId;
	}
	if(self.Cellphone != nil){
		dictionary[kDLLResultCellphone] = self.Cellphone;
	}
	dictionary[kDLLResultCityID] = @(self.CityID);
	if(self.CompanyName != nil){
		dictionary[kDLLResultCompanyName] = self.CompanyName;
	}
	if(self.ContactEnterprise != nil){
		dictionary[kDLLResultContactEnterprise] = self.ContactEnterprise;
	}
	dictionary[kDLLResultContactType] = @(self.ContactType);
	if(self.CreateBy != nil){
		dictionary[kDLLResultCreateBy] = self.CreateBy;
	}
	if(self.CreateOn != nil){
		dictionary[kDLLResultCreateOn] = self.CreateOn;
	}
	dictionary[kDLLResultDeleted] = @(self.Deleted);
	dictionary[kDLLResultDisabled] = @(self.Disabled);
	dictionary[kDLLResultDistrictID] = @(self.DistrictID);
	if(self.IMUser != nil){
		dictionary[kDLLResultIMUser] = [self.IMUser toDictionary];
	}
	if(self.IdField != nil){
		dictionary[kDLLResultIdField] = self.IdField;
	}
	dictionary[kDLLResultNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kDLLResultNumberString] = self.NumberString;
	}
	dictionary[kDLLResultProvinceID] = @(self.ProvinceID);
	dictionary[kDLLResultResource] = @(self.Resource);
	if(self.UpdateBy != nil){
		dictionary[kDLLResultUpdateBy] = self.UpdateBy;
	}
	if(self.UpdateOn != nil){
		dictionary[kDLLResultUpdateOn] = self.UpdateOn;
	}
	if(self.UserId != nil){
		dictionary[kDLLResultUserId] = self.UserId;
	}
	if(self.UserName != nil){
		dictionary[kDLLResultUserName] = self.UserName;
	}
	dictionary[kDLLResultUserType] = @(self.UserType);
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
		[aCoder encodeObject:self.BelongEnterprise forKey:kDLLResultBelongEnterprise];
	}
	if(self.BindUserId != nil){
		[aCoder encodeObject:self.BindUserId forKey:kDLLResultBindUserId];
	}
	if(self.Cellphone != nil){
		[aCoder encodeObject:self.Cellphone forKey:kDLLResultCellphone];
	}
	[aCoder encodeObject:@(self.CityID) forKey:kDLLResultCityID];	if(self.CompanyName != nil){
		[aCoder encodeObject:self.CompanyName forKey:kDLLResultCompanyName];
	}
	if(self.ContactEnterprise != nil){
		[aCoder encodeObject:self.ContactEnterprise forKey:kDLLResultContactEnterprise];
	}
	[aCoder encodeObject:@(self.ContactType) forKey:kDLLResultContactType];	if(self.CreateBy != nil){
		[aCoder encodeObject:self.CreateBy forKey:kDLLResultCreateBy];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDLLResultCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDLLResultDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDLLResultDisabled];	[aCoder encodeObject:@(self.DistrictID) forKey:kDLLResultDistrictID];	if(self.IMUser != nil){
		[aCoder encodeObject:self.IMUser forKey:kDLLResultIMUser];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kDLLResultIdField];
	}
	[aCoder encodeObject:@(self.Number) forKey:kDLLResultNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kDLLResultNumberString];
	}
	[aCoder encodeObject:@(self.ProvinceID) forKey:kDLLResultProvinceID];	[aCoder encodeObject:@(self.Resource) forKey:kDLLResultResource];	if(self.UpdateBy != nil){
		[aCoder encodeObject:self.UpdateBy forKey:kDLLResultUpdateBy];
	}
	if(self.UpdateOn != nil){
		[aCoder encodeObject:self.UpdateOn forKey:kDLLResultUpdateOn];
	}
	if(self.UserId != nil){
		[aCoder encodeObject:self.UserId forKey:kDLLResultUserId];
	}
	if(self.UserName != nil){
		[aCoder encodeObject:self.UserName forKey:kDLLResultUserName];
	}
	[aCoder encodeObject:@(self.UserType) forKey:kDLLResultUserType];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.BelongEnterprise = [aDecoder decodeObjectForKey:kDLLResultBelongEnterprise];
	self.BindUserId = [aDecoder decodeObjectForKey:kDLLResultBindUserId];
	self.Cellphone = [aDecoder decodeObjectForKey:kDLLResultCellphone];
	self.CityID = [[aDecoder decodeObjectForKey:kDLLResultCityID] integerValue];
	self.CompanyName = [aDecoder decodeObjectForKey:kDLLResultCompanyName];
	self.ContactEnterprise = [aDecoder decodeObjectForKey:kDLLResultContactEnterprise];
	self.ContactType = [[aDecoder decodeObjectForKey:kDLLResultContactType] integerValue];
	self.CreateBy = [aDecoder decodeObjectForKey:kDLLResultCreateBy];
	self.CreateOn = [aDecoder decodeObjectForKey:kDLLResultCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDLLResultDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDLLResultDisabled] boolValue];
	self.DistrictID = [[aDecoder decodeObjectForKey:kDLLResultDistrictID] integerValue];
	self.IMUser = [aDecoder decodeObjectForKey:kDLLResultIMUser];
	self.IdField = [aDecoder decodeObjectForKey:kDLLResultIdField];
	self.Number = [[aDecoder decodeObjectForKey:kDLLResultNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kDLLResultNumberString];
	self.ProvinceID = [[aDecoder decodeObjectForKey:kDLLResultProvinceID] integerValue];
	self.Resource = [[aDecoder decodeObjectForKey:kDLLResultResource] integerValue];
	self.UpdateBy = [aDecoder decodeObjectForKey:kDLLResultUpdateBy];
	self.UpdateOn = [aDecoder decodeObjectForKey:kDLLResultUpdateOn];
	self.UserId = [aDecoder decodeObjectForKey:kDLLResultUserId];
	self.UserName = [aDecoder decodeObjectForKey:kDLLResultUserName];
	self.UserType = [[aDecoder decodeObjectForKey:kDLLResultUserType] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DLLResult *copy = [DLLResult new];

	copy.BelongEnterprise = [self.BelongEnterprise copy];
	copy.BindUserId = [self.BindUserId copy];
	copy.Cellphone = [self.Cellphone copy];
	copy.CityID = self.CityID;
	copy.CompanyName = [self.CompanyName copy];
	copy.ContactEnterprise = [self.ContactEnterprise copy];
	copy.ContactType = self.ContactType;
	copy.CreateBy = [self.CreateBy copy];
	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.DistrictID = self.DistrictID;
	copy.IMUser = [self.IMUser copy];
	copy.IdField = [self.IdField copy];
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