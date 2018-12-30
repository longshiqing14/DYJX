//
//	DIIMemberFrom.m
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DIIMemberFrom.h"

NSString *const kDIIMemberFromBelongEnterprise = @"BelongEnterprise";
NSString *const kDIIMemberFromBusiness = @"Business";
NSString *const kDIIMemberFromCellphone = @"Cellphone";
NSString *const kDIIMemberFromCreateOn = @"CreateOn";
NSString *const kDIIMemberFromDeleted = @"Deleted";
NSString *const kDIIMemberFromDisabled = @"Disabled";
NSString *const kDIIMemberFromDisplayName = @"DisplayName";
NSString *const kDIIMemberFromDisplayTel = @"DisplayTel";
NSString *const kDIIMemberFromIdField = @"Id";
NSString *const kDIIMemberFromNumber = @"Number";
NSString *const kDIIMemberFromNumberString = @"NumberString";
NSString *const kDIIMemberFromRongCloudToken = @"RongCloudToken";
NSString *const kDIIMemberFromType = @"Type";
NSString *const kDIIMemberFromUserName = @"UserName";

@interface DIIMemberFrom ()
@end
@implementation DIIMemberFrom




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDIIMemberFromBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.BelongEnterprise = dictionary[kDIIMemberFromBelongEnterprise];
	}	
	if(![dictionary[kDIIMemberFromBusiness] isKindOfClass:[NSNull class]]){
		self.Business = [[DIIBusines alloc] initWithDictionary:dictionary[kDIIMemberFromBusiness]];
	}

	if(![dictionary[kDIIMemberFromCellphone] isKindOfClass:[NSNull class]]){
		self.Cellphone = dictionary[kDIIMemberFromCellphone];
	}	
	if(![dictionary[kDIIMemberFromCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDIIMemberFromCreateOn];
	}	
	if(![dictionary[kDIIMemberFromDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDIIMemberFromDeleted] boolValue];
	}

	if(![dictionary[kDIIMemberFromDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDIIMemberFromDisabled] boolValue];
	}

	if(![dictionary[kDIIMemberFromDisplayName] isKindOfClass:[NSNull class]]){
		self.DisplayName = dictionary[kDIIMemberFromDisplayName];
	}	
	if(![dictionary[kDIIMemberFromDisplayTel] isKindOfClass:[NSNull class]]){
		self.DisplayTel = dictionary[kDIIMemberFromDisplayTel];
	}	
	if(![dictionary[kDIIMemberFromIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kDIIMemberFromIdField];
	}	
	if(![dictionary[kDIIMemberFromNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kDIIMemberFromNumber] integerValue];
	}

	if(![dictionary[kDIIMemberFromNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kDIIMemberFromNumberString];
	}	
	if(![dictionary[kDIIMemberFromRongCloudToken] isKindOfClass:[NSNull class]]){
		self.RongCloudToken = dictionary[kDIIMemberFromRongCloudToken];
	}	
	if(![dictionary[kDIIMemberFromType] isKindOfClass:[NSNull class]]){
		self.Type = [dictionary[kDIIMemberFromType] integerValue];
	}

	if(![dictionary[kDIIMemberFromUserName] isKindOfClass:[NSNull class]]){
		self.UserName = dictionary[kDIIMemberFromUserName];
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
		dictionary[kDIIMemberFromBelongEnterprise] = self.BelongEnterprise;
	}
	if(self.Business != nil){
		dictionary[kDIIMemberFromBusiness] = [self.Business toDictionary];
	}
	if(self.Cellphone != nil){
		dictionary[kDIIMemberFromCellphone] = self.Cellphone;
	}
	if(self.CreateOn != nil){
		dictionary[kDIIMemberFromCreateOn] = self.CreateOn;
	}
	dictionary[kDIIMemberFromDeleted] = @(self.Deleted);
	dictionary[kDIIMemberFromDisabled] = @(self.Disabled);
	if(self.DisplayName != nil){
		dictionary[kDIIMemberFromDisplayName] = self.DisplayName;
	}
	if(self.DisplayTel != nil){
		dictionary[kDIIMemberFromDisplayTel] = self.DisplayTel;
	}
	if(self.IdField != nil){
		dictionary[kDIIMemberFromIdField] = self.IdField;
	}
	dictionary[kDIIMemberFromNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kDIIMemberFromNumberString] = self.NumberString;
	}
	if(self.RongCloudToken != nil){
		dictionary[kDIIMemberFromRongCloudToken] = self.RongCloudToken;
	}
	dictionary[kDIIMemberFromType] = @(self.Type);
	if(self.UserName != nil){
		dictionary[kDIIMemberFromUserName] = self.UserName;
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
		[aCoder encodeObject:self.BelongEnterprise forKey:kDIIMemberFromBelongEnterprise];
	}
	if(self.Business != nil){
		[aCoder encodeObject:self.Business forKey:kDIIMemberFromBusiness];
	}
	if(self.Cellphone != nil){
		[aCoder encodeObject:self.Cellphone forKey:kDIIMemberFromCellphone];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDIIMemberFromCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDIIMemberFromDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDIIMemberFromDisabled];	if(self.DisplayName != nil){
		[aCoder encodeObject:self.DisplayName forKey:kDIIMemberFromDisplayName];
	}
	if(self.DisplayTel != nil){
		[aCoder encodeObject:self.DisplayTel forKey:kDIIMemberFromDisplayTel];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kDIIMemberFromIdField];
	}
	[aCoder encodeObject:@(self.Number) forKey:kDIIMemberFromNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kDIIMemberFromNumberString];
	}
	if(self.RongCloudToken != nil){
		[aCoder encodeObject:self.RongCloudToken forKey:kDIIMemberFromRongCloudToken];
	}
	[aCoder encodeObject:@(self.Type) forKey:kDIIMemberFromType];	if(self.UserName != nil){
		[aCoder encodeObject:self.UserName forKey:kDIIMemberFromUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.BelongEnterprise = [aDecoder decodeObjectForKey:kDIIMemberFromBelongEnterprise];
	self.Business = [aDecoder decodeObjectForKey:kDIIMemberFromBusiness];
	self.Cellphone = [aDecoder decodeObjectForKey:kDIIMemberFromCellphone];
	self.CreateOn = [aDecoder decodeObjectForKey:kDIIMemberFromCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDIIMemberFromDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDIIMemberFromDisabled] boolValue];
	self.DisplayName = [aDecoder decodeObjectForKey:kDIIMemberFromDisplayName];
	self.DisplayTel = [aDecoder decodeObjectForKey:kDIIMemberFromDisplayTel];
	self.IdField = [aDecoder decodeObjectForKey:kDIIMemberFromIdField];
	self.Number = [[aDecoder decodeObjectForKey:kDIIMemberFromNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kDIIMemberFromNumberString];
	self.RongCloudToken = [aDecoder decodeObjectForKey:kDIIMemberFromRongCloudToken];
	self.Type = [[aDecoder decodeObjectForKey:kDIIMemberFromType] integerValue];
	self.UserName = [aDecoder decodeObjectForKey:kDIIMemberFromUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DIIMemberFrom *copy = [DIIMemberFrom new];

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