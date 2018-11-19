//
//	DJJLMember.m
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJLMember.h"

NSString *const kDJJLMemberCellphone = @"Cellphone";
NSString *const kDJJLMemberCellphoneChecked = @"CellphoneChecked";
NSString *const kDJJLMemberCity = @"City";
NSString *const kDJJLMemberDistrict = @"District";
NSString *const kDJJLMemberFailureCount = @"FailureCount";
NSString *const kDJJLMemberNickName = @"NickName";
NSString *const kDJJLMemberParentID = @"ParentID";
NSString *const kDJJLMemberPassword = @"Password";
NSString *const kDJJLMemberProvince = @"Province";
NSString *const kDJJLMemberRegisterByAdmin = @"RegisterByAdmin";
NSString *const kDJJLMemberRegisterFrom = @"RegisterFrom";
NSString *const kDJJLMemberRegisterFromType = @"RegisterFromType";
NSString *const kDJJLMemberUserName = @"UserName";

@interface DJJLMember ()
@end
@implementation DJJLMember




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJLMemberCellphone] isKindOfClass:[NSNull class]]){
		self.Cellphone = dictionary[kDJJLMemberCellphone];
	}	
	if(![dictionary[kDJJLMemberCellphoneChecked] isKindOfClass:[NSNull class]]){
		self.CellphoneChecked = [dictionary[kDJJLMemberCellphoneChecked] boolValue];
	}

	if(![dictionary[kDJJLMemberCity] isKindOfClass:[NSNull class]]){
		self.City = [dictionary[kDJJLMemberCity] integerValue];
	}

	if(![dictionary[kDJJLMemberDistrict] isKindOfClass:[NSNull class]]){
		self.District = [dictionary[kDJJLMemberDistrict] integerValue];
	}

	if(![dictionary[kDJJLMemberFailureCount] isKindOfClass:[NSNull class]]){
		self.FailureCount = [dictionary[kDJJLMemberFailureCount] integerValue];
	}

	if(![dictionary[kDJJLMemberNickName] isKindOfClass:[NSNull class]]){
		self.NickName = dictionary[kDJJLMemberNickName];
	}	
	if(![dictionary[kDJJLMemberParentID] isKindOfClass:[NSNull class]]){
		self.ParentID = dictionary[kDJJLMemberParentID];
	}	
	if(![dictionary[kDJJLMemberPassword] isKindOfClass:[NSNull class]]){
		self.Password = dictionary[kDJJLMemberPassword];
	}	
	if(![dictionary[kDJJLMemberProvince] isKindOfClass:[NSNull class]]){
		self.Province = [dictionary[kDJJLMemberProvince] integerValue];
	}

	if(![dictionary[kDJJLMemberRegisterByAdmin] isKindOfClass:[NSNull class]]){
		self.RegisterByAdmin = [dictionary[kDJJLMemberRegisterByAdmin] boolValue];
	}

	if(![dictionary[kDJJLMemberRegisterFrom] isKindOfClass:[NSNull class]]){
		self.RegisterFrom = dictionary[kDJJLMemberRegisterFrom];
	}	
	if(![dictionary[kDJJLMemberRegisterFromType] isKindOfClass:[NSNull class]]){
		self.RegisterFromType = [dictionary[kDJJLMemberRegisterFromType] integerValue];
	}

	if(![dictionary[kDJJLMemberUserName] isKindOfClass:[NSNull class]]){
		self.UserName = dictionary[kDJJLMemberUserName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.Cellphone != nil){
		dictionary[kDJJLMemberCellphone] = self.Cellphone;
	}
	dictionary[kDJJLMemberCellphoneChecked] = @(self.CellphoneChecked);
	dictionary[kDJJLMemberCity] = @(self.City);
	dictionary[kDJJLMemberDistrict] = @(self.District);
	dictionary[kDJJLMemberFailureCount] = @(self.FailureCount);
	if(self.NickName != nil){
		dictionary[kDJJLMemberNickName] = self.NickName;
	}
	if(self.ParentID != nil){
		dictionary[kDJJLMemberParentID] = self.ParentID;
	}
	if(self.Password != nil){
		dictionary[kDJJLMemberPassword] = self.Password;
	}
	dictionary[kDJJLMemberProvince] = @(self.Province);
	dictionary[kDJJLMemberRegisterByAdmin] = @(self.RegisterByAdmin);
	if(self.RegisterFrom != nil){
		dictionary[kDJJLMemberRegisterFrom] = self.RegisterFrom;
	}
	dictionary[kDJJLMemberRegisterFromType] = @(self.RegisterFromType);
	if(self.UserName != nil){
		dictionary[kDJJLMemberUserName] = self.UserName;
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
	if(self.Cellphone != nil){
		[aCoder encodeObject:self.Cellphone forKey:kDJJLMemberCellphone];
	}
	[aCoder encodeObject:@(self.CellphoneChecked) forKey:kDJJLMemberCellphoneChecked];	[aCoder encodeObject:@(self.City) forKey:kDJJLMemberCity];	[aCoder encodeObject:@(self.District) forKey:kDJJLMemberDistrict];	[aCoder encodeObject:@(self.FailureCount) forKey:kDJJLMemberFailureCount];	if(self.NickName != nil){
		[aCoder encodeObject:self.NickName forKey:kDJJLMemberNickName];
	}
	if(self.ParentID != nil){
		[aCoder encodeObject:self.ParentID forKey:kDJJLMemberParentID];
	}
	if(self.Password != nil){
		[aCoder encodeObject:self.Password forKey:kDJJLMemberPassword];
	}
	[aCoder encodeObject:@(self.Province) forKey:kDJJLMemberProvince];	[aCoder encodeObject:@(self.RegisterByAdmin) forKey:kDJJLMemberRegisterByAdmin];	if(self.RegisterFrom != nil){
		[aCoder encodeObject:self.RegisterFrom forKey:kDJJLMemberRegisterFrom];
	}
	[aCoder encodeObject:@(self.RegisterFromType) forKey:kDJJLMemberRegisterFromType];	if(self.UserName != nil){
		[aCoder encodeObject:self.UserName forKey:kDJJLMemberUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.Cellphone = [aDecoder decodeObjectForKey:kDJJLMemberCellphone];
	self.CellphoneChecked = [[aDecoder decodeObjectForKey:kDJJLMemberCellphoneChecked] boolValue];
	self.City = [[aDecoder decodeObjectForKey:kDJJLMemberCity] integerValue];
	self.District = [[aDecoder decodeObjectForKey:kDJJLMemberDistrict] integerValue];
	self.FailureCount = [[aDecoder decodeObjectForKey:kDJJLMemberFailureCount] integerValue];
	self.NickName = [aDecoder decodeObjectForKey:kDJJLMemberNickName];
	self.ParentID = [aDecoder decodeObjectForKey:kDJJLMemberParentID];
	self.Password = [aDecoder decodeObjectForKey:kDJJLMemberPassword];
	self.Province = [[aDecoder decodeObjectForKey:kDJJLMemberProvince] integerValue];
	self.RegisterByAdmin = [[aDecoder decodeObjectForKey:kDJJLMemberRegisterByAdmin] boolValue];
	self.RegisterFrom = [aDecoder decodeObjectForKey:kDJJLMemberRegisterFrom];
	self.RegisterFromType = [[aDecoder decodeObjectForKey:kDJJLMemberRegisterFromType] integerValue];
	self.UserName = [aDecoder decodeObjectForKey:kDJJLMemberUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJLMember *copy = [DJJLMember new];

	copy.Cellphone = [self.Cellphone copy];
	copy.CellphoneChecked = self.CellphoneChecked;
	copy.City = self.City;
	copy.District = self.District;
	copy.FailureCount = self.FailureCount;
	copy.NickName = [self.NickName copy];
	copy.ParentID = [self.ParentID copy];
	copy.Password = [self.Password copy];
	copy.Province = self.Province;
	copy.RegisterByAdmin = self.RegisterByAdmin;
	copy.RegisterFrom = [self.RegisterFrom copy];
	copy.RegisterFromType = self.RegisterFromType;
	copy.UserName = [self.UserName copy];

	return copy;
}
@end