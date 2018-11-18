//
//	DJJXBusines.m
//
//	Create by longshiqing on 17/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJXBusines.h"

NSString *const kDJJXBusinesCreateOn = @"CreateOn";
NSString *const kDJJXBusinesDeleted = @"Deleted";
NSString *const kDJJXBusinesDisabled = @"Disabled";
NSString *const kDJJXBusinesIMInfo = @"IMInfo";
NSString *const kDJJXBusinesIdField = @"Id";

@interface DJJXBusines ()
@end
@implementation DJJXBusines




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJXBusinesCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDJJXBusinesCreateOn];
	}	
	if(![dictionary[kDJJXBusinesDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDJJXBusinesDeleted] boolValue];
	}

	if(![dictionary[kDJJXBusinesDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDJJXBusinesDisabled] boolValue];
	}

	if(![dictionary[kDJJXBusinesIMInfo] isKindOfClass:[NSNull class]]){
		self.IMInfo = [[DJJXIMInfo alloc] initWithDictionary:dictionary[kDJJXBusinesIMInfo]];
	}

	if(![dictionary[kDJJXBusinesIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kDJJXBusinesIdField];
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
		dictionary[kDJJXBusinesCreateOn] = self.CreateOn;
	}
	dictionary[kDJJXBusinesDeleted] = @(self.Deleted);
	dictionary[kDJJXBusinesDisabled] = @(self.Disabled);
	if(self.IMInfo != nil){
		dictionary[kDJJXBusinesIMInfo] = [self.IMInfo toDictionary];
	}
	if(self.IdField != nil){
		dictionary[kDJJXBusinesIdField] = self.IdField;
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
		[aCoder encodeObject:self.CreateOn forKey:kDJJXBusinesCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDJJXBusinesDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDJJXBusinesDisabled];	if(self.IMInfo != nil){
		[aCoder encodeObject:self.IMInfo forKey:kDJJXBusinesIMInfo];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kDJJXBusinesIdField];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.CreateOn = [aDecoder decodeObjectForKey:kDJJXBusinesCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDJJXBusinesDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDJJXBusinesDisabled] boolValue];
	self.IMInfo = [aDecoder decodeObjectForKey:kDJJXBusinesIMInfo];
	self.IdField = [aDecoder decodeObjectForKey:kDJJXBusinesIdField];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJXBusines *copy = [DJJXBusines new];

	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.IMInfo = [self.IMInfo copy];
	copy.IdField = [self.IdField copy];

	return copy;
}
@end