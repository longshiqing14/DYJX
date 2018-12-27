//
//	XYDYJXResponse.m
//
//	Create by 岩 熊 on 18/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "XYDYJXResponse.h"

NSString *const kXYDYJXResponseClientId = @"ClientId";
NSString *const kXYDYJXResponseDebugMessages = @"DebugMessages";
NSString *const kXYDYJXResponseHasNextPage = @"HasNextPage";
NSString *const kXYDYJXResponseHasPreviousPage = @"HasPreviousPage";
NSString *const kXYDYJXResponseKicked = @"Kicked";
NSString *const kXYDYJXResponseMemberID = @"MemberID";
NSString *const kXYDYJXResponsePageIndex = @"PageIndex";
NSString *const kXYDYJXResponsePageSize = @"PageSize";
NSString *const kXYDYJXResponseResult = @"Result";
NSString *const kXYDYJXResponseSkip = @"Skip";
NSString *const kXYDYJXResponseSucceed = @"Succeed";
NSString *const kXYDYJXResponseTake = @"Take";
NSString *const kXYDYJXResponseTotalCount = @"TotalCount";
NSString *const kXYDYJXResponseTotalPages = @"TotalPages";
NSString *const kXYDYJXResponseUserID = @"UserID";

@interface XYDYJXResponse ()
@end
@implementation XYDYJXResponse




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kXYDYJXResponseClientId] isKindOfClass:[NSNull class]]){
		self.ClientId = dictionary[kXYDYJXResponseClientId];
	}	
	if(![dictionary[kXYDYJXResponseDebugMessages] isKindOfClass:[NSNull class]]){
		self.DebugMessages = dictionary[kXYDYJXResponseDebugMessages];
	}	
	if(![dictionary[kXYDYJXResponseHasNextPage] isKindOfClass:[NSNull class]]){
		self.HasNextPage = [dictionary[kXYDYJXResponseHasNextPage] boolValue];
	}

	if(![dictionary[kXYDYJXResponseHasPreviousPage] isKindOfClass:[NSNull class]]){
		self.HasPreviousPage = [dictionary[kXYDYJXResponseHasPreviousPage] boolValue];
	}

	if(![dictionary[kXYDYJXResponseKicked] isKindOfClass:[NSNull class]]){
		self.Kicked = [dictionary[kXYDYJXResponseKicked] boolValue];
	}

	if(![dictionary[kXYDYJXResponseMemberID] isKindOfClass:[NSNull class]]){
		self.MemberID = dictionary[kXYDYJXResponseMemberID];
	}	
	if(![dictionary[kXYDYJXResponsePageIndex] isKindOfClass:[NSNull class]]){
		self.PageIndex = [dictionary[kXYDYJXResponsePageIndex] integerValue];
	}

	if(![dictionary[kXYDYJXResponsePageSize] isKindOfClass:[NSNull class]]){
		self.PageSize = [dictionary[kXYDYJXResponsePageSize] integerValue];
	}

	if(dictionary[kXYDYJXResponseResult] != nil && [dictionary[kXYDYJXResponseResult] isKindOfClass:[NSArray class]]){
		NSArray * ResultDictionaries = dictionary[kXYDYJXResponseResult];
		NSMutableArray * ResultItems = [NSMutableArray array];
		for(NSDictionary * ResultDictionary in ResultDictionaries){
			XYDYJXResult * ResultItem = [[XYDYJXResult alloc] initWithDictionary:ResultDictionary];
			[ResultItems addObject:ResultItem];
		}
		self.Result = ResultItems;
	}
	if(![dictionary[kXYDYJXResponseSkip] isKindOfClass:[NSNull class]]){
		self.Skip = [dictionary[kXYDYJXResponseSkip] integerValue];
	}

	if(![dictionary[kXYDYJXResponseSucceed] isKindOfClass:[NSNull class]]){
		self.Succeed = [dictionary[kXYDYJXResponseSucceed] boolValue];
	}

	if(![dictionary[kXYDYJXResponseTake] isKindOfClass:[NSNull class]]){
		self.Take = [dictionary[kXYDYJXResponseTake] integerValue];
	}

	if(![dictionary[kXYDYJXResponseTotalCount] isKindOfClass:[NSNull class]]){
		self.TotalCount = [dictionary[kXYDYJXResponseTotalCount] integerValue];
	}

	if(![dictionary[kXYDYJXResponseTotalPages] isKindOfClass:[NSNull class]]){
		self.TotalPages = [dictionary[kXYDYJXResponseTotalPages] integerValue];
	}

	if(![dictionary[kXYDYJXResponseUserID] isKindOfClass:[NSNull class]]){
		self.UserID = dictionary[kXYDYJXResponseUserID];
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
		dictionary[kXYDYJXResponseClientId] = self.ClientId;
	}
	if(self.DebugMessages != nil){
		dictionary[kXYDYJXResponseDebugMessages] = self.DebugMessages;
	}
	dictionary[kXYDYJXResponseHasNextPage] = @(self.HasNextPage);
	dictionary[kXYDYJXResponseHasPreviousPage] = @(self.HasPreviousPage);
	dictionary[kXYDYJXResponseKicked] = @(self.Kicked);
	if(self.MemberID != nil){
		dictionary[kXYDYJXResponseMemberID] = self.MemberID;
	}
	dictionary[kXYDYJXResponsePageIndex] = @(self.PageIndex);
	dictionary[kXYDYJXResponsePageSize] = @(self.PageSize);
	if(self.Result != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(XYDYJXResult * ResultElement in self.Result){
			[dictionaryElements addObject:[ResultElement toDictionary]];
		}
		dictionary[kXYDYJXResponseResult] = dictionaryElements;
	}
	dictionary[kXYDYJXResponseSkip] = @(self.Skip);
	dictionary[kXYDYJXResponseSucceed] = @(self.Succeed);
	dictionary[kXYDYJXResponseTake] = @(self.Take);
	dictionary[kXYDYJXResponseTotalCount] = @(self.TotalCount);
	dictionary[kXYDYJXResponseTotalPages] = @(self.TotalPages);
	if(self.UserID != nil){
		dictionary[kXYDYJXResponseUserID] = self.UserID;
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
		[aCoder encodeObject:self.ClientId forKey:kXYDYJXResponseClientId];
	}
	if(self.DebugMessages != nil){
		[aCoder encodeObject:self.DebugMessages forKey:kXYDYJXResponseDebugMessages];
	}
	[aCoder encodeObject:@(self.HasNextPage) forKey:kXYDYJXResponseHasNextPage];	[aCoder encodeObject:@(self.HasPreviousPage) forKey:kXYDYJXResponseHasPreviousPage];	[aCoder encodeObject:@(self.Kicked) forKey:kXYDYJXResponseKicked];	if(self.MemberID != nil){
		[aCoder encodeObject:self.MemberID forKey:kXYDYJXResponseMemberID];
	}
	[aCoder encodeObject:@(self.PageIndex) forKey:kXYDYJXResponsePageIndex];	[aCoder encodeObject:@(self.PageSize) forKey:kXYDYJXResponsePageSize];	if(self.Result != nil){
		[aCoder encodeObject:self.Result forKey:kXYDYJXResponseResult];
	}
	[aCoder encodeObject:@(self.Skip) forKey:kXYDYJXResponseSkip];	[aCoder encodeObject:@(self.Succeed) forKey:kXYDYJXResponseSucceed];	[aCoder encodeObject:@(self.Take) forKey:kXYDYJXResponseTake];	[aCoder encodeObject:@(self.TotalCount) forKey:kXYDYJXResponseTotalCount];	[aCoder encodeObject:@(self.TotalPages) forKey:kXYDYJXResponseTotalPages];	if(self.UserID != nil){
		[aCoder encodeObject:self.UserID forKey:kXYDYJXResponseUserID];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ClientId = [aDecoder decodeObjectForKey:kXYDYJXResponseClientId];
	self.DebugMessages = [aDecoder decodeObjectForKey:kXYDYJXResponseDebugMessages];
	self.HasNextPage = [[aDecoder decodeObjectForKey:kXYDYJXResponseHasNextPage] boolValue];
	self.HasPreviousPage = [[aDecoder decodeObjectForKey:kXYDYJXResponseHasPreviousPage] boolValue];
	self.Kicked = [[aDecoder decodeObjectForKey:kXYDYJXResponseKicked] boolValue];
	self.MemberID = [aDecoder decodeObjectForKey:kXYDYJXResponseMemberID];
	self.PageIndex = [[aDecoder decodeObjectForKey:kXYDYJXResponsePageIndex] integerValue];
	self.PageSize = [[aDecoder decodeObjectForKey:kXYDYJXResponsePageSize] integerValue];
	self.Result = [aDecoder decodeObjectForKey:kXYDYJXResponseResult];
	self.Skip = [[aDecoder decodeObjectForKey:kXYDYJXResponseSkip] integerValue];
	self.Succeed = [[aDecoder decodeObjectForKey:kXYDYJXResponseSucceed] boolValue];
	self.Take = [[aDecoder decodeObjectForKey:kXYDYJXResponseTake] integerValue];
	self.TotalCount = [[aDecoder decodeObjectForKey:kXYDYJXResponseTotalCount] integerValue];
	self.TotalPages = [[aDecoder decodeObjectForKey:kXYDYJXResponseTotalPages] integerValue];
	self.UserID = [aDecoder decodeObjectForKey:kXYDYJXResponseUserID];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	XYDYJXResponse *copy = [XYDYJXResponse new];

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