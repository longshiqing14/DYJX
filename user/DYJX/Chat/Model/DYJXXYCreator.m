//
//	DYJXXYCreator.m
//
//	Create by 岩 熊 on 12/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYJXXYCreator.h"

NSString *const kDYJXXYCreatorBelongEnterprise = @"BelongEnterprise";
NSString *const kDYJXXYCreatorBusiness = @"Business";
NSString *const kDYJXXYCreatorCellphone = @"Cellphone";
NSString *const kDYJXXYCreatorCreateOn = @"CreateOn";
NSString *const kDYJXXYCreatorDeleted = @"Deleted";
NSString *const kDYJXXYCreatorDisabled = @"Disabled";
NSString *const kDYJXXYCreatorDisplayName = @"DisplayName";
NSString *const kDYJXXYCreatorDisplayTel = @"DisplayTel";
NSString *const kDYJXXYCreatorIdField = @"Id";
NSString *const kDYJXXYCreatorNumber = @"Number";
NSString *const kDYJXXYCreatorNumberString = @"NumberString";
NSString *const kDYJXXYCreatorRongCloudToken = @"RongCloudToken";
NSString *const kDYJXXYCreatorType = @"Type";
NSString *const kDYJXXYCreatorUserName = @"UserName";

@interface DYJXXYCreator ()
@end
@implementation DYJXXYCreator




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYJXXYCreatorBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.BelongEnterprise = dictionary[kDYJXXYCreatorBelongEnterprise];
	}	
	if(![dictionary[kDYJXXYCreatorBusiness] isKindOfClass:[NSNull class]]){
		self.Business = [[DYJXXYBusines alloc] initWithDictionary:dictionary[kDYJXXYCreatorBusiness]];
	}

	if(![dictionary[kDYJXXYCreatorCellphone] isKindOfClass:[NSNull class]]){
		self.Cellphone = dictionary[kDYJXXYCreatorCellphone];
	}	
	if(![dictionary[kDYJXXYCreatorCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDYJXXYCreatorCreateOn];
	}	
	if(![dictionary[kDYJXXYCreatorDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDYJXXYCreatorDeleted] boolValue];
	}

	if(![dictionary[kDYJXXYCreatorDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDYJXXYCreatorDisabled] boolValue];
	}

	if(![dictionary[kDYJXXYCreatorDisplayName] isKindOfClass:[NSNull class]]){
		self.DisplayName = dictionary[kDYJXXYCreatorDisplayName];
	}	
	if(![dictionary[kDYJXXYCreatorDisplayTel] isKindOfClass:[NSNull class]]){
		self.DisplayTel = dictionary[kDYJXXYCreatorDisplayTel];
	}	
	if(![dictionary[kDYJXXYCreatorIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kDYJXXYCreatorIdField];
	}	
	if(![dictionary[kDYJXXYCreatorNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kDYJXXYCreatorNumber] integerValue];
	}

	if(![dictionary[kDYJXXYCreatorNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kDYJXXYCreatorNumberString];
	}	
	if(![dictionary[kDYJXXYCreatorRongCloudToken] isKindOfClass:[NSNull class]]){
		self.RongCloudToken = dictionary[kDYJXXYCreatorRongCloudToken];
	}	
	if(![dictionary[kDYJXXYCreatorType] isKindOfClass:[NSNull class]]){
		self.Type = [dictionary[kDYJXXYCreatorType] integerValue];
	}

	if(![dictionary[kDYJXXYCreatorUserName] isKindOfClass:[NSNull class]]){
		self.UserName = dictionary[kDYJXXYCreatorUserName];
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
		dictionary[kDYJXXYCreatorBelongEnterprise] = self.BelongEnterprise;
	}
	if(self.Business != nil){
		dictionary[kDYJXXYCreatorBusiness] = [self.Business toDictionary];
	}
	if(self.Cellphone != nil){
		dictionary[kDYJXXYCreatorCellphone] = self.Cellphone;
	}
	if(self.CreateOn != nil){
		dictionary[kDYJXXYCreatorCreateOn] = self.CreateOn;
	}
	dictionary[kDYJXXYCreatorDeleted] = @(self.Deleted);
	dictionary[kDYJXXYCreatorDisabled] = @(self.Disabled);
	if(self.DisplayName != nil){
		dictionary[kDYJXXYCreatorDisplayName] = self.DisplayName;
	}
	if(self.DisplayTel != nil){
		dictionary[kDYJXXYCreatorDisplayTel] = self.DisplayTel;
	}
	if(self.IdField != nil){
		dictionary[kDYJXXYCreatorIdField] = self.IdField;
	}
	dictionary[kDYJXXYCreatorNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kDYJXXYCreatorNumberString] = self.NumberString;
	}
	if(self.RongCloudToken != nil){
		dictionary[kDYJXXYCreatorRongCloudToken] = self.RongCloudToken;
	}
	dictionary[kDYJXXYCreatorType] = @(self.Type);
	if(self.UserName != nil){
		dictionary[kDYJXXYCreatorUserName] = self.UserName;
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
		[aCoder encodeObject:self.BelongEnterprise forKey:kDYJXXYCreatorBelongEnterprise];
	}
	if(self.Business != nil){
		[aCoder encodeObject:self.Business forKey:kDYJXXYCreatorBusiness];
	}
	if(self.Cellphone != nil){
		[aCoder encodeObject:self.Cellphone forKey:kDYJXXYCreatorCellphone];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDYJXXYCreatorCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDYJXXYCreatorDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDYJXXYCreatorDisabled];	if(self.DisplayName != nil){
		[aCoder encodeObject:self.DisplayName forKey:kDYJXXYCreatorDisplayName];
	}
	if(self.DisplayTel != nil){
		[aCoder encodeObject:self.DisplayTel forKey:kDYJXXYCreatorDisplayTel];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kDYJXXYCreatorIdField];
	}
	[aCoder encodeObject:@(self.Number) forKey:kDYJXXYCreatorNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kDYJXXYCreatorNumberString];
	}
	if(self.RongCloudToken != nil){
		[aCoder encodeObject:self.RongCloudToken forKey:kDYJXXYCreatorRongCloudToken];
	}
	[aCoder encodeObject:@(self.Type) forKey:kDYJXXYCreatorType];	if(self.UserName != nil){
		[aCoder encodeObject:self.UserName forKey:kDYJXXYCreatorUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.BelongEnterprise = [aDecoder decodeObjectForKey:kDYJXXYCreatorBelongEnterprise];
	self.Business = [aDecoder decodeObjectForKey:kDYJXXYCreatorBusiness];
	self.Cellphone = [aDecoder decodeObjectForKey:kDYJXXYCreatorCellphone];
	self.CreateOn = [aDecoder decodeObjectForKey:kDYJXXYCreatorCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDYJXXYCreatorDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDYJXXYCreatorDisabled] boolValue];
	self.DisplayName = [aDecoder decodeObjectForKey:kDYJXXYCreatorDisplayName];
	self.DisplayTel = [aDecoder decodeObjectForKey:kDYJXXYCreatorDisplayTel];
	self.IdField = [aDecoder decodeObjectForKey:kDYJXXYCreatorIdField];
	self.Number = [[aDecoder decodeObjectForKey:kDYJXXYCreatorNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kDYJXXYCreatorNumberString];
	self.RongCloudToken = [aDecoder decodeObjectForKey:kDYJXXYCreatorRongCloudToken];
	self.Type = [[aDecoder decodeObjectForKey:kDYJXXYCreatorType] integerValue];
	self.UserName = [aDecoder decodeObjectForKey:kDYJXXYCreatorUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXXYCreator *copy = [DYJXXYCreator new];

	copy.BelongEnterprise = [self.BelongEnterprise copy];
	copy.Business = [self.Business copy];
	copy.Cellphone = [self.Cellphone copy];
	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.DisplayName = [self.DisplayName copy];
	copy.DisplayTel = [self.DisplayTel copy];
	copy.IdField = [self.IdField copy];
	copy.Number = self.Number;
	copy.NumberString = [self.NumberString copy];
	copy.RongCloudToken = [self.RongCloudToken copy];
	copy.Type = self.Type;
	copy.UserName = [self.UserName copy];

	return copy;
}
@end