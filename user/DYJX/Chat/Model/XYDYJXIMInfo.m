//
//	XYDYJXIMInfo.m
//
//	Create by 岩 熊 on 18/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "XYDYJXIMInfo.h"

NSString *const kXYDYJXIMInfoAdminSay = @"AdminSay";
NSString *const kXYDYJXIMInfoCanNotSearch = @"CanNotSearch";
NSString *const kXYDYJXIMInfoHeadImgUrl = @"HeadImgUrl";
NSString *const kXYDYJXIMInfoIdField = @"Id";
NSString *const kXYDYJXIMInfoImages = @"Images";
NSString *const kXYDYJXIMInfoNickName = @"NickName";

@interface XYDYJXIMInfo ()
@end
@implementation XYDYJXIMInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kXYDYJXIMInfoAdminSay] isKindOfClass:[NSNull class]]){
		self.AdminSay = [dictionary[kXYDYJXIMInfoAdminSay] boolValue];
	}

	if(![dictionary[kXYDYJXIMInfoCanNotSearch] isKindOfClass:[NSNull class]]){
		self.CanNotSearch = [dictionary[kXYDYJXIMInfoCanNotSearch] boolValue];
	}

	if(![dictionary[kXYDYJXIMInfoHeadImgUrl] isKindOfClass:[NSNull class]]){
		self.HeadImgUrl = dictionary[kXYDYJXIMInfoHeadImgUrl];
	}	
	if(![dictionary[kXYDYJXIMInfoIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kXYDYJXIMInfoIdField];
	}	
	if(![dictionary[kXYDYJXIMInfoImages] isKindOfClass:[NSNull class]]){
		self.Images = dictionary[kXYDYJXIMInfoImages];
	}	
	if(![dictionary[kXYDYJXIMInfoNickName] isKindOfClass:[NSNull class]]){
		self.NickName = dictionary[kXYDYJXIMInfoNickName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kXYDYJXIMInfoAdminSay] = @(self.AdminSay);
	dictionary[kXYDYJXIMInfoCanNotSearch] = @(self.CanNotSearch);
	if(self.HeadImgUrl != nil){
		dictionary[kXYDYJXIMInfoHeadImgUrl] = self.HeadImgUrl;
	}
	if(self.IdField != nil){
		dictionary[kXYDYJXIMInfoIdField] = self.IdField;
	}
	if(self.Images != nil){
		dictionary[kXYDYJXIMInfoImages] = self.Images;
	}
	if(self.NickName != nil){
		dictionary[kXYDYJXIMInfoNickName] = self.NickName;
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
	[aCoder encodeObject:@(self.AdminSay) forKey:kXYDYJXIMInfoAdminSay];	[aCoder encodeObject:@(self.CanNotSearch) forKey:kXYDYJXIMInfoCanNotSearch];	if(self.HeadImgUrl != nil){
		[aCoder encodeObject:self.HeadImgUrl forKey:kXYDYJXIMInfoHeadImgUrl];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kXYDYJXIMInfoIdField];
	}
	if(self.Images != nil){
		[aCoder encodeObject:self.Images forKey:kXYDYJXIMInfoImages];
	}
	if(self.NickName != nil){
		[aCoder encodeObject:self.NickName forKey:kXYDYJXIMInfoNickName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.AdminSay = [[aDecoder decodeObjectForKey:kXYDYJXIMInfoAdminSay] boolValue];
	self.CanNotSearch = [[aDecoder decodeObjectForKey:kXYDYJXIMInfoCanNotSearch] boolValue];
	self.HeadImgUrl = [aDecoder decodeObjectForKey:kXYDYJXIMInfoHeadImgUrl];
	self.IdField = [aDecoder decodeObjectForKey:kXYDYJXIMInfoIdField];
	self.Images = [aDecoder decodeObjectForKey:kXYDYJXIMInfoImages];
	self.NickName = [aDecoder decodeObjectForKey:kXYDYJXIMInfoNickName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	XYDYJXIMInfo *copy = [XYDYJXIMInfo new];

	copy.AdminSay = self.AdminSay;
	copy.CanNotSearch = self.CanNotSearch;
	copy.HeadImgUrl = [self.HeadImgUrl copy];
	copy.IdField = [self.IdField copy];
	copy.Images = [self.Images copy];
	copy.NickName = [self.NickName copy];

	return copy;
}
@end