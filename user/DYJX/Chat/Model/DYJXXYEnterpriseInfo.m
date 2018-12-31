//
//	DYJXXYEnterpriseInfo.m
//
//	Create by 岩 熊 on 12/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYJXXYEnterpriseInfo.h"

NSString *const kDYJXXYEnterpriseInfoAdminSay = @"AdminSay";
NSString *const kDYJXXYEnterpriseInfoCanNotSearch = @"CanNotSearch";
NSString *const kDYJXXYEnterpriseInfoCompanyName = @"CompanyName";
NSString *const kDYJXXYEnterpriseInfoCompanyShortName = @"CompanyShortName";
NSString *const kDYJXXYEnterpriseInfoHeadImgUrl = @"HeadImgUrl";
NSString *const kDYJXXYEnterpriseInfoId = @"Id";
NSString *const kDYJXXYEnterpriseInfoImages = @"Images";

@interface DYJXXYEnterpriseInfo ()
@end
@implementation DYJXXYEnterpriseInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYJXXYEnterpriseInfoAdminSay] isKindOfClass:[NSNull class]]){
		self.AdminSay = [dictionary[kDYJXXYEnterpriseInfoAdminSay] boolValue];
	}

	if(![dictionary[kDYJXXYEnterpriseInfoCanNotSearch] isKindOfClass:[NSNull class]]){
		self.CanNotSearch = [dictionary[kDYJXXYEnterpriseInfoCanNotSearch] boolValue];
	}

	if(![dictionary[kDYJXXYEnterpriseInfoCompanyName] isKindOfClass:[NSNull class]]){
		self.CompanyName = dictionary[kDYJXXYEnterpriseInfoCompanyName];
	}	
	if(![dictionary[kDYJXXYEnterpriseInfoCompanyShortName] isKindOfClass:[NSNull class]]){
		self.CompanyShortName = dictionary[kDYJXXYEnterpriseInfoCompanyShortName];
	}	
	if(![dictionary[kDYJXXYEnterpriseInfoHeadImgUrl] isKindOfClass:[NSNull class]]){
		self.HeadImgUrl = dictionary[kDYJXXYEnterpriseInfoHeadImgUrl];
	}	
	if(![dictionary[kDYJXXYEnterpriseInfoId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDYJXXYEnterpriseInfoId];
	}	
	if(![dictionary[kDYJXXYEnterpriseInfoImages] isKindOfClass:[NSNull class]]){
		self.Images = dictionary[kDYJXXYEnterpriseInfoImages];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kDYJXXYEnterpriseInfoAdminSay] = @(self.AdminSay);
	dictionary[kDYJXXYEnterpriseInfoCanNotSearch] = @(self.CanNotSearch);
	if(self.CompanyName != nil){
		dictionary[kDYJXXYEnterpriseInfoCompanyName] = self.CompanyName;
	}
	if(self.CompanyShortName != nil){
		dictionary[kDYJXXYEnterpriseInfoCompanyShortName] = self.CompanyShortName;
	}
	if(self.HeadImgUrl != nil){
		dictionary[kDYJXXYEnterpriseInfoHeadImgUrl] = self.HeadImgUrl;
	}
	if(self.Id != nil){
		dictionary[kDYJXXYEnterpriseInfoId] = self.Id;
	}
	if(self.Images != nil){
		dictionary[kDYJXXYEnterpriseInfoImages] = self.Images;
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
	[aCoder encodeObject:@(self.AdminSay) forKey:kDYJXXYEnterpriseInfoAdminSay];	[aCoder encodeObject:@(self.CanNotSearch) forKey:kDYJXXYEnterpriseInfoCanNotSearch];	if(self.CompanyName != nil){
		[aCoder encodeObject:self.CompanyName forKey:kDYJXXYEnterpriseInfoCompanyName];
	}
	if(self.CompanyShortName != nil){
		[aCoder encodeObject:self.CompanyShortName forKey:kDYJXXYEnterpriseInfoCompanyShortName];
	}
	if(self.HeadImgUrl != nil){
		[aCoder encodeObject:self.HeadImgUrl forKey:kDYJXXYEnterpriseInfoHeadImgUrl];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDYJXXYEnterpriseInfoId];
	}
	if(self.Images != nil){
		[aCoder encodeObject:self.Images forKey:kDYJXXYEnterpriseInfoImages];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.AdminSay = [[aDecoder decodeObjectForKey:kDYJXXYEnterpriseInfoAdminSay] boolValue];
	self.CanNotSearch = [[aDecoder decodeObjectForKey:kDYJXXYEnterpriseInfoCanNotSearch] boolValue];
	self.CompanyName = [aDecoder decodeObjectForKey:kDYJXXYEnterpriseInfoCompanyName];
	self.CompanyShortName = [aDecoder decodeObjectForKey:kDYJXXYEnterpriseInfoCompanyShortName];
	self.HeadImgUrl = [aDecoder decodeObjectForKey:kDYJXXYEnterpriseInfoHeadImgUrl];
	self.Id = [aDecoder decodeObjectForKey:kDYJXXYEnterpriseInfoId];
	self.Images = [aDecoder decodeObjectForKey:kDYJXXYEnterpriseInfoImages];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXXYEnterpriseInfo *copy = [DYJXXYEnterpriseInfo new];

	copy.AdminSay = self.AdminSay;
	copy.CanNotSearch = self.CanNotSearch;
	copy.CompanyName = [self.CompanyName copy];
	copy.CompanyShortName = [self.CompanyShortName copy];
	copy.HeadImgUrl = [self.HeadImgUrl copy];
	copy.Id = [self.Id copy];
	copy.Images = [self.Images copy];

	return copy;
}
@end
