//
//	DYJXData.m
//
//	Create by longshiqing on 21/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYJXData.h"

NSString *const kDYJXDataBody = @"Body";
NSString *const kDYJXDataConversationId = @"ConversationId";
NSString *const kDYJXDataCreateBy = @"CreateBy";
NSString *const kDYJXDataCreateOn = @"CreateOn";
NSString *const kDYJXDataDeleteBy = @"DeleteBy";
NSString *const kDYJXDataDeleteOn = @"DeleteOn";
NSString *const kDYJXDataDeleted = @"Deleted";
NSString *const kDYJXDataDisabled = @"Disabled";
NSString *const kDYJXDataFromCertifyId = @"FromCertifyId";
NSString *const kDYJXDataFromId = @"FromId";
NSString *const kDYJXDataId = @"Id";
NSString *const kDYJXDataMessageType = @"MessageType";
NSString *const kDYJXDataSendType = @"SendType";
NSString *const kDYJXDataTarget = @"Target";
NSString *const kDYJXDataTargetId = @"TargetId";
NSString *const kDYJXDataTargetType = @"TargetType";
NSString *const kDYJXDataUpdateBy = @"UpdateBy";
NSString *const kDYJXDataUpdateOn = @"UpdateOn";

@interface DYJXData ()
@end
@implementation DYJXData


