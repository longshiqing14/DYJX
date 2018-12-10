//
//	DYJXXYGroupByIdResponse.m
//
//	Create by 岩 熊 on 7/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYJXXYGroupByIdResponse.h"

NSString *const kDYJXXYGroupByIdResponseClientId = @"ClientId";
NSString *const kDYJXXYGroupByIdResponseDebugMessages = @"DebugMessages";
NSString *const kDYJXXYGroupByIdResponseKicked = @"Kicked";
NSString *const kDYJXXYGroupByIdResponseMemberID = @"MemberID";
NSString *const kDYJXXYGroupByIdResponseMessage = @"Message";
NSString *const kDYJXXYGroupByIdResponseResult = @"Result";
NSString *const kDYJXXYGroupByIdResponseSucceed = @"Succeed";
NSString *const kDYJXXYGroupByIdResponseUserID = @"UserID";

@interface DYJXXYGroupByIdResponse ()
@end
@implementation DYJXXYGroupByIdResponse




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYJXXYGroupByIdResponseClientId] isKindOfClass:[NSNull class]]){
		self.clientId = dictionary[kDYJXXYGroupByIdResponseClientId];
	}	
	if(![dictionary[kDYJXXYGroupByIdResponseDebugMessages] isKindOfClass:[NSNull class]]){
		self.debugMessages = dictionary[kDYJXXYGroupByIdResponseDebugMessages];
	}	
	if(![dictionary[kDYJXXYGroupByIdResponseKicked] isKindOfClass:[NSNull class]]){
		self.kicked = [dictionary[kDYJXXYGroupByIdResponseKicked] boolValue];
	}

	if(![dictionary[kDYJXXYGroupByIdResponseMemberID] isKindOfClass:[NSNull class]]){
		self.memberID = dictionary[kDYJXXYGroupByIdResponseMemberID];
	}	
	if(![dictionary[kDYJXXYGroupByIdResponseMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kDYJXXYGroupByIdResponseMessage];
	}	
	if(![dictionary[kDYJXXYGroupByIdResponseResult] isKindOfClass:[NSNull class]]){
		self.result = [[DYJXXYResult alloc] initWithDictionary:dictionary[kDYJXXYGroupByIdResponseResult]];
	}

	if(![dictionary[kDYJXXYGroupByIdResponseSucceed] isKindOfClass:[NSNull class]]){
		self.succeed = [dictionary[kDYJXXYGroupByIdResponseSucceed] boolValue];
	}

	if(![dictionary[kDYJXXYGroupByIdResponseUserID] isKindOfClass:[NSNull class]]){
		self.userID = dictionary[kDYJXXYGroupByIdResponseUserID];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.clientId != nil){
		dictionary[kDYJXXYGroupByIdResponseClientId] = self.clientId;
	}
	if(self.debugMessages != nil){
		dictionary[kDYJXXYGroupByIdResponseDebugMessages] = self.debugMessages;
	}
	dictionary[kDYJXXYGroupByIdResponseKicked] = @(self.kicked);
	if(self.memberID != nil){
		dictionary[kDYJXXYGroupByIdResponseMemberID] = self.memberID;
	}
	if(self.message != nil){
		dictionary[kDYJXXYGroupByIdResponseMessage] = self.message;
	}
	if(self.result != nil){
		dictionary[kDYJXXYGroupByIdResponseResult] = [self.result toDictionary];
	}
	dictionary[kDYJXXYGroupByIdResponseSucceed] = @(self.succeed);
	if(self.userID != nil){
		dictionary[kDYJXXYGroupByIdResponseUserID] = self.userID;
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
	if(self.clientId != nil){
		[aCoder encodeObject:self.clientId forKey:kDYJXXYGroupByIdResponseClientId];
	}
	if(self.debugMessages != nil){
		[aCoder encodeObject:self.debugMessages forKey:kDYJXXYGroupByIdResponseDebugMessages];
	}
	[aCoder encodeObject:@(self.kicked) forKey:kDYJXXYGroupByIdResponseKicked];	if(self.memberID != nil){
		[aCoder encodeObject:self.memberID forKey:kDYJXXYGroupByIdResponseMemberID];
	}
	if(self.message != nil){
		[aCoder encodeObject:self.message forKey:kDYJXXYGroupByIdResponseMessage];
	}
	if(self.result != nil){
		[aCoder encodeObject:self.result forKey:kDYJXXYGroupByIdResponseResult];
	}
	[aCoder encodeObject:@(self.succeed) forKey:kDYJXXYGroupByIdResponseSucceed];	if(self.userID != nil){
		[aCoder encodeObject:self.userID forKey:kDYJXXYGroupByIdResponseUserID];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.clientId = [aDecoder decodeObjectForKey:kDYJXXYGroupByIdResponseClientId];
	self.debugMessages = [aDecoder decodeObjectForKey:kDYJXXYGroupByIdResponseDebugMessages];
	self.kicked = [[aDecoder decodeObjectForKey:kDYJXXYGroupByIdResponseKicked] boolValue];
	self.memberID = [aDecoder decodeObjectForKey:kDYJXXYGroupByIdResponseMemberID];
	self.message = [aDecoder decodeObjectForKey:kDYJXXYGroupByIdResponseMessage];
	self.result = [aDecoder decodeObjectForKey:kDYJXXYGroupByIdResponseResult];
	self.succeed = [[aDecoder decodeObjectForKey:kDYJXXYGroupByIdResponseSucceed] boolValue];
	self.userID = [aDecoder decodeObjectForKey:kDYJXXYGroupByIdResponseUserID];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXXYGroupByIdResponse *copy = [DYJXXYGroupByIdResponse new];

	copy.clientId = [self.clientId copy];
	copy.debugMessages = [self.debugMessages copy];
	copy.kicked = self.kicked;
	copy.memberID = [self.memberID copy];
	copy.message = [self.message copy];
	copy.result = [self.result copy];
	copy.succeed = self.succeed;
	copy.userID = [self.userID copy];

	return copy;
}
@end