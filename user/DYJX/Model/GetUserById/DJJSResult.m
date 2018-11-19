//
//	DJJSResult.m
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJSResult.h"

NSString *const kDJJSResultBelongEnterprise = @"BelongEnterprise";
NSString *const kDJJSResultBusiness = @"Business";
NSString *const kDJJSResultCellphone = @"Cellphone";
NSString *const kDJJSResultCreateOn = @"CreateOn";
NSString *const kDJJSResultDeleted = @"Deleted";
NSString *const kDJJSResultDisabled = @"Disabled";
NSString *const kDJJSResultDisplayName = @"DisplayName";
NSString *const kDJJSResultIdField = @"Id";
NSString *const kDJJSResultNumber = @"Number";
NSString *const kDJJSResultNumberString = @"NumberString";
NSString *const kDJJSResultRelation = @"Relation";
NSString *const kDJJSResultRongCloudToken = @"RongCloudToken";
NSString *const kDJJSResultType = @"Type";
NSString *const kDJJSResultUserName = @"UserName";

@interface DJJSResult ()
@end
@implementation DJJSResult




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJSResultBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.BelongEnterprise = dictionary[kDJJSResultBelongEnterprise];
	}	
	if(![dictionary[kDJJSResultBusiness] isKindOfClass:[NSNull class]]){
		self.Business = [[DJJSBusines alloc] initWithDictionary:dictionary[kDJJSResultBusiness]];
	}

	if(![dictionary[kDJJSResultCellphone] isKindOfClass:[NSNull class]]){
		self.Cellphone = dictionary[kDJJSResultCellphone];
	}	
	if(![dictionary[kDJJSResultCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDJJSResultCreateOn];
	}	
	if(![dictionary[kDJJSResultDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDJJSResultDeleted] boolValue];
	}

	if(![dictionary[kDJJSResultDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDJJSResultDisabled] boolValue];
	}

	if(![dictionary[kDJJSResultDisplayName] isKindOfClass:[NSNull class]]){
		self.DisplayName = dictionary[kDJJSResultDisplayName];
	}	
	if(![dictionary[kDJJSResultIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kDJJSResultIdField];
	}	
	if(![dictionary[kDJJSResultNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kDJJSResultNumber] integerValue];
	}

	if(![dictionary[kDJJSResultNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kDJJSResultNumberString];
	}	
	if(![dictionary[kDJJSResultRelation] isKindOfClass:[NSNull class]]){
		self.Relation = [[DJJSRelation alloc] initWithDictionary:dictionary[kDJJSResultRelation]];
	}

	if(![dictionary[kDJJSResultRongCloudToken] isKindOfClass:[NSNull class]]){
		self.RongCloudToken = dictionary[kDJJSResultRongCloudToken];
	}	
	if(![dictionary[kDJJSResultType] isKindOfClass:[NSNull class]]){
		self.Type = [dictionary[kDJJSResultType] integerValue];
	}

	if(![dictionary[kDJJSResultUserName] isKindOfClass:[NSNull class]]){
		self.UserName = dictionary[kDJJSResultUserName];
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
		dictionary[kDJJSResultBelongEnterprise] = self.BelongEnterprise;
	}
	if(self.Business != nil){
		dictionary[kDJJSResultBusiness] = [self.Business toDictionary];
	}
	if(self.Cellphone != nil){
		dictionary[kDJJSResultCellphone] = self.Cellphone;
	}
	if(self.CreateOn != nil){
		dictionary[kDJJSResultCreateOn] = self.CreateOn;
	}
	dictionary[kDJJSResultDeleted] = @(self.Deleted);
	dictionary[kDJJSResultDisabled] = @(self.Disabled);
	if(self.DisplayName != nil){
		dictionary[kDJJSResultDisplayName] = self.DisplayName;
	}
	if(self.IdField != nil){
		dictionary[kDJJSResultIdField] = self.IdField;
	}
	dictionary[kDJJSResultNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kDJJSResultNumberString] = self.NumberString;
	}
	if(self.Relation != nil){
		dictionary[kDJJSResultRelation] = [self.Relation toDictionary];
	}
	if(self.RongCloudToken != nil){
		dictionary[kDJJSResultRongCloudToken] = self.RongCloudToken;
	}
	dictionary[kDJJSResultType] = @(self.Type);
	if(self.UserName != nil){
		dictionary[kDJJSResultUserName] = self.UserName;
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
		[aCoder encodeObject:self.BelongEnterprise forKey:kDJJSResultBelongEnterprise];
	}
	if(self.Business != nil){
		[aCoder encodeObject:self.Business forKey:kDJJSResultBusiness];
	}
	if(self.Cellphone != nil){
		[aCoder encodeObject:self.Cellphone forKey:kDJJSResultCellphone];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDJJSResultCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDJJSResultDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDJJSResultDisabled];	if(self.DisplayName != nil){
		[aCoder encodeObject:self.DisplayName forKey:kDJJSResultDisplayName];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kDJJSResultIdField];
	}
	[aCoder encodeObject:@(self.Number) forKey:kDJJSResultNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kDJJSResultNumberString];
	}
	if(self.Relation != nil){
		[aCoder encodeObject:self.Relation forKey:kDJJSResultRelation];
	}
	if(self.RongCloudToken != nil){
		[aCoder encodeObject:self.RongCloudToken forKey:kDJJSResultRongCloudToken];
	}
	[aCoder encodeObject:@(self.Type) forKey:kDJJSResultType];	if(self.UserName != nil){
		[aCoder encodeObject:self.UserName forKey:kDJJSResultUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.BelongEnterprise = [aDecoder decodeObjectForKey:kDJJSResultBelongEnterprise];
	self.Business = [aDecoder decodeObjectForKey:kDJJSResultBusiness];
	self.Cellphone = [aDecoder decodeObjectForKey:kDJJSResultCellphone];
	self.CreateOn = [aDecoder decodeObjectForKey:kDJJSResultCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDJJSResultDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDJJSResultDisabled] boolValue];
	self.DisplayName = [aDecoder decodeObjectForKey:kDJJSResultDisplayName];
	self.IdField = [aDecoder decodeObjectForKey:kDJJSResultIdField];
	self.Number = [[aDecoder decodeObjectForKey:kDJJSResultNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kDJJSResultNumberString];
	self.Relation = [aDecoder decodeObjectForKey:kDJJSResultRelation];
	self.RongCloudToken = [aDecoder decodeObjectForKey:kDJJSResultRongCloudToken];
	self.Type = [[aDecoder decodeObjectForKey:kDJJSResultType] integerValue];
	self.UserName = [aDecoder decodeObjectForKey:kDJJSResultUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJSResult *copy = [DJJSResult new];

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
	copy.Relation = [self.Relation copy];
	copy.RongCloudToken = [self.RongCloudToken copy];
	copy.Type = self.Type;
	copy.UserName = [self.UserName copy];

	return copy;
}
@end