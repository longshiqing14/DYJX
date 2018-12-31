//
//	DJJSIMInfo.m
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJSIMInfo.h"

NSString *const kDJJSIMInfoAdminSay = @"AdminSay";
NSString *const kDJJSIMInfoCanNotSearch = @"CanNotSearch";
NSString *const kDJJSIMInfoHeadImgUrl = @"HeadImgUrl";
NSString *const kDJJSIMInfoId = @"Id";
NSString *const kDJJSIMInfoImages = @"Images";
NSString *const kDJJSIMInfoNickName = @"NickName";

@interface DJJSIMInfo ()
@end
@implementation DJJSIMInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJSIMInfoAdminSay] isKindOfClass:[NSNull class]]){
		self.AdminSay = [dictionary[kDJJSIMInfoAdminSay] boolValue];
	}

	if(![dictionary[kDJJSIMInfoCanNotSearch] isKindOfClass:[NSNull class]]){
		self.CanNotSearch = [dictionary[kDJJSIMInfoCanNotSearch] boolValue];
	}

	if(![dictionary[kDJJSIMInfoHeadImgUrl] isKindOfClass:[NSNull class]]){
		self.HeadImgUrl = dictionary[kDJJSIMInfoHeadImgUrl];
	}	
	if(![dictionary[kDJJSIMInfoId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDJJSIMInfoId];
	}	
	if(![dictionary[kDJJSIMInfoImages] isKindOfClass:[NSNull class]]){
		self.Images = dictionary[kDJJSIMInfoImages];
	}	
	if(![dictionary[kDJJSIMInfoNickName] isKindOfClass:[NSNull class]]){
		self.NickName = dictionary[kDJJSIMInfoNickName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kDJJSIMInfoAdminSay] = @(self.AdminSay);
	dictionary[kDJJSIMInfoCanNotSearch] = @(self.CanNotSearch);
	if(self.HeadImgUrl != nil){
		dictionary[kDJJSIMInfoHeadImgUrl] = self.HeadImgUrl;
	}
	if(self.Id != nil){
		dictionary[kDJJSIMInfoId] = self.Id;
	}
	if(self.Images != nil){
		dictionary[kDJJSIMInfoImages] = self.Images;
	}
	if(self.NickName != nil){
		dictionary[kDJJSIMInfoNickName] = self.NickName;
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
	[aCoder encodeObject:@(self.AdminSay) forKey:kDJJSIMInfoAdminSay];	[aCoder encodeObject:@(self.CanNotSearch) forKey:kDJJSIMInfoCanNotSearch];	if(self.HeadImgUrl != nil){
		[aCoder encodeObject:self.HeadImgUrl forKey:kDJJSIMInfoHeadImgUrl];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDJJSIMInfoId];
	}
	if(self.Images != nil){
		[aCoder encodeObject:self.Images forKey:kDJJSIMInfoImages];
	}
	if(self.NickName != nil){
		[aCoder encodeObject:self.NickName forKey:kDJJSIMInfoNickName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.AdminSay = [[aDecoder decodeObjectForKey:kDJJSIMInfoAdminSay] boolValue];
	self.CanNotSearch = [[aDecoder decodeObjectForKey:kDJJSIMInfoCanNotSearch] boolValue];
	self.HeadImgUrl = [aDecoder decodeObjectForKey:kDJJSIMInfoHeadImgUrl];
	self.Id = [aDecoder decodeObjectForKey:kDJJSIMInfoId];
	self.Images = [aDecoder decodeObjectForKey:kDJJSIMInfoImages];
	self.NickName = [aDecoder decodeObjectForKey:kDJJSIMInfoNickName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJSIMInfo *copy = [DJJSIMInfo new];

	copy.AdminSay = self.AdminSay;
	copy.CanNotSearch = self.CanNotSearch;
	copy.HeadImgUrl = [self.HeadImgUrl copy];
	copy.Id = [self.Id copy];
	copy.Images = [self.Images copy];
	copy.NickName = [self.NickName copy];

	return copy;
}
@end
