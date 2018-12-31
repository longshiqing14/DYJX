//
//	DYJXXYBusines.m
//
//	Create by 岩 熊 on 12/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYJXXYBusines.h"

NSString *const kDYJXXYBusinesCreateOn = @"CreateOn";
NSString *const kDYJXXYBusinesDeleted = @"Deleted";
NSString *const kDYJXXYBusinesDisabled = @"Disabled";
NSString *const kDYJXXYBusinesIMInfo = @"IMInfo";
NSString *const kDYJXXYBusinesId = @"Id";

@interface DYJXXYBusines ()
@end
@implementation DYJXXYBusines




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYJXXYBusinesCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDYJXXYBusinesCreateOn];
	}	
	if(![dictionary[kDYJXXYBusinesDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDYJXXYBusinesDeleted] boolValue];
	}

	if(![dictionary[kDYJXXYBusinesDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDYJXXYBusinesDisabled] boolValue];
	}

	if(![dictionary[kDYJXXYBusinesIMInfo] isKindOfClass:[NSNull class]]){
		self.IMInfo = [[DYJXXYIMInfo alloc] initWithDictionary:dictionary[kDYJXXYBusinesIMInfo]];
	}

	if(![dictionary[kDYJXXYBusinesId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDYJXXYBusinesId];
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
		dictionary[kDYJXXYBusinesCreateOn] = self.CreateOn;
	}
	dictionary[kDYJXXYBusinesDeleted] = @(self.Deleted);
	dictionary[kDYJXXYBusinesDisabled] = @(self.Disabled);
	if(self.IMInfo != nil){
		dictionary[kDYJXXYBusinesIMInfo] = [self.IMInfo toDictionary];
	}
	if(self.Id != nil){
		dictionary[kDYJXXYBusinesId] = self.Id;
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
		[aCoder encodeObject:self.CreateOn forKey:kDYJXXYBusinesCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDYJXXYBusinesDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDYJXXYBusinesDisabled];	if(self.IMInfo != nil){
		[aCoder encodeObject:self.IMInfo forKey:kDYJXXYBusinesIMInfo];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDYJXXYBusinesId];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.CreateOn = [aDecoder decodeObjectForKey:kDYJXXYBusinesCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDYJXXYBusinesDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDYJXXYBusinesDisabled] boolValue];
	self.IMInfo = [aDecoder decodeObjectForKey:kDYJXXYBusinesIMInfo];
	self.Id = [aDecoder decodeObjectForKey:kDYJXXYBusinesId];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXXYBusines *copy = [DYJXXYBusines new];

	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.IMInfo = [self.IMInfo copy];
	copy.Id = [self.Id copy];

	return copy;
}
@end
