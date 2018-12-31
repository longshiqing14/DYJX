//
//	SKLatestMsgs.m
//
//	Create by longshiqing on 31/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "SKLatestMsgs.h"

NSString *const kSKLatestMsgsBody = @"Body";
NSString *const kSKLatestMsgsConversationId = @"ConversationId";
NSString *const kSKLatestMsgsCreateBy = @"CreateBy";
NSString *const kSKLatestMsgsCreateOn = @"CreateOn";
NSString *const kSKLatestMsgsDeleteBy = @"DeleteBy";
NSString *const kSKLatestMsgsDeleted = @"Deleted";
NSString *const kSKLatestMsgsDisabled = @"Disabled";
NSString *const kSKLatestMsgsFromCertifyId = @"FromCertifyId";
NSString *const kSKLatestMsgsFromId = @"FromId";
NSString *const kSKLatestMsgsIdField = @"Id";
NSString *const kSKLatestMsgsImKey = @"ImKey";
NSString *const kSKLatestMsgsKeywords = @"Keywords";
NSString *const kSKLatestMsgsMessageType = @"MessageType";
NSString *const kSKLatestMsgsRowData = @"RowData";
NSString *const kSKLatestMsgsSendType = @"SendType";
NSString *const kSKLatestMsgsTarget = @"Target";
NSString *const kSKLatestMsgsTargetId = @"TargetId";
NSString *const kSKLatestMsgsTargetType = @"TargetType";
NSString *const kSKLatestMsgsUpdateBy = @"UpdateBy";

