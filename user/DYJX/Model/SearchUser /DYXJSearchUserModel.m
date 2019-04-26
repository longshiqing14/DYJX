//
//	DYXJSearchUserModel.m
//
//	Create by longshiqing on 26/4/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYXJSearchUserModel.h"

NSString *const kDYXJSearchUserModelClientId = @"ClientId";
NSString *const kDYXJSearchUserModelDebugMessages = @"DebugMessages";
NSString *const kDYXJSearchUserModelHasNextPage = @"HasNextPage";
NSString *const kDYXJSearchUserModelHasPreviousPage = @"HasPreviousPage";
NSString *const kDYXJSearchUserModelKicked = @"Kicked";
NSString *const kDYXJSearchUserModelMemberID = @"MemberID";
NSString *const kDYXJSearchUserModelPageIndex = @"PageIndex";
NSString *const kDYXJSearchUserModelPageSize = @"PageSize";
NSString *const kDYXJSearchUserModelResult = @"Result";
NSString *const kDYXJSearchUserModelSkip = @"Skip";
NSString *const kDYXJSearchUserModelSucceed = @"Succeed";
NSString *const kDYXJSearchUserModelTake = @"Take";
NSString *const kDYXJSearchUserModelTotalCount = @"TotalCount";
NSString *const kDYXJSearchUserModelTotalPages = @"TotalPages";
NSString *const kDYXJSearchUserModelUserID = @"UserID";

