//
//	DLLIMInfo.m
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DLLIMInfo.h"

NSString *const kDLLIMInfoAdminSay = @"AdminSay";
NSString *const kDLLIMInfoCanNotSearch = @"CanNotSearch";
NSString *const kDLLIMInfoHeadImgUrl = @"HeadImgUrl";
NSString *const kDLLIMInfoId = @"Id";
NSString *const kDLLIMInfoImages = @"Images";
NSString *const kDLLIMInfoPersonBank = @"PersonBank";
NSString *const kDLLIMInfoPersonBankCardNo = @"PersonBankCardNo";

@interface DLLIMInfo ()
@end
@implementation DLLIMInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDLLIMInfoAdminSay] isKindOfClass:[NSNull class]]){
		self.AdminSay = [dictionary[kDLLIMInfoAdminSay] boolValue];
	}

	if(![dictionary[kDLLIMInfoCanNotSearch] isKindOfClass:[NSNull class]]){
		self.CanNotSearch = [dictionary[kDLLIMInfoCanNotSearch] boolValue];
	}

	if(![dictionary[kDLLIMInfoHeadImgUrl] isKindOfClass:[NSNull class]]){
		self.HeadImgUrl = dictionary[kDLLIMInfoHeadImgUrl];
	}	
	if(![dictionary[kDLLIMInfoId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDLLIMInfoId];
	}	
	if(![dictionary[kDLLIMInfoImages] isKindOfClass:[NSNull class]]){
		self.Images = dictionary[kDLLIMInfoImages];
	}	
	if(![dictionary[kDLLIMInfoPersonBank] isKindOfClass:[NSNull class]]){
		self.PersonBank = dictionary[kDLLIMInfoPersonBank];
	}	
	if(![dictionary[kDLLIMInfoPersonBankCardNo] isKindOfClass:[NSNull class]]){
		self.PersonBankCardNo = dictionary[kDLLIMInfoPersonBankCardNo];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kDLLIMInfoAdminSay] = @(self.AdminSay);
	dictionary[kDLLIMInfoCanNotSearch] = @(self.CanNotSearch);
	if(self.HeadImgUrl != nil){
		dictionary[kDLLIMInfoHeadImgUrl] = self.HeadImgUrl;
	}
	if(self.Id != nil){
		dictionary[kDLLIMInfoId] = self.Id;
	}
	if(self.Images != nil){
		dictionary[kDLLIMInfoImages] = self.Images;
	}
	if(self.PersonBank != nil){
		dictionary[kDLLIMInfoPersonBank] = self.PersonBank;
	}
	if(self.PersonBankCardNo != nil){
		dictionary[kDLLIMInfoPersonBankCardNo] = self.PersonBankCardNo;
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
	[aCoder encodeObject:@(self.AdminSay) forKey:kDLLIMInfoAdminSay];	[aCoder encodeObject:@(self.CanNotSearch) forKey:kDLLIMInfoCanNotSearch];	if(self.HeadImgUrl != nil){
		[aCoder encodeObject:self.HeadImgUrl forKey:kDLLIMInfoHeadImgUrl];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDLLIMInfoId];
	}
	if(self.Images != nil){
		[aCoder encodeObject:self.Images forKey:kDLLIMInfoImages];
	}
	if(self.PersonBank != nil){
		[aCoder encodeObject:self.PersonBank forKey:kDLLIMInfoPersonBank];
	}
	if(self.PersonBankCardNo != nil){
		[aCoder encodeObject:self.PersonBankCardNo forKey:kDLLIMInfoPersonBankCardNo];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.AdminSay = [[aDecoder decodeObjectForKey:kDLLIMInfoAdminSay] boolValue];
	self.CanNotSearch = [[aDecoder decodeObjectForKey:kDLLIMInfoCanNotSearch] boolValue];
	self.HeadImgUrl = [aDecoder decodeObjectForKey:kDLLIMInfoHeadImgUrl];
	self.Id = [aDecoder decodeObjectForKey:kDLLIMInfoId];
	self.Images = [aDecoder decodeObjectForKey:kDLLIMInfoImages];
	self.PersonBank = [aDecoder decodeObjectForKey:kDLLIMInfoPersonBank];
	self.PersonBankCardNo = [aDecoder decodeObjectForKey:kDLLIMInfoPersonBankCardNo];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DLLIMInfo *copy = [DLLIMInfo new];

	copy.AdminSay = self.AdminSay;
	copy.CanNotSearch = self.CanNotSearch;
	copy.HeadImgUrl = [self.HeadImgUrl copy];
	copy.Id = [self.Id copy];
	copy.Images = [self.Images copy];
	copy.PersonBank = [self.PersonBank copy];
	copy.PersonBankCardNo = [self.PersonBankCardNo copy];

	return copy;
}
@end