@interface SKLatestMsgs ()
@end
@implementation SKLatestMsgs




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSKLatestMsgsBody] isKindOfClass:[NSNull class]]){
		self.Body = dictionary[kSKLatestMsgsBody];
	}	
	if(![dictionary[kSKLatestMsgsConversationId] isKindOfClass:[NSNull class]]){
		self.ConversationId = dictionary[kSKLatestMsgsConversationId];
	}	
	if(![dictionary[kSKLatestMsgsCreateBy] isKindOfClass:[NSNull class]]){
		self.CreateBy = dictionary[kSKLatestMsgsCreateBy];
	}	
	if(![dictionary[kSKLatestMsgsCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kSKLatestMsgsCreateOn];
	}	
	if(![dictionary[kSKLatestMsgsDeleteBy] isKindOfClass:[NSNull class]]){
		self.DeleteBy = dictionary[kSKLatestMsgsDeleteBy];
	}	
	if(![dictionary[kSKLatestMsgsDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kSKLatestMsgsDeleted] boolValue];
	}

	if(![dictionary[kSKLatestMsgsDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kSKLatestMsgsDisabled] boolValue];
	}

	if(![dictionary[kSKLatestMsgsFromCertifyId] isKindOfClass:[NSNull class]]){
		self.FromCertifyId = dictionary[kSKLatestMsgsFromCertifyId];
	}	
	if(![dictionary[kSKLatestMsgsFromId] isKindOfClass:[NSNull class]]){
		self.FromId = dictionary[kSKLatestMsgsFromId];
	}	
	if(![dictionary[kSKLatestMsgsIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kSKLatestMsgsIdField];
	}	
	if(![dictionary[kSKLatestMsgsImKey] isKindOfClass:[NSNull class]]){
		self.ImKey = dictionary[kSKLatestMsgsImKey];
	}	
	if(![dictionary[kSKLatestMsgsKeywords] isKindOfClass:[NSNull class]]){
		self.Keywords = dictionary[kSKLatestMsgsKeywords];
	}	
	if(![dictionary[kSKLatestMsgsMessageType] isKindOfClass:[NSNull class]]){
		self.MessageType = [dictionary[kSKLatestMsgsMessageType] integerValue];
	}

	if(![dictionary[kSKLatestMsgsRowData] isKindOfClass:[NSNull class]]){
		self.RowData = dictionary[kSKLatestMsgsRowData];
	}	
	if(![dictionary[kSKLatestMsgsSendType] isKindOfClass:[NSNull class]]){
		self.SendType = [dictionary[kSKLatestMsgsSendType] integerValue];
	}

	if(![dictionary[kSKLatestMsgsTarget] isKindOfClass:[NSNull class]]){
		self.Target = dictionary[kSKLatestMsgsTarget];
	}	
	if(![dictionary[kSKLatestMsgsTargetId] isKindOfClass:[NSNull class]]){
		self.TargetId = dictionary[kSKLatestMsgsTargetId];
	}	
	if(![dictionary[kSKLatestMsgsTargetType] isKindOfClass:[NSNull class]]){
		self.TargetType = [dictionary[kSKLatestMsgsTargetType] integerValue];
	}

	if(![dictionary[kSKLatestMsgsUpdateBy] isKindOfClass:[NSNull class]]){
		self.UpdateBy = dictionary[kSKLatestMsgsUpdateBy];
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
		dictionary[kSKLatestMsgsBody] = self.Body;
	}
	if(self.ConversationId != nil){
		dictionary[kSKLatestMsgsConversationId] = self.ConversationId;
	}
	if(self.CreateBy != nil){
		dictionary[kSKLatestMsgsCreateBy] = self.CreateBy;
	}
	if(self.CreateOn != nil){
		dictionary[kSKLatestMsgsCreateOn] = self.CreateOn;
	}
	if(self.DeleteBy != nil){
		dictionary[kSKLatestMsgsDeleteBy] = self.DeleteBy;
	}
	dictionary[kSKLatestMsgsDeleted] = @(self.Deleted);
	dictionary[kSKLatestMsgsDisabled] = @(self.Disabled);
	if(self.FromCertifyId != nil){
		dictionary[kSKLatestMsgsFromCertifyId] = self.FromCertifyId;
	}
	if(self.FromId != nil){
		dictionary[kSKLatestMsgsFromId] = self.FromId;
	}
	if(self.IdField != nil){
		dictionary[kSKLatestMsgsIdField] = self.IdField;
	}
	if(self.ImKey != nil){
		dictionary[kSKLatestMsgsImKey] = self.ImKey;
	}
	if(self.Keywords != nil){
		dictionary[kSKLatestMsgsKeywords] = self.Keywords;
	}
	dictionary[kSKLatestMsgsMessageType] = @(self.MessageType);
	if(self.RowData != nil){
		dictionary[kSKLatestMsgsRowData] = self.RowData;
	}
	dictionary[kSKLatestMsgsSendType] = @(self.SendType);
	if(self.Target != nil){
		dictionary[kSKLatestMsgsTarget] = self.Target;
	}
	if(self.TargetId != nil){
		dictionary[kSKLatestMsgsTargetId] = self.TargetId;
	}
	dictionary[kSKLatestMsgsTargetType] = @(self.TargetType);
	if(self.UpdateBy != nil){
		dictionary[kSKLatestMsgsUpdateBy] = self.UpdateBy;
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
		[aCoder encodeObject:self.Body forKey:kSKLatestMsgsBody];
	}
	if(self.ConversationId != nil){
		[aCoder encodeObject:self.ConversationId forKey:kSKLatestMsgsConversationId];
	}
	if(self.CreateBy != nil){
		[aCoder encodeObject:self.CreateBy forKey:kSKLatestMsgsCreateBy];
	}
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kSKLatestMsgsCreateOn];
	}
	if(self.DeleteBy != nil){
		[aCoder encodeObject:self.DeleteBy forKey:kSKLatestMsgsDeleteBy];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kSKLatestMsgsDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kSKLatestMsgsDisabled];	if(self.FromCertifyId != nil){
		[aCoder encodeObject:self.FromCertifyId forKey:kSKLatestMsgsFromCertifyId];
	}
	if(self.FromId != nil){
		[aCoder encodeObject:self.FromId forKey:kSKLatestMsgsFromId];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kSKLatestMsgsIdField];
	}
	if(self.ImKey != nil){
		[aCoder encodeObject:self.ImKey forKey:kSKLatestMsgsImKey];
	}
	if(self.Keywords != nil){
		[aCoder encodeObject:self.Keywords forKey:kSKLatestMsgsKeywords];
	}
	[aCoder encodeObject:@(self.MessageType) forKey:kSKLatestMsgsMessageType];	if(self.RowData != nil){
		[aCoder encodeObject:self.RowData forKey:kSKLatestMsgsRowData];
	}
	[aCoder encodeObject:@(self.SendType) forKey:kSKLatestMsgsSendType];	if(self.Target != nil){
		[aCoder encodeObject:self.Target forKey:kSKLatestMsgsTarget];
	}
	if(self.TargetId != nil){
		[aCoder encodeObject:self.TargetId forKey:kSKLatestMsgsTargetId];
	}
	[aCoder encodeObject:@(self.TargetType) forKey:kSKLatestMsgsTargetType];	if(self.UpdateBy != nil){
		[aCoder encodeObject:self.UpdateBy forKey:kSKLatestMsgsUpdateBy];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.Body = [aDecoder decodeObjectForKey:kSKLatestMsgsBody];
	self.ConversationId = [aDecoder decodeObjectForKey:kSKLatestMsgsConversationId];
	self.CreateBy = [aDecoder decodeObjectForKey:kSKLatestMsgsCreateBy];
	self.CreateOn = [aDecoder decodeObjectForKey:kSKLatestMsgsCreateOn];
	self.DeleteBy = [aDecoder decodeObjectForKey:kSKLatestMsgsDeleteBy];
	self.Deleted = [[aDecoder decodeObjectForKey:kSKLatestMsgsDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kSKLatestMsgsDisabled] boolValue];
	self.FromCertifyId = [aDecoder decodeObjectForKey:kSKLatestMsgsFromCertifyId];
	self.FromId = [aDecoder decodeObjectForKey:kSKLatestMsgsFromId];
	self.IdField = [aDecoder decodeObjectForKey:kSKLatestMsgsIdField];
	self.ImKey = [aDecoder decodeObjectForKey:kSKLatestMsgsImKey];
	self.Keywords = [aDecoder decodeObjectForKey:kSKLatestMsgsKeywords];
	self.MessageType = [[aDecoder decodeObjectForKey:kSKLatestMsgsMessageType] integerValue];
	self.RowData = [aDecoder decodeObjectForKey:kSKLatestMsgsRowData];
	self.SendType = [[aDecoder decodeObjectForKey:kSKLatestMsgsSendType] integerValue];
	self.Target = [aDecoder decodeObjectForKey:kSKLatestMsgsTarget];
	self.TargetId = [aDecoder decodeObjectForKey:kSKLatestMsgsTargetId];
	self.TargetType = [[aDecoder decodeObjectForKey:kSKLatestMsgsTargetType] integerValue];
	self.UpdateBy = [aDecoder decodeObjectForKey:kSKLatestMsgsUpdateBy];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	SKLatestMsgs *copy = [SKLatestMsgs new];

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
	copy.Keywords = [self.Keywords copy];
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