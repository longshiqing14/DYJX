//
//	DIISearchApply.m
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DIISearchApply.h"

NSString *const kDIISearchApplyClientId = @"ClientId";
NSString *const kDIISearchApplyDebugMessages = @"DebugMessages";
NSString *const kDIISearchApplyHasNextPage = @"HasNextPage";
NSString *const kDIISearchApplyHasPreviousPage = @"HasPreviousPage";
NSString *const kDIISearchApplyKicked = @"Kicked";
NSString *const kDIISearchApplyMemberID = @"MemberID";
NSString *const kDIISearchApplyMessage = @"Message";
NSString *const kDIISearchApplyPageIndex = @"PageIndex";
NSString *const kDIISearchApplyPageSize = @"PageSize";
NSString *const kDIISearchApplyResult = @"Result";
NSString *const kDIISearchApplySkip = @"Skip";
NSString *const kDIISearchApplySucceed = @"Succeed";
NSString *const kDIISearchApplyTake = @"Take";
NSString *const kDIISearchApplyTotalCount = @"TotalCount";
NSString *const kDIISearchApplyTotalPages = @"TotalPages";
NSString *const kDIISearchApplyUserID = @"UserID";

@interface DIISearchApply ()
@end
@implementation DIISearchApply




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDIISearchApplyClientId] isKindOfClass:[NSNull class]]){
		self.ClientId = dictionary[kDIISearchApplyClientId];
	}	
	if(![dictionary[kDIISearchApplyDebugMessages] isKindOfClass:[NSNull class]]){
		self.DebugMessages = dictionary[kDIISearchApplyDebugMessages];
	}	
	if(![dictionary[kDIISearchApplyHasNextPage] isKindOfClass:[NSNull class]]){
		self.HasNextPage = [dictionary[kDIISearchApplyHasNextPage] boolValue];
	}

	if(![dictionary[kDIISearchApplyHasPreviousPage] isKindOfClass:[NSNull class]]){
		self.HasPreviousPage = [dictionary[kDIISearchApplyHasPreviousPage] boolValue];
	}

	if(![dictionary[kDIISearchApplyKicked] isKindOfClass:[NSNull class]]){
		self.Kicked = [dictionary[kDIISearchApplyKicked] boolValue];
	}

	if(![dictionary[kDIISearchApplyMemberID] isKindOfClass:[NSNull class]]){
		self.MemberID = dictionary[kDIISearchApplyMemberID];
	}	
	if(![dictionary[kDIISearchApplyMessage] isKindOfClass:[NSNull class]]){
		self.Message = dictionary[kDIISearchApplyMessage];
	}	
	if(![dictionary[kDIISearchApplyPageIndex] isKindOfClass:[NSNull class]]){
		self.PageIndex = [dictionary[kDIISearchApplyPageIndex] integerValue];
	}

	if(![dictionary[kDIISearchApplyPageSize] isKindOfClass:[NSNull class]]){
		self.PageSize = [dictionary[kDIISearchApplyPageSize] integerValue];
	}

	if(dictionary[kDIISearchApplyResult] != nil && [dictionary[kDIISearchApplyResult] isKindOfClass:[NSArray class]]){
		NSArray * ResultDictionaries = dictionary[kDIISearchApplyResult];
		NSMutableArray * ResultItems = [NSMutableArray array];
		for(NSDictionary * ResultDictionary in ResultDictionaries){
			DIIResult * ResultItem = [[DIIResult alloc] initWithDictionary:ResultDictionary];
			[ResultItems addObject:ResultItem];
		}
		self.Result = ResultItems;
	}
	if(![dictionary[kDIISearchApplySkip] isKindOfClass:[NSNull class]]){
		self.Skip = [dictionary[kDIISearchApplySkip] integerValue];
	}

	if(![dictionary[kDIISearchApplySucceed] isKindOfClass:[NSNull class]]){
		self.Succeed = [dictionary[kDIISearchApplySucceed] boolValue];
	}

	if(![dictionary[kDIISearchApplyTake] isKindOfClass:[NSNull class]]){
		self.Take = [dictionary[kDIISearchApplyTake] integerValue];
	}

	if(![dictionary[kDIISearchApplyTotalCount] isKindOfClass:[NSNull class]]){
		self.TotalCount = [dictionary[kDIISearchApplyTotalCount] integerValue];
	}

	if(![dictionary[kDIISearchApplyTotalPages] isKindOfClass:[NSNull class]]){
		self.TotalPages = [dictionary[kDIISearchApplyTotalPages] integerValue];
	}

	if(![dictionary[kDIISearchApplyUserID] isKindOfClass:[NSNull class]]){
		self.UserID = dictionary[kDIISearchApplyUserID];
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
		dictionary[kDIISearchApplyClientId] = self.ClientId;
	}
	if(self.DebugMessages != nil){
		dictionary[kDIISearchApplyDebugMessages] = self.DebugMessages;
	}
	dictionary[kDIISearchApplyHasNextPage] = @(self.HasNextPage);
	dictionary[kDIISearchApplyHasPreviousPage] = @(self.HasPreviousPage);
	dictionary[kDIISearchApplyKicked] = @(self.Kicked);
	if(self.MemberID != nil){
		dictionary[kDIISearchApplyMemberID] = self.MemberID;
	}
	if(self.Message != nil){
		dictionary[kDIISearchApplyMessage] = self.Message;
	}
	dictionary[kDIISearchApplyPageIndex] = @(self.PageIndex);
	dictionary[kDIISearchApplyPageSize] = @(self.PageSize);
	if(self.Result != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(DIIResult * ResultElement in self.Result){
			[dictionaryElements addObject:[ResultElement toDictionary]];
		}
		dictionary[kDIISearchApplyResult] = dictionaryElements;
	}
	dictionary[kDIISearchApplySkip] = @(self.Skip);
	dictionary[kDIISearchApplySucceed] = @(self.Succeed);
	dictionary[kDIISearchApplyTake] = @(self.Take);
	dictionary[kDIISearchApplyTotalCount] = @(self.TotalCount);
	dictionary[kDIISearchApplyTotalPages] = @(self.TotalPages);
	if(self.UserID != nil){
		dictionary[kDIISearchApplyUserID] = self.UserID;
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
		[aCoder encodeObject:self.ClientId forKey:kDIISearchApplyClientId];
	}
	if(self.DebugMessages != nil){
		[aCoder encodeObject:self.DebugMessages forKey:kDIISearchApplyDebugMessages];
	}
	[aCoder encodeObject:@(self.HasNextPage) forKey:kDIISearchApplyHasNextPage];	[aCoder encodeObject:@(self.HasPreviousPage) forKey:kDIISearchApplyHasPreviousPage];	[aCoder encodeObject:@(self.Kicked) forKey:kDIISearchApplyKicked];	if(self.MemberID != nil){
		[aCoder encodeObject:self.MemberID forKey:kDIISearchApplyMemberID];
	}
	if(self.Message != nil){
		[aCoder encodeObject:self.Message forKey:kDIISearchApplyMessage];
	}
	[aCoder encodeObject:@(self.PageIndex) forKey:kDIISearchApplyPageIndex];	[aCoder encodeObject:@(self.PageSize) forKey:kDIISearchApplyPageSize];	if(self.Result != nil){
		[aCoder encodeObject:self.Result forKey:kDIISearchApplyResult];
	}
	[aCoder encodeObject:@(self.Skip) forKey:kDIISearchApplySkip];	[aCoder encodeObject:@(self.Succeed) forKey:kDIISearchApplySucceed];	[aCoder encodeObject:@(self.Take) forKey:kDIISearchApplyTake];	[aCoder encodeObject:@(self.TotalCount) forKey:kDIISearchApplyTotalCount];	[aCoder encodeObject:@(self.TotalPages) forKey:kDIISearchApplyTotalPages];	if(self.UserID != nil){
		[aCoder encodeObject:self.UserID forKey:kDIISearchApplyUserID];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ClientId = [aDecoder decodeObjectForKey:kDIISearchApplyClientId];
	self.DebugMessages = [aDecoder decodeObjectForKey:kDIISearchApplyDebugMessages];
	self.HasNextPage = [[aDecoder decodeObjectForKey:kDIISearchApplyHasNextPage] boolValue];
	self.HasPreviousPage = [[aDecoder decodeObjectForKey:kDIISearchApplyHasPreviousPage] boolValue];
	self.Kicked = [[aDecoder decodeObjectForKey:kDIISearchApplyKicked] boolValue];
	self.MemberID = [aDecoder decodeObjectForKey:kDIISearchApplyMemberID];
	self.Message = [aDecoder decodeObjectForKey:kDIISearchApplyMessage];
	self.PageIndex = [[aDecoder decodeObjectForKey:kDIISearchApplyPageIndex] integerValue];
	self.PageSize = [[aDecoder decodeObjectForKey:kDIISearchApplyPageSize] integerValue];
	self.Result = [aDecoder decodeObjectForKey:kDIISearchApplyResult];
	self.Skip = [[aDecoder decodeObjectForKey:kDIISearchApplySkip] integerValue];
	self.Succeed = [[aDecoder decodeObjectForKey:kDIISearchApplySucceed] boolValue];
	self.Take = [[aDecoder decodeObjectForKey:kDIISearchApplyTake] integerValue];
	self.TotalCount = [[aDecoder decodeObjectForKey:kDIISearchApplyTotalCount] integerValue];
	self.TotalPages = [[aDecoder decodeObjectForKey:kDIISearchApplyTotalPages] integerValue];
	self.UserID = [aDecoder decodeObjectForKey:kDIISearchApplyUserID];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DIISearchApply *copy = [DIISearchApply new];

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