//
//	DYXJResult.m
//
//	Create by longshiqing on 26/4/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYXJResult.h"

NSString *const kDYXJResultBelongEnterprise = @"BelongEnterprise";
NSString *const kDYXJResultBusiness = @"Business";
NSString *const kDYXJResultCellphone = @"Cellphone";
NSString *const kDYXJResultCreateBy = @"CreateBy";
NSString *const kDYXJResultCreateOn = @"CreateOn";
NSString *const kDYXJResultDeleted = @"Deleted";
NSString *const kDYXJResultDisabled = @"Disabled";
NSString *const kDYXJResultDisplayName = @"DisplayName";
NSString *const kDYXJResultDisplayTel = @"DisplayTel";
NSString *const kDYXJResultId = @"Id";
NSString *const kDYXJResultNumber = @"Number";
NSString *const kDYXJResultNumberString = @"NumberString";
NSString *const kDYXJResultRongCloudToken = @"RongCloudToken";
NSString *const kDYXJResultType = @"Type";
NSString *const kDYXJResultUserName = @"UserName";

@interface DYXJResult ()
@end
@implementation DYXJResult




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYXJResultBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.BelongEnterprise = dictionary[kDYXJResultBelongEnterprise];
	}	
	if(![dictionary[kDYXJResultBusiness] isKindOfClass:[NSNull class]]){
		self.Business = [[DYXJBusines alloc] initWithDictionary:dictionary[kDYXJResultBusiness]];
	}

	if(![dictionary[kDYXJResultCellphone] isKindOfClass:[NSNull class]]){
		self.Cellphone = dictionary[kDYXJResultCellphone];
	}	
	if(![dictionary[kDYXJResultCreateBy] isKindOfClass:[NSNull class]]){
		self.CreateBy = dictionary[kDYXJResultCreateBy];
	}	
	if(![dictionary[kDYXJResultCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDYXJResultCreateOn];
	}	
	if(![dictionary[kDYXJResultDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDYXJResultDeleted] boolValue];
	}

	if(![dictionary[kDYXJResultDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDYXJResultDisabled] boolValue];
	}

	if(![dictionary[kDYXJResultDisplayName] isKindOfClass:[NSNull class]]){
		self.DisplayName = dictionary[kDYXJResultDisplayName];
	}	
	if(![dictionary[kDYXJResultDisplayTel] isKindOfClass:[NSNull class]]){
		self.DisplayTel = dictionary[kDYXJResultDisplayTel];
	}	
	if(![dictionary[kDYXJResultId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDYXJResultId];
	}	
	if(![dictionary[kDYXJResultNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kDYXJResultNumber] integerValue];
	}

	if(![dictionary[kDYXJResultNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kDYXJResultNumberString];
	}	
	if(![dictionary[kDYXJResultRongCloudToken] isKindOfClass:[NSNull class]]){
		self.RongCloudToken = dictionary[kDYXJResultRongCloudToken];
	}	
	if(![dictionary[kDYXJResultType] isKindOfClass:[NSNull class]]){
		self.Type = [dictionary[kDYXJResultType] integerValue];
	}

	if(![dictionary[kDYXJResultUserName] isKindOfClass:[NSNull class]]){
		self.UserName = dictionary[kDYXJResultUserName];
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
		dictionary[kDYXJResultBelongEnterprise] = self.BelongEnterprise;
	}
	if(self.Business != nil){
		dictionary[kDYXJResultBusiness] = [self.Business toDictionary];
	}
	if(self.Cellphone != nil){
		dictionary[kDYXJResultCellphone] = self.Cellphone;
	}
	if(self.CreateBy != nil){
		dictionary[kDYXJResultCreateBy] = self.CreateBy;
	}
	if(self.CreateOn != nil){
		dictionary[kDYXJResultCreateOn] = self.CreateOn;
	}
	dictionary[kDYXJResultDeleted] = @(self.Deleted);
	dictionary[kDYXJResultDisabled] = @(self.Disabled);
	if(self.DisplayName != nil){
		dictionary[kDYXJResultDisplayName] = self.DisplayName;
	}
	if(self.DisplayTel != nil){
		dictionary[kDYXJResultDisplayTel] = self.DisplayTel;
	}
	if(self.Id != nil){
		dictionary[kDYXJResultId] = self.Id;
	}
	dictionary[kDYXJResultNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kDYXJResultNumberString] = self.NumberString;
	}
	if(self.RongCloudToken != nil){
		dictionary[kDYXJResultRongCloudToken] = self.RongCloudToken;
	}
	dictionary[kDYXJResultType] = @(self.Type);
	if(self.UserName != nil){
		dictionary[kDYXJResultUserName] = self.UserName;
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
		[aCoder encodeObject:self.BelongEnterprise forKey:kDYXJResultBelongEnterprise];
	}
	if(self.Business != nil){
		[aCoder encodeObject:self.Business forKey:kDYXJResultBusiness];
	}
	if(self.Cellphone != nil){
		[aCoder encodeObject:self.Cellphone forKey:kDYXJResultCellphone];
	}
	if(self.CreateBy != nil){
		[aCoder encodeObject:self.CreateBy forKey:kDYXJResultCreateBy];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDYXJResultCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDYXJResultDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDYXJResultDisabled];	if(self.DisplayName != nil){
		[aCoder encodeObject:self.DisplayName forKey:kDYXJResultDisplayName];
	}
	if(self.DisplayTel != nil){
		[aCoder encodeObject:self.DisplayTel forKey:kDYXJResultDisplayTel];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDYXJResultId];
	}
	[aCoder encodeObject:@(self.Number) forKey:kDYXJResultNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kDYXJResultNumberString];
	}
	if(self.RongCloudToken != nil){
		[aCoder encodeObject:self.RongCloudToken forKey:kDYXJResultRongCloudToken];
	}
	[aCoder encodeObject:@(self.Type) forKey:kDYXJResultType];	if(self.UserName != nil){
		[aCoder encodeObject:self.UserName forKey:kDYXJResultUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.BelongEnterprise = [aDecoder decodeObjectForKey:kDYXJResultBelongEnterprise];
	self.Business = [aDecoder decodeObjectForKey:kDYXJResultBusiness];
	self.Cellphone = [aDecoder decodeObjectForKey:kDYXJResultCellphone];
	self.CreateBy = [aDecoder decodeObjectForKey:kDYXJResultCreateBy];
	self.CreateOn = [aDecoder decodeObjectForKey:kDYXJResultCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDYXJResultDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDYXJResultDisabled] boolValue];
	self.DisplayName = [aDecoder decodeObjectForKey:kDYXJResultDisplayName];
	self.DisplayTel = [aDecoder decodeObjectForKey:kDYXJResultDisplayTel];
	self.Id = [aDecoder decodeObjectForKey:kDYXJResultId];
	self.Number = [[aDecoder decodeObjectForKey:kDYXJResultNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kDYXJResultNumberString];
	self.RongCloudToken = [aDecoder decodeObjectForKey:kDYXJResultRongCloudToken];
	self.Type = [[aDecoder decodeObjectForKey:kDYXJResultType] integerValue];
	self.UserName = [aDecoder decodeObjectForKey:kDYXJResultUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYXJResult *copy = [DYXJResult new];

	copy.BelongEnterprise = [self.BelongEnterprise copy];
	copy.Business = [self.Business copy];
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
