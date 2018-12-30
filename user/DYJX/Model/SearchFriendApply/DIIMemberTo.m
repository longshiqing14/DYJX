//
//	DIIMemberTo.m
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DIIMemberTo.h"

NSString *const kDIIMemberToBelongEnterprise = @"BelongEnterprise";
NSString *const kDIIMemberToCellphone = @"Cellphone";
NSString *const kDIIMemberToCreateBy = @"CreateBy";
NSString *const kDIIMemberToCreateOn = @"CreateOn";
NSString *const kDIIMemberToDeleted = @"Deleted";
NSString *const kDIIMemberToDisabled = @"Disabled";
NSString *const kDIIMemberToDisplayName = @"DisplayName";
NSString *const kDIIMemberToDisplayTel = @"DisplayTel";
NSString *const kDIIMemberToId = @"Id";
NSString *const kDIIMemberToNumber = @"Number";
NSString *const kDIIMemberToNumberString = @"NumberString";
NSString *const kDIIMemberToRongCloudToken = @"RongCloudToken";
NSString *const kDIIMemberToType = @"Type";
NSString *const kDIIMemberToUserName = @"UserName";

@interface DIIMemberTo ()
@end
@implementation DIIMemberTo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDIIMemberToBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.BelongEnterprise = dictionary[kDIIMemberToBelongEnterprise];
	}	
	if(![dictionary[kDIIMemberToCellphone] isKindOfClass:[NSNull class]]){
		self.Cellphone = dictionary[kDIIMemberToCellphone];
	}	
	if(![dictionary[kDIIMemberToCreateBy] isKindOfClass:[NSNull class]]){
		self.CreateBy = dictionary[kDIIMemberToCreateBy];
	}	
	if(![dictionary[kDIIMemberToCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDIIMemberToCreateOn];
	}	
	if(![dictionary[kDIIMemberToDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDIIMemberToDeleted] boolValue];
	}

	if(![dictionary[kDIIMemberToDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDIIMemberToDisabled] boolValue];
	}

	if(![dictionary[kDIIMemberToDisplayName] isKindOfClass:[NSNull class]]){
		self.DisplayName = dictionary[kDIIMemberToDisplayName];
	}	
	if(![dictionary[kDIIMemberToDisplayTel] isKindOfClass:[NSNull class]]){
		self.DisplayTel = dictionary[kDIIMemberToDisplayTel];
	}	
	if(![dictionary[kDIIMemberToId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDIIMemberToId];
	}	
	if(![dictionary[kDIIMemberToNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kDIIMemberToNumber] integerValue];
	}

	if(![dictionary[kDIIMemberToNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kDIIMemberToNumberString];
	}	
	if(![dictionary[kDIIMemberToRongCloudToken] isKindOfClass:[NSNull class]]){
		self.RongCloudToken = dictionary[kDIIMemberToRongCloudToken];
	}	
	if(![dictionary[kDIIMemberToType] isKindOfClass:[NSNull class]]){
		self.Type = [dictionary[kDIIMemberToType] integerValue];
	}

	if(![dictionary[kDIIMemberToUserName] isKindOfClass:[NSNull class]]){
		self.UserName = dictionary[kDIIMemberToUserName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.BelongEnterprise != nil){
		dictionary[kDIIMemberToBelongEnterprise] = self.BelongEnterprise;
	}
	if(self.Cellphone != nil){
		dictionary[kDIIMemberToCellphone] = self.Cellphone;
	}
	if(self.CreateBy != nil){
		dictionary[kDIIMemberToCreateBy] = self.CreateBy;
	}
	if(self.CreateOn != nil){
		dictionary[kDIIMemberToCreateOn] = self.CreateOn;
	}
	dictionary[kDIIMemberToDeleted] = @(self.Deleted);
	dictionary[kDIIMemberToDisabled] = @(self.Disabled);
	if(self.DisplayName != nil){
		dictionary[kDIIMemberToDisplayName] = self.DisplayName;
	}
	if(self.DisplayTel != nil){
		dictionary[kDIIMemberToDisplayTel] = self.DisplayTel;
	}
	if(self.Id != nil){
		dictionary[kDIIMemberToId] = self.Id;
	}
	dictionary[kDIIMemberToNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kDIIMemberToNumberString] = self.NumberString;
	}
	if(self.RongCloudToken != nil){
		dictionary[kDIIMemberToRongCloudToken] = self.RongCloudToken;
	}
	dictionary[kDIIMemberToType] = @(self.Type);
	if(self.UserName != nil){
		dictionary[kDIIMemberToUserName] = self.UserName;
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
	if(self.BelongEnterprise != nil){
		[aCoder encodeObject:self.BelongEnterprise forKey:kDIIMemberToBelongEnterprise];
	}
	if(self.Cellphone != nil){
		[aCoder encodeObject:self.Cellphone forKey:kDIIMemberToCellphone];
	}
	if(self.CreateBy != nil){
		[aCoder encodeObject:self.CreateBy forKey:kDIIMemberToCreateBy];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDIIMemberToCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDIIMemberToDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDIIMemberToDisabled];	if(self.DisplayName != nil){
		[aCoder encodeObject:self.DisplayName forKey:kDIIMemberToDisplayName];
	}
	if(self.DisplayTel != nil){
		[aCoder encodeObject:self.DisplayTel forKey:kDIIMemberToDisplayTel];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDIIMemberToId];
	}
	[aCoder encodeObject:@(self.Number) forKey:kDIIMemberToNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kDIIMemberToNumberString];
	}
	if(self.RongCloudToken != nil){
		[aCoder encodeObject:self.RongCloudToken forKey:kDIIMemberToRongCloudToken];
	}
	[aCoder encodeObject:@(self.Type) forKey:kDIIMemberToType];	if(self.UserName != nil){
		[aCoder encodeObject:self.UserName forKey:kDIIMemberToUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.BelongEnterprise = [aDecoder decodeObjectForKey:kDIIMemberToBelongEnterprise];
	self.Cellphone = [aDecoder decodeObjectForKey:kDIIMemberToCellphone];
	self.CreateBy = [aDecoder decodeObjectForKey:kDIIMemberToCreateBy];
	self.CreateOn = [aDecoder decodeObjectForKey:kDIIMemberToCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDIIMemberToDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDIIMemberToDisabled] boolValue];
	self.DisplayName = [aDecoder decodeObjectForKey:kDIIMemberToDisplayName];
	self.DisplayTel = [aDecoder decodeObjectForKey:kDIIMemberToDisplayTel];
	self.Id = [aDecoder decodeObjectForKey:kDIIMemberToId];
	self.Number = [[aDecoder decodeObjectForKey:kDIIMemberToNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kDIIMemberToNumberString];
	self.RongCloudToken = [aDecoder decodeObjectForKey:kDIIMemberToRongCloudToken];
	self.Type = [[aDecoder decodeObjectForKey:kDIIMemberToType] integerValue];
	self.UserName = [aDecoder decodeObjectForKey:kDIIMemberToUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DIIMemberTo *copy = [DIIMemberTo new];

	copy.BelongEnterprise = [self.BelongEnterprise copy];
	copy.Cellphone = [self.Cellphone copy];
	copy.CreateBy = [self.CreateBy copy];
	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.DisplayName = [self.DisplayName copy];
	copy.DisplayTel = [self.DisplayTel copy];
	copy.Id = [self.Id copy];
	copy.Number = self.Number;
	copy.NumberString = [self.NumberString copy];
	copy.RongCloudToken = [self.RongCloudToken copy];
	copy.Type = self.Type;
	copy.UserName = [self.UserName copy];

	return copy;
}
@end
