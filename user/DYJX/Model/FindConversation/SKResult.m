//
//	SKResult.m
//
//	Create by longshiqing on 31/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "SKResult.h"

NSString *const kSKResultCreateBy = @"CreateBy";
NSString *const kSKResultCreateOn = @"CreateOn";
NSString *const kSKResultDeleted = @"Deleted";
NSString *const kSKResultDisabled = @"Disabled";
NSString *const kSKResultFromHeadImg = @"FromHeadImg";
NSString *const kSKResultFromId = @"FromId";
NSString *const kSKResultFromName = @"FromName";
NSString *const kSKResultIdField = @"Id";
NSString *const kSKResultLastMsg = @"LastMsg";
NSString *const kSKResultLatestMsgs = @"LatestMsgs";
NSString *const kSKResultTargetHeadImg = @"TargetHeadImg";
NSString *const kSKResultTargetId = @"TargetId";
NSString *const kSKResultTargetName = @"TargetName";
NSString *const kSKResultType = @"Type";
NSString *const kSKResultUpdateBy = @"UpdateBy";
NSString *const kSKResultUpdateOn = @"UpdateOn";

@interface SKResult ()
@end
@implementation SKResult




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSKResultCreateBy] isKindOfClass:[NSNull class]]){
		self.CreateBy = dictionary[kSKResultCreateBy];
	}	
	if(![dictionary[kSKResultCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kSKResultCreateOn];
	}	
	if(![dictionary[kSKResultDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kSKResultDeleted] boolValue];
	}

	if(![dictionary[kSKResultDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kSKResultDisabled] boolValue];
	}

	if(![dictionary[kSKResultFromHeadImg] isKindOfClass:[NSNull class]]){
		self.FromHeadImg = dictionary[kSKResultFromHeadImg];
	}	
	if(![dictionary[kSKResultFromId] isKindOfClass:[NSNull class]]){
		self.FromId = dictionary[kSKResultFromId];
	}	
	if(![dictionary[kSKResultFromName] isKindOfClass:[NSNull class]]){
		self.FromName = dictionary[kSKResultFromName];
	}	
	if(![dictionary[kSKResultIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kSKResultIdField];
	}	
	if(![dictionary[kSKResultLastMsg] isKindOfClass:[NSNull class]]){
		self.LastMsg = [[SKLastMg alloc] initWithDictionary:dictionary[kSKResultLastMsg]];
	}

	if(dictionary[kSKResultLatestMsgs] != nil && [dictionary[kSKResultLatestMsgs] isKindOfClass:[NSArray class]]){
		NSArray * LatestMsgsDictionaries = dictionary[kSKResultLatestMsgs];
		NSMutableArray * LatestMsgsItems = [NSMutableArray array];
		for(NSDictionary * LatestMsgsDictionary in LatestMsgsDictionaries){
			SKLatestMsgs * LatestMsgsItem = [[SKLatestMsgs alloc] initWithDictionary:LatestMsgsDictionary];
			[LatestMsgsItems addObject:LatestMsgsItem];
		}
		self.LatestMsgs = LatestMsgsItems;
	}
	if(![dictionary[kSKResultTargetHeadImg] isKindOfClass:[NSNull class]]){
		self.TargetHeadImg = dictionary[kSKResultTargetHeadImg];
	}	
	if(![dictionary[kSKResultTargetId] isKindOfClass:[NSNull class]]){
		self.TargetId = dictionary[kSKResultTargetId];
	}	
	if(![dictionary[kSKResultTargetName] isKindOfClass:[NSNull class]]){
		self.TargetName = dictionary[kSKResultTargetName];
	}	
	if(![dictionary[kSKResultType] isKindOfClass:[NSNull class]]){
		self.Type = [dictionary[kSKResultType] integerValue];
	}

	if(![dictionary[kSKResultUpdateBy] isKindOfClass:[NSNull class]]){
		self.UpdateBy = dictionary[kSKResultUpdateBy];
	}	
	if(![dictionary[kSKResultUpdateOn] isKindOfClass:[NSNull class]]){
		self.UpdateOn = dictionary[kSKResultUpdateOn];
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
		dictionary[kSKResultCreateBy] = self.CreateBy;
	}
	if(self.CreateOn != nil){
		dictionary[kSKResultCreateOn] = self.CreateOn;
	}
	dictionary[kSKResultDeleted] = @(self.Deleted);
	dictionary[kSKResultDisabled] = @(self.Disabled);
	if(self.FromHeadImg != nil){
		dictionary[kSKResultFromHeadImg] = self.FromHeadImg;
	}
	if(self.FromId != nil){
		dictionary[kSKResultFromId] = self.FromId;
	}
	if(self.FromName != nil){
		dictionary[kSKResultFromName] = self.FromName;
	}
	if(self.IdField != nil){
		dictionary[kSKResultIdField] = self.IdField;
	}
	if(self.LastMsg != nil){
		dictionary[kSKResultLastMsg] = [self.LastMsg toDictionary];
	}
	if(self.LatestMsgs != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(SKLatestMsgs * LatestMsgsElement in self.LatestMsgs){
			[dictionaryElements addObject:[LatestMsgsElement toDictionary]];
		}
		dictionary[kSKResultLatestMsgs] = dictionaryElements;
	}
	if(self.TargetHeadImg != nil){
		dictionary[kSKResultTargetHeadImg] = self.TargetHeadImg;
	}
	if(self.TargetId != nil){
		dictionary[kSKResultTargetId] = self.TargetId;
	}
	if(self.TargetName != nil){
		dictionary[kSKResultTargetName] = self.TargetName;
	}
	dictionary[kSKResultType] = @(self.Type);
	if(self.UpdateBy != nil){
		dictionary[kSKResultUpdateBy] = self.UpdateBy;
	}
	if(self.UpdateOn != nil){
		dictionary[kSKResultUpdateOn] = self.UpdateOn;
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
		[aCoder encodeObject:self.CreateBy forKey:kSKResultCreateBy];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kSKResultCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kSKResultDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kSKResultDisabled];	if(self.FromHeadImg != nil){
		[aCoder encodeObject:self.FromHeadImg forKey:kSKResultFromHeadImg];
	}
	if(self.FromId != nil){
		[aCoder encodeObject:self.FromId forKey:kSKResultFromId];
	}
	if(self.FromName != nil){
		[aCoder encodeObject:self.FromName forKey:kSKResultFromName];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kSKResultIdField];
	}
	if(self.LastMsg != nil){
		[aCoder encodeObject:self.LastMsg forKey:kSKResultLastMsg];
	}
	if(self.LatestMsgs != nil){
		[aCoder encodeObject:self.LatestMsgs forKey:kSKResultLatestMsgs];
	}
	if(self.TargetHeadImg != nil){
		[aCoder encodeObject:self.TargetHeadImg forKey:kSKResultTargetHeadImg];
	}
	if(self.TargetId != nil){
		[aCoder encodeObject:self.TargetId forKey:kSKResultTargetId];
	}
	if(self.TargetName != nil){
		[aCoder encodeObject:self.TargetName forKey:kSKResultTargetName];
	}
	[aCoder encodeObject:@(self.Type) forKey:kSKResultType];	if(self.UpdateBy != nil){
		[aCoder encodeObject:self.UpdateBy forKey:kSKResultUpdateBy];
	}
	if(self.UpdateOn != nil){
		[aCoder encodeObject:self.UpdateOn forKey:kSKResultUpdateOn];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.CreateBy = [aDecoder decodeObjectForKey:kSKResultCreateBy];
	self.CreateOn = [aDecoder decodeObjectForKey:kSKResultCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kSKResultDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kSKResultDisabled] boolValue];
	self.FromHeadImg = [aDecoder decodeObjectForKey:kSKResultFromHeadImg];
	self.FromId = [aDecoder decodeObjectForKey:kSKResultFromId];
	self.FromName = [aDecoder decodeObjectForKey:kSKResultFromName];
	self.IdField = [aDecoder decodeObjectForKey:kSKResultIdField];
	self.LastMsg = [aDecoder decodeObjectForKey:kSKResultLastMsg];
	self.LatestMsgs = [aDecoder decodeObjectForKey:kSKResultLatestMsgs];
	self.TargetHeadImg = [aDecoder decodeObjectForKey:kSKResultTargetHeadImg];
	self.TargetId = [aDecoder decodeObjectForKey:kSKResultTargetId];
	self.TargetName = [aDecoder decodeObjectForKey:kSKResultTargetName];
	self.Type = [[aDecoder decodeObjectForKey:kSKResultType] integerValue];
	self.UpdateBy = [aDecoder decodeObjectForKey:kSKResultUpdateBy];
	self.UpdateOn = [aDecoder decodeObjectForKey:kSKResultUpdateOn];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	SKResult *copy = [SKResult new];

	copy.CreateBy = [self.CreateBy copy];
	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.FromHeadImg = [self.FromHeadImg copy];
	copy.FromId = [self.FromId copy];
	copy.FromName = [self.FromName copy];
	copy.IdField = [self.IdField copy];
	copy.LastMsg = [self.LastMsg copy];
	copy.LatestMsgs = [self.LatestMsgs copy];
	copy.TargetHeadImg = [self.TargetHeadImg copy];
	copy.TargetId = [self.TargetId copy];
	copy.TargetName = [self.TargetName copy];
	copy.Type = self.Type;
	copy.UpdateBy = [self.UpdateBy copy];
	copy.UpdateOn = [self.UpdateOn copy];

	return copy;
}
@end