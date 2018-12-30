//
//	DLLSearchContactResponse.m
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DLLSearchContactResponse.h"

NSString *const kDLLSearchContactResponseClientId = @"ClientId";
NSString *const kDLLSearchContactResponseDebugMessages = @"DebugMessages";
NSString *const kDLLSearchContactResponseHasNextPage = @"HasNextPage";
NSString *const kDLLSearchContactResponseHasPreviousPage = @"HasPreviousPage";
NSString *const kDLLSearchContactResponseKicked = @"Kicked";
NSString *const kDLLSearchContactResponseMemberID = @"MemberID";
NSString *const kDLLSearchContactResponsePageIndex = @"PageIndex";
NSString *const kDLLSearchContactResponsePageSize = @"PageSize";
NSString *const kDLLSearchContactResponseResult = @"Result";
NSString *const kDLLSearchContactResponseSkip = @"Skip";
NSString *const kDLLSearchContactResponseSucceed = @"Succeed";
NSString *const kDLLSearchContactResponseTake = @"Take";
NSString *const kDLLSearchContactResponseTotalCount = @"TotalCount";
NSString *const kDLLSearchContactResponseTotalPages = @"TotalPages";
NSString *const kDLLSearchContactResponseUserID = @"UserID";

@interface DLLSearchContactResponse ()
@end
@implementation DLLSearchContactResponse




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDLLSearchContactResponseClientId] isKindOfClass:[NSNull class]]){
		self.ClientId = dictionary[kDLLSearchContactResponseClientId];
	}	
	if(![dictionary[kDLLSearchContactResponseDebugMessages] isKindOfClass:[NSNull class]]){
		self.DebugMessages = dictionary[kDLLSearchContactResponseDebugMessages];
	}	
	if(![dictionary[kDLLSearchContactResponseHasNextPage] isKindOfClass:[NSNull class]]){
		self.HasNextPage = [dictionary[kDLLSearchContactResponseHasNextPage] boolValue];
	}

	if(![dictionary[kDLLSearchContactResponseHasPreviousPage] isKindOfClass:[NSNull class]]){
		self.HasPreviousPage = [dictionary[kDLLSearchContactResponseHasPreviousPage] boolValue];
	}

	if(![dictionary[kDLLSearchContactResponseKicked] isKindOfClass:[NSNull class]]){
		self.Kicked = [dictionary[kDLLSearchContactResponseKicked] boolValue];
	}

	if(![dictionary[kDLLSearchContactResponseMemberID] isKindOfClass:[NSNull class]]){
		self.MemberID = dictionary[kDLLSearchContactResponseMemberID];
	}	
	if(![dictionary[kDLLSearchContactResponsePageIndex] isKindOfClass:[NSNull class]]){
		self.PageIndex = [dictionary[kDLLSearchContactResponsePageIndex] integerValue];
	}

	if(![dictionary[kDLLSearchContactResponsePageSize] isKindOfClass:[NSNull class]]){
		self.PageSize = [dictionary[kDLLSearchContactResponsePageSize] integerValue];
	}

	if(dictionary[kDLLSearchContactResponseResult] != nil && [dictionary[kDLLSearchContactResponseResult] isKindOfClass:[NSArray class]]){
		NSArray * ResultDictionaries = dictionary[kDLLSearchContactResponseResult];
		NSMutableArray * ResultItems = [NSMutableArray array];
		for(NSDictionary * ResultDictionary in ResultDictionaries){
			DLLResult * ResultItem = [[DLLResult alloc] initWithDictionary:ResultDictionary];
			[ResultItems addObject:ResultItem];
		}
		self.Result = ResultItems;
	}
	if(![dictionary[kDLLSearchContactResponseSkip] isKindOfClass:[NSNull class]]){
		self.Skip = [dictionary[kDLLSearchContactResponseSkip] integerValue];
	}

	if(![dictionary[kDLLSearchContactResponseSucceed] isKindOfClass:[NSNull class]]){
		self.Succeed = [dictionary[kDLLSearchContactResponseSucceed] boolValue];
	}

	if(![dictionary[kDLLSearchContactResponseTake] isKindOfClass:[NSNull class]]){
		self.Take = [dictionary[kDLLSearchContactResponseTake] integerValue];
	}

	if(![dictionary[kDLLSearchContactResponseTotalCount] isKindOfClass:[NSNull class]]){
		self.TotalCount = [dictionary[kDLLSearchContactResponseTotalCount] integerValue];
	}

	if(![dictionary[kDLLSearchContactResponseTotalPages] isKindOfClass:[NSNull class]]){
		self.TotalPages = [dictionary[kDLLSearchContactResponseTotalPages] integerValue];
	}

	if(![dictionary[kDLLSearchContactResponseUserID] isKindOfClass:[NSNull class]]){
		self.UserID = dictionary[kDLLSearchContactResponseUserID];
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
		dictionary[kDLLSearchContactResponseClientId] = self.ClientId;
	}
	if(self.DebugMessages != nil){
		dictionary[kDLLSearchContactResponseDebugMessages] = self.DebugMessages;
	}
	dictionary[kDLLSearchContactResponseHasNextPage] = @(self.HasNextPage);
	dictionary[kDLLSearchContactResponseHasPreviousPage] = @(self.HasPreviousPage);
	dictionary[kDLLSearchContactResponseKicked] = @(self.Kicked);
	if(self.MemberID != nil){
		dictionary[kDLLSearchContactResponseMemberID] = self.MemberID;
	}
	dictionary[kDLLSearchContactResponsePageIndex] = @(self.PageIndex);
	dictionary[kDLLSearchContactResponsePageSize] = @(self.PageSize);
	if(self.Result != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(DLLResult * ResultElement in self.Result){
			[dictionaryElements addObject:[ResultElement toDictionary]];
		}
		dictionary[kDLLSearchContactResponseResult] = dictionaryElements;
	}
	dictionary[kDLLSearchContactResponseSkip] = @(self.Skip);
	dictionary[kDLLSearchContactResponseSucceed] = @(self.Succeed);
	dictionary[kDLLSearchContactResponseTake] = @(self.Take);
	dictionary[kDLLSearchContactResponseTotalCount] = @(self.TotalCount);
	dictionary[kDLLSearchContactResponseTotalPages] = @(self.TotalPages);
	if(self.UserID != nil){
		dictionary[kDLLSearchContactResponseUserID] = self.UserID;
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
		[aCoder encodeObject:self.ClientId forKey:kDLLSearchContactResponseClientId];
	}
	if(self.DebugMessages != nil){
		[aCoder encodeObject:self.DebugMessages forKey:kDLLSearchContactResponseDebugMessages];
	}
	[aCoder encodeObject:@(self.HasNextPage) forKey:kDLLSearchContactResponseHasNextPage];	[aCoder encodeObject:@(self.HasPreviousPage) forKey:kDLLSearchContactResponseHasPreviousPage];	[aCoder encodeObject:@(self.Kicked) forKey:kDLLSearchContactResponseKicked];	if(self.MemberID != nil){
		[aCoder encodeObject:self.MemberID forKey:kDLLSearchContactResponseMemberID];
	}
	[aCoder encodeObject:@(self.PageIndex) forKey:kDLLSearchContactResponsePageIndex];	[aCoder encodeObject:@(self.PageSize) forKey:kDLLSearchContactResponsePageSize];	if(self.Result != nil){
		[aCoder encodeObject:self.Result forKey:kDLLSearchContactResponseResult];
	}
	[aCoder encodeObject:@(self.Skip) forKey:kDLLSearchContactResponseSkip];	[aCoder encodeObject:@(self.Succeed) forKey:kDLLSearchContactResponseSucceed];	[aCoder encodeObject:@(self.Take) forKey:kDLLSearchContactResponseTake];	[aCoder encodeObject:@(self.TotalCount) forKey:kDLLSearchContactResponseTotalCount];	[aCoder encodeObject:@(self.TotalPages) forKey:kDLLSearchContactResponseTotalPages];	if(self.UserID != nil){
		[aCoder encodeObject:self.UserID forKey:kDLLSearchContactResponseUserID];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ClientId = [aDecoder decodeObjectForKey:kDLLSearchContactResponseClientId];
	self.DebugMessages = [aDecoder decodeObjectForKey:kDLLSearchContactResponseDebugMessages];
	self.HasNextPage = [[aDecoder decodeObjectForKey:kDLLSearchContactResponseHasNextPage] boolValue];
	self.HasPreviousPage = [[aDecoder decodeObjectForKey:kDLLSearchContactResponseHasPreviousPage] boolValue];
	self.Kicked = [[aDecoder decodeObjectForKey:kDLLSearchContactResponseKicked] boolValue];
	self.MemberID = [aDecoder decodeObjectForKey:kDLLSearchContactResponseMemberID];
	self.PageIndex = [[aDecoder decodeObjectForKey:kDLLSearchContactResponsePageIndex] integerValue];
	self.PageSize = [[aDecoder decodeObjectForKey:kDLLSearchContactResponsePageSize] integerValue];
	self.Result = [aDecoder decodeObjectForKey:kDLLSearchContactResponseResult];
	self.Skip = [[aDecoder decodeObjectForKey:kDLLSearchContactResponseSkip] integerValue];
	self.Succeed = [[aDecoder decodeObjectForKey:kDLLSearchContactResponseSucceed] boolValue];
	self.Take = [[aDecoder decodeObjectForKey:kDLLSearchContactResponseTake] integerValue];
	self.TotalCount = [[aDecoder decodeObjectForKey:kDLLSearchContactResponseTotalCount] integerValue];
	self.TotalPages = [[aDecoder decodeObjectForKey:kDLLSearchContactResponseTotalPages] integerValue];
	self.UserID = [aDecoder decodeObjectForKey:kDLLSearchContactResponseUserID];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DLLSearchContactResponse *copy = [DLLSearchContactResponse new];

	copy.ClientId = [self.ClientId copy];
	copy.DebugMessages = [self.DebugMessages copy];
	copy.HasNextPage = self.HasNextPage;
	copy.HasPreviousPage = self.HasPreviousPage;
	copy.Kicked = self.Kicked;
	copy.MemberID = [self.MemberID copy];
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