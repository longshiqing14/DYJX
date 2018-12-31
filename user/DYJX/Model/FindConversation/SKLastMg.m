//
//	SKLastMg.m
//
//	Create by longshiqing on 31/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "SKLastMg.h"

NSString *const kSKLastMgBody = @"Body";
NSString *const kSKLastMgConversationId = @"ConversationId";
NSString *const kSKLastMgCreateBy = @"CreateBy";
NSString *const kSKLastMgCreateOn = @"CreateOn";
NSString *const kSKLastMgDeleteBy = @"DeleteBy";
NSString *const kSKLastMgDeleted = @"Deleted";
NSString *const kSKLastMgDisabled = @"Disabled";
NSString *const kSKLastMgFromCertifyId = @"FromCertifyId";
NSString *const kSKLastMgFromId = @"FromId";
NSString *const kSKLastMgIdField = @"Id";
NSString *const kSKLastMgImKey = @"ImKey";
NSString *const kSKLastMgMessageType = @"MessageType";
NSString *const kSKLastMgRowData = @"RowData";
NSString *const kSKLastMgSendType = @"SendType";
NSString *const kSKLastMgTarget = @"Target";
NSString *const kSKLastMgTargetId = @"TargetId";
NSString *const kSKLastMgTargetType = @"TargetType";
NSString *const kSKLastMgUpdateBy = @"UpdateBy";