- (instancetype)init
{
    self = [super init];
    if (self) {
        _Deleted = NO;
        _Disabled = NO;
        _SendType = 4;
    }
    return self;
}

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [self init];
	if(![dictionary[kDYJXDataBody] isKindOfClass:[NSNull class]]){
		self.Body = dictionary[kDYJXDataBody];
	}	
	if(![dictionary[kDYJXDataConversationId] isKindOfClass:[NSNull class]]){
		self.ConversationId = dictionary[kDYJXDataConversationId];
	}	
	if(![dictionary[kDYJXDataCreateBy] isKindOfClass:[NSNull class]]){
		self.CreateBy = dictionary[kDYJXDataCreateBy];
	}	
	if(![dictionary[kDYJXDataCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = [dictionary[kDYJXDataCreateOn] integerValue];
	}

	if(![dictionary[kDYJXDataDeleteBy] isKindOfClass:[NSNull class]]){
		self.DeleteBy = dictionary[kDYJXDataDeleteBy];
	}	
	if(![dictionary[kDYJXDataDeleteOn] isKindOfClass:[NSNull class]]){
		self.DeleteOn = [dictionary[kDYJXDataDeleteOn] integerValue];
	}

	if(![dictionary[kDYJXDataDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDYJXDataDeleted] boolValue];
	}

	if(![dictionary[kDYJXDataDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDYJXDataDisabled] boolValue];
	}

	if(![dictionary[kDYJXDataFromCertifyId] isKindOfClass:[NSNull class]]){
		self.FromCertifyId = dictionary[kDYJXDataFromCertifyId];
	}	
	if(![dictionary[kDYJXDataFromId] isKindOfClass:[NSNull class]]){
		self.FromId = dictionary[kDYJXDataFromId];
	}	
	if(![dictionary[kDYJXDataId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDYJXDataId];
	}	
	if(![dictionary[kDYJXDataMessageType] isKindOfClass:[NSNull class]]){
		self.MessageType = [dictionary[kDYJXDataMessageType] integerValue];
	}

	if(![dictionary[kDYJXDataSendType] isKindOfClass:[NSNull class]]){
		self.SendType = [dictionary[kDYJXDataSendType] integerValue];
	}

	if(![dictionary[kDYJXDataTarget] isKindOfClass:[NSNull class]]){
		self.Target = dictionary[kDYJXDataTarget];
	}	
	if(![dictionary[kDYJXDataTargetId] isKindOfClass:[NSNull class]]){
		self.TargetId = dictionary[kDYJXDataTargetId];
	}	
	if(![dictionary[kDYJXDataTargetType] isKindOfClass:[NSNull class]]){
		self.TargetType = [dictionary[kDYJXDataTargetType] integerValue];
	}

	if(![dictionary[kDYJXDataUpdateBy] isKindOfClass:[NSNull class]]){
		self.UpdateBy = dictionary[kDYJXDataUpdateBy];
	}	
	if(![dictionary[kDYJXDataUpdateOn] isKindOfClass:[NSNull class]]){
		self.UpdateOn = [dictionary[kDYJXDataUpdateOn] integerValue];
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
		dictionary[kDYJXDataBody] = self.Body;
	}
	if(self.ConversationId != nil){
		dictionary[kDYJXDataConversationId] = self.ConversationId;
	}
	if(self.CreateBy != nil){
		dictionary[kDYJXDataCreateBy] = self.CreateBy;
	}
	dictionary[kDYJXDataCreateOn] = @(self.CreateOn);
	if(self.DeleteBy != nil){
		dictionary[kDYJXDataDeleteBy] = self.DeleteBy;
	}
	dictionary[kDYJXDataDeleteOn] = @(self.DeleteOn);
	dictionary[kDYJXDataDeleted] = @(self.Deleted);
	dictionary[kDYJXDataDisabled] = @(self.Disabled);
	if(self.FromCertifyId != nil){
		dictionary[kDYJXDataFromCertifyId] = self.FromCertifyId;
	}
	if(self.FromId != nil){
		dictionary[kDYJXDataFromId] = self.FromId;
	}
	if(self.Id != nil){
		dictionary[kDYJXDataId] = self.Id;
	}
	dictionary[kDYJXDataMessageType] = @(self.MessageType);
	dictionary[kDYJXDataSendType] = @(self.SendType);
	if(self.Target != nil){
		dictionary[kDYJXDataTarget] = self.Target;
	}
	if(self.TargetId != nil){
		dictionary[kDYJXDataTargetId] = self.TargetId;
	}
	dictionary[kDYJXDataTargetType] = @(self.TargetType);
	if(self.UpdateBy != nil){
		dictionary[kDYJXDataUpdateBy] = self.UpdateBy;
	}
	dictionary[kDYJXDataUpdateOn] = @(self.UpdateOn);
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
		[aCoder encodeObject:self.Body forKey:kDYJXDataBody];
	}
	if(self.ConversationId != nil){
		[aCoder encodeObject:self.ConversationId forKey:kDYJXDataConversationId];
	}
	if(self.CreateBy != nil){
		[aCoder encodeObject:self.CreateBy forKey:kDYJXDataCreateBy];
	}
	[aCoder encodeObject:@(self.CreateOn) forKey:kDYJXDataCreateOn];	if(self.DeleteBy != nil){
		[aCoder encodeObject:self.DeleteBy forKey:kDYJXDataDeleteBy];
	}
	[aCoder encodeObject:@(self.DeleteOn) forKey:kDYJXDataDeleteOn];	[aCoder encodeObject:@(self.Deleted) forKey:kDYJXDataDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDYJXDataDisabled];	if(self.FromCertifyId != nil){
		[aCoder encodeObject:self.FromCertifyId forKey:kDYJXDataFromCertifyId];
	}
	if(self.FromId != nil){
		[aCoder encodeObject:self.FromId forKey:kDYJXDataFromId];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDYJXDataId];
	}
	[aCoder encodeObject:@(self.MessageType) forKey:kDYJXDataMessageType];	[aCoder encodeObject:@(self.SendType) forKey:kDYJXDataSendType];	if(self.Target != nil){
		[aCoder encodeObject:self.Target forKey:kDYJXDataTarget];
	}
	if(self.TargetId != nil){
		[aCoder encodeObject:self.TargetId forKey:kDYJXDataTargetId];
	}
	[aCoder encodeObject:@(self.TargetType) forKey:kDYJXDataTargetType];	if(self.UpdateBy != nil){
		[aCoder encodeObject:self.UpdateBy forKey:kDYJXDataUpdateBy];
	}
	[aCoder encodeObject:@(self.UpdateOn) forKey:kDYJXDataUpdateOn];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.Body = [aDecoder decodeObjectForKey:kDYJXDataBody];
	self.ConversationId = [aDecoder decodeObjectForKey:kDYJXDataConversationId];
	self.CreateBy = [aDecoder decodeObjectForKey:kDYJXDataCreateBy];
	self.CreateOn = [[aDecoder decodeObjectForKey:kDYJXDataCreateOn] integerValue];
	self.DeleteBy = [aDecoder decodeObjectForKey:kDYJXDataDeleteBy];
	self.DeleteOn = [[aDecoder decodeObjectForKey:kDYJXDataDeleteOn] integerValue];
	self.Deleted = [[aDecoder decodeObjectForKey:kDYJXDataDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDYJXDataDisabled] boolValue];
	self.FromCertifyId = [aDecoder decodeObjectForKey:kDYJXDataFromCertifyId];
	self.FromId = [aDecoder decodeObjectForKey:kDYJXDataFromId];
	self.Id = [aDecoder decodeObjectForKey:kDYJXDataId];
	self.MessageType = [[aDecoder decodeObjectForKey:kDYJXDataMessageType] integerValue];
	self.SendType = [[aDecoder decodeObjectForKey:kDYJXDataSendType] integerValue];
	self.Target = [aDecoder decodeObjectForKey:kDYJXDataTarget];
	self.TargetId = [aDecoder decodeObjectForKey:kDYJXDataTargetId];
	self.TargetType = [[aDecoder decodeObjectForKey:kDYJXDataTargetType] integerValue];
	self.UpdateBy = [aDecoder decodeObjectForKey:kDYJXDataUpdateBy];
	self.UpdateOn = [[aDecoder decodeObjectForKey:kDYJXDataUpdateOn] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXData *copy = [DYJXData new];

	copy.Body = [self.Body copy];
	copy.ConversationId = [self.ConversationId copy];
	copy.CreateBy = [self.CreateBy copy];
	copy.CreateOn = self.CreateOn;
	copy.DeleteBy = [self.DeleteBy copy];
	copy.DeleteOn = self.DeleteOn;
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.FromCertifyId = [self.FromCertifyId copy];
	copy.FromId = [self.FromId copy];
	copy.Id = [self.Id copy];
	copy.MessageType = self.MessageType;
	copy.SendType = self.SendType;
	copy.Target = [self.Target copy];
	copy.TargetId = [self.TargetId copy];
	copy.TargetType = self.TargetType;
	copy.UpdateBy = [self.UpdateBy copy];
	copy.UpdateOn = self.UpdateOn;

	return copy;
}
@end
