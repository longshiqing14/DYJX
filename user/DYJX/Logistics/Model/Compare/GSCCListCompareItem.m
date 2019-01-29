//
//	GSCCListCompareItem.m
//
//	Create by longshiqing on 29/1/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "GSCCListCompareItem.h"

NSString *const kGSCCListCompareItemImgUrl = @"ImgUrl";
NSString *const kGSCCListCompareItemLink = @"Link";
NSString *const kGSCCListCompareItemName = @"Name";

@interface GSCCListCompareItem ()
@end
@implementation GSCCListCompareItem




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kGSCCListCompareItemImgUrl] isKindOfClass:[NSNull class]]){
		self.ImgUrl = dictionary[kGSCCListCompareItemImgUrl];
	}	
	if(![dictionary[kGSCCListCompareItemLink] isKindOfClass:[NSNull class]]){
		self.Link = dictionary[kGSCCListCompareItemLink];
	}	
	if(![dictionary[kGSCCListCompareItemName] isKindOfClass:[NSNull class]]){
		self.Name = dictionary[kGSCCListCompareItemName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.ImgUrl != nil){
		dictionary[kGSCCListCompareItemImgUrl] = self.ImgUrl;
	}
	if(self.Link != nil){
		dictionary[kGSCCListCompareItemLink] = self.Link;
	}
	if(self.Name != nil){
		dictionary[kGSCCListCompareItemName] = self.Name;
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
	if(self.ImgUrl != nil){
		[aCoder encodeObject:self.ImgUrl forKey:kGSCCListCompareItemImgUrl];
	}
	if(self.Link != nil){
		[aCoder encodeObject:self.Link forKey:kGSCCListCompareItemLink];
	}
	if(self.Name != nil){
		[aCoder encodeObject:self.Name forKey:kGSCCListCompareItemName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.ImgUrl = [aDecoder decodeObjectForKey:kGSCCListCompareItemImgUrl];
	self.Link = [aDecoder decodeObjectForKey:kGSCCListCompareItemLink];
	self.Name = [aDecoder decodeObjectForKey:kGSCCListCompareItemName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	GSCCListCompareItem *copy = [GSCCListCompareItem new];

	copy.ImgUrl = [self.ImgUrl copy];
	copy.Link = [self.Link copy];
	copy.Name = [self.Name copy];

	return copy;
}
@end