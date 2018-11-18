//
//	DJJSGetUserModel.m
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJSGetUserModel.h"

NSString *const kDJJSGetUserModelClientId = @"ClientId";
NSString *const kDJJSGetUserModelDebugMessages = @"DebugMessages";
NSString *const kDJJSGetUserModelKicked = @"Kicked";
NSString *const kDJJSGetUserModelMemberID = @"MemberID";
NSString *const kDJJSGetUserModelResult = @"Result";
NSString *const kDJJSGetUserModelSucceed = @"Succeed";
NSString *const kDJJSGetUserModelUserID = @"UserID";

@interface DJJSGetUserModel ()
@end
@implementation DJJSGetUserModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJSGetUserModelClientId] isKindOfClass:[NSNull class]]){
		self.ClientId = dictionary[kDJJSGetUserModelClientId];
	}	
	if(![dictionary[kDJJSGetUserModelDebugMessages] isKindOfClass:[NSNull class]]){
		self.DebugMessages = dictionary[kDJJSGetUserModelDebugMessages];
	}	
	if(![dictionary[kDJJSGetUserModelKicked] isKindOfClass:[NSNull class]]){
		self.Kicked = [dictionary[kDJJSGetUserModelKicked] boolValue];
	}

	if(![dictionary[kDJJSGetUserModelMemberID] isKindOfClass:[NSNull class]]){
		self.MemberID = dictionary[kDJJSGetUserModelMemberID];
	}	
	if(![dictionary[kDJJSGetUserModelResult] isKindOfClass:[NSNull class]]){
		self.Result = [[DJJSResult alloc] initWithDictionary:dictionary[kDJJSGetUserModelResult]];
	}

	if(![dictionary[kDJJSGetUserModelSucceed] isKindOfClass:[NSNull class]]){
		self.Succeed = [dictionary[kDJJSGetUserModelSucceed] boolValue];
	}

	if(![dictionary[kDJJSGetUserModelUserID] isKindOfClass:[NSNull class]]){
		self.UserID = dictionary[kDJJSGetUserModelUserID];
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
		dictionary[kDJJSGetUserModelClientId] = self.ClientId;
	}
	if(self.DebugMessages != nil){
		dictionary[kDJJSGetUserModelDebugMessages] = self.DebugMessages;
	}
	dictionary[kDJJSGetUserModelKicked] = @(self.Kicked);
	if(self.MemberID != nil){
		dictionary[kDJJSGetUserModelMemberID] = self.MemberID;
	}
	if(self.Result != nil){
		dictionary[kDJJSGetUserModelResult] = [self.Result toDictionary];
	}
	dictionary[kDJJSGetUserModelSucceed] = @(self.Succeed);
	if(self.UserID != nil){
		dictionary[kDJJSGetUserModelUserID] = self.UserID;
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
		[aCoder encodeObject:self.ClientId forKey:kDJJSGetUserModelClientId];
	}
	if(self.DebugMessages != nil){
		[aCoder encodeObject:self.DebugMessages forKey:kDJJSGetUserModelDebugMessages];
	}
	[aCoder encodeObject:@(self.Kicked) forKey:kDJJSGetUserModelKicked];	if(self.MemberID != nil){
		[aCoder encodeObject:self.MemberID forKey:kDJJSGetUserModelMemberID];
	}
	if(self.Result != nil){
		[aCoder encodeObject:self.Result forKey:kDJJSGetUserModelResult];
	}
	[aCoder encodeObject:@(self.Succeed) forKey:kDJJSGetUserModelSucceed];	if(self.UserID != nil){
		[aCoder encodeObject:self.UserID forKey:kDJJSGetUserModelUserID];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ClientId = [aDecoder decodeObjectForKey:kDJJSGetUserModelClientId];
	self.DebugMessages = [aDecoder decodeObjectForKey:kDJJSGetUserModelDebugMessages];
	self.Kicked = [[aDecoder decodeObjectForKey:kDJJSGetUserModelKicked] boolValue];
	self.MemberID = [aDecoder decodeObjectForKey:kDJJSGetUserModelMemberID];
	self.Result = [aDecoder decodeObjectForKey:kDJJSGetUserModelResult];
	self.Succeed = [[aDecoder decodeObjectForKey:kDJJSGetUserModelSucceed] boolValue];
	self.UserID = [aDecoder decodeObjectForKey:kDJJSGetUserModelUserID];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJSGetUserModel *copy = [DJJSGetUserModel new];

	copy.ClientId = [self.ClientId copy];
	copy.DebugMessages = [self.DebugMessages copy];
	copy.Kicked = self.Kicked;
	copy.MemberID = [self.MemberID copy];
	copy.Result = [self.Result copy];
	copy.Succeed = self.Succeed;
	copy.UserID = [self.UserID copy];

	return copy;
}
@end