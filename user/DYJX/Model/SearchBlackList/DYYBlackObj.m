//
//	DYYBlackObj.m
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYYBlackObj.h"

NSString *const kDYYBlackObjBelongEnterprise = @"BelongEnterprise";
NSString *const kDYYBlackObjCellphone = @"Cellphone";
NSString *const kDYYBlackObjCreateBy = @"CreateBy";
NSString *const kDYYBlackObjCreateOn = @"CreateOn";
NSString *const kDYYBlackObjDeleted = @"Deleted";
NSString *const kDYYBlackObjDisabled = @"Disabled";
NSString *const kDYYBlackObjDisplayName = @"DisplayName";
NSString *const kDYYBlackObjDisplayTel = @"DisplayTel";
NSString *const kDYYBlackObjId = @"Id";
NSString *const kDYYBlackObjNumber = @"Number";
NSString *const kDYYBlackObjNumberString = @"NumberString";
NSString *const kDYYBlackObjRongCloudToken = @"RongCloudToken";
NSString *const kDYYBlackObjType = @"Type";
NSString *const kDYYBlackObjUserName = @"UserName";

@interface DYYBlackObj ()
@end
@implementation DYYBlackObj




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYYBlackObjBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.BelongEnterprise = dictionary[kDYYBlackObjBelongEnterprise];
	}	
	if(![dictionary[kDYYBlackObjCellphone] isKindOfClass:[NSNull class]]){
		self.Cellphone = dictionary[kDYYBlackObjCellphone];
	}	
	if(![dictionary[kDYYBlackObjCreateBy] isKindOfClass:[NSNull class]]){
		self.CreateBy = dictionary[kDYYBlackObjCreateBy];
	}	
	if(![dictionary[kDYYBlackObjCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDYYBlackObjCreateOn];
	}	
	if(![dictionary[kDYYBlackObjDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDYYBlackObjDeleted] boolValue];
	}

	if(![dictionary[kDYYBlackObjDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDYYBlackObjDisabled] boolValue];
	}

	if(![dictionary[kDYYBlackObjDisplayName] isKindOfClass:[NSNull class]]){
		self.DisplayName = dictionary[kDYYBlackObjDisplayName];
	}	
	if(![dictionary[kDYYBlackObjDisplayTel] isKindOfClass:[NSNull class]]){
		self.DisplayTel = dictionary[kDYYBlackObjDisplayTel];
	}	
	if(![dictionary[kDYYBlackObjId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDYYBlackObjId];
	}	
	if(![dictionary[kDYYBlackObjNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kDYYBlackObjNumber] integerValue];
	}

	if(![dictionary[kDYYBlackObjNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kDYYBlackObjNumberString];
	}	
	if(![dictionary[kDYYBlackObjRongCloudToken] isKindOfClass:[NSNull class]]){
		self.RongCloudToken = dictionary[kDYYBlackObjRongCloudToken];
	}	
	if(![dictionary[kDYYBlackObjType] isKindOfClass:[NSNull class]]){
		self.Type = [dictionary[kDYYBlackObjType] integerValue];
	}

	if(![dictionary[kDYYBlackObjUserName] isKindOfClass:[NSNull class]]){
		self.UserName = dictionary[kDYYBlackObjUserName];
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
		dictionary[kDYYBlackObjBelongEnterprise] = self.BelongEnterprise;
	}
	if(self.Cellphone != nil){
		dictionary[kDYYBlackObjCellphone] = self.Cellphone;
	}
	if(self.CreateBy != nil){
		dictionary[kDYYBlackObjCreateBy] = self.CreateBy;
	}
	if(self.CreateOn != nil){
		dictionary[kDYYBlackObjCreateOn] = self.CreateOn;
	}
	dictionary[kDYYBlackObjDeleted] = @(self.Deleted);
	dictionary[kDYYBlackObjDisabled] = @(self.Disabled);
	if(self.DisplayName != nil){
		dictionary[kDYYBlackObjDisplayName] = self.DisplayName;
	}
	if(self.DisplayTel != nil){
		dictionary[kDYYBlackObjDisplayTel] = self.DisplayTel;
	}
	if(self.Id != nil){
		dictionary[kDYYBlackObjId] = self.Id;
	}
	dictionary[kDYYBlackObjNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kDYYBlackObjNumberString] = self.NumberString;
	}
	if(self.RongCloudToken != nil){
		dictionary[kDYYBlackObjRongCloudToken] = self.RongCloudToken;
	}
	dictionary[kDYYBlackObjType] = @(self.Type);
	if(self.UserName != nil){
		dictionary[kDYYBlackObjUserName] = self.UserName;
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
		[aCoder encodeObject:self.BelongEnterprise forKey:kDYYBlackObjBelongEnterprise];
	}
	if(self.Cellphone != nil){
		[aCoder encodeObject:self.Cellphone forKey:kDYYBlackObjCellphone];
	}
	if(self.CreateBy != nil){
		[aCoder encodeObject:self.CreateBy forKey:kDYYBlackObjCreateBy];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDYYBlackObjCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDYYBlackObjDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDYYBlackObjDisabled];	if(self.DisplayName != nil){
		[aCoder encodeObject:self.DisplayName forKey:kDYYBlackObjDisplayName];
	}
	if(self.DisplayTel != nil){
		[aCoder encodeObject:self.DisplayTel forKey:kDYYBlackObjDisplayTel];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDYYBlackObjId];
	}
	[aCoder encodeObject:@(self.Number) forKey:kDYYBlackObjNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kDYYBlackObjNumberString];
	}
	if(self.RongCloudToken != nil){
		[aCoder encodeObject:self.RongCloudToken forKey:kDYYBlackObjRongCloudToken];
	}
	[aCoder encodeObject:@(self.Type) forKey:kDYYBlackObjType];	if(self.UserName != nil){
		[aCoder encodeObject:self.UserName forKey:kDYYBlackObjUserName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.BelongEnterprise = [aDecoder decodeObjectForKey:kDYYBlackObjBelongEnterprise];
	self.Cellphone = [aDecoder decodeObjectForKey:kDYYBlackObjCellphone];
	self.CreateBy = [aDecoder decodeObjectForKey:kDYYBlackObjCreateBy];
	self.CreateOn = [aDecoder decodeObjectForKey:kDYYBlackObjCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDYYBlackObjDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDYYBlackObjDisabled] boolValue];
	self.DisplayName = [aDecoder decodeObjectForKey:kDYYBlackObjDisplayName];
	self.DisplayTel = [aDecoder decodeObjectForKey:kDYYBlackObjDisplayTel];
	self.Id = [aDecoder decodeObjectForKey:kDYYBlackObjId];
	self.Number = [[aDecoder decodeObjectForKey:kDYYBlackObjNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kDYYBlackObjNumberString];
	self.RongCloudToken = [aDecoder decodeObjectForKey:kDYYBlackObjRongCloudToken];
	self.Type = [[aDecoder decodeObjectForKey:kDYYBlackObjType] integerValue];
	self.UserName = [aDecoder decodeObjectForKey:kDYYBlackObjUserName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYYBlackObj *copy = [DYYBlackObj new];

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
