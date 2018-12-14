//
//	DYJXXYIMInfo.m
//
//	Create by 岩 熊 on 12/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYJXXYIMInfo.h"

NSString *const kDYJXXYIMInfoAdminSay = @"AdminSay";
NSString *const kDYJXXYIMInfoCanNotSearch = @"CanNotSearch";
NSString *const kDYJXXYIMInfoHeadImgUrl = @"HeadImgUrl";
NSString *const kDYJXXYIMInfoIdField = @"Id";
NSString *const kDYJXXYIMInfoImages = @"Images";
NSString *const kDYJXXYIMInfoPersonBank = @"PersonBank";
NSString *const kDYJXXYIMInfoPersonBankCardNo = @"PersonBankCardNo";
NSString *const kDYJXXYIMInfoNickName = @"NickName";
NSString *const kDYJXXYIMInfoPersonRemark = @"PersonRemark";

@interface DYJXXYIMInfo ()
@end
@implementation DYJXXYIMInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYJXXYIMInfoAdminSay] isKindOfClass:[NSNull class]]){
		self.AdminSay = [dictionary[kDYJXXYIMInfoAdminSay] boolValue];
	}

	if(![dictionary[kDYJXXYIMInfoCanNotSearch] isKindOfClass:[NSNull class]]){
		self.CanNotSearch = [dictionary[kDYJXXYIMInfoCanNotSearch] boolValue];
	}

	if(![dictionary[kDYJXXYIMInfoHeadImgUrl] isKindOfClass:[NSNull class]]){
		self.HeadImgUrl = dictionary[kDYJXXYIMInfoHeadImgUrl];
	}	
	if(![dictionary[kDYJXXYIMInfoIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kDYJXXYIMInfoIdField];
	}	
	if(![dictionary[kDYJXXYIMInfoImages] isKindOfClass:[NSNull class]]){
		self.Images = dictionary[kDYJXXYIMInfoImages];
	}	
	if(![dictionary[kDYJXXYIMInfoPersonBank] isKindOfClass:[NSNull class]]){
		self.PersonBank = dictionary[kDYJXXYIMInfoPersonBank];
	}	
	if(![dictionary[kDYJXXYIMInfoPersonBankCardNo] isKindOfClass:[NSNull class]]){
		self.PersonBankCardNo = dictionary[kDYJXXYIMInfoPersonBankCardNo];
	}	
	if(![dictionary[kDYJXXYIMInfoNickName] isKindOfClass:[NSNull class]]){
		self.NickName = dictionary[kDYJXXYIMInfoNickName];
	}	
	if(![dictionary[kDYJXXYIMInfoPersonRemark] isKindOfClass:[NSNull class]]){
		self.PersonRemark = dictionary[kDYJXXYIMInfoPersonRemark];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kDYJXXYIMInfoAdminSay] = @(self.AdminSay);
	dictionary[kDYJXXYIMInfoCanNotSearch] = @(self.CanNotSearch);
	if(self.HeadImgUrl != nil){
		dictionary[kDYJXXYIMInfoHeadImgUrl] = self.HeadImgUrl;
	}
	if(self.IdField != nil){
		dictionary[kDYJXXYIMInfoIdField] = self.IdField;
	}
	if(self.Images != nil){
		dictionary[kDYJXXYIMInfoImages] = self.Images;
	}
	if(self.PersonBank != nil){
		dictionary[kDYJXXYIMInfoPersonBank] = self.PersonBank;
	}
	if(self.PersonBankCardNo != nil){
		dictionary[kDYJXXYIMInfoPersonBankCardNo] = self.PersonBankCardNo;
	}
	if(self.NickName != nil){
		dictionary[kDYJXXYIMInfoNickName] = self.NickName;
	}
	if(self.PersonRemark != nil){
		dictionary[kDYJXXYIMInfoPersonRemark] = self.PersonRemark;
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
	[aCoder encodeObject:@(self.AdminSay) forKey:kDYJXXYIMInfoAdminSay];	[aCoder encodeObject:@(self.CanNotSearch) forKey:kDYJXXYIMInfoCanNotSearch];	if(self.HeadImgUrl != nil){
		[aCoder encodeObject:self.HeadImgUrl forKey:kDYJXXYIMInfoHeadImgUrl];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kDYJXXYIMInfoIdField];
	}
	if(self.Images != nil){
		[aCoder encodeObject:self.Images forKey:kDYJXXYIMInfoImages];
	}
	if(self.PersonBank != nil){
		[aCoder encodeObject:self.PersonBank forKey:kDYJXXYIMInfoPersonBank];
	}
	if(self.PersonBankCardNo != nil){
		[aCoder encodeObject:self.PersonBankCardNo forKey:kDYJXXYIMInfoPersonBankCardNo];
	}
	if(self.NickName != nil){
		[aCoder encodeObject:self.NickName forKey:kDYJXXYIMInfoNickName];
	}
	if(self.PersonRemark != nil){
		[aCoder encodeObject:self.PersonRemark forKey:kDYJXXYIMInfoPersonRemark];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.AdminSay = [[aDecoder decodeObjectForKey:kDYJXXYIMInfoAdminSay] boolValue];
	self.CanNotSearch = [[aDecoder decodeObjectForKey:kDYJXXYIMInfoCanNotSearch] boolValue];
	self.HeadImgUrl = [aDecoder decodeObjectForKey:kDYJXXYIMInfoHeadImgUrl];
	self.IdField = [aDecoder decodeObjectForKey:kDYJXXYIMInfoIdField];
	self.Images = [aDecoder decodeObjectForKey:kDYJXXYIMInfoImages];
	self.PersonBank = [aDecoder decodeObjectForKey:kDYJXXYIMInfoPersonBank];
	self.PersonBankCardNo = [aDecoder decodeObjectForKey:kDYJXXYIMInfoPersonBankCardNo];
	self.NickName = [aDecoder decodeObjectForKey:kDYJXXYIMInfoNickName];
	self.PersonRemark = [aDecoder decodeObjectForKey:kDYJXXYIMInfoPersonRemark];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXXYIMInfo *copy = [DYJXXYIMInfo new];

	copy.AdminSay = self.AdminSay;
	copy.CanNotSearch = self.CanNotSearch;
	copy.HeadImgUrl = [self.HeadImgUrl copy];
	copy.IdField = [self.IdField copy];
	copy.Images = [self.Images copy];
	copy.PersonBank = [self.PersonBank copy];
	copy.PersonBankCardNo = [self.PersonBankCardNo copy];
	copy.NickName = [self.NickName copy];
	copy.PersonRemark = [self.PersonRemark copy];

	return copy;
}
@end