//
//	DJJSBusines.m
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJSBusines.h"

NSString *const kDJJSBusinesCreateOn = @"CreateOn";
NSString *const kDJJSBusinesDeleted = @"Deleted";
NSString *const kDJJSBusinesDisabled = @"Disabled";
NSString *const kDJJSBusinesIMInfo = @"IMInfo";
NSString *const kDJJSBusinesId = @"Id";

@interface DJJSBusines ()
@end
@implementation DJJSBusines




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJSBusinesCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDJJSBusinesCreateOn];
	}	
	if(![dictionary[kDJJSBusinesDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDJJSBusinesDeleted] boolValue];
	}

	if(![dictionary[kDJJSBusinesDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDJJSBusinesDisabled] boolValue];
	}

	if(![dictionary[kDJJSBusinesIMInfo] isKindOfClass:[NSNull class]]){
		self.IMInfo = [[DJJSIMInfo alloc] initWithDictionary:dictionary[kDJJSBusinesIMInfo]];
	}

	if(![dictionary[kDJJSBusinesId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDJJSBusinesId];
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
		dictionary[kDJJSBusinesCreateOn] = self.CreateOn;
	}
	dictionary[kDJJSBusinesDeleted] = @(self.Deleted);
	dictionary[kDJJSBusinesDisabled] = @(self.Disabled);
	if(self.IMInfo != nil){
		dictionary[kDJJSBusinesIMInfo] = [self.IMInfo toDictionary];
	}
	if(self.Id != nil){
		dictionary[kDJJSBusinesId] = self.Id;
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
		[aCoder encodeObject:self.CreateOn forKey:kDJJSBusinesCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDJJSBusinesDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDJJSBusinesDisabled];	if(self.IMInfo != nil){
		[aCoder encodeObject:self.IMInfo forKey:kDJJSBusinesIMInfo];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDJJSBusinesId];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.CreateOn = [aDecoder decodeObjectForKey:kDJJSBusinesCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDJJSBusinesDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDJJSBusinesDisabled] boolValue];
	self.IMInfo = [aDecoder decodeObjectForKey:kDJJSBusinesIMInfo];
	self.Id = [aDecoder decodeObjectForKey:kDJJSBusinesId];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJSBusines *copy = [DJJSBusines new];

	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.IMInfo = [self.IMInfo copy];
	copy.Id = [self.Id copy];

	return copy;
}
@end
