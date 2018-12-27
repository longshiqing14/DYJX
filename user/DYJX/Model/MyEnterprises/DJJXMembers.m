//
//	DJJXMembers.m
//
//	Create by longshiqing on 17/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJXMembers.h"

NSString *const kDJJXMembersBelongEnterprise = @"BelongEnterprise";
NSString *const kDJJXMembersBusiness = @"Business";
NSString *const kDJJXMembersCellphone = @"Cellphone";
NSString *const kDJJXMembersCreateBy = @"CreateBy";
NSString *const kDJJXMembersCreateOn = @"CreateOn";
NSString *const kDJJXMembersDeleted = @"Deleted";
NSString *const kDJJXMembersDisabled = @"Disabled";
NSString *const kDJJXMembersDisplayName = @"DisplayName";
NSString *const kDJJXMembersIdField = @"Id";
NSString *const kDJJXMembersNumber = @"Number";
NSString *const kDJJXMembersNumberString = @"NumberString";
NSString *const kDJJXMembersRongCloudToken = @"RongCloudToken";
NSString *const kDJJXMembersType = @"Type";
NSString *const kDJJXMembersUpdateBy = @"UpdateBy";
NSString *const kDJJXMembersUpdateOn = @"UpdateOn";
NSString *const kDJJXMembersUserName = @"UserName";
NSString *const kDJJXMembersId = @"Id";

