//
//	DYJOResult.m
//
//	Create by longshiqing on 27/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYJOResult.h"

NSString *const kDYJOResultCreateBy = @"CreateBy";
NSString *const kDYJOResultCreateOn = @"CreateOn";
NSString *const kDYJOResultDeleted = @"Deleted";
NSString *const kDYJOResultDisabled = @"Disabled";
NSString *const kDYJOResultFromHeadImg = @"FromHeadImg";
NSString *const kDYJOResultFromId = @"FromId";
NSString *const kDYJOResultFromName = @"FromName";
NSString *const kDYJOResultId = @"Id";
NSString *const kDYJOResultLastMsg = @"LastMsg";
NSString *const kDYJOResultTargetHeadImg = @"TargetHeadImg";
NSString *const kDYJOResultTargetId = @"TargetId";
NSString *const kDYJOResultTargetName = @"TargetName";
NSString *const kDYJOResultType = @"Type";
NSString *const kDYJOResultUpdateBy = @"UpdateBy";
NSString *const kDYJOResultUpdateOn = @"UpdateOn";

@interface DYJOResult ()
@end
@implementation DYJOResult




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYJOResultCreateBy] isKindOfClass:[NSNull class]]){
		self.CreateBy = dictionary[kDYJOResultCreateBy];
	}	
	if(![dictionary[kDYJOResultCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDYJOResultCreateOn];
	}	
	if(![dictionary[kDYJOResultDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDYJOResultDeleted] boolValue];
	}

	if(![dictionary[kDYJOResultDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDYJOResultDisabled] boolValue];
	}

	if(![dictionary[kDYJOResultFromHeadImg] isKindOfClass:[NSNull class]]){
		self.FromHeadImg = dictionary[kDYJOResultFromHeadImg];
	}	
	if(![dictionary[kDYJOResultFromId] isKindOfClass:[NSNull class]]){
		self.FromId = dictionary[kDYJOResultFromId];
	}	
	if(![dictionary[kDYJOResultFromName] isKindOfClass:[NSNull class]]){
		self.FromName = dictionary[kDYJOResultFromName];
	}	
	if(![dictionary[kDYJOResultId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDYJOResultId];
	}	
	if(![dictionary[kDYJOResultLastMsg] isKindOfClass:[NSNull class]]){
		self.LastMsg = [[NSDictionary alloc] initWithDictionary:dictionary[kDYJOResultLastMsg]];
	}

	if(![dictionary[kDYJOResultTargetHeadImg] isKindOfClass:[NSNull class]]){
		self.TargetHeadImg = dictionary[kDYJOResultTargetHeadImg];
	}	
	if(![dictionary[kDYJOResultTargetId] isKindOfClass:[NSNull class]]){
		self.TargetId = dictionary[kDYJOResultTargetId];
	}	
	if(![dictionary[kDYJOResultTargetName] isKindOfClass:[NSNull class]]){
		self.TargetName = dictionary[kDYJOResultTargetName];
	}	
	if(![dictionary[kDYJOResultType] isKindOfClass:[NSNull class]]){
		self.Type = [dictionary[kDYJOResultType] integerValue];
	}

	if(![dictionary[kDYJOResultUpdateBy] isKindOfClass:[NSNull class]]){
		self.UpdateBy = dictionary[kDYJOResultUpdateBy];
	}	
	if(![dictionary[kDYJOResultUpdateOn] isKindOfClass:[NSNull class]]){
		self.UpdateOn = dictionary[kDYJOResultUpdateOn];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.CreateBy != nil){
		dictionary[kDYJOResultCreateBy] = self.CreateBy;
	}
	if(self.CreateOn != nil){
		dictionary[kDYJOResultCreateOn] = self.CreateOn;
	}
	dictionary[kDYJOResultDeleted] = @(self.Deleted);
	dictionary[kDYJOResultDisabled] = @(self.Disabled);
	if(self.FromHeadImg != nil){
		dictionary[kDYJOResultFromHeadImg] = self.FromHeadImg;
	}
	if(self.FromId != nil){
		dictionary[kDYJOResultFromId] = self.FromId;
	}
	if(self.FromName != nil){
		dictionary[kDYJOResultFromName] = self.FromName;
	}
	if(self.Id != nil){
		dictionary[kDYJOResultId] = self.Id;
	}
	if(self.LastMsg != nil){
		dictionary[kDYJOResultLastMsg] = self.LastMsg;
	}
	if(self.TargetHeadImg != nil){
		dictionary[kDYJOResultTargetHeadImg] = self.TargetHeadImg;
	}
	if(self.TargetId != nil){
		dictionary[kDYJOResultTargetId] = self.TargetId;
	}
	if(self.TargetName != nil){
		dictionary[kDYJOResultTargetName] = self.TargetName;
	}
	dictionary[kDYJOResultType] = @(self.Type);
	if(self.UpdateBy != nil){
		dictionary[kDYJOResultUpdateBy] = self.UpdateBy;
	}
	if(self.UpdateOn != nil){
		dictionary[kDYJOResultUpdateOn] = self.UpdateOn;
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
	if(self.CreateBy != nil){
		[aCoder encodeObject:self.CreateBy forKey:kDYJOResultCreateBy];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDYJOResultCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDYJOResultDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDYJOResultDisabled];	if(self.FromHeadImg != nil){
		[aCoder encodeObject:self.FromHeadImg forKey:kDYJOResultFromHeadImg];
	}
	if(self.FromId != nil){
		[aCoder encodeObject:self.FromId forKey:kDYJOResultFromId];
	}
	if(self.FromName != nil){
		[aCoder encodeObject:self.FromName forKey:kDYJOResultFromName];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDYJOResultId];
	}
	if(self.LastMsg != nil){
		[aCoder encodeObject:self.LastMsg forKey:kDYJOResultLastMsg];
	}
	if(self.TargetHeadImg != nil){
		[aCoder encodeObject:self.TargetHeadImg forKey:kDYJOResultTargetHeadImg];
	}
	if(self.TargetId != nil){
		[aCoder encodeObject:self.TargetId forKey:kDYJOResultTargetId];
	}
	if(self.TargetName != nil){
		[aCoder encodeObject:self.TargetName forKey:kDYJOResultTargetName];
	}
	[aCoder encodeObject:@(self.Type) forKey:kDYJOResultType];	if(self.UpdateBy != nil){
		[aCoder encodeObject:self.UpdateBy forKey:kDYJOResultUpdateBy];
	}
	if(self.UpdateOn != nil){
		[aCoder encodeObject:self.UpdateOn forKey:kDYJOResultUpdateOn];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.CreateBy = [aDecoder decodeObjectForKey:kDYJOResultCreateBy];
	self.CreateOn = [aDecoder decodeObjectForKey:kDYJOResultCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDYJOResultDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDYJOResultDisabled] boolValue];
	self.FromHeadImg = [aDecoder decodeObjectForKey:kDYJOResultFromHeadImg];
	self.FromId = [aDecoder decodeObjectForKey:kDYJOResultFromId];
	self.FromName = [aDecoder decodeObjectForKey:kDYJOResultFromName];
	self.Id = [aDecoder decodeObjectForKey:kDYJOResultId];
	self.LastMsg = [aDecoder decodeObjectForKey:kDYJOResultLastMsg];
	self.TargetHeadImg = [aDecoder decodeObjectForKey:kDYJOResultTargetHeadImg];
	self.TargetId = [aDecoder decodeObjectForKey:kDYJOResultTargetId];
	self.TargetName = [aDecoder decodeObjectForKey:kDYJOResultTargetName];
	self.Type = [[aDecoder decodeObjectForKey:kDYJOResultType] integerValue];
	self.UpdateBy = [aDecoder decodeObjectForKey:kDYJOResultUpdateBy];
	self.UpdateOn = [aDecoder decodeObjectForKey:kDYJOResultUpdateOn];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJOResult *copy = [DYJOResult new];

	copy.CreateBy = [self.CreateBy copy];
	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.FromHeadImg = [self.FromHeadImg copy];
	copy.FromId = [self.FromId copy];
	copy.FromName = [self.FromName copy];
	copy.Id = [self.Id copy];
	copy.LastMsg = [self.LastMsg copy];
	copy.TargetHeadImg = [self.TargetHeadImg copy];
	copy.TargetId = [self.TargetId copy];
	copy.TargetName = [self.TargetName copy];
	copy.Type = self.Type;
	copy.UpdateBy = [self.UpdateBy copy];
	copy.UpdateOn = [self.UpdateOn copy];

	return copy;
}
@end
