//
//	DYXJIMInfo.m
//
//	Create by longshiqing on 26/4/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYXJIMInfo.h"

NSString *const kDYXJIMInfoAdminSay = @"AdminSay";
NSString *const kDYXJIMInfoCanNotSearch = @"CanNotSearch";
NSString *const kDYXJIMInfoIdField = @"Id";
NSString *const kDYXJIMInfoImages = @"Images";

@interface DYXJIMInfo ()
@end
@implementation DYXJIMInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYXJIMInfoAdminSay] isKindOfClass:[NSNull class]]){
		self.AdminSay = [dictionary[kDYXJIMInfoAdminSay] boolValue];
	}

	if(![dictionary[kDYXJIMInfoCanNotSearch] isKindOfClass:[NSNull class]]){
		self.CanNotSearch = [dictionary[kDYXJIMInfoCanNotSearch] boolValue];
	}

	if(![dictionary[kDYXJIMInfoIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kDYXJIMInfoIdField];
	}	
	if(![dictionary[kDYXJIMInfoImages] isKindOfClass:[NSNull class]]){
		self.Images = dictionary[kDYXJIMInfoImages];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kDYXJIMInfoAdminSay] = @(self.AdminSay);
	dictionary[kDYXJIMInfoCanNotSearch] = @(self.CanNotSearch);
	if(self.IdField != nil){
		dictionary[kDYXJIMInfoIdField] = self.IdField;
	}
	if(self.Images != nil){
		dictionary[kDYXJIMInfoImages] = self.Images;
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
	[aCoder encodeObject:@(self.AdminSay) forKey:kDYXJIMInfoAdminSay];	[aCoder encodeObject:@(self.CanNotSearch) forKey:kDYXJIMInfoCanNotSearch];	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kDYXJIMInfoIdField];
	}
	if(self.Images != nil){
		[aCoder encodeObject:self.Images forKey:kDYXJIMInfoImages];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.AdminSay = [[aDecoder decodeObjectForKey:kDYXJIMInfoAdminSay] boolValue];
	self.CanNotSearch = [[aDecoder decodeObjectForKey:kDYXJIMInfoCanNotSearch] boolValue];
	self.IdField = [aDecoder decodeObjectForKey:kDYXJIMInfoIdField];
	self.Images = [aDecoder decodeObjectForKey:kDYXJIMInfoImages];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYXJIMInfo *copy = [DYXJIMInfo new];

	copy.AdminSay = self.AdminSay;
	copy.CanNotSearch = self.CanNotSearch;
	copy.IdField = [self.IdField copy];
	copy.Images = [self.Images copy];

	return copy;
}
@end