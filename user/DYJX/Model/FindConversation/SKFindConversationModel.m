//
//	SKFindConversationModel.m
//
//	Create by longshiqing on 31/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "SKFindConversationModel.h"

NSString *const kSKFindConversationModelClientId = @"ClientId";
NSString *const kSKFindConversationModelDebugMessages = @"DebugMessages";
NSString *const kSKFindConversationModelKicked = @"Kicked";
NSString *const kSKFindConversationModelMemberID = @"MemberID";
NSString *const kSKFindConversationModelMessage = @"Message";
NSString *const kSKFindConversationModelResult = @"Result";
NSString *const kSKFindConversationModelSucceed = @"Succeed";
NSString *const kSKFindConversationModelUserID = @"UserID";

@interface SKFindConversationModel ()
@end
@implementation SKFindConversationModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSKFindConversationModelClientId] isKindOfClass:[NSNull class]]){
		self.ClientId = dictionary[kSKFindConversationModelClientId];
	}	
	if(![dictionary[kSKFindConversationModelDebugMessages] isKindOfClass:[NSNull class]]){
		self.DebugMessages = dictionary[kSKFindConversationModelDebugMessages];
	}	
	if(![dictionary[kSKFindConversationModelKicked] isKindOfClass:[NSNull class]]){
		self.Kicked = [dictionary[kSKFindConversationModelKicked] boolValue];
	}

	if(![dictionary[kSKFindConversationModelMemberID] isKindOfClass:[NSNull class]]){
		self.MemberID = dictionary[kSKFindConversationModelMemberID];
	}	
	if(![dictionary[kSKFindConversationModelMessage] isKindOfClass:[NSNull class]]){
		self.Message = dictionary[kSKFindConversationModelMessage];
	}	
	if(![dictionary[kSKFindConversationModelResult] isKindOfClass:[NSNull class]]){
		self.Result = [[SKResult alloc] initWithDictionary:dictionary[kSKFindConversationModelResult]];
	}

	if(![dictionary[kSKFindConversationModelSucceed] isKindOfClass:[NSNull class]]){
		self.Succeed = [dictionary[kSKFindConversationModelSucceed] boolValue];
	}

	if(![dictionary[kSKFindConversationModelUserID] isKindOfClass:[NSNull class]]){
		self.UserID = dictionary[kSKFindConversationModelUserID];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.ClientId != nil){
		dictionary[kSKFindConversationModelClientId] = self.ClientId;
	}
	if(self.DebugMessages != nil){
		dictionary[kSKFindConversationModelDebugMessages] = self.DebugMessages;
	}
	dictionary[kSKFindConversationModelKicked] = @(self.Kicked);
	if(self.MemberID != nil){
		dictionary[kSKFindConversationModelMemberID] = self.MemberID;
	}
	if(self.Message != nil){
		dictionary[kSKFindConversationModelMessage] = self.Message;
	}
	if(self.Result != nil){
		dictionary[kSKFindConversationModelResult] = [self.Result toDictionary];
	}
	dictionary[kSKFindConversationModelSucceed] = @(self.Succeed);
	if(self.UserID != nil){
		dictionary[kSKFindConversationModelUserID] = self.UserID;
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
	if(self.ClientId != nil){
		[aCoder encodeObject:self.ClientId forKey:kSKFindConversationModelClientId];
	}
	if(self.DebugMessages != nil){
		[aCoder encodeObject:self.DebugMessages forKey:kSKFindConversationModelDebugMessages];
	}
	[aCoder encodeObject:@(self.Kicked) forKey:kSKFindConversationModelKicked];	if(self.MemberID != nil){
		[aCoder encodeObject:self.MemberID forKey:kSKFindConversationModelMemberID];
	}
	if(self.Message != nil){
		[aCoder encodeObject:self.Message forKey:kSKFindConversationModelMessage];
	}
	if(self.Result != nil){
		[aCoder encodeObject:self.Result forKey:kSKFindConversationModelResult];
	}
	[aCoder encodeObject:@(self.Succeed) forKey:kSKFindConversationModelSucceed];	if(self.UserID != nil){
		[aCoder encodeObject:self.UserID forKey:kSKFindConversationModelUserID];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ClientId = [aDecoder decodeObjectForKey:kSKFindConversationModelClientId];
	self.DebugMessages = [aDecoder decodeObjectForKey:kSKFindConversationModelDebugMessages];
	self.Kicked = [[aDecoder decodeObjectForKey:kSKFindConversationModelKicked] boolValue];
	self.MemberID = [aDecoder decodeObjectForKey:kSKFindConversationModelMemberID];
	self.Message = [aDecoder decodeObjectForKey:kSKFindConversationModelMessage];
	self.Result = [aDecoder decodeObjectForKey:kSKFindConversationModelResult];
	self.Succeed = [[aDecoder decodeObjectForKey:kSKFindConversationModelSucceed] boolValue];
	self.UserID = [aDecoder decodeObjectForKey:kSKFindConversationModelUserID];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	SKFindConversationModel *copy = [SKFindConversationModel new];

	copy.ClientId = [self.ClientId copy];
	copy.DebugMessages = [self.DebugMessages copy];
	copy.Kicked = self.Kicked;
	copy.MemberID = [self.MemberID copy];
	copy.Message = [self.Message copy];
	copy.Result = [self.Result copy];
	copy.Succeed = self.Succeed;
	copy.UserID = [self.UserID copy];

	return copy;
}
@end