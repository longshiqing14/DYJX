//
//	DJJXCreator.m
//
//	Create by longshiqing on 17/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJXCreator.h"

NSString *const kDJJXCreatorBelongEnterprise = @"BelongEnterprise";
NSString *const kDJJXCreatorBusiness = @"Business";
NSString *const kDJJXCreatorCellphone = @"Cellphone";
NSString *const kDJJXCreatorCreateOn = @"CreateOn";
NSString *const kDJJXCreatorDeleted = @"Deleted";
NSString *const kDJJXCreatorDisabled = @"Disabled";
NSString *const kDJJXCreatorDisplayName = @"DisplayName";
NSString *const kDJJXCreatorIdField = @"Id";
NSString *const kDJJXCreatorNumber = @"Number";
NSString *const kDJJXCreatorNumberString = @"NumberString";
NSString *const kDJJXCreatorRongCloudToken = @"RongCloudToken";
NSString *const kDJJXCreatorType = @"Type";
NSString *const kDJJXCreatorUserName = @"UserName";

@interface DJJXCreator ()
@end
@implementation DJJXCreator




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJXCreatorBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.BelongEnterprise = dictionary[kDJJXCreatorBelongEnterprise];
	}	
	if(![dictionary[kDJJXCreatorBusiness] isKindOfClass:[NSNull class]]){
		self.Business = [[DJJXBusines alloc] initWithDictionary:dictionary[kDJJXCreatorBusiness]];
	}

	if(![dictionary[kDJJXCreatorCellphone] isKindOfClass:[NSNull class]]){
		self.Cellphone = dictionary[kDJJXCreatorCellphone];
	}	
	if(![dictionary[kDJJXCreatorCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDJJXCreatorCreateOn];
	}	
	if(![dictionary[kDJJXCreatorDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDJJXCreatorDeleted] boolValue];
	}

	if(![dictionary[kDJJXCreatorDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDJJXCreatorDisabled] boolValue];
	}

	if(![dictionary[kDJJXCreatorDisplayName] isKindOfClass:[NSNull class]]){
		self.DisplayName = dictionary[kDJJXCreatorDisplayName];
	}	
	if(![dictionary[kDJJXCreatorIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kDJJXCreatorIdField];
	}	
	if(![dictionary[kDJJXCreatorNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kDJJXCreatorNumber] integerValue];
	}

	if(![dictionary[kDJJXCreatorNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kDJJXCreatorNumberString];
	}	
	if(![dictionary[kDJJXCreatorRongCloudToken] isKindOfClass:[NSNull class]]){
		self.RongCloudToken = dictionary[kDJJXCreatorRongCloudToken];
	}	
	if(![dictionary[kDJJXCreatorType] isKindOfClass:[NSNull class]]){
		self.Type = [dictionary[kDJJXCreatorType] integerValue];
	}

	if(![dictionary[kDJJXCreatorUserName] isKindOfClass:[NSNull class]]){
		self.UserName = dictionary[kDJJXCreatorUserName];
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
		dictionary[kDJJXCreatorBelongEnterprise] = self.BelongEnterprise;
	}
	if(self.Business != nil){
		dictionary[kDJJXCreatorBusiness] = [self.Business toDictionary];
	}
	if(self.Cellphone != nil){
		dictionary[kDJJXCreatorCellphone] = self.Cellphone;
	}
	if(self.CreateOn != nil){
		dictionary[kDJJXCreatorCreateOn] = self.CreateOn;
	}
	dictionary[kDJJXCreatorDeleted] = @(self.Deleted);
	dictionary[kDJJXCreatorDisabled] = @(self.Disabled);
	if(self.DisplayName != nil){
		dictionary[kDJJXCreatorDisplayName] = self.DisplayName;
	}
	if(self.IdField != nil){
		dictionary[kDJJXCreatorIdField] = self.IdField;
	}
	dictionary[kDJJXCreatorNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kDJJXCreatorNumberString] = self.NumberString;
	}
	if(self.RongCloudToken != nil){
		dictionary[kDJJXCreatorRongCloudToken] = self.RongCloudToken;
	}
	dictionary[kDJJXCreatorType] = @(self.Type);
	if(self.UserName != nil){
		dictionary[kDJJXCreatorUserName] = self.UserName;
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
		[aCoder encodeObject:self.BelongEnterprise forKey:kDJJXCreatorBelongEnterprise];
	}
	if(self.Business != nil){
		[aCoder encodeObject:self.Business forKey:kDJJXCreatorBusiness];
	}
	if(self.Cellphone != nil){
		[aCoder encodeObject:self.Cellphone forKey:kDJJXCreatorCellphone];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDJJXCreatorCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDJJXCreatorDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDJJXCreatorDisabled];	if(self.DisplayName != nil){
		[aCoder encodeObject:self.DisplayName forKey:kDJJXCreatorDisplayName];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kDJJXCreatorIdField];
	}
	[aCoder encodeObject:@(self.Number) forKey:kDJJXCreatorNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kDJJXCreatorNumberString];
	}
	if(self.RongCloudToken != nil){
		[aCoder encodeObject:self.RongCloudToken forKey:kDJJXCreatorRongCloudToken];
	}
	[aCoder encodeObject:@(self.Type) forKey:kDJJXCreatorType];	if(self.UserName != nil){
		[aCoder encodeObject:self.UserName forKey:kDJJXCreatorUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.BelongEnterprise = [aDecoder decodeObjectForKey:kDJJXCreatorBelongEnterprise];
	self.Business = [aDecoder decodeObjectForKey:kDJJXCreatorBusiness];
	self.Cellphone = [aDecoder decodeObjectForKey:kDJJXCreatorCellphone];
	self.CreateOn = [aDecoder decodeObjectForKey:kDJJXCreatorCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDJJXCreatorDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDJJXCreatorDisabled] boolValue];
	self.DisplayName = [aDecoder decodeObjectForKey:kDJJXCreatorDisplayName];
	self.IdField = [aDecoder decodeObjectForKey:kDJJXCreatorIdField];
	self.Number = [[aDecoder decodeObjectForKey:kDJJXCreatorNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kDJJXCreatorNumberString];
	self.RongCloudToken = [aDecoder decodeObjectForKey:kDJJXCreatorRongCloudToken];
	self.Type = [[aDecoder decodeObjectForKey:kDJJXCreatorType] integerValue];
	self.UserName = [aDecoder decodeObjectForKey:kDJJXCreatorUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJXCreator *copy = [DJJXCreator new];

	copy.BelongEnterprise = [self.BelongEnterprise copy];
	copy.Business = [self.Business copy];
	copy.Cellphone = [self.Cellphone copy];
	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.DisplayName = [self.DisplayName copy];
	copy.IdField = [self.IdField copy];
	copy.Number = self.Number;
	copy.NumberString = [self.NumberString copy];
	copy.RongCloudToken = [self.RongCloudToken copy];
	copy.Type = self.Type;
	copy.UserName = [self.UserName copy];

	return copy;
}
@end