@interface DJJXMembers ()
@end
@implementation DJJXMembers




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJXMembersBelongEnterprise] isKindOfClass:[NSNull class]]){
		self.BelongEnterprise = dictionary[kDJJXMembersBelongEnterprise];
	}	
	if(![dictionary[kDJJXMembersBusiness] isKindOfClass:[NSNull class]]){
		self.Business = [[DJJXBusines alloc] initWithDictionary:dictionary[kDJJXMembersBusiness]];
	}

	if(![dictionary[kDJJXMembersCellphone] isKindOfClass:[NSNull class]]){
		self.Cellphone = dictionary[kDJJXMembersCellphone];
	}	
	if(![dictionary[kDJJXMembersCreateBy] isKindOfClass:[NSNull class]]){
		self.CreateBy = dictionary[kDJJXMembersCreateBy];
	}	
	if(![dictionary[kDJJXMembersCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDJJXMembersCreateOn];
	}	
	if(![dictionary[kDJJXMembersDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDJJXMembersDeleted] boolValue];
	}

	if(![dictionary[kDJJXMembersDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDJJXMembersDisabled] boolValue];
	}

	if(![dictionary[kDJJXMembersDisplayName] isKindOfClass:[NSNull class]]){
		self.DisplayName = dictionary[kDJJXMembersDisplayName];
	}	
	if(![dictionary[kDJJXMembersIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kDJJXMembersIdField];
	}	
	if(![dictionary[kDJJXMembersNumber] isKindOfClass:[NSNull class]]){
		self.Number = [dictionary[kDJJXMembersNumber] integerValue];
	}

	if(![dictionary[kDJJXMembersNumberString] isKindOfClass:[NSNull class]]){
		self.NumberString = dictionary[kDJJXMembersNumberString];
	}	
	if(![dictionary[kDJJXMembersRongCloudToken] isKindOfClass:[NSNull class]]){
		self.RongCloudToken = dictionary[kDJJXMembersRongCloudToken];
	}	
	if(![dictionary[kDJJXMembersType] isKindOfClass:[NSNull class]]){
		self.Type = [dictionary[kDJJXMembersType] integerValue];
	}

	if(![dictionary[kDJJXMembersUpdateBy] isKindOfClass:[NSNull class]]){
		self.UpdateBy = dictionary[kDJJXMembersUpdateBy];
	}	
	if(![dictionary[kDJJXMembersUpdateOn] isKindOfClass:[NSNull class]]){
		self.UpdateOn = dictionary[kDJJXMembersUpdateOn];
	}	
	if(![dictionary[kDJJXMembersUserName] isKindOfClass:[NSNull class]]){
		self.UserName = dictionary[kDJJXMembersUserName];
	}
    if(![dictionary[kDJJXMembersId] isKindOfClass:[NSNull class]]){
        self.Id = dictionary[kDJJXMembersId];
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
		dictionary[kDJJXMembersBelongEnterprise] = self.BelongEnterprise;
	}
	if(self.Business != nil){
		dictionary[kDJJXMembersBusiness] = [self.Business toDictionary];
	}
	if(self.Cellphone != nil){
		dictionary[kDJJXMembersCellphone] = self.Cellphone;
	}
	if(self.CreateBy != nil){
		dictionary[kDJJXMembersCreateBy] = self.CreateBy;
	}
	if(self.CreateOn != nil){
		dictionary[kDJJXMembersCreateOn] = self.CreateOn;
	}
	dictionary[kDJJXMembersDeleted] = @(self.Deleted);
	dictionary[kDJJXMembersDisabled] = @(self.Disabled);
	if(self.DisplayName != nil){
		dictionary[kDJJXMembersDisplayName] = self.DisplayName;
	}
	if(self.IdField != nil){
		dictionary[kDJJXMembersIdField] = self.IdField;
	}
	dictionary[kDJJXMembersNumber] = @(self.Number);
	if(self.NumberString != nil){
		dictionary[kDJJXMembersNumberString] = self.NumberString;
	}
	if(self.RongCloudToken != nil){
		dictionary[kDJJXMembersRongCloudToken] = self.RongCloudToken;
	}
	dictionary[kDJJXMembersType] = @(self.Type);
	if(self.UpdateBy != nil){
		dictionary[kDJJXMembersUpdateBy] = self.UpdateBy;
	}
	if(self.UpdateOn != nil){
		dictionary[kDJJXMembersUpdateOn] = self.UpdateOn;
	}
	if(self.UserName != nil){
		dictionary[kDJJXMembersUserName] = self.UserName;
	}
    if(self.Id != nil){
        dictionary[kDJJXMembersId] = self.Id;
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
		[aCoder encodeObject:self.BelongEnterprise forKey:kDJJXMembersBelongEnterprise];
	}
	if(self.Business != nil){
		[aCoder encodeObject:self.Business forKey:kDJJXMembersBusiness];
	}
	if(self.Cellphone != nil){
		[aCoder encodeObject:self.Cellphone forKey:kDJJXMembersCellphone];
	}
	if(self.CreateBy != nil){
		[aCoder encodeObject:self.CreateBy forKey:kDJJXMembersCreateBy];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDJJXMembersCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDJJXMembersDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDJJXMembersDisabled];	if(self.DisplayName != nil){
		[aCoder encodeObject:self.DisplayName forKey:kDJJXMembersDisplayName];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kDJJXMembersIdField];
	}
	[aCoder encodeObject:@(self.Number) forKey:kDJJXMembersNumber];	if(self.NumberString != nil){
		[aCoder encodeObject:self.NumberString forKey:kDJJXMembersNumberString];
	}
	if(self.RongCloudToken != nil){
		[aCoder encodeObject:self.RongCloudToken forKey:kDJJXMembersRongCloudToken];
	}
	[aCoder encodeObject:@(self.Type) forKey:kDJJXMembersType];	if(self.UpdateBy != nil){
		[aCoder encodeObject:self.UpdateBy forKey:kDJJXMembersUpdateBy];
	}
	if(self.UpdateOn != nil){
		[aCoder encodeObject:self.UpdateOn forKey:kDJJXMembersUpdateOn];
	}
	if(self.UserName != nil){
		[aCoder encodeObject:self.UserName forKey:kDJJXMembersUserName];
	}
    if(self.Id != nil){
        [aCoder encodeObject:self.Id forKey:kDJJXMembersId];
    }

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.BelongEnterprise = [aDecoder decodeObjectForKey:kDJJXMembersBelongEnterprise];
	self.Business = [aDecoder decodeObjectForKey:kDJJXMembersBusiness];
	self.Cellphone = [aDecoder decodeObjectForKey:kDJJXMembersCellphone];
	self.CreateBy = [aDecoder decodeObjectForKey:kDJJXMembersCreateBy];
	self.CreateOn = [aDecoder decodeObjectForKey:kDJJXMembersCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDJJXMembersDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDJJXMembersDisabled] boolValue];
	self.DisplayName = [aDecoder decodeObjectForKey:kDJJXMembersDisplayName];
	self.IdField = [aDecoder decodeObjectForKey:kDJJXMembersIdField];
	self.Number = [[aDecoder decodeObjectForKey:kDJJXMembersNumber] integerValue];
	self.NumberString = [aDecoder decodeObjectForKey:kDJJXMembersNumberString];
	self.RongCloudToken = [aDecoder decodeObjectForKey:kDJJXMembersRongCloudToken];
	self.Type = [[aDecoder decodeObjectForKey:kDJJXMembersType] integerValue];
	self.UpdateBy = [aDecoder decodeObjectForKey:kDJJXMembersUpdateBy];
	self.UpdateOn = [aDecoder decodeObjectForKey:kDJJXMembersUpdateOn];
	self.UserName = [aDecoder decodeObjectForKey:kDJJXMembersUserName];
    self.Id = [aDecoder decodeObjectForKey:kDJJXMembersId];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJXMembers *copy = [DJJXMembers new];

	copy.BelongEnterprise = [self.BelongEnterprise copy];
	copy.Business = [self.Business copy];
	copy.Cellphone = [self.Cellphone copy];
	copy.CreateBy = [self.CreateBy copy];
	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.DisplayName = [self.DisplayName copy];
	copy.IdField = [self.IdField copy];
	copy.Number = self.Number;
	copy.NumberString = [self.NumberString copy];
	copy.RongCloudToken = [self.RongCloudToken copy];
	copy.Type = self.Type;
	copy.UpdateBy = [self.UpdateBy copy];
	copy.UpdateOn = [self.UpdateOn copy];
	copy.UserName = [self.UserName copy];
    copy.Id = [self.Id copy];
	return copy;
}
@end
