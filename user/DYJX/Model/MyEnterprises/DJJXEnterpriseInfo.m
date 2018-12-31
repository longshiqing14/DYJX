//
//	DJJXEnterpriseInfo.m
//
//	Create by longshiqing on 17/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJXEnterpriseInfo.h"

NSString *const kDJJXEnterpriseInfoAdminSay = @"AdminSay";
NSString *const kDJJXEnterpriseInfoCanNotSearch = @"CanNotSearch";
NSString *const kDJJXEnterpriseInfoCompanyName = @"CompanyName";
NSString *const kDJJXEnterpriseInfoId = @"Id";
NSString *const kDJJXEnterpriseInfoImages = @"Images";

@interface DJJXEnterpriseInfo ()
@end
@implementation DJJXEnterpriseInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJXEnterpriseInfoAdminSay] isKindOfClass:[NSNull class]]){
		self.AdminSay = [dictionary[kDJJXEnterpriseInfoAdminSay] boolValue];
	}

	if(![dictionary[kDJJXEnterpriseInfoCanNotSearch] isKindOfClass:[NSNull class]]){
		self.CanNotSearch = [dictionary[kDJJXEnterpriseInfoCanNotSearch] boolValue];
	}

	if(![dictionary[kDJJXEnterpriseInfoCompanyName] isKindOfClass:[NSNull class]]){
		self.CompanyName = dictionary[kDJJXEnterpriseInfoCompanyName];
	}	
	if(![dictionary[kDJJXEnterpriseInfoId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDJJXEnterpriseInfoId];
	}	
	if(![dictionary[kDJJXEnterpriseInfoImages] isKindOfClass:[NSNull class]]){
		self.Images = dictionary[kDJJXEnterpriseInfoImages];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kDJJXEnterpriseInfoAdminSay] = @(self.AdminSay);
	dictionary[kDJJXEnterpriseInfoCanNotSearch] = @(self.CanNotSearch);
	if(self.CompanyName != nil){
		dictionary[kDJJXEnterpriseInfoCompanyName] = self.CompanyName;
	}
	if(self.Id != nil){
		dictionary[kDJJXEnterpriseInfoId] = self.Id;
	}
	if(self.Images != nil){
		dictionary[kDJJXEnterpriseInfoImages] = self.Images;
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
	[aCoder encodeObject:@(self.AdminSay) forKey:kDJJXEnterpriseInfoAdminSay];	[aCoder encodeObject:@(self.CanNotSearch) forKey:kDJJXEnterpriseInfoCanNotSearch];	if(self.CompanyName != nil){
		[aCoder encodeObject:self.CompanyName forKey:kDJJXEnterpriseInfoCompanyName];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDJJXEnterpriseInfoId];
	}
	if(self.Images != nil){
		[aCoder encodeObject:self.Images forKey:kDJJXEnterpriseInfoImages];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.AdminSay = [[aDecoder decodeObjectForKey:kDJJXEnterpriseInfoAdminSay] boolValue];
	self.CanNotSearch = [[aDecoder decodeObjectForKey:kDJJXEnterpriseInfoCanNotSearch] boolValue];
	self.CompanyName = [aDecoder decodeObjectForKey:kDJJXEnterpriseInfoCompanyName];
	self.Id = [aDecoder decodeObjectForKey:kDJJXEnterpriseInfoId];
	self.Images = [aDecoder decodeObjectForKey:kDJJXEnterpriseInfoImages];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJXEnterpriseInfo *copy = [DJJXEnterpriseInfo new];

	copy.AdminSay = self.AdminSay;
	copy.CanNotSearch = self.CanNotSearch;
	copy.CompanyName = [self.CompanyName copy];
	copy.Id = [self.Id copy];
	copy.Images = [self.Images copy];

	return copy;
}
@end
