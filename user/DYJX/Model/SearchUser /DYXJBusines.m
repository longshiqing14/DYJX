//
//	DYXJBusines.m
//
//	Create by longshiqing on 26/4/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYXJBusines.h"

NSString *const kDYXJBusinesCreateOn = @"CreateOn";
NSString *const kDYXJBusinesDeleted = @"Deleted";
NSString *const kDYXJBusinesDisabled = @"Disabled";
NSString *const kDYXJBusinesIMInfo = @"IMInfo";
NSString *const kDYXJBusinesIdField = @"Id";

@interface DYXJBusines ()
@end
@implementation DYXJBusines




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYXJBusinesCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDYXJBusinesCreateOn];
	}	
	if(![dictionary[kDYXJBusinesDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDYXJBusinesDeleted] boolValue];
	}

	if(![dictionary[kDYXJBusinesDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDYXJBusinesDisabled] boolValue];
	}

	if(![dictionary[kDYXJBusinesIMInfo] isKindOfClass:[NSNull class]]){
		self.IMInfo = [[DYXJIMInfo alloc] initWithDictionary:dictionary[kDYXJBusinesIMInfo]];
	}

	if(![dictionary[kDYXJBusinesIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kDYXJBusinesIdField];
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
		dictionary[kDYXJBusinesCreateOn] = self.CreateOn;
	}
	dictionary[kDYXJBusinesDeleted] = @(self.Deleted);
	dictionary[kDYXJBusinesDisabled] = @(self.Disabled);
	if(self.IMInfo != nil){
		dictionary[kDYXJBusinesIMInfo] = [self.IMInfo toDictionary];
	}
	if(self.IdField != nil){
		dictionary[kDYXJBusinesIdField] = self.IdField;
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
		[aCoder encodeObject:self.CreateOn forKey:kDYXJBusinesCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDYXJBusinesDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDYXJBusinesDisabled];	if(self.IMInfo != nil){
		[aCoder encodeObject:self.IMInfo forKey:kDYXJBusinesIMInfo];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kDYXJBusinesIdField];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.CreateOn = [aDecoder decodeObjectForKey:kDYXJBusinesCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDYXJBusinesDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDYXJBusinesDisabled] boolValue];
	self.IMInfo = [aDecoder decodeObjectForKey:kDYXJBusinesIMInfo];
	self.IdField = [aDecoder decodeObjectForKey:kDYXJBusinesIdField];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYXJBusines *copy = [DYXJBusines new];

	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.IMInfo = [self.IMInfo copy];
	copy.IdField = [self.IdField copy];

	return copy;
}
@end