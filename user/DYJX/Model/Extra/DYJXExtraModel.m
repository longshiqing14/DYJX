//
//	DYJXExtraModel.m
//
//	Create by longshiqing on 14/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYJXExtraModel.h"

NSString *const kDYJXExtraModelconversationId = @"ConversationId";
NSString *const kDYJXExtraModelfromCertifyHeadImg = @"FromCertifyHeadImg";
NSString *const kDYJXExtraModelfromCertifyId = @"FromCertifyId";
NSString *const kDYJXExtraModelfromCertifyName = @"FromCertifyName";
NSString *const kDYJXExtraModelfromHeadImg = @"FromHeadImg";
NSString *const kDYJXExtraModelfromId = @"FromId";
NSString *const kDYJXExtraModelfromName = @"FromName";
NSString *const kDYJXExtraModelgMembers = @"GMembers";
NSString *const kDYJXExtraModelgType = @"GType";
NSString *const kDYJXExtraModelId = @"Id";
NSString *const kDYJXExtraModelimKey = @"ImKey";
NSString *const kDYJXExtraModelkeywords = @"Keywords";
NSString *const kDYJXExtraModelmessageType = @"MessageType";
NSString *const kDYJXExtraModelmsgTime = @"MsgTime";
NSString *const kDYJXExtraModeltargetHeadImg = @"TargetHeadImg";
NSString *const kDYJXExtraModeltargetId = @"TargetId";
NSString *const kDYJXExtraModeltargetName = @"TargetName";
NSString *const kDYJXExtraModeltargetType = @"TargetType";

