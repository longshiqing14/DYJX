//
//	DJJLLoginResponse.m
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJLLoginResponse.h"

NSString *const kDJJLLoginResponseClientId = @"ClientId";
NSString *const kDJJLLoginResponseDebugMessages = @"DebugMessages";
NSString *const kDJJLLoginResponseKicked = @"Kicked";
NSString *const kDJJLLoginResponseObjResult = @"ObjResult";
NSString *const kDJJLLoginResponseSucceed = @"Succeed";
NSString *const kDJJLLoginResponseUAUser = @"UAUser";
NSString *const kDJJLLoginResponseUserID = @"UserID";

@interface DJJLLoginResponse ()
@end
@implementation DJJLLoginResponse




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJLLoginResponseClientId] isKindOfClass:[NSNull class]]){
		self.ClientId = dictionary[kDJJLLoginResponseClientId];
	}	
	if(![dictionary[kDJJLLoginResponseDebugMessages] isKindOfClass:[NSNull class]]){
		self.DebugMessages = dictionary[kDJJLLoginResponseDebugMessages];
	}	
	if(![dictionary[kDJJLLoginResponseKicked] isKindOfClass:[NSNull class]]){
		self.Kicked = [dictionary[kDJJLLoginResponseKicked] boolValue];
	}

	if(![dictionary[kDJJLLoginResponseObjResult] isKindOfClass:[NSNull class]]){
		self.ObjResult = dictionary[kDJJLLoginResponseObjResult];
	}	
	if(![dictionary[kDJJLLoginResponseSucceed] isKindOfClass:[NSNull class]]){
		self.Succeed = [dictionary[kDJJLLoginResponseSucceed] boolValue];
	}

	if(![dictionary[kDJJLLoginResponseUAUser] isKindOfClass:[NSNull class]]){
		self.UAUser = [[DJJLUAUser alloc] initWithDictionary:dictionary[kDJJLLoginResponseUAUser]];
	}

	if(![dictionary[kDJJLLoginResponseUserID] isKindOfClass:[NSNull class]]){
		self.UserID = dictionary[kDJJLLoginResponseUserID];
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
		dictionary[kDJJLLoginResponseClientId] = self.ClientId;
	}
	if(self.DebugMessages != nil){
		dictionary[kDJJLLoginResponseDebugMessages] = self.DebugMessages;
	}
	dictionary[kDJJLLoginResponseKicked] = @(self.Kicked);
	if(self.ObjResult != nil){
		dictionary[kDJJLLoginResponseObjResult] = self.ObjResult;
	}
	dictionary[kDJJLLoginResponseSucceed] = @(self.Succeed);
	if(self.UAUser != nil){
		dictionary[kDJJLLoginResponseUAUser] = [self.UAUser toDictionary];
	}
	if(self.UserID != nil){
		dictionary[kDJJLLoginResponseUserID] = self.UserID;
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
		[aCoder encodeObject:self.ClientId forKey:kDJJLLoginResponseClientId];
	}
	if(self.DebugMessages != nil){
		[aCoder encodeObject:self.DebugMessages forKey:kDJJLLoginResponseDebugMessages];
	}
	[aCoder encodeObject:@(self.Kicked) forKey:kDJJLLoginResponseKicked];	if(self.ObjResult != nil){
		[aCoder encodeObject:self.ObjResult forKey:kDJJLLoginResponseObjResult];
	}
	[aCoder encodeObject:@(self.Succeed) forKey:kDJJLLoginResponseSucceed];	if(self.UAUser != nil){
		[aCoder encodeObject:self.UAUser forKey:kDJJLLoginResponseUAUser];
	}
	if(self.UserID != nil){
		[aCoder encodeObject:self.UserID forKey:kDJJLLoginResponseUserID];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ClientId = [aDecoder decodeObjectForKey:kDJJLLoginResponseClientId];
	self.DebugMessages = [aDecoder decodeObjectForKey:kDJJLLoginResponseDebugMessages];
	self.Kicked = [[aDecoder decodeObjectForKey:kDJJLLoginResponseKicked] boolValue];
	self.ObjResult = [aDecoder decodeObjectForKey:kDJJLLoginResponseObjResult];
	self.Succeed = [[aDecoder decodeObjectForKey:kDJJLLoginResponseSucceed] boolValue];
	self.UAUser = [aDecoder decodeObjectForKey:kDJJLLoginResponseUAUser];
	self.UserID = [aDecoder decodeObjectForKey:kDJJLLoginResponseUserID];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJLLoginResponse *copy = [DJJLLoginResponse new];

	copy.ClientId = [self.ClientId copy];
	copy.DebugMessages = [self.DebugMessages copy];
	copy.Kicked = self.Kicked;
	copy.ObjResult = [self.ObjResult copy];
	copy.Succeed = self.Succeed;
	copy.UAUser = [self.UAUser copy];
	copy.UserID = [self.UserID copy];

	return copy;
}
@end