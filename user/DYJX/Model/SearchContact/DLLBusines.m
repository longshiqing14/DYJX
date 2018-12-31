//
//	DLLBusines.m
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DLLBusines.h"

NSString *const kDLLBusinesCreateOn = @"CreateOn";
NSString *const kDLLBusinesDeleted = @"Deleted";
NSString *const kDLLBusinesDisabled = @"Disabled";
NSString *const kDLLBusinesIMInfo = @"IMInfo";
NSString *const kDLLBusinesId = @"Id";

@interface DLLBusines ()
@end
@implementation DLLBusines




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDLLBusinesCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDLLBusinesCreateOn];
	}	
	if(![dictionary[kDLLBusinesDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDLLBusinesDeleted] boolValue];
	}

	if(![dictionary[kDLLBusinesDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDLLBusinesDisabled] boolValue];
	}

	if(![dictionary[kDLLBusinesIMInfo] isKindOfClass:[NSNull class]]){
		self.IMInfo = [[DLLIMInfo alloc] initWithDictionary:dictionary[kDLLBusinesIMInfo]];
	}

	if(![dictionary[kDLLBusinesId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDLLBusinesId];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.CreateOn != nil){
		dictionary[kDLLBusinesCreateOn] = self.CreateOn;
	}
	dictionary[kDLLBusinesDeleted] = @(self.Deleted);
	dictionary[kDLLBusinesDisabled] = @(self.Disabled);
	if(self.IMInfo != nil){
		dictionary[kDLLBusinesIMInfo] = [self.IMInfo toDictionary];
	}
	if(self.Id != nil){
		dictionary[kDLLBusinesId] = self.Id;
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
	if(self.CreateOn != nil){
		[aCoder encodeObject:self.CreateOn forKey:kDLLBusinesCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDLLBusinesDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDLLBusinesDisabled];	if(self.IMInfo != nil){
		[aCoder encodeObject:self.IMInfo forKey:kDLLBusinesIMInfo];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDLLBusinesId];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.CreateOn = [aDecoder decodeObjectForKey:kDLLBusinesCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDLLBusinesDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDLLBusinesDisabled] boolValue];
	self.IMInfo = [aDecoder decodeObjectForKey:kDLLBusinesIMInfo];
	self.Id = [aDecoder decodeObjectForKey:kDLLBusinesId];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DLLBusines *copy = [DLLBusines new];

	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.IMInfo = [self.IMInfo copy];
	copy.Id = [self.Id copy];

	return copy;
}
@end
