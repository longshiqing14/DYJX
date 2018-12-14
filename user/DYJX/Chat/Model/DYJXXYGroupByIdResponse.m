//
//	DYJXXYGroupByIdResponse.m
//
//	Create by 岩 熊 on 12/12/2018
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
		self.ClientId = dictionary[kDYJXXYGroupByIdResponseClientId];
	}	
	if(![dictionary[kDYJXXYGroupByIdResponseDebugMessages] isKindOfClass:[NSNull class]]){
		self.DebugMessages = dictionary[kDYJXXYGroupByIdResponseDebugMessages];
	}	
	if(![dictionary[kDYJXXYGroupByIdResponseKicked] isKindOfClass:[NSNull class]]){
		self.Kicked = [dictionary[kDYJXXYGroupByIdResponseKicked] boolValue];
	}

	if(![dictionary[kDYJXXYGroupByIdResponseMemberID] isKindOfClass:[NSNull class]]){
		self.MemberID = dictionary[kDYJXXYGroupByIdResponseMemberID];
	}	
	if(![dictionary[kDYJXXYGroupByIdResponseMessage] isKindOfClass:[NSNull class]]){
		self.Message = dictionary[kDYJXXYGroupByIdResponseMessage];
	}	
	if(![dictionary[kDYJXXYGroupByIdResponseResult] isKindOfClass:[NSNull class]]){
		self.Result = [[DYJXXYResult alloc] initWithDictionary:dictionary[kDYJXXYGroupByIdResponseResult]];
	}

	if(![dictionary[kDYJXXYGroupByIdResponseSucceed] isKindOfClass:[NSNull class]]){
		self.Succeed = [dictionary[kDYJXXYGroupByIdResponseSucceed] boolValue];
	}

	if(![dictionary[kDYJXXYGroupByIdResponseUserID] isKindOfClass:[NSNull class]]){
		self.UserID = dictionary[kDYJXXYGroupByIdResponseUserID];
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
		dictionary[kDYJXXYGroupByIdResponseClientId] = self.ClientId;
	}
	if(self.DebugMessages != nil){
		dictionary[kDYJXXYGroupByIdResponseDebugMessages] = self.DebugMessages;
	}
	dictionary[kDYJXXYGroupByIdResponseKicked] = @(self.Kicked);
	if(self.MemberID != nil){
		dictionary[kDYJXXYGroupByIdResponseMemberID] = self.MemberID;
	}
	if(self.Message != nil){
		dictionary[kDYJXXYGroupByIdResponseMessage] = self.Message;
	}
	if(self.Result != nil){
		dictionary[kDYJXXYGroupByIdResponseResult] = [self.Result toDictionary];
	}
	dictionary[kDYJXXYGroupByIdResponseSucceed] = @(self.Succeed);
	if(self.UserID != nil){
		dictionary[kDYJXXYGroupByIdResponseUserID] = self.UserID;
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
		[aCoder encodeObject:self.ClientId forKey:kDYJXXYGroupByIdResponseClientId];
	}
	if(self.DebugMessages != nil){
		[aCoder encodeObject:self.DebugMessages forKey:kDYJXXYGroupByIdResponseDebugMessages];
	}
	[aCoder encodeObject:@(self.Kicked) forKey:kDYJXXYGroupByIdResponseKicked];	if(self.MemberID != nil){
		[aCoder encodeObject:self.MemberID forKey:kDYJXXYGroupByIdResponseMemberID];
	}
	if(self.Message != nil){
		[aCoder encodeObject:self.Message forKey:kDYJXXYGroupByIdResponseMessage];
	}
	if(self.Result != nil){
		[aCoder encodeObject:self.Result forKey:kDYJXXYGroupByIdResponseResult];
	}
	[aCoder encodeObject:@(self.Succeed) forKey:kDYJXXYGroupByIdResponseSucceed];	if(self.UserID != nil){
		[aCoder encodeObject:self.UserID forKey:kDYJXXYGroupByIdResponseUserID];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ClientId = [aDecoder decodeObjectForKey:kDYJXXYGroupByIdResponseClientId];
	self.DebugMessages = [aDecoder decodeObjectForKey:kDYJXXYGroupByIdResponseDebugMessages];
	self.Kicked = [[aDecoder decodeObjectForKey:kDYJXXYGroupByIdResponseKicked] boolValue];
	self.MemberID = [aDecoder decodeObjectForKey:kDYJXXYGroupByIdResponseMemberID];
	self.Message = [aDecoder decodeObjectForKey:kDYJXXYGroupByIdResponseMessage];
	self.Result = [aDecoder decodeObjectForKey:kDYJXXYGroupByIdResponseResult];
	self.Succeed = [[aDecoder decodeObjectForKey:kDYJXXYGroupByIdResponseSucceed] boolValue];
	self.UserID = [aDecoder decodeObjectForKey:kDYJXXYGroupByIdResponseUserID];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXXYGroupByIdResponse *copy = [DYJXXYGroupByIdResponse new];

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