//
//	DYYBlackListResponse.m
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYYBlackListResponse.h"

NSString *const kDYYBlackListResponseClientId = @"ClientId";
NSString *const kDYYBlackListResponseDebugMessages = @"DebugMessages";
NSString *const kDYYBlackListResponseHasNextPage = @"HasNextPage";
NSString *const kDYYBlackListResponseHasPreviousPage = @"HasPreviousPage";
NSString *const kDYYBlackListResponseKicked = @"Kicked";
NSString *const kDYYBlackListResponseMessage = @"Message";
NSString *const kDYYBlackListResponsePageIndex = @"PageIndex";
NSString *const kDYYBlackListResponsePageSize = @"PageSize";
NSString *const kDYYBlackListResponseResult = @"Result";
NSString *const kDYYBlackListResponseSkip = @"Skip";
NSString *const kDYYBlackListResponseSucceed = @"Succeed";
NSString *const kDYYBlackListResponseTake = @"Take";
NSString *const kDYYBlackListResponseTotalCount = @"TotalCount";
NSString *const kDYYBlackListResponseTotalPages = @"TotalPages";
NSString *const kDYYBlackListResponseUserID = @"UserID";

@interface DYYBlackListResponse ()
@end
@implementation DYYBlackListResponse




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYYBlackListResponseClientId] isKindOfClass:[NSNull class]]){
		self.ClientId = dictionary[kDYYBlackListResponseClientId];
	}	
	if(![dictionary[kDYYBlackListResponseDebugMessages] isKindOfClass:[NSNull class]]){
		self.DebugMessages = dictionary[kDYYBlackListResponseDebugMessages];
	}	
	if(![dictionary[kDYYBlackListResponseHasNextPage] isKindOfClass:[NSNull class]]){
		self.HasNextPage = [dictionary[kDYYBlackListResponseHasNextPage] boolValue];
	}

	if(![dictionary[kDYYBlackListResponseHasPreviousPage] isKindOfClass:[NSNull class]]){
		self.HasPreviousPage = [dictionary[kDYYBlackListResponseHasPreviousPage] boolValue];
	}

	if(![dictionary[kDYYBlackListResponseKicked] isKindOfClass:[NSNull class]]){
		self.Kicked = [dictionary[kDYYBlackListResponseKicked] boolValue];
	}

	if(![dictionary[kDYYBlackListResponseMessage] isKindOfClass:[NSNull class]]){
		self.Message = dictionary[kDYYBlackListResponseMessage];
	}	
	if(![dictionary[kDYYBlackListResponsePageIndex] isKindOfClass:[NSNull class]]){
		self.PageIndex = [dictionary[kDYYBlackListResponsePageIndex] integerValue];
	}

	if(![dictionary[kDYYBlackListResponsePageSize] isKindOfClass:[NSNull class]]){
		self.PageSize = [dictionary[kDYYBlackListResponsePageSize] integerValue];
	}

	if(dictionary[kDYYBlackListResponseResult] != nil && [dictionary[kDYYBlackListResponseResult] isKindOfClass:[NSArray class]]){
		NSArray * ResultDictionaries = dictionary[kDYYBlackListResponseResult];
		NSMutableArray * ResultItems = [NSMutableArray array];
		for(NSDictionary * ResultDictionary in ResultDictionaries){
			DYYResult * ResultItem = [[DYYResult alloc] initWithDictionary:ResultDictionary];
			[ResultItems addObject:ResultItem];
		}
		self.Result = ResultItems;
	}
	if(![dictionary[kDYYBlackListResponseSkip] isKindOfClass:[NSNull class]]){
		self.Skip = [dictionary[kDYYBlackListResponseSkip] integerValue];
	}

	if(![dictionary[kDYYBlackListResponseSucceed] isKindOfClass:[NSNull class]]){
		self.Succeed = [dictionary[kDYYBlackListResponseSucceed] boolValue];
	}

	if(![dictionary[kDYYBlackListResponseTake] isKindOfClass:[NSNull class]]){
		self.Take = [dictionary[kDYYBlackListResponseTake] integerValue];
	}

	if(![dictionary[kDYYBlackListResponseTotalCount] isKindOfClass:[NSNull class]]){
		self.TotalCount = [dictionary[kDYYBlackListResponseTotalCount] integerValue];
	}

	if(![dictionary[kDYYBlackListResponseTotalPages] isKindOfClass:[NSNull class]]){
		self.TotalPages = [dictionary[kDYYBlackListResponseTotalPages] integerValue];
	}

	if(![dictionary[kDYYBlackListResponseUserID] isKindOfClass:[NSNull class]]){
		self.UserID = dictionary[kDYYBlackListResponseUserID];
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
		dictionary[kDYYBlackListResponseClientId] = self.ClientId;
	}
	if(self.DebugMessages != nil){
		dictionary[kDYYBlackListResponseDebugMessages] = self.DebugMessages;
	}
	dictionary[kDYYBlackListResponseHasNextPage] = @(self.HasNextPage);
	dictionary[kDYYBlackListResponseHasPreviousPage] = @(self.HasPreviousPage);
	dictionary[kDYYBlackListResponseKicked] = @(self.Kicked);
	if(self.Message != nil){
		dictionary[kDYYBlackListResponseMessage] = self.Message;
	}
	dictionary[kDYYBlackListResponsePageIndex] = @(self.PageIndex);
	dictionary[kDYYBlackListResponsePageSize] = @(self.PageSize);
	if(self.Result != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(DYYResult * ResultElement in self.Result){
			[dictionaryElements addObject:[ResultElement toDictionary]];
		}
		dictionary[kDYYBlackListResponseResult] = dictionaryElements;
	}
	dictionary[kDYYBlackListResponseSkip] = @(self.Skip);
	dictionary[kDYYBlackListResponseSucceed] = @(self.Succeed);
	dictionary[kDYYBlackListResponseTake] = @(self.Take);
	dictionary[kDYYBlackListResponseTotalCount] = @(self.TotalCount);
	dictionary[kDYYBlackListResponseTotalPages] = @(self.TotalPages);
	if(self.UserID != nil){
		dictionary[kDYYBlackListResponseUserID] = self.UserID;
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
		[aCoder encodeObject:self.ClientId forKey:kDYYBlackListResponseClientId];
	}
	if(self.DebugMessages != nil){
		[aCoder encodeObject:self.DebugMessages forKey:kDYYBlackListResponseDebugMessages];
	}
	[aCoder encodeObject:@(self.HasNextPage) forKey:kDYYBlackListResponseHasNextPage];	[aCoder encodeObject:@(self.HasPreviousPage) forKey:kDYYBlackListResponseHasPreviousPage];	[aCoder encodeObject:@(self.Kicked) forKey:kDYYBlackListResponseKicked];	if(self.Message != nil){
		[aCoder encodeObject:self.Message forKey:kDYYBlackListResponseMessage];
	}
	[aCoder encodeObject:@(self.PageIndex) forKey:kDYYBlackListResponsePageIndex];	[aCoder encodeObject:@(self.PageSize) forKey:kDYYBlackListResponsePageSize];	if(self.Result != nil){
		[aCoder encodeObject:self.Result forKey:kDYYBlackListResponseResult];
	}
	[aCoder encodeObject:@(self.Skip) forKey:kDYYBlackListResponseSkip];	[aCoder encodeObject:@(self.Succeed) forKey:kDYYBlackListResponseSucceed];	[aCoder encodeObject:@(self.Take) forKey:kDYYBlackListResponseTake];	[aCoder encodeObject:@(self.TotalCount) forKey:kDYYBlackListResponseTotalCount];	[aCoder encodeObject:@(self.TotalPages) forKey:kDYYBlackListResponseTotalPages];	if(self.UserID != nil){
		[aCoder encodeObject:self.UserID forKey:kDYYBlackListResponseUserID];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ClientId = [aDecoder decodeObjectForKey:kDYYBlackListResponseClientId];
	self.DebugMessages = [aDecoder decodeObjectForKey:kDYYBlackListResponseDebugMessages];
	self.HasNextPage = [[aDecoder decodeObjectForKey:kDYYBlackListResponseHasNextPage] boolValue];
	self.HasPreviousPage = [[aDecoder decodeObjectForKey:kDYYBlackListResponseHasPreviousPage] boolValue];
	self.Kicked = [[aDecoder decodeObjectForKey:kDYYBlackListResponseKicked] boolValue];
	self.Message = [aDecoder decodeObjectForKey:kDYYBlackListResponseMessage];
	self.PageIndex = [[aDecoder decodeObjectForKey:kDYYBlackListResponsePageIndex] integerValue];
	self.PageSize = [[aDecoder decodeObjectForKey:kDYYBlackListResponsePageSize] integerValue];
	self.Result = [aDecoder decodeObjectForKey:kDYYBlackListResponseResult];
	self.Skip = [[aDecoder decodeObjectForKey:kDYYBlackListResponseSkip] integerValue];
	self.Succeed = [[aDecoder decodeObjectForKey:kDYYBlackListResponseSucceed] boolValue];
	self.Take = [[aDecoder decodeObjectForKey:kDYYBlackListResponseTake] integerValue];
	self.TotalCount = [[aDecoder decodeObjectForKey:kDYYBlackListResponseTotalCount] integerValue];
	self.TotalPages = [[aDecoder decodeObjectForKey:kDYYBlackListResponseTotalPages] integerValue];
	self.UserID = [aDecoder decodeObjectForKey:kDYYBlackListResponseUserID];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYYBlackListResponse *copy = [DYYBlackListResponse new];

	copy.ClientId = [self.ClientId copy];
	copy.DebugMessages = [self.DebugMessages copy];
	copy.HasNextPage = self.HasNextPage;
	copy.HasPreviousPage = self.HasPreviousPage;
	copy.Kicked = self.Kicked;
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