@interface SKLastMg ()
@end
@implementation SKLastMg




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSKLastMgBody] isKindOfClass:[NSNull class]]){
		self.Body = dictionary[kSKLastMgBody];
	}	
	if(![dictionary[kSKLastMgConversationId] isKindOfClass:[NSNull class]]){
		self.ConversationId = dictionary[kSKLastMgConversationId];
	}	
	if(![dictionary[kSKLastMgCreateBy] isKindOfClass:[NSNull class]]){
		self.CreateBy = dictionary[kSKLastMgCreateBy];
	}	
	if(![dictionary[kSKLastMgCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kSKLastMgCreateOn];
	}	
	if(![dictionary[kSKLastMgDeleteBy] isKindOfClass:[NSNull class]]){
		self.DeleteBy = dictionary[kSKLastMgDeleteBy];
	}	
	if(![dictionary[kSKLastMgDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kSKLastMgDeleted] boolValue];
	}

	if(![dictionary[kSKLastMgDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kSKLastMgDisabled] boolValue];
	}

	if(![dictionary[kSKLastMgFromCertifyId] isKindOfClass:[NSNull class]]){
		self.FromCertifyId = dictionary[kSKLastMgFromCertifyId];
	}	
	if(![dictionary[kSKLastMgFromId] isKindOfClass:[NSNull class]]){
		self.FromId = dictionary[kSKLastMgFromId];
	}	
	if(![dictionary[kSKLastMgIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kSKLastMgIdField];
	}	
	if(![dictionary[kSKLastMgImKey] isKindOfClass:[NSNull class]]){
		self.ImKey = dictionary[kSKLastMgImKey];
	}	
	if(![dictionary[kSKLastMgMessageType] isKindOfClass:[NSNull class]]){
		self.MessageType = [dictionary[kSKLastMgMessageType] integerValue];
	}

	if(![dictionary[kSKLastMgRowData] isKindOfClass:[NSNull class]]){
		self.RowData = dictionary[kSKLastMgRowData];
	}	
	if(![dictionary[kSKLastMgSendType] isKindOfClass:[NSNull class]]){
		self.SendType = [dictionary[kSKLastMgSendType] integerValue];
	}

	if(![dictionary[kSKLastMgTarget] isKindOfClass:[NSNull class]]){
		self.Target = dictionary[kSKLastMgTarget];
	}	
	if(![dictionary[kSKLastMgTargetId] isKindOfClass:[NSNull class]]){
		self.TargetId = dictionary[kSKLastMgTargetId];
	}	
	if(![dictionary[kSKLastMgTargetType] isKindOfClass:[NSNull class]]){
		self.TargetType = [dictionary[kSKLastMgTargetType] integerValue];
	}

	if(![dictionary[kSKLastMgUpdateBy] isKindOfClass:[NSNull class]]){
		self.UpdateBy = dictionary[kSKLastMgUpdateBy];
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
		dictionary[kSKLastMgBody] = self.Body;
	}
	if(self.ConversationId != nil){
		dictionary[kSKLastMgConversationId] = self.ConversationId;
	}
	if(self.CreateBy != nil){
		dictionary[kSKLastMgCreateBy] = self.CreateBy;
	}
	if(self.CreateOn != nil){
		dictionary[kSKLastMgCreateOn] = self.CreateOn;
	}
	if(self.DeleteBy != nil){
		dictionary[kSKLastMgDeleteBy] = self.DeleteBy;
	}
	dictionary[kSKLastMgDeleted] = @(self.Deleted);
	dictionary[kSKLastMgDisabled] = @(self.Disabled);
	if(self.FromCertifyId != nil){
		dictionary[kSKLastMgFromCertifyId] = self.FromCertifyId;
	}
	if(self.FromId != nil){
		dictionary[kSKLastMgFromId] = self.FromId;
	}
	if(self.IdField != nil){
		dictionary[kSKLastMgIdField] = self.IdField;
	}
	if(self.ImKey != nil){
		dictionary[kSKLastMgImKey] = self.ImKey;
	}
	dictionary[kSKLastMgMessageType] = @(self.MessageType);
	if(self.RowData != nil){
		dictionary[kSKLastMgRowData] = self.RowData;
	}
	dictionary[kSKLastMgSendType] = @(self.SendType);
	if(self.Target != nil){
		dictionary[kSKLastMgTarget] = self.Target;
	}
	if(self.TargetId != nil){
		dictionary[kSKLastMgTargetId] = self.TargetId;
	}
	dictionary[kSKLastMgTargetType] = @(self.TargetType);
	if(self.UpdateBy != nil){
		dictionary[kSKLastMgUpdateBy] = self.UpdateBy;
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
	if(self.Body != nil){
		[aCoder encodeObject:self.Body forKey:kSKLastMgBody];
	}
	if(self.ConversationId != nil){
		[aCoder encodeObject:self.ConversationId forKey:kSKLastMgConversationId];
	}
	if(self.CreateBy != nil){
		[aCoder encodeObject:self.CreateBy forKey:kSKLastMgCreateBy];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kSKLastMgCreateOn];
	}
	if(self.DeleteBy != nil){
		[aCoder encodeObject:self.DeleteBy forKey:kSKLastMgDeleteBy];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kSKLastMgDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kSKLastMgDisabled];	if(self.FromCertifyId != nil){
		[aCoder encodeObject:self.FromCertifyId forKey:kSKLastMgFromCertifyId];
	}
	if(self.FromId != nil){
		[aCoder encodeObject:self.FromId forKey:kSKLastMgFromId];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kSKLastMgIdField];
	}
	if(self.ImKey != nil){
		[aCoder encodeObject:self.ImKey forKey:kSKLastMgImKey];
	}
	[aCoder encodeObject:@(self.MessageType) forKey:kSKLastMgMessageType];	if(self.RowData != nil){
		[aCoder encodeObject:self.RowData forKey:kSKLastMgRowData];
	}
	[aCoder encodeObject:@(self.SendType) forKey:kSKLastMgSendType];	if(self.Target != nil){
		[aCoder encodeObject:self.Target forKey:kSKLastMgTarget];
	}
	if(self.TargetId != nil){
		[aCoder encodeObject:self.TargetId forKey:kSKLastMgTargetId];
	}
	[aCoder encodeObject:@(self.TargetType) forKey:kSKLastMgTargetType];	if(self.UpdateBy != nil){
		[aCoder encodeObject:self.UpdateBy forKey:kSKLastMgUpdateBy];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.Body = [aDecoder decodeObjectForKey:kSKLastMgBody];
	self.ConversationId = [aDecoder decodeObjectForKey:kSKLastMgConversationId];
	self.CreateBy = [aDecoder decodeObjectForKey:kSKLastMgCreateBy];
	self.CreateOn = [aDecoder decodeObjectForKey:kSKLastMgCreateOn];
	self.DeleteBy = [aDecoder decodeObjectForKey:kSKLastMgDeleteBy];
	self.Deleted = [[aDecoder decodeObjectForKey:kSKLastMgDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kSKLastMgDisabled] boolValue];
	self.FromCertifyId = [aDecoder decodeObjectForKey:kSKLastMgFromCertifyId];
	self.FromId = [aDecoder decodeObjectForKey:kSKLastMgFromId];
	self.IdField = [aDecoder decodeObjectForKey:kSKLastMgIdField];
	self.ImKey = [aDecoder decodeObjectForKey:kSKLastMgImKey];
	self.MessageType = [[aDecoder decodeObjectForKey:kSKLastMgMessageType] integerValue];
	self.RowData = [aDecoder decodeObjectForKey:kSKLastMgRowData];
	self.SendType = [[aDecoder decodeObjectForKey:kSKLastMgSendType] integerValue];
	self.Target = [aDecoder decodeObjectForKey:kSKLastMgTarget];
	self.TargetId = [aDecoder decodeObjectForKey:kSKLastMgTargetId];
	self.TargetType = [[aDecoder decodeObjectForKey:kSKLastMgTargetType] integerValue];
	self.UpdateBy = [aDecoder decodeObjectForKey:kSKLastMgUpdateBy];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	SKLastMg *copy = [SKLastMg new];

	copy.Body = [self.Body copy];
	copy.ConversationId = [self.ConversationId copy];
	copy.CreateBy = [self.CreateBy copy];
	copy.CreateOn = [self.CreateOn copy];
	copy.DeleteBy = [self.DeleteBy copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.FromCertifyId = [self.FromCertifyId copy];
	copy.FromId = [self.FromId copy];
	copy.IdField = [self.IdField copy];
	copy.ImKey = [self.ImKey copy];
	copy.MessageType = self.MessageType;
	copy.RowData = [self.RowData copy];
	copy.SendType = self.SendType;
	copy.Target = [self.Target copy];
	copy.TargetId = [self.TargetId copy];
	copy.TargetType = self.TargetType;
	copy.UpdateBy = [self.UpdateBy copy];

	return copy;
}
@end