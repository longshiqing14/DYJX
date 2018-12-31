//
//	DYJOLastMg.m
//
//	Create by longshiqing on 27/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYJOLastMg.h"

NSString *const kDYJOLastMgBody = @"Body";
NSString *const kDYJOLastMgConversationId = @"ConversationId";
NSString *const kDYJOLastMgCreateBy = @"CreateBy";
NSString *const kDYJOLastMgCreateOn = @"CreateOn";
NSString *const kDYJOLastMgDeleted = @"Deleted";
NSString *const kDYJOLastMgDisabled = @"Disabled";
NSString *const kDYJOLastMgFromCertifyId = @"FromCertifyId";
NSString *const kDYJOLastMgFromId = @"FromId";
NSString *const kDYJOLastMgId = @"Id";
NSString *const kDYJOLastMgImKey = @"ImKey";
NSString *const kDYJOLastMgMessageType = @"MessageType";
NSString *const kDYJOLastMgRowData = @"RowData";
NSString *const kDYJOLastMgSendType = @"SendType";
NSString *const kDYJOLastMgTarget = @"Target";
NSString *const kDYJOLastMgTargetId = @"TargetId";
NSString *const kDYJOLastMgTargetType = @"TargetType";

@interface DYJOLastMg ()
@end
@implementation DYJOLastMg




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYJOLastMgBody] isKindOfClass:[NSNull class]]){
		self.Body = dictionary[kDYJOLastMgBody];
	}	
	if(![dictionary[kDYJOLastMgConversationId] isKindOfClass:[NSNull class]]){
		self.ConversationId = dictionary[kDYJOLastMgConversationId];
	}	
	if(![dictionary[kDYJOLastMgCreateBy] isKindOfClass:[NSNull class]]){
		self.CreateBy = dictionary[kDYJOLastMgCreateBy];
	}	
	if(![dictionary[kDYJOLastMgCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDYJOLastMgCreateOn];
	}	
	if(![dictionary[kDYJOLastMgDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDYJOLastMgDeleted] boolValue];
	}

	if(![dictionary[kDYJOLastMgDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDYJOLastMgDisabled] boolValue];
	}

	if(![dictionary[kDYJOLastMgFromCertifyId] isKindOfClass:[NSNull class]]){
		self.FromCertifyId = dictionary[kDYJOLastMgFromCertifyId];
	}	
	if(![dictionary[kDYJOLastMgFromId] isKindOfClass:[NSNull class]]){
		self.FromId = dictionary[kDYJOLastMgFromId];
	}	
	if(![dictionary[kDYJOLastMgId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDYJOLastMgId];
	}	
	if(![dictionary[kDYJOLastMgImKey] isKindOfClass:[NSNull class]]){
		self.ImKey = dictionary[kDYJOLastMgImKey];
	}	
	if(![dictionary[kDYJOLastMgMessageType] isKindOfClass:[NSNull class]]){
		self.MessageType = [dictionary[kDYJOLastMgMessageType] integerValue];
	}

	if(![dictionary[kDYJOLastMgRowData] isKindOfClass:[NSNull class]]){
		self.RowData = dictionary[kDYJOLastMgRowData];
	}	
	if(![dictionary[kDYJOLastMgSendType] isKindOfClass:[NSNull class]]){
		self.SendType = [dictionary[kDYJOLastMgSendType] integerValue];
	}

	if(![dictionary[kDYJOLastMgTarget] isKindOfClass:[NSNull class]]){
		self.Target = dictionary[kDYJOLastMgTarget];
	}	
	if(![dictionary[kDYJOLastMgTargetId] isKindOfClass:[NSNull class]]){
		self.TargetId = dictionary[kDYJOLastMgTargetId];
	}	
	if(![dictionary[kDYJOLastMgTargetType] isKindOfClass:[NSNull class]]){
		self.TargetType = [dictionary[kDYJOLastMgTargetType] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.Body != nil){
		dictionary[kDYJOLastMgBody] = self.Body;
	}
	if(self.ConversationId != nil){
		dictionary[kDYJOLastMgConversationId] = self.ConversationId;
	}
	if(self.CreateBy != nil){
		dictionary[kDYJOLastMgCreateBy] = self.CreateBy;
	}
	if(self.CreateOn != nil){
		dictionary[kDYJOLastMgCreateOn] = self.CreateOn;
	}
	dictionary[kDYJOLastMgDeleted] = @(self.Deleted);
	dictionary[kDYJOLastMgDisabled] = @(self.Disabled);
	if(self.FromCertifyId != nil){
		dictionary[kDYJOLastMgFromCertifyId] = self.FromCertifyId;
	}
	if(self.FromId != nil){
		dictionary[kDYJOLastMgFromId] = self.FromId;
	}
	if(self.Id != nil){
		dictionary[kDYJOLastMgId] = self.Id;
	}
	if(self.ImKey != nil){
		dictionary[kDYJOLastMgImKey] = self.ImKey;
	}
	dictionary[kDYJOLastMgMessageType] = @(self.MessageType);
	if(self.RowData != nil){
		dictionary[kDYJOLastMgRowData] = self.RowData;
	}
	dictionary[kDYJOLastMgSendType] = @(self.SendType);
	if(self.Target != nil){
		dictionary[kDYJOLastMgTarget] = self.Target;
	}
	if(self.TargetId != nil){
		dictionary[kDYJOLastMgTargetId] = self.TargetId;
	}
	dictionary[kDYJOLastMgTargetType] = @(self.TargetType);
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
	if(self.Body != nil){
		[aCoder encodeObject:self.Body forKey:kDYJOLastMgBody];
	}
	if(self.ConversationId != nil){
		[aCoder encodeObject:self.ConversationId forKey:kDYJOLastMgConversationId];
	}
	if(self.CreateBy != nil){
		[aCoder encodeObject:self.CreateBy forKey:kDYJOLastMgCreateBy];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDYJOLastMgCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDYJOLastMgDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDYJOLastMgDisabled];	if(self.FromCertifyId != nil){
		[aCoder encodeObject:self.FromCertifyId forKey:kDYJOLastMgFromCertifyId];
	}
	if(self.FromId != nil){
		[aCoder encodeObject:self.FromId forKey:kDYJOLastMgFromId];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDYJOLastMgId];
	}
	if(self.ImKey != nil){
		[aCoder encodeObject:self.ImKey forKey:kDYJOLastMgImKey];
	}
	[aCoder encodeObject:@(self.MessageType) forKey:kDYJOLastMgMessageType];	if(self.RowData != nil){
		[aCoder encodeObject:self.RowData forKey:kDYJOLastMgRowData];
	}
	[aCoder encodeObject:@(self.SendType) forKey:kDYJOLastMgSendType];	if(self.Target != nil){
		[aCoder encodeObject:self.Target forKey:kDYJOLastMgTarget];
	}
	if(self.TargetId != nil){
		[aCoder encodeObject:self.TargetId forKey:kDYJOLastMgTargetId];
	}
	[aCoder encodeObject:@(self.TargetType) forKey:kDYJOLastMgTargetType];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.Body = [aDecoder decodeObjectForKey:kDYJOLastMgBody];
	self.ConversationId = [aDecoder decodeObjectForKey:kDYJOLastMgConversationId];
	self.CreateBy = [aDecoder decodeObjectForKey:kDYJOLastMgCreateBy];
	self.CreateOn = [aDecoder decodeObjectForKey:kDYJOLastMgCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDYJOLastMgDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDYJOLastMgDisabled] boolValue];
	self.FromCertifyId = [aDecoder decodeObjectForKey:kDYJOLastMgFromCertifyId];
	self.FromId = [aDecoder decodeObjectForKey:kDYJOLastMgFromId];
	self.Id = [aDecoder decodeObjectForKey:kDYJOLastMgId];
	self.ImKey = [aDecoder decodeObjectForKey:kDYJOLastMgImKey];
	self.MessageType = [[aDecoder decodeObjectForKey:kDYJOLastMgMessageType] integerValue];
	self.RowData = [aDecoder decodeObjectForKey:kDYJOLastMgRowData];
	self.SendType = [[aDecoder decodeObjectForKey:kDYJOLastMgSendType] integerValue];
	self.Target = [aDecoder decodeObjectForKey:kDYJOLastMgTarget];
	self.TargetId = [aDecoder decodeObjectForKey:kDYJOLastMgTargetId];
	self.TargetType = [[aDecoder decodeObjectForKey:kDYJOLastMgTargetType] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJOLastMg *copy = [DYJOLastMg new];

	copy.Body = [self.Body copy];
	copy.ConversationId = [self.ConversationId copy];
	copy.CreateBy = [self.CreateBy copy];
	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.FromCertifyId = [self.FromCertifyId copy];
	copy.FromId = [self.FromId copy];
	copy.Id = [self.Id copy];
	copy.ImKey = [self.ImKey copy];
	copy.MessageType = self.MessageType;
	copy.RowData = [self.RowData copy];
	copy.SendType = self.SendType;
	copy.Target = [self.Target copy];
	copy.TargetId = [self.TargetId copy];
	copy.TargetType = self.TargetType;

	return copy;
}
@end
