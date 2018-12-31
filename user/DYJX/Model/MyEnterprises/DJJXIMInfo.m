//
//	DJJXIMInfo.m
//
//	Create by longshiqing on 17/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJXIMInfo.h"

NSString *const kDJJXIMInfoAdminSay = @"AdminSay";
NSString *const kDJJXIMInfoCanNotSearch = @"CanNotSearch";
NSString *const kDJJXIMInfoHeadImgUrl = @"HeadImgUrl";
NSString *const kDJJXIMInfoId = @"Id";
NSString *const kDJJXIMInfoImages = @"Images";
NSString *const kDJJXIMInfoNickName = @"NickName";

@interface DJJXIMInfo ()
@end
@implementation DJJXIMInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJXIMInfoAdminSay] isKindOfClass:[NSNull class]]){
		self.AdminSay = [dictionary[kDJJXIMInfoAdminSay] boolValue];
	}

	if(![dictionary[kDJJXIMInfoCanNotSearch] isKindOfClass:[NSNull class]]){
		self.CanNotSearch = [dictionary[kDJJXIMInfoCanNotSearch] boolValue];
	}

	if(![dictionary[kDJJXIMInfoHeadImgUrl] isKindOfClass:[NSNull class]]){
		self.HeadImgUrl = dictionary[kDJJXIMInfoHeadImgUrl];
	}	
	if(![dictionary[kDJJXIMInfoId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDJJXIMInfoId];
	}	
	if(![dictionary[kDJJXIMInfoImages] isKindOfClass:[NSNull class]]){
		self.Images = dictionary[kDJJXIMInfoImages];
	}	
	if(![dictionary[kDJJXIMInfoNickName] isKindOfClass:[NSNull class]]){
		self.NickName = dictionary[kDJJXIMInfoNickName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kDJJXIMInfoAdminSay] = @(self.AdminSay);
	dictionary[kDJJXIMInfoCanNotSearch] = @(self.CanNotSearch);
	if(self.HeadImgUrl != nil){
		dictionary[kDJJXIMInfoHeadImgUrl] = self.HeadImgUrl;
	}
	if(self.Id != nil){
		dictionary[kDJJXIMInfoId] = self.Id;
	}
	if(self.Images != nil){
		dictionary[kDJJXIMInfoImages] = self.Images;
	}
	if(self.NickName != nil){
		dictionary[kDJJXIMInfoNickName] = self.NickName;
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
	[aCoder encodeObject:@(self.AdminSay) forKey:kDJJXIMInfoAdminSay];	[aCoder encodeObject:@(self.CanNotSearch) forKey:kDJJXIMInfoCanNotSearch];	if(self.HeadImgUrl != nil){
		[aCoder encodeObject:self.HeadImgUrl forKey:kDJJXIMInfoHeadImgUrl];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDJJXIMInfoId];
	}
	if(self.Images != nil){
		[aCoder encodeObject:self.Images forKey:kDJJXIMInfoImages];
	}
	if(self.NickName != nil){
		[aCoder encodeObject:self.NickName forKey:kDJJXIMInfoNickName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.AdminSay = [[aDecoder decodeObjectForKey:kDJJXIMInfoAdminSay] boolValue];
	self.CanNotSearch = [[aDecoder decodeObjectForKey:kDJJXIMInfoCanNotSearch] boolValue];
	self.HeadImgUrl = [aDecoder decodeObjectForKey:kDJJXIMInfoHeadImgUrl];
	self.Id = [aDecoder decodeObjectForKey:kDJJXIMInfoId];
	self.Images = [aDecoder decodeObjectForKey:kDJJXIMInfoImages];
	self.NickName = [aDecoder decodeObjectForKey:kDJJXIMInfoNickName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJXIMInfo *copy = [DJJXIMInfo new];

	copy.AdminSay = self.AdminSay;
	copy.CanNotSearch = self.CanNotSearch;
	copy.HeadImgUrl = [self.HeadImgUrl copy];
	copy.Id = [self.Id copy];
	copy.Images = [self.Images copy];
	copy.NickName = [self.NickName copy];

	return copy;
}
@end
