//
//	DIIIMInfo.m
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DIIIMInfo.h"

NSString *const kDIIIMInfoAdminSay = @"AdminSay";
NSString *const kDIIIMInfoCanNotSearch = @"CanNotSearch";
NSString *const kDIIIMInfoHeadImgUrl = @"HeadImgUrl";
NSString *const kDIIIMInfoId = @"Id";
NSString *const kDIIIMInfoImages = @"Images";
NSString *const kDIIIMInfoNickName = @"NickName";

@interface DIIIMInfo ()
@end
@implementation DIIIMInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDIIIMInfoAdminSay] isKindOfClass:[NSNull class]]){
		self.AdminSay = [dictionary[kDIIIMInfoAdminSay] boolValue];
	}

	if(![dictionary[kDIIIMInfoCanNotSearch] isKindOfClass:[NSNull class]]){
		self.CanNotSearch = [dictionary[kDIIIMInfoCanNotSearch] boolValue];
	}

	if(![dictionary[kDIIIMInfoHeadImgUrl] isKindOfClass:[NSNull class]]){
		self.HeadImgUrl = dictionary[kDIIIMInfoHeadImgUrl];
	}	
	if(![dictionary[kDIIIMInfoId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDIIIMInfoId];
	}	
	if(![dictionary[kDIIIMInfoImages] isKindOfClass:[NSNull class]]){
		self.Images = dictionary[kDIIIMInfoImages];
	}	
	if(![dictionary[kDIIIMInfoNickName] isKindOfClass:[NSNull class]]){
		self.NickName = dictionary[kDIIIMInfoNickName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kDIIIMInfoAdminSay] = @(self.AdminSay);
	dictionary[kDIIIMInfoCanNotSearch] = @(self.CanNotSearch);
	if(self.HeadImgUrl != nil){
		dictionary[kDIIIMInfoHeadImgUrl] = self.HeadImgUrl;
	}
	if(self.Id != nil){
		dictionary[kDIIIMInfoId] = self.Id;
	}
	if(self.Images != nil){
		dictionary[kDIIIMInfoImages] = self.Images;
	}
	if(self.NickName != nil){
		dictionary[kDIIIMInfoNickName] = self.NickName;
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
	[aCoder encodeObject:@(self.AdminSay) forKey:kDIIIMInfoAdminSay];	[aCoder encodeObject:@(self.CanNotSearch) forKey:kDIIIMInfoCanNotSearch];	if(self.HeadImgUrl != nil){
		[aCoder encodeObject:self.HeadImgUrl forKey:kDIIIMInfoHeadImgUrl];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDIIIMInfoId];
	}
	if(self.Images != nil){
		[aCoder encodeObject:self.Images forKey:kDIIIMInfoImages];
	}
	if(self.NickName != nil){
		[aCoder encodeObject:self.NickName forKey:kDIIIMInfoNickName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.AdminSay = [[aDecoder decodeObjectForKey:kDIIIMInfoAdminSay] boolValue];
	self.CanNotSearch = [[aDecoder decodeObjectForKey:kDIIIMInfoCanNotSearch] boolValue];
	self.HeadImgUrl = [aDecoder decodeObjectForKey:kDIIIMInfoHeadImgUrl];
	self.Id = [aDecoder decodeObjectForKey:kDIIIMInfoId];
	self.Images = [aDecoder decodeObjectForKey:kDIIIMInfoImages];
	self.NickName = [aDecoder decodeObjectForKey:kDIIIMInfoNickName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DIIIMInfo *copy = [DIIIMInfo new];

	copy.AdminSay = self.AdminSay;
	copy.CanNotSearch = self.CanNotSearch;
	copy.HeadImgUrl = [self.HeadImgUrl copy];
	copy.Id = [self.Id copy];
	copy.Images = [self.Images copy];
	copy.NickName = [self.NickName copy];

	return copy;
}
@end
