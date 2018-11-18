//
//	DJJXResponModel.m
//
//	Create by longshiqing on 17/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJXResponModel.h"

NSString *const kDJJXResponModelClientId = @"ClientId";
NSString *const kDJJXResponModelDebugMessages = @"DebugMessages";
NSString *const kDJJXResponModelHasNextPage = @"HasNextPage";
NSString *const kDJJXResponModelHasPreviousPage = @"HasPreviousPage";
NSString *const kDJJXResponModelKicked = @"Kicked";
NSString *const kDJJXResponModelMemberID = @"MemberID";
NSString *const kDJJXResponModelMessage = @"Message";
NSString *const kDJJXResponModelPageIndex = @"PageIndex";
NSString *const kDJJXResponModelPageSize = @"PageSize";
NSString *const kDJJXResponModelResult = @"Result";
NSString *const kDJJXResponModelSkip = @"Skip";
NSString *const kDJJXResponModelSucceed = @"Succeed";
NSString *const kDJJXResponModelTake = @"Take";
NSString *const kDJJXResponModelTotalCount = @"TotalCount";
NSString *const kDJJXResponModelTotalPages = @"TotalPages";
NSString *const kDJJXResponModelUserID = @"UserID";

@interface DJJXResponModel ()
@end
@implementation DJJXResponModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJXResponModelClientId] isKindOfClass:[NSNull class]]){
		self.ClientId = dictionary[kDJJXResponModelClientId];
	}	
	if(![dictionary[kDJJXResponModelDebugMessages] isKindOfClass:[NSNull class]]){
		self.DebugMessages = dictionary[kDJJXResponModelDebugMessages];
	}	
	if(![dictionary[kDJJXResponModelHasNextPage] isKindOfClass:[NSNull class]]){
		self.HasNextPage = [dictionary[kDJJXResponModelHasNextPage] boolValue];
	}

	if(![dictionary[kDJJXResponModelHasPreviousPage] isKindOfClass:[NSNull class]]){
		self.HasPreviousPage = [dictionary[kDJJXResponModelHasPreviousPage] boolValue];
	}

	if(![dictionary[kDJJXResponModelKicked] isKindOfClass:[NSNull class]]){
		self.Kicked = [dictionary[kDJJXResponModelKicked] boolValue];
	}

	if(![dictionary[kDJJXResponModelMemberID] isKindOfClass:[NSNull class]]){
		self.MemberID = dictionary[kDJJXResponModelMemberID];
	}	
	if(![dictionary[kDJJXResponModelMessage] isKindOfClass:[NSNull class]]){
		self.Message = dictionary[kDJJXResponModelMessage];
	}	
	if(![dictionary[kDJJXResponModelPageIndex] isKindOfClass:[NSNull class]]){
		self.PageIndex = [dictionary[kDJJXResponModelPageIndex] integerValue];
	}

	if(![dictionary[kDJJXResponModelPageSize] isKindOfClass:[NSNull class]]){
		self.PageSize = [dictionary[kDJJXResponModelPageSize] integerValue];
	}

	if(dictionary[kDJJXResponModelResult] != nil && [dictionary[kDJJXResponModelResult] isKindOfClass:[NSArray class]]){
		NSArray * ResultDictionaries = dictionary[kDJJXResponModelResult];
		NSMutableArray * ResultItems = [NSMutableArray array];
		for(NSDictionary * ResultDictionary in ResultDictionaries){
			DJJXResult * ResultItem = [[DJJXResult alloc] initWithDictionary:ResultDictionary];
			[ResultItems addObject:ResultItem];
		}
		self.Result = ResultItems;
	}
	if(![dictionary[kDJJXResponModelSkip] isKindOfClass:[NSNull class]]){
		self.Skip = [dictionary[kDJJXResponModelSkip] integerValue];
	}

	if(![dictionary[kDJJXResponModelSucceed] isKindOfClass:[NSNull class]]){
		self.Succeed = [dictionary[kDJJXResponModelSucceed] boolValue];
	}

	if(![dictionary[kDJJXResponModelTake] isKindOfClass:[NSNull class]]){
		self.Take = [dictionary[kDJJXResponModelTake] integerValue];
	}

	if(![dictionary[kDJJXResponModelTotalCount] isKindOfClass:[NSNull class]]){
		self.TotalCount = [dictionary[kDJJXResponModelTotalCount] integerValue];
	}

	if(![dictionary[kDJJXResponModelTotalPages] isKindOfClass:[NSNull class]]){
		self.TotalPages = [dictionary[kDJJXResponModelTotalPages] integerValue];
	}

	if(![dictionary[kDJJXResponModelUserID] isKindOfClass:[NSNull class]]){
		self.UserID = dictionary[kDJJXResponModelUserID];
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
		dictionary[kDJJXResponModelClientId] = self.ClientId;
	}
	if(self.DebugMessages != nil){
		dictionary[kDJJXResponModelDebugMessages] = self.DebugMessages;
	}
	dictionary[kDJJXResponModelHasNextPage] = @(self.HasNextPage);
	dictionary[kDJJXResponModelHasPreviousPage] = @(self.HasPreviousPage);
	dictionary[kDJJXResponModelKicked] = @(self.Kicked);
	if(self.MemberID != nil){
		dictionary[kDJJXResponModelMemberID] = self.MemberID;
	}
	if(self.Message != nil){
		dictionary[kDJJXResponModelMessage] = self.Message;
	}
	dictionary[kDJJXResponModelPageIndex] = @(self.PageIndex);
	dictionary[kDJJXResponModelPageSize] = @(self.PageSize);
	if(self.Result != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(DJJXResult * ResultElement in self.Result){
			[dictionaryElements addObject:[ResultElement toDictionary]];
		}
		dictionary[kDJJXResponModelResult] = dictionaryElements;
	}
	dictionary[kDJJXResponModelSkip] = @(self.Skip);
	dictionary[kDJJXResponModelSucceed] = @(self.Succeed);
	dictionary[kDJJXResponModelTake] = @(self.Take);
	dictionary[kDJJXResponModelTotalCount] = @(self.TotalCount);
	dictionary[kDJJXResponModelTotalPages] = @(self.TotalPages);
	if(self.UserID != nil){
		dictionary[kDJJXResponModelUserID] = self.UserID;
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
		[aCoder encodeObject:self.ClientId forKey:kDJJXResponModelClientId];
	}
	if(self.DebugMessages != nil){
		[aCoder encodeObject:self.DebugMessages forKey:kDJJXResponModelDebugMessages];
	}
	[aCoder encodeObject:@(self.HasNextPage) forKey:kDJJXResponModelHasNextPage];	[aCoder encodeObject:@(self.HasPreviousPage) forKey:kDJJXResponModelHasPreviousPage];	[aCoder encodeObject:@(self.Kicked) forKey:kDJJXResponModelKicked];	if(self.MemberID != nil){
		[aCoder encodeObject:self.MemberID forKey:kDJJXResponModelMemberID];
	}
	if(self.Message != nil){
		[aCoder encodeObject:self.Message forKey:kDJJXResponModelMessage];
	}
	[aCoder encodeObject:@(self.PageIndex) forKey:kDJJXResponModelPageIndex];	[aCoder encodeObject:@(self.PageSize) forKey:kDJJXResponModelPageSize];	if(self.Result != nil){
		[aCoder encodeObject:self.Result forKey:kDJJXResponModelResult];
	}
	[aCoder encodeObject:@(self.Skip) forKey:kDJJXResponModelSkip];	[aCoder encodeObject:@(self.Succeed) forKey:kDJJXResponModelSucceed];	[aCoder encodeObject:@(self.Take) forKey:kDJJXResponModelTake];	[aCoder encodeObject:@(self.TotalCount) forKey:kDJJXResponModelTotalCount];	[aCoder encodeObject:@(self.TotalPages) forKey:kDJJXResponModelTotalPages];	if(self.UserID != nil){
		[aCoder encodeObject:self.UserID forKey:kDJJXResponModelUserID];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ClientId = [aDecoder decodeObjectForKey:kDJJXResponModelClientId];
	self.DebugMessages = [aDecoder decodeObjectForKey:kDJJXResponModelDebugMessages];
	self.HasNextPage = [[aDecoder decodeObjectForKey:kDJJXResponModelHasNextPage] boolValue];
	self.HasPreviousPage = [[aDecoder decodeObjectForKey:kDJJXResponModelHasPreviousPage] boolValue];
	self.Kicked = [[aDecoder decodeObjectForKey:kDJJXResponModelKicked] boolValue];
	self.MemberID = [aDecoder decodeObjectForKey:kDJJXResponModelMemberID];
	self.Message = [aDecoder decodeObjectForKey:kDJJXResponModelMessage];
	self.PageIndex = [[aDecoder decodeObjectForKey:kDJJXResponModelPageIndex] integerValue];
	self.PageSize = [[aDecoder decodeObjectForKey:kDJJXResponModelPageSize] integerValue];
	self.Result = [aDecoder decodeObjectForKey:kDJJXResponModelResult];
	self.Skip = [[aDecoder decodeObjectForKey:kDJJXResponModelSkip] integerValue];
	self.Succeed = [[aDecoder decodeObjectForKey:kDJJXResponModelSucceed] boolValue];
	self.Take = [[aDecoder decodeObjectForKey:kDJJXResponModelTake] integerValue];
	self.TotalCount = [[aDecoder decodeObjectForKey:kDJJXResponModelTotalCount] integerValue];
	self.TotalPages = [[aDecoder decodeObjectForKey:kDJJXResponModelTotalPages] integerValue];
	self.UserID = [aDecoder decodeObjectForKey:kDJJXResponModelUserID];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJXResponModel *copy = [DJJXResponModel new];

	copy.ClientId = [self.ClientId copy];
	copy.DebugMessages = [self.DebugMessages copy];
	copy.HasNextPage = self.HasNextPage;
	copy.HasPreviousPage = self.HasPreviousPage;
	copy.Kicked = self.Kicked;
	copy.MemberID = [self.MemberID copy];
	copy.Message = [self.Message copy];
	copy.PageIndex = self.PageIndex;
	copy.PageSize = self.PageSize;
	copy.Result = [self.Result copy];
	copy.Skip = self.Skip;
	copy.Succeed = self.Succeed;
	copy.Take = self.Take;
	copy.TotalCount = self.TotalCount;
	copy.TotalPages = self.TotalPages;
	copy.UserID = [self.UserID copy];

	return copy;
}
@end