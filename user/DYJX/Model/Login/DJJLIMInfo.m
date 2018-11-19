//
//	DJJLIMInfo.m
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJLIMInfo.h"

NSString *const kDJJLIMInfoAdminSay = @"AdminSay";
NSString *const kDJJLIMInfoCanNotSearch = @"CanNotSearch";
NSString *const kDJJLIMInfoHeadImgUrl = @"HeadImgUrl";
NSString *const kDJJLIMInfoIdField = @"Id";
NSString *const kDJJLIMInfoImages = @"Images";
NSString *const kDJJLIMInfoNickName = @"NickName";

@interface DJJLIMInfo ()
@end
@implementation DJJLIMInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJLIMInfoAdminSay] isKindOfClass:[NSNull class]]){
		self.AdminSay = [dictionary[kDJJLIMInfoAdminSay] boolValue];
	}

	if(![dictionary[kDJJLIMInfoCanNotSearch] isKindOfClass:[NSNull class]]){
		self.CanNotSearch = [dictionary[kDJJLIMInfoCanNotSearch] boolValue];
	}

	if(![dictionary[kDJJLIMInfoHeadImgUrl] isKindOfClass:[NSNull class]]){
		self.HeadImgUrl = dictionary[kDJJLIMInfoHeadImgUrl];
	}	
	if(![dictionary[kDJJLIMInfoIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kDJJLIMInfoIdField];
	}	
	if(![dictionary[kDJJLIMInfoImages] isKindOfClass:[NSNull class]]){
		self.Images = dictionary[kDJJLIMInfoImages];
	}	
	if(![dictionary[kDJJLIMInfoNickName] isKindOfClass:[NSNull class]]){
		self.NickName = dictionary[kDJJLIMInfoNickName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kDJJLIMInfoAdminSay] = @(self.AdminSay);
	dictionary[kDJJLIMInfoCanNotSearch] = @(self.CanNotSearch);
	if(self.HeadImgUrl != nil){
		dictionary[kDJJLIMInfoHeadImgUrl] = self.HeadImgUrl;
	}
	if(self.IdField != nil){
		dictionary[kDJJLIMInfoIdField] = self.IdField;
	}
	if(self.Images != nil){
		dictionary[kDJJLIMInfoImages] = self.Images;
	}
	if(self.NickName != nil){
		dictionary[kDJJLIMInfoNickName] = self.NickName;
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
	[aCoder encodeObject:@(self.AdminSay) forKey:kDJJLIMInfoAdminSay];	[aCoder encodeObject:@(self.CanNotSearch) forKey:kDJJLIMInfoCanNotSearch];	if(self.HeadImgUrl != nil){
		[aCoder encodeObject:self.HeadImgUrl forKey:kDJJLIMInfoHeadImgUrl];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kDJJLIMInfoIdField];
	}
	if(self.Images != nil){
		[aCoder encodeObject:self.Images forKey:kDJJLIMInfoImages];
	}
	if(self.NickName != nil){
		[aCoder encodeObject:self.NickName forKey:kDJJLIMInfoNickName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.AdminSay = [[aDecoder decodeObjectForKey:kDJJLIMInfoAdminSay] boolValue];
	self.CanNotSearch = [[aDecoder decodeObjectForKey:kDJJLIMInfoCanNotSearch] boolValue];
	self.HeadImgUrl = [aDecoder decodeObjectForKey:kDJJLIMInfoHeadImgUrl];
	self.IdField = [aDecoder decodeObjectForKey:kDJJLIMInfoIdField];
	self.Images = [aDecoder decodeObjectForKey:kDJJLIMInfoImages];
	self.NickName = [aDecoder decodeObjectForKey:kDJJLIMInfoNickName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJLIMInfo *copy = [DJJLIMInfo new];

	copy.AdminSay = self.AdminSay;
	copy.CanNotSearch = self.CanNotSearch;
	copy.HeadImgUrl = [self.HeadImgUrl copy];
	copy.IdField = [self.IdField copy];
	copy.Images = [self.Images copy];
	copy.NickName = [self.NickName copy];

	return copy;
}
@end