@interface DYJXExtraModel ()
@end
@implementation DYJXExtraModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYJXExtraModelconversationId] isKindOfClass:[NSNull class]]){
		self.conversationId = dictionary[kDYJXExtraModelconversationId];
	}	
	if(![dictionary[kDYJXExtraModelfromCertifyHeadImg] isKindOfClass:[NSNull class]]){
		self.fromCertifyHeadImg = dictionary[kDYJXExtraModelfromCertifyHeadImg];
	}	
	if(![dictionary[kDYJXExtraModelfromCertifyId] isKindOfClass:[NSNull class]]){
		self.fromCertifyId = dictionary[kDYJXExtraModelfromCertifyId];
	}	
	if(![dictionary[kDYJXExtraModelfromCertifyName] isKindOfClass:[NSNull class]]){
		self.fromCertifyName = dictionary[kDYJXExtraModelfromCertifyName];
	}	
	if(![dictionary[kDYJXExtraModelfromHeadImg] isKindOfClass:[NSNull class]]){
		self.fromHeadImg = dictionary[kDYJXExtraModelfromHeadImg];
	}	
	if(![dictionary[kDYJXExtraModelfromId] isKindOfClass:[NSNull class]]){
		self.fromId = dictionary[kDYJXExtraModelfromId];
	}	
	if(![dictionary[kDYJXExtraModelfromName] isKindOfClass:[NSNull class]]){
		self.fromName = dictionary[kDYJXExtraModelfromName];
	}	
	if(![dictionary[kDYJXExtraModelgMembers] isKindOfClass:[NSNull class]]){
		self.gMembers = dictionary[kDYJXExtraModelgMembers];
	}	
	if(![dictionary[kDYJXExtraModelgType] isKindOfClass:[NSNull class]]){
		self.gType = [dictionary[kDYJXExtraModelgType] integerValue];
	}

	if(![dictionary[kDYJXExtraModelId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDYJXExtraModelId];
	}	
	if(![dictionary[kDYJXExtraModelimKey] isKindOfClass:[NSNull class]]){
		self.imKey = dictionary[kDYJXExtraModelimKey];
	}	
	if(![dictionary[kDYJXExtraModelkeywords] isKindOfClass:[NSNull class]]){
		self.keywords = dictionary[kDYJXExtraModelkeywords];
	}	
	if(![dictionary[kDYJXExtraModelmessageType] isKindOfClass:[NSNull class]]){
		self.messageType = [dictionary[kDYJXExtraModelmessageType] integerValue];
	}

	if(![dictionary[kDYJXExtraModelmsgTime] isKindOfClass:[NSNull class]]){
		self.msgTime = dictionary[kDYJXExtraModelmsgTime];
	}	
	if(![dictionary[kDYJXExtraModeltargetHeadImg] isKindOfClass:[NSNull class]]){
		self.targetHeadImg = dictionary[kDYJXExtraModeltargetHeadImg];
	}	
	if(![dictionary[kDYJXExtraModeltargetId] isKindOfClass:[NSNull class]]){
		self.targetId = dictionary[kDYJXExtraModeltargetId];
	}	
	if(![dictionary[kDYJXExtraModeltargetName] isKindOfClass:[NSNull class]]){
		self.targetName = dictionary[kDYJXExtraModeltargetName];
	}	
	if(![dictionary[kDYJXExtraModeltargetType] isKindOfClass:[NSNull class]]){
		self.targetType = [dictionary[kDYJXExtraModeltargetType] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.conversationId != nil){
		dictionary[kDYJXExtraModelconversationId] = self.conversationId;
	}
	if(self.fromCertifyHeadImg != nil){
		dictionary[kDYJXExtraModelfromCertifyHeadImg] = self.fromCertifyHeadImg;
	}
	if(self.fromCertifyId != nil){
		dictionary[kDYJXExtraModelfromCertifyId] = self.fromCertifyId;
	}
	if(self.fromCertifyName != nil){
		dictionary[kDYJXExtraModelfromCertifyName] = self.fromCertifyName;
	}
	if(self.fromHeadImg != nil){
		dictionary[kDYJXExtraModelfromHeadImg] = self.fromHeadImg;
	}
	if(self.fromId != nil){
		dictionary[kDYJXExtraModelfromId] = self.fromId;
	}
	if(self.fromName != nil){
		dictionary[kDYJXExtraModelfromName] = self.fromName;
	}
	if(self.gMembers != nil){
		dictionary[kDYJXExtraModelgMembers] = self.gMembers;
	}
	dictionary[kDYJXExtraModelgType] = @(self.gType);
	if(self.Id != nil){
		dictionary[kDYJXExtraModelId] = self.Id;
	}
	if(self.imKey != nil){
		dictionary[kDYJXExtraModelimKey] = self.imKey;
	}
	if(self.keywords != nil){
		dictionary[kDYJXExtraModelkeywords] = self.keywords;
	}
	dictionary[kDYJXExtraModelmessageType] = @(self.messageType);
	if(self.msgTime != nil){
		dictionary[kDYJXExtraModelmsgTime] = self.msgTime;
	}
	if(self.targetHeadImg != nil){
		dictionary[kDYJXExtraModeltargetHeadImg] = self.targetHeadImg;
	}
	if(self.targetId != nil){
		dictionary[kDYJXExtraModeltargetId] = self.targetId;
	}
	if(self.targetName != nil){
		dictionary[kDYJXExtraModeltargetName] = self.targetName;
	}
	dictionary[kDYJXExtraModeltargetType] = @(self.targetType);
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
	if(self.conversationId != nil){
		[aCoder encodeObject:self.conversationId forKey:kDYJXExtraModelconversationId];
	}
	if(self.fromCertifyHeadImg != nil){
		[aCoder encodeObject:self.fromCertifyHeadImg forKey:kDYJXExtraModelfromCertifyHeadImg];
	}
	if(self.fromCertifyId != nil){
		[aCoder encodeObject:self.fromCertifyId forKey:kDYJXExtraModelfromCertifyId];
	}
	if(self.fromCertifyName != nil){
		[aCoder encodeObject:self.fromCertifyName forKey:kDYJXExtraModelfromCertifyName];
	}
	if(self.fromHeadImg != nil){
		[aCoder encodeObject:self.fromHeadImg forKey:kDYJXExtraModelfromHeadImg];
	}
	if(self.fromId != nil){
		[aCoder encodeObject:self.fromId forKey:kDYJXExtraModelfromId];
	}
	if(self.fromName != nil){
		[aCoder encodeObject:self.fromName forKey:kDYJXExtraModelfromName];
	}
	if(self.gMembers != nil){
		[aCoder encodeObject:self.gMembers forKey:kDYJXExtraModelgMembers];
	}
	[aCoder encodeObject:@(self.gType) forKey:kDYJXExtraModelgType];	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDYJXExtraModelId];
	}
	if(self.imKey != nil){
		[aCoder encodeObject:self.imKey forKey:kDYJXExtraModelimKey];
	}
	if(self.keywords != nil){
		[aCoder encodeObject:self.keywords forKey:kDYJXExtraModelkeywords];
	}
	[aCoder encodeObject:@(self.messageType) forKey:kDYJXExtraModelmessageType];	if(self.msgTime != nil){
		[aCoder encodeObject:self.msgTime forKey:kDYJXExtraModelmsgTime];
	}
	if(self.targetHeadImg != nil){
		[aCoder encodeObject:self.targetHeadImg forKey:kDYJXExtraModeltargetHeadImg];
	}
	if(self.targetId != nil){
		[aCoder encodeObject:self.targetId forKey:kDYJXExtraModeltargetId];
	}
	if(self.targetName != nil){
		[aCoder encodeObject:self.targetName forKey:kDYJXExtraModeltargetName];
	}
	[aCoder encodeObject:@(self.targetType) forKey:kDYJXExtraModeltargetType];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.conversationId = [aDecoder decodeObjectForKey:kDYJXExtraModelconversationId];
	self.fromCertifyHeadImg = [aDecoder decodeObjectForKey:kDYJXExtraModelfromCertifyHeadImg];
	self.fromCertifyId = [aDecoder decodeObjectForKey:kDYJXExtraModelfromCertifyId];
	self.fromCertifyName = [aDecoder decodeObjectForKey:kDYJXExtraModelfromCertifyName];
	self.fromHeadImg = [aDecoder decodeObjectForKey:kDYJXExtraModelfromHeadImg];
	self.fromId = [aDecoder decodeObjectForKey:kDYJXExtraModelfromId];
	self.fromName = [aDecoder decodeObjectForKey:kDYJXExtraModelfromName];
	self.gMembers = [aDecoder decodeObjectForKey:kDYJXExtraModelgMembers];
	self.gType = [[aDecoder decodeObjectForKey:kDYJXExtraModelgType] integerValue];
	self.Id = [aDecoder decodeObjectForKey:kDYJXExtraModelId];
	self.imKey = [aDecoder decodeObjectForKey:kDYJXExtraModelimKey];
	self.keywords = [aDecoder decodeObjectForKey:kDYJXExtraModelkeywords];
	self.messageType = [[aDecoder decodeObjectForKey:kDYJXExtraModelmessageType] integerValue];
	self.msgTime = [aDecoder decodeObjectForKey:kDYJXExtraModelmsgTime];
	self.targetHeadImg = [aDecoder decodeObjectForKey:kDYJXExtraModeltargetHeadImg];
	self.targetId = [aDecoder decodeObjectForKey:kDYJXExtraModeltargetId];
	self.targetName = [aDecoder decodeObjectForKey:kDYJXExtraModeltargetName];
	self.targetType = [[aDecoder decodeObjectForKey:kDYJXExtraModeltargetType] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXExtraModel *copy = [DYJXExtraModel new];

	copy.conversationId = [self.conversationId copy];
	copy.fromCertifyHeadImg = [self.fromCertifyHeadImg copy];
	copy.fromCertifyId = [self.fromCertifyId copy];
	copy.fromCertifyName = [self.fromCertifyName copy];
	copy.fromHeadImg = [self.fromHeadImg copy];
	copy.fromId = [self.fromId copy];
	copy.fromName = [self.fromName copy];
	copy.gMembers = [self.gMembers copy];
	copy.gType = self.gType;
	copy.Id = [self.Id copy];
	copy.imKey = [self.imKey copy];
	copy.keywords = [self.keywords copy];
	copy.messageType = self.messageType;
	copy.msgTime = [self.msgTime copy];
	copy.targetHeadImg = [self.targetHeadImg copy];
	copy.targetId = [self.targetId copy];
	copy.targetName = [self.targetName copy];
	copy.targetType = self.targetType;

	return copy;
}
@end
