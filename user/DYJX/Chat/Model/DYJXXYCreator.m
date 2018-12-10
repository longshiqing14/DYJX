//
//	DYJXXYCreator.m
//
//	Create by 岩 熊 on 7/12/2018
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
		self.belongEnterprise = dictionary[kDYJXXYCreatorBelongEnterprise];
	}	
	if(![dictionary[kDYJXXYCreatorBusiness] isKindOfClass:[NSNull class]]){
		self.business = [[DYJXXYBusines alloc] initWithDictionary:dictionary[kDYJXXYCreatorBusiness]];
	}

	if(![dictionary[kDYJXXYCreatorCellphone] isKindOfClass:[NSNull class]]){
		self.cellphone = dictionary[kDYJXXYCreatorCellphone];
	}	
	if(![dictionary[kDYJXXYCreatorCreateOn] isKindOfClass:[NSNull class]]){
		self.createOn = dictionary[kDYJXXYCreatorCreateOn];
	}	
	if(![dictionary[kDYJXXYCreatorDeleted] isKindOfClass:[NSNull class]]){
		self.deleted = [dictionary[kDYJXXYCreatorDeleted] boolValue];
	}

	if(![dictionary[kDYJXXYCreatorDisabled] isKindOfClass:[NSNull class]]){
		self.disabled = [dictionary[kDYJXXYCreatorDisabled] boolValue];
	}

	if(![dictionary[kDYJXXYCreatorDisplayName] isKindOfClass:[NSNull class]]){
		self.displayName = dictionary[kDYJXXYCreatorDisplayName];
	}	
	if(![dictionary[kDYJXXYCreatorDisplayTel] isKindOfClass:[NSNull class]]){
		self.displayTel = dictionary[kDYJXXYCreatorDisplayTel];
	}	
	if(![dictionary[kDYJXXYCreatorIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kDYJXXYCreatorIdField];
	}	
	if(![dictionary[kDYJXXYCreatorNumber] isKindOfClass:[NSNull class]]){
		self.number = [dictionary[kDYJXXYCreatorNumber] integerValue];
	}

	if(![dictionary[kDYJXXYCreatorNumberString] isKindOfClass:[NSNull class]]){
		self.numberString = dictionary[kDYJXXYCreatorNumberString];
	}	
	if(![dictionary[kDYJXXYCreatorRongCloudToken] isKindOfClass:[NSNull class]]){
		self.rongCloudToken = dictionary[kDYJXXYCreatorRongCloudToken];
	}	
	if(![dictionary[kDYJXXYCreatorType] isKindOfClass:[NSNull class]]){
		self.type = [dictionary[kDYJXXYCreatorType] integerValue];
	}

	if(![dictionary[kDYJXXYCreatorUserName] isKindOfClass:[NSNull class]]){
		self.userName = dictionary[kDYJXXYCreatorUserName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.belongEnterprise != nil){
		dictionary[kDYJXXYCreatorBelongEnterprise] = self.belongEnterprise;
	}
	if(self.business != nil){
		dictionary[kDYJXXYCreatorBusiness] = [self.business toDictionary];
	}
	if(self.cellphone != nil){
		dictionary[kDYJXXYCreatorCellphone] = self.cellphone;
	}
	if(self.createOn != nil){
		dictionary[kDYJXXYCreatorCreateOn] = self.createOn;
	}
	dictionary[kDYJXXYCreatorDeleted] = @(self.deleted);
	dictionary[kDYJXXYCreatorDisabled] = @(self.disabled);
	if(self.displayName != nil){
		dictionary[kDYJXXYCreatorDisplayName] = self.displayName;
	}
	if(self.displayTel != nil){
		dictionary[kDYJXXYCreatorDisplayTel] = self.displayTel;
	}
	if(self.idField != nil){
		dictionary[kDYJXXYCreatorIdField] = self.idField;
	}
	dictionary[kDYJXXYCreatorNumber] = @(self.number);
	if(self.numberString != nil){
		dictionary[kDYJXXYCreatorNumberString] = self.numberString;
	}
	if(self.rongCloudToken != nil){
		dictionary[kDYJXXYCreatorRongCloudToken] = self.rongCloudToken;
	}
	dictionary[kDYJXXYCreatorType] = @(self.type);
	if(self.userName != nil){
		dictionary[kDYJXXYCreatorUserName] = self.userName;
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
	if(self.belongEnterprise != nil){
		[aCoder encodeObject:self.belongEnterprise forKey:kDYJXXYCreatorBelongEnterprise];
	}
	if(self.business != nil){
		[aCoder encodeObject:self.business forKey:kDYJXXYCreatorBusiness];
	}
	if(self.cellphone != nil){
		[aCoder encodeObject:self.cellphone forKey:kDYJXXYCreatorCellphone];
	}
	if(self.createOn != nil){
		[aCoder encodeObject:self.createOn forKey:kDYJXXYCreatorCreateOn];
	}
	[aCoder encodeObject:@(self.deleted) forKey:kDYJXXYCreatorDeleted];	[aCoder encodeObject:@(self.disabled) forKey:kDYJXXYCreatorDisabled];	if(self.displayName != nil){
		[aCoder encodeObject:self.displayName forKey:kDYJXXYCreatorDisplayName];
	}
	if(self.displayTel != nil){
		[aCoder encodeObject:self.displayTel forKey:kDYJXXYCreatorDisplayTel];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kDYJXXYCreatorIdField];
	}
	[aCoder encodeObject:@(self.number) forKey:kDYJXXYCreatorNumber];	if(self.numberString != nil){
		[aCoder encodeObject:self.numberString forKey:kDYJXXYCreatorNumberString];
	}
	if(self.rongCloudToken != nil){
		[aCoder encodeObject:self.rongCloudToken forKey:kDYJXXYCreatorRongCloudToken];
	}
	[aCoder encodeObject:@(self.type) forKey:kDYJXXYCreatorType];	if(self.userName != nil){
		[aCoder encodeObject:self.userName forKey:kDYJXXYCreatorUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.belongEnterprise = [aDecoder decodeObjectForKey:kDYJXXYCreatorBelongEnterprise];
	self.business = [aDecoder decodeObjectForKey:kDYJXXYCreatorBusiness];
	self.cellphone = [aDecoder decodeObjectForKey:kDYJXXYCreatorCellphone];
	self.createOn = [aDecoder decodeObjectForKey:kDYJXXYCreatorCreateOn];
	self.deleted = [[aDecoder decodeObjectForKey:kDYJXXYCreatorDeleted] boolValue];
	self.disabled = [[aDecoder decodeObjectForKey:kDYJXXYCreatorDisabled] boolValue];
	self.displayName = [aDecoder decodeObjectForKey:kDYJXXYCreatorDisplayName];
	self.displayTel = [aDecoder decodeObjectForKey:kDYJXXYCreatorDisplayTel];
	self.idField = [aDecoder decodeObjectForKey:kDYJXXYCreatorIdField];
	self.number = [[aDecoder decodeObjectForKey:kDYJXXYCreatorNumber] integerValue];
	self.numberString = [aDecoder decodeObjectForKey:kDYJXXYCreatorNumberString];
	self.rongCloudToken = [aDecoder decodeObjectForKey:kDYJXXYCreatorRongCloudToken];
	self.type = [[aDecoder decodeObjectForKey:kDYJXXYCreatorType] integerValue];
	self.userName = [aDecoder decodeObjectForKey:kDYJXXYCreatorUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXXYCreator *copy = [DYJXXYCreator new];

	copy.belongEnterprise = [self.belongEnterprise copy];
	copy.business = [self.business copy];
	copy.cellphone = [self.cellphone copy];
	copy.createOn = [self.createOn copy];
	copy.deleted = self.deleted;
	copy.disabled = self.disabled;
	copy.displayName = [self.displayName copy];
	copy.displayTel = [self.displayTel copy];
	copy.idField = [self.idField copy];
	copy.number = self.number;
	copy.numberString = [self.numberString copy];
	copy.rongCloudToken = [self.rongCloudToken copy];
	copy.type = self.type;
	copy.userName = [self.userName copy];

	return copy;
}
@end