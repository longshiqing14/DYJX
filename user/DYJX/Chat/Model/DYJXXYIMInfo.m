//
//	DYJXXYIMInfo.m
//
//	Create by 岩 熊 on 7/12/2018
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
		self.adminSay = [dictionary[kDYJXXYIMInfoAdminSay] boolValue];
	}

	if(![dictionary[kDYJXXYIMInfoCanNotSearch] isKindOfClass:[NSNull class]]){
		self.canNotSearch = [dictionary[kDYJXXYIMInfoCanNotSearch] boolValue];
	}

	if(![dictionary[kDYJXXYIMInfoHeadImgUrl] isKindOfClass:[NSNull class]]){
		self.headImgUrl = dictionary[kDYJXXYIMInfoHeadImgUrl];
	}	
	if(![dictionary[kDYJXXYIMInfoIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kDYJXXYIMInfoIdField];
	}	
	if(![dictionary[kDYJXXYIMInfoImages] isKindOfClass:[NSNull class]]){
		self.images = dictionary[kDYJXXYIMInfoImages];
	}	
	if(![dictionary[kDYJXXYIMInfoPersonBank] isKindOfClass:[NSNull class]]){
		self.personBank = dictionary[kDYJXXYIMInfoPersonBank];
	}	
	if(![dictionary[kDYJXXYIMInfoPersonBankCardNo] isKindOfClass:[NSNull class]]){
		self.personBankCardNo = dictionary[kDYJXXYIMInfoPersonBankCardNo];
	}	
	if(![dictionary[kDYJXXYIMInfoNickName] isKindOfClass:[NSNull class]]){
		self.nickName = dictionary[kDYJXXYIMInfoNickName];
	}	
	if(![dictionary[kDYJXXYIMInfoPersonRemark] isKindOfClass:[NSNull class]]){
		self.personRemark = dictionary[kDYJXXYIMInfoPersonRemark];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kDYJXXYIMInfoAdminSay] = @(self.adminSay);
	dictionary[kDYJXXYIMInfoCanNotSearch] = @(self.canNotSearch);
	if(self.headImgUrl != nil){
		dictionary[kDYJXXYIMInfoHeadImgUrl] = self.headImgUrl;
	}
	if(self.idField != nil){
		dictionary[kDYJXXYIMInfoIdField] = self.idField;
	}
	if(self.images != nil){
		dictionary[kDYJXXYIMInfoImages] = self.images;
	}
	if(self.personBank != nil){
		dictionary[kDYJXXYIMInfoPersonBank] = self.personBank;
	}
	if(self.personBankCardNo != nil){
		dictionary[kDYJXXYIMInfoPersonBankCardNo] = self.personBankCardNo;
	}
	if(self.nickName != nil){
		dictionary[kDYJXXYIMInfoNickName] = self.nickName;
	}
	if(self.personRemark != nil){
		dictionary[kDYJXXYIMInfoPersonRemark] = self.personRemark;
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
	[aCoder encodeObject:@(self.adminSay) forKey:kDYJXXYIMInfoAdminSay];	[aCoder encodeObject:@(self.canNotSearch) forKey:kDYJXXYIMInfoCanNotSearch];	if(self.headImgUrl != nil){
		[aCoder encodeObject:self.headImgUrl forKey:kDYJXXYIMInfoHeadImgUrl];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kDYJXXYIMInfoIdField];
	}
	if(self.images != nil){
		[aCoder encodeObject:self.images forKey:kDYJXXYIMInfoImages];
	}
	if(self.personBank != nil){
		[aCoder encodeObject:self.personBank forKey:kDYJXXYIMInfoPersonBank];
	}
	if(self.personBankCardNo != nil){
		[aCoder encodeObject:self.personBankCardNo forKey:kDYJXXYIMInfoPersonBankCardNo];
	}
	if(self.nickName != nil){
		[aCoder encodeObject:self.nickName forKey:kDYJXXYIMInfoNickName];
	}
	if(self.personRemark != nil){
		[aCoder encodeObject:self.personRemark forKey:kDYJXXYIMInfoPersonRemark];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.adminSay = [[aDecoder decodeObjectForKey:kDYJXXYIMInfoAdminSay] boolValue];
	self.canNotSearch = [[aDecoder decodeObjectForKey:kDYJXXYIMInfoCanNotSearch] boolValue];
	self.headImgUrl = [aDecoder decodeObjectForKey:kDYJXXYIMInfoHeadImgUrl];
	self.idField = [aDecoder decodeObjectForKey:kDYJXXYIMInfoIdField];
	self.images = [aDecoder decodeObjectForKey:kDYJXXYIMInfoImages];
	self.personBank = [aDecoder decodeObjectForKey:kDYJXXYIMInfoPersonBank];
	self.personBankCardNo = [aDecoder decodeObjectForKey:kDYJXXYIMInfoPersonBankCardNo];
	self.nickName = [aDecoder decodeObjectForKey:kDYJXXYIMInfoNickName];
	self.personRemark = [aDecoder decodeObjectForKey:kDYJXXYIMInfoPersonRemark];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXXYIMInfo *copy = [DYJXXYIMInfo new];

	copy.adminSay = self.adminSay;
	copy.canNotSearch = self.canNotSearch;
	copy.headImgUrl = [self.headImgUrl copy];
	copy.idField = [self.idField copy];
	copy.images = [self.images copy];
	copy.personBank = [self.personBank copy];
	copy.personBankCardNo = [self.personBankCardNo copy];
	copy.nickName = [self.nickName copy];
	copy.personRemark = [self.personRemark copy];

	return copy;
}
@end