@interface DYXJSearchUserModel ()
@end
@implementation DYXJSearchUserModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYXJSearchUserModelClientId] isKindOfClass:[NSNull class]]){
		self.ClientId = dictionary[kDYXJSearchUserModelClientId];
	}	
	if(![dictionary[kDYXJSearchUserModelDebugMessages] isKindOfClass:[NSNull class]]){
		self.DebugMessages = dictionary[kDYXJSearchUserModelDebugMessages];
	}	
	if(![dictionary[kDYXJSearchUserModelHasNextPage] isKindOfClass:[NSNull class]]){
		self.HasNextPage = [dictionary[kDYXJSearchUserModelHasNextPage] boolValue];
	}

	if(![dictionary[kDYXJSearchUserModelHasPreviousPage] isKindOfClass:[NSNull class]]){
		self.HasPreviousPage = [dictionary[kDYXJSearchUserModelHasPreviousPage] boolValue];
	}

	if(![dictionary[kDYXJSearchUserModelKicked] isKindOfClass:[NSNull class]]){
		self.Kicked = [dictionary[kDYXJSearchUserModelKicked] boolValue];
	}

	if(![dictionary[kDYXJSearchUserModelMemberID] isKindOfClass:[NSNull class]]){
		self.MemberID = dictionary[kDYXJSearchUserModelMemberID];
	}	
	if(![dictionary[kDYXJSearchUserModelPageIndex] isKindOfClass:[NSNull class]]){
		self.PageIndex = [dictionary[kDYXJSearchUserModelPageIndex] integerValue];
	}

	if(![dictionary[kDYXJSearchUserModelPageSize] isKindOfClass:[NSNull class]]){
		self.PageSize = [dictionary[kDYXJSearchUserModelPageSize] integerValue];
	}

	if(dictionary[kDYXJSearchUserModelResult] != nil && [dictionary[kDYXJSearchUserModelResult] isKindOfClass:[NSArray class]]){
		NSArray * ResultDictionaries = dictionary[kDYXJSearchUserModelResult];
		NSMutableArray * ResultItems = [NSMutableArray array];
		for(NSDictionary * ResultDictionary in ResultDictionaries){
			DYXJResult * ResultItem = [[DYXJResult alloc] initWithDictionary:ResultDictionary];
			[ResultItems addObject:ResultItem];
		}
		self.Result = ResultItems;
	}
	if(![dictionary[kDYXJSearchUserModelSkip] isKindOfClass:[NSNull class]]){
		self.Skip = [dictionary[kDYXJSearchUserModelSkip] integerValue];
	}

	if(![dictionary[kDYXJSearchUserModelSucceed] isKindOfClass:[NSNull class]]){
		self.Succeed = [dictionary[kDYXJSearchUserModelSucceed] boolValue];
	}

	if(![dictionary[kDYXJSearchUserModelTake] isKindOfClass:[NSNull class]]){
		self.Take = [dictionary[kDYXJSearchUserModelTake] integerValue];
	}

	if(![dictionary[kDYXJSearchUserModelTotalCount] isKindOfClass:[NSNull class]]){
		self.TotalCount = [dictionary[kDYXJSearchUserModelTotalCount] integerValue];
	}

	if(![dictionary[kDYXJSearchUserModelTotalPages] isKindOfClass:[NSNull class]]){
		self.TotalPages = [dictionary[kDYXJSearchUserModelTotalPages] integerValue];
	}

	if(![dictionary[kDYXJSearchUserModelUserID] isKindOfClass:[NSNull class]]){
		self.UserID = dictionary[kDYXJSearchUserModelUserID];
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
		dictionary[kDYXJSearchUserModelClientId] = self.ClientId;
	}
	if(self.DebugMessages != nil){
		dictionary[kDYXJSearchUserModelDebugMessages] = self.DebugMessages;
	}
	dictionary[kDYXJSearchUserModelHasNextPage] = @(self.HasNextPage);
	dictionary[kDYXJSearchUserModelHasPreviousPage] = @(self.HasPreviousPage);
	dictionary[kDYXJSearchUserModelKicked] = @(self.Kicked);
	if(self.MemberID != nil){
		dictionary[kDYXJSearchUserModelMemberID] = self.MemberID;
	}
	dictionary[kDYXJSearchUserModelPageIndex] = @(self.PageIndex);
	dictionary[kDYXJSearchUserModelPageSize] = @(self.PageSize);
	if(self.Result != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(DYXJResult * ResultElement in self.Result){
			[dictionaryElements addObject:[ResultElement toDictionary]];
		}
		dictionary[kDYXJSearchUserModelResult] = dictionaryElements;
	}
	dictionary[kDYXJSearchUserModelSkip] = @(self.Skip);
	dictionary[kDYXJSearchUserModelSucceed] = @(self.Succeed);
	dictionary[kDYXJSearchUserModelTake] = @(self.Take);
	dictionary[kDYXJSearchUserModelTotalCount] = @(self.TotalCount);
	dictionary[kDYXJSearchUserModelTotalPages] = @(self.TotalPages);
	if(self.UserID != nil){
		dictionary[kDYXJSearchUserModelUserID] = self.UserID;
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
		[aCoder encodeObject:self.ClientId forKey:kDYXJSearchUserModelClientId];
	}
	if(self.DebugMessages != nil){
		[aCoder encodeObject:self.DebugMessages forKey:kDYXJSearchUserModelDebugMessages];
	}
	[aCoder encodeObject:@(self.HasNextPage) forKey:kDYXJSearchUserModelHasNextPage];	[aCoder encodeObject:@(self.HasPreviousPage) forKey:kDYXJSearchUserModelHasPreviousPage];	[aCoder encodeObject:@(self.Kicked) forKey:kDYXJSearchUserModelKicked];	if(self.MemberID != nil){
		[aCoder encodeObject:self.MemberID forKey:kDYXJSearchUserModelMemberID];
	}
	[aCoder encodeObject:@(self.PageIndex) forKey:kDYXJSearchUserModelPageIndex];	[aCoder encodeObject:@(self.PageSize) forKey:kDYXJSearchUserModelPageSize];	if(self.Result != nil){
		[aCoder encodeObject:self.Result forKey:kDYXJSearchUserModelResult];
	}
	[aCoder encodeObject:@(self.Skip) forKey:kDYXJSearchUserModelSkip];	[aCoder encodeObject:@(self.Succeed) forKey:kDYXJSearchUserModelSucceed];	[aCoder encodeObject:@(self.Take) forKey:kDYXJSearchUserModelTake];	[aCoder encodeObject:@(self.TotalCount) forKey:kDYXJSearchUserModelTotalCount];	[aCoder encodeObject:@(self.TotalPages) forKey:kDYXJSearchUserModelTotalPages];	if(self.UserID != nil){
		[aCoder encodeObject:self.UserID forKey:kDYXJSearchUserModelUserID];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ClientId = [aDecoder decodeObjectForKey:kDYXJSearchUserModelClientId];
	self.DebugMessages = [aDecoder decodeObjectForKey:kDYXJSearchUserModelDebugMessages];
	self.HasNextPage = [[aDecoder decodeObjectForKey:kDYXJSearchUserModelHasNextPage] boolValue];
	self.HasPreviousPage = [[aDecoder decodeObjectForKey:kDYXJSearchUserModelHasPreviousPage] boolValue];
	self.Kicked = [[aDecoder decodeObjectForKey:kDYXJSearchUserModelKicked] boolValue];
	self.MemberID = [aDecoder decodeObjectForKey:kDYXJSearchUserModelMemberID];
	self.PageIndex = [[aDecoder decodeObjectForKey:kDYXJSearchUserModelPageIndex] integerValue];
	self.PageSize = [[aDecoder decodeObjectForKey:kDYXJSearchUserModelPageSize] integerValue];
	self.Result = [aDecoder decodeObjectForKey:kDYXJSearchUserModelResult];
	self.Skip = [[aDecoder decodeObjectForKey:kDYXJSearchUserModelSkip] integerValue];
	self.Succeed = [[aDecoder decodeObjectForKey:kDYXJSearchUserModelSucceed] boolValue];
	self.Take = [[aDecoder decodeObjectForKey:kDYXJSearchUserModelTake] integerValue];
	self.TotalCount = [[aDecoder decodeObjectForKey:kDYXJSearchUserModelTotalCount] integerValue];
	self.TotalPages = [[aDecoder decodeObjectForKey:kDYXJSearchUserModelTotalPages] integerValue];
	self.UserID = [aDecoder decodeObjectForKey:kDYXJSearchUserModelUserID];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYXJSearchUserModel *copy = [DYXJSearchUserModel new];

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