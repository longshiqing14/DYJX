//
//	DYJXXYEnterpriseInfo.m
//
//	Create by 岩 熊 on 7/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYJXXYEnterpriseInfo.h"

NSString *const kDYJXXYEnterpriseInfoAdminSay = @"AdminSay";
NSString *const kDYJXXYEnterpriseInfoCanNotSearch = @"CanNotSearch";
NSString *const kDYJXXYEnterpriseInfoCompanyName = @"CompanyName";
NSString *const kDYJXXYEnterpriseInfoCompanyShortName = @"CompanyShortName";
NSString *const kDYJXXYEnterpriseInfoHeadImgUrl = @"HeadImgUrl";
NSString *const kDYJXXYEnterpriseInfoIdField = @"Id";
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
		self.adminSay = [dictionary[kDYJXXYEnterpriseInfoAdminSay] boolValue];
	}

	if(![dictionary[kDYJXXYEnterpriseInfoCanNotSearch] isKindOfClass:[NSNull class]]){
		self.canNotSearch = [dictionary[kDYJXXYEnterpriseInfoCanNotSearch] boolValue];
	}

	if(![dictionary[kDYJXXYEnterpriseInfoCompanyName] isKindOfClass:[NSNull class]]){
		self.companyName = dictionary[kDYJXXYEnterpriseInfoCompanyName];
	}	
	if(![dictionary[kDYJXXYEnterpriseInfoCompanyShortName] isKindOfClass:[NSNull class]]){
		self.companyShortName = dictionary[kDYJXXYEnterpriseInfoCompanyShortName];
	}	
	if(![dictionary[kDYJXXYEnterpriseInfoHeadImgUrl] isKindOfClass:[NSNull class]]){
		self.headImgUrl = dictionary[kDYJXXYEnterpriseInfoHeadImgUrl];
	}	
	if(![dictionary[kDYJXXYEnterpriseInfoIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kDYJXXYEnterpriseInfoIdField];
	}	
	if(![dictionary[kDYJXXYEnterpriseInfoImages] isKindOfClass:[NSNull class]]){
		self.images = dictionary[kDYJXXYEnterpriseInfoImages];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kDYJXXYEnterpriseInfoAdminSay] = @(self.adminSay);
	dictionary[kDYJXXYEnterpriseInfoCanNotSearch] = @(self.canNotSearch);
	if(self.companyName != nil){
		dictionary[kDYJXXYEnterpriseInfoCompanyName] = self.companyName;
	}
	if(self.companyShortName != nil){
		dictionary[kDYJXXYEnterpriseInfoCompanyShortName] = self.companyShortName;
	}
	if(self.headImgUrl != nil){
		dictionary[kDYJXXYEnterpriseInfoHeadImgUrl] = self.headImgUrl;
	}
	if(self.idField != nil){
		dictionary[kDYJXXYEnterpriseInfoIdField] = self.idField;
	}
	if(self.images != nil){
		dictionary[kDYJXXYEnterpriseInfoImages] = self.images;
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
	[aCoder encodeObject:@(self.adminSay) forKey:kDYJXXYEnterpriseInfoAdminSay];	[aCoder encodeObject:@(self.canNotSearch) forKey:kDYJXXYEnterpriseInfoCanNotSearch];	if(self.companyName != nil){
		[aCoder encodeObject:self.companyName forKey:kDYJXXYEnterpriseInfoCompanyName];
	}
	if(self.companyShortName != nil){
		[aCoder encodeObject:self.companyShortName forKey:kDYJXXYEnterpriseInfoCompanyShortName];
	}
	if(self.headImgUrl != nil){
		[aCoder encodeObject:self.headImgUrl forKey:kDYJXXYEnterpriseInfoHeadImgUrl];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kDYJXXYEnterpriseInfoIdField];
	}
	if(self.images != nil){
		[aCoder encodeObject:self.images forKey:kDYJXXYEnterpriseInfoImages];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.adminSay = [[aDecoder decodeObjectForKey:kDYJXXYEnterpriseInfoAdminSay] boolValue];
	self.canNotSearch = [[aDecoder decodeObjectForKey:kDYJXXYEnterpriseInfoCanNotSearch] boolValue];
	self.companyName = [aDecoder decodeObjectForKey:kDYJXXYEnterpriseInfoCompanyName];
	self.companyShortName = [aDecoder decodeObjectForKey:kDYJXXYEnterpriseInfoCompanyShortName];
	self.headImgUrl = [aDecoder decodeObjectForKey:kDYJXXYEnterpriseInfoHeadImgUrl];
	self.idField = [aDecoder decodeObjectForKey:kDYJXXYEnterpriseInfoIdField];
	self.images = [aDecoder decodeObjectForKey:kDYJXXYEnterpriseInfoImages];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXXYEnterpriseInfo *copy = [DYJXXYEnterpriseInfo new];

	copy.adminSay = self.adminSay;
	copy.canNotSearch = self.canNotSearch;
	copy.companyName = [self.companyName copy];
	copy.companyShortName = [self.companyShortName copy];
	copy.headImgUrl = [self.headImgUrl copy];
	copy.idField = [self.idField copy];
	copy.images = [self.images copy];

	return copy;
}
@end