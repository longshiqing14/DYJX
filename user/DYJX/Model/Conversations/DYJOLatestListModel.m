//
//	DYJOLatestListModel.m
//
//	Create by longshiqing on 27/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYJOLatestListModel.h"

NSString *const kDYJOLatestListModelClientId = @"ClientId";
NSString *const kDYJOLatestListModelDebugMessages = @"DebugMessages";
NSString *const kDYJOLatestListModelKicked = @"Kicked";
NSString *const kDYJOLatestListModelMemberID = @"MemberID";
NSString *const kDYJOLatestListModelMessage = @"Message";
NSString *const kDYJOLatestListModelResult = @"Result";
NSString *const kDYJOLatestListModelSucceed = @"Succeed";
NSString *const kDYJOLatestListModelUserID = @"UserID";

@interface DYJOLatestListModel ()
@end
@implementation DYJOLatestListModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYJOLatestListModelClientId] isKindOfClass:[NSNull class]]){
		self.ClientId = dictionary[kDYJOLatestListModelClientId];
	}	
	if(![dictionary[kDYJOLatestListModelDebugMessages] isKindOfClass:[NSNull class]]){
		self.DebugMessages = dictionary[kDYJOLatestListModelDebugMessages];
	}	
	if(![dictionary[kDYJOLatestListModelKicked] isKindOfClass:[NSNull class]]){
		self.Kicked = [dictionary[kDYJOLatestListModelKicked] boolValue];
	}

	if(![dictionary[kDYJOLatestListModelMemberID] isKindOfClass:[NSNull class]]){
		self.MemberID = dictionary[kDYJOLatestListModelMemberID];
	}	
	if(![dictionary[kDYJOLatestListModelMessage] isKindOfClass:[NSNull class]]){
		self.Message = dictionary[kDYJOLatestListModelMessage];
	}	
	if(dictionary[kDYJOLatestListModelResult] != nil && [dictionary[kDYJOLatestListModelResult] isKindOfClass:[NSArray class]]){
		NSArray * ResultDictionaries = dictionary[kDYJOLatestListModelResult];
		NSMutableArray * ResultItems = [NSMutableArray array];
		for(NSDictionary * ResultDictionary in ResultDictionaries){
			DYJOResult * ResultItem = [[DYJOResult alloc] initWithDictionary:ResultDictionary];
			[ResultItems addObject:ResultItem];
		}
		self.Result = ResultItems;
	}
	if(![dictionary[kDYJOLatestListModelSucceed] isKindOfClass:[NSNull class]]){
		self.Succeed = [dictionary[kDYJOLatestListModelSucceed] boolValue];
	}

	if(![dictionary[kDYJOLatestListModelUserID] isKindOfClass:[NSNull class]]){
		self.UserID = dictionary[kDYJOLatestListModelUserID];
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
		dictionary[kDYJOLatestListModelClientId] = self.ClientId;
	}
	if(self.DebugMessages != nil){
		dictionary[kDYJOLatestListModelDebugMessages] = self.DebugMessages;
	}
	dictionary[kDYJOLatestListModelKicked] = @(self.Kicked);
	if(self.MemberID != nil){
		dictionary[kDYJOLatestListModelMemberID] = self.MemberID;
	}
	if(self.Message != nil){
		dictionary[kDYJOLatestListModelMessage] = self.Message;
	}
	if(self.Result != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(DYJOResult * ResultElement in self.Result){
			[dictionaryElements addObject:[ResultElement toDictionary]];
		}
		dictionary[kDYJOLatestListModelResult] = dictionaryElements;
	}
	dictionary[kDYJOLatestListModelSucceed] = @(self.Succeed);
	if(self.UserID != nil){
		dictionary[kDYJOLatestListModelUserID] = self.UserID;
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
		[aCoder encodeObject:self.ClientId forKey:kDYJOLatestListModelClientId];
	}
	if(self.DebugMessages != nil){
		[aCoder encodeObject:self.DebugMessages forKey:kDYJOLatestListModelDebugMessages];
	}
	[aCoder encodeObject:@(self.Kicked) forKey:kDYJOLatestListModelKicked];	if(self.MemberID != nil){
		[aCoder encodeObject:self.MemberID forKey:kDYJOLatestListModelMemberID];
	}
	if(self.Message != nil){
		[aCoder encodeObject:self.Message forKey:kDYJOLatestListModelMessage];
	}
	if(self.Result != nil){
		[aCoder encodeObject:self.Result forKey:kDYJOLatestListModelResult];
	}
	[aCoder encodeObject:@(self.Succeed) forKey:kDYJOLatestListModelSucceed];	if(self.UserID != nil){
		[aCoder encodeObject:self.UserID forKey:kDYJOLatestListModelUserID];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ClientId = [aDecoder decodeObjectForKey:kDYJOLatestListModelClientId];
	self.DebugMessages = [aDecoder decodeObjectForKey:kDYJOLatestListModelDebugMessages];
	self.Kicked = [[aDecoder decodeObjectForKey:kDYJOLatestListModelKicked] boolValue];
	self.MemberID = [aDecoder decodeObjectForKey:kDYJOLatestListModelMemberID];
	self.Message = [aDecoder decodeObjectForKey:kDYJOLatestListModelMessage];
	self.Result = [aDecoder decodeObjectForKey:kDYJOLatestListModelResult];
	self.Succeed = [[aDecoder decodeObjectForKey:kDYJOLatestListModelSucceed] boolValue];
	self.UserID = [aDecoder decodeObjectForKey:kDYJOLatestListModelUserID];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJOLatestListModel *copy = [DYJOLatestListModel new];

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