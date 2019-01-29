//
//	GSCCompare.m
//
//	Create by longshiqing on 29/1/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "GSCCompare.h"

NSString *const kGSCCompareClientId = @"ClientId";
NSString *const kGSCCompareKicked = @"Kicked";
NSString *const kGSCCompareListCompareItem = @"ListCompareItem";
NSString *const kGSCCompareMemberID = @"MemberID";
NSString *const kGSCCompareMessage = @"Message";
NSString *const kGSCCompareResult = @"Result";
NSString *const kGSCCompareSucceed = @"Succeed";

@interface GSCCompare ()
@end
@implementation GSCCompare




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kGSCCompareClientId] isKindOfClass:[NSNull class]]){
		self.ClientId = dictionary[kGSCCompareClientId];
	}	
	if(![dictionary[kGSCCompareKicked] isKindOfClass:[NSNull class]]){
		self.Kicked = [dictionary[kGSCCompareKicked] boolValue];
	}

	if(dictionary[kGSCCompareListCompareItem] != nil && [dictionary[kGSCCompareListCompareItem] isKindOfClass:[NSArray class]]){
		NSArray * ListCompareItemDictionaries = dictionary[kGSCCompareListCompareItem];
		NSMutableArray * ListCompareItemItems = [NSMutableArray array];
		for(NSDictionary * ListCompareItemDictionary in ListCompareItemDictionaries){
			GSCCListCompareItem * ListCompareItemItem = [[GSCCListCompareItem alloc] initWithDictionary:ListCompareItemDictionary];
			[ListCompareItemItems addObject:ListCompareItemItem];
		}
		self.ListCompareItem = ListCompareItemItems;
	}
	if(![dictionary[kGSCCompareMemberID] isKindOfClass:[NSNull class]]){
		self.MemberID = dictionary[kGSCCompareMemberID];
	}	
	if(![dictionary[kGSCCompareMessage] isKindOfClass:[NSNull class]]){
		self.Message = dictionary[kGSCCompareMessage];
	}	
	if(![dictionary[kGSCCompareResult] isKindOfClass:[NSNull class]]){
		self.Result = dictionary[kGSCCompareResult];
	}	
	if(![dictionary[kGSCCompareSucceed] isKindOfClass:[NSNull class]]){
		self.Succeed = [dictionary[kGSCCompareSucceed] boolValue];
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
		dictionary[kGSCCompareClientId] = self.ClientId;
	}
	dictionary[kGSCCompareKicked] = @(self.Kicked);
	if(self.ListCompareItem != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(GSCCListCompareItem * ListCompareItemElement in self.ListCompareItem){
			[dictionaryElements addObject:[ListCompareItemElement toDictionary]];
		}
		dictionary[kGSCCompareListCompareItem] = dictionaryElements;
	}
	if(self.MemberID != nil){
		dictionary[kGSCCompareMemberID] = self.MemberID;
	}
	if(self.Message != nil){
		dictionary[kGSCCompareMessage] = self.Message;
	}
	if(self.Result != nil){
		dictionary[kGSCCompareResult] = self.Result;
	}
	dictionary[kGSCCompareSucceed] = @(self.Succeed);
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
		[aCoder encodeObject:self.ClientId forKey:kGSCCompareClientId];
	}
	[aCoder encodeObject:@(self.Kicked) forKey:kGSCCompareKicked];	if(self.ListCompareItem != nil){
		[aCoder encodeObject:self.ListCompareItem forKey:kGSCCompareListCompareItem];
	}
	if(self.MemberID != nil){
		[aCoder encodeObject:self.MemberID forKey:kGSCCompareMemberID];
	}
	if(self.Message != nil){
		[aCoder encodeObject:self.Message forKey:kGSCCompareMessage];
	}
	if(self.Result != nil){
		[aCoder encodeObject:self.Result forKey:kGSCCompareResult];
	}
	[aCoder encodeObject:@(self.Succeed) forKey:kGSCCompareSucceed];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ClientId = [aDecoder decodeObjectForKey:kGSCCompareClientId];
	self.Kicked = [[aDecoder decodeObjectForKey:kGSCCompareKicked] boolValue];
	self.ListCompareItem = [aDecoder decodeObjectForKey:kGSCCompareListCompareItem];
	self.MemberID = [aDecoder decodeObjectForKey:kGSCCompareMemberID];
	self.Message = [aDecoder decodeObjectForKey:kGSCCompareMessage];
	self.Result = [aDecoder decodeObjectForKey:kGSCCompareResult];
	self.Succeed = [[aDecoder decodeObjectForKey:kGSCCompareSucceed] boolValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	GSCCompare *copy = [GSCCompare new];

	copy.ClientId = [self.ClientId copy];
	copy.Kicked = self.Kicked;
	copy.ListCompareItem = [self.ListCompareItem copy];
	copy.MemberID = [self.MemberID copy];
	copy.Message = [self.Message copy];
	copy.Result = [self.Result copy];
	copy.Succeed = self.Succeed;

	return copy;
}
@end