//
//	DYJXXYBusines.m
//
//	Create by 岩 熊 on 7/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYJXXYBusines.h"

NSString *const kDYJXXYBusinesCreateOn = @"CreateOn";
NSString *const kDYJXXYBusinesDeleted = @"Deleted";
NSString *const kDYJXXYBusinesDisabled = @"Disabled";
NSString *const kDYJXXYBusinesIMInfo = @"IMInfo";
NSString *const kDYJXXYBusinesIdField = @"Id";

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
		self.createOn = dictionary[kDYJXXYBusinesCreateOn];
	}	
	if(![dictionary[kDYJXXYBusinesDeleted] isKindOfClass:[NSNull class]]){
		self.deleted = [dictionary[kDYJXXYBusinesDeleted] boolValue];
	}

	if(![dictionary[kDYJXXYBusinesDisabled] isKindOfClass:[NSNull class]]){
		self.disabled = [dictionary[kDYJXXYBusinesDisabled] boolValue];
	}

	if(![dictionary[kDYJXXYBusinesIMInfo] isKindOfClass:[NSNull class]]){
		self.iMInfo = [[DYJXXYIMInfo alloc] initWithDictionary:dictionary[kDYJXXYBusinesIMInfo]];
	}

	if(![dictionary[kDYJXXYBusinesIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kDYJXXYBusinesIdField];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.createOn != nil){
		dictionary[kDYJXXYBusinesCreateOn] = self.createOn;
	}
	dictionary[kDYJXXYBusinesDeleted] = @(self.deleted);
	dictionary[kDYJXXYBusinesDisabled] = @(self.disabled);
	if(self.iMInfo != nil){
		dictionary[kDYJXXYBusinesIMInfo] = [self.iMInfo toDictionary];
	}
	if(self.idField != nil){
		dictionary[kDYJXXYBusinesIdField] = self.idField;
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
	if(self.createOn != nil){
		[aCoder encodeObject:self.createOn forKey:kDYJXXYBusinesCreateOn];
	}
	[aCoder encodeObject:@(self.deleted) forKey:kDYJXXYBusinesDeleted];	[aCoder encodeObject:@(self.disabled) forKey:kDYJXXYBusinesDisabled];	if(self.iMInfo != nil){
		[aCoder encodeObject:self.iMInfo forKey:kDYJXXYBusinesIMInfo];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kDYJXXYBusinesIdField];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.createOn = [aDecoder decodeObjectForKey:kDYJXXYBusinesCreateOn];
	self.deleted = [[aDecoder decodeObjectForKey:kDYJXXYBusinesDeleted] boolValue];
	self.disabled = [[aDecoder decodeObjectForKey:kDYJXXYBusinesDisabled] boolValue];
	self.iMInfo = [aDecoder decodeObjectForKey:kDYJXXYBusinesIMInfo];
	self.idField = [aDecoder decodeObjectForKey:kDYJXXYBusinesIdField];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXXYBusines *copy = [DYJXXYBusines new];

	copy.createOn = [self.createOn copy];
	copy.deleted = self.deleted;
	copy.disabled = self.disabled;
	copy.iMInfo = [self.iMInfo copy];
	copy.idField = [self.idField copy];

	return copy;
}
@end