//
//	DJJLBusines.m
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DJJLBusines.h"

NSString *const kDJJLBusinesCreateOn = @"CreateOn";
NSString *const kDJJLBusinesDeleted = @"Deleted";
NSString *const kDJJLBusinesDisabled = @"Disabled";
NSString *const kDJJLBusinesIMInfo = @"IMInfo";
NSString *const kDJJLBusinesIdField = @"Id";

@interface DJJLBusines ()
@end
@implementation DJJLBusines




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDJJLBusinesCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDJJLBusinesCreateOn];
	}	
	if(![dictionary[kDJJLBusinesDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDJJLBusinesDeleted] boolValue];
	}

	if(![dictionary[kDJJLBusinesDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDJJLBusinesDisabled] boolValue];
	}

	if(![dictionary[kDJJLBusinesIMInfo] isKindOfClass:[NSNull class]]){
		self.IMInfo = [[DJJLIMInfo alloc] initWithDictionary:dictionary[kDJJLBusinesIMInfo]];
	}

	if(![dictionary[kDJJLBusinesIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kDJJLBusinesIdField];
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
		dictionary[kDJJLBusinesCreateOn] = self.CreateOn;
	}
	dictionary[kDJJLBusinesDeleted] = @(self.Deleted);
	dictionary[kDJJLBusinesDisabled] = @(self.Disabled);
	if(self.IMInfo != nil){
		dictionary[kDJJLBusinesIMInfo] = [self.IMInfo toDictionary];
	}
	if(self.IdField != nil){
		dictionary[kDJJLBusinesIdField] = self.IdField;
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
		[aCoder encodeObject:self.CreateOn forKey:kDJJLBusinesCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDJJLBusinesDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDJJLBusinesDisabled];	if(self.IMInfo != nil){
		[aCoder encodeObject:self.IMInfo forKey:kDJJLBusinesIMInfo];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kDJJLBusinesIdField];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.CreateOn = [aDecoder decodeObjectForKey:kDJJLBusinesCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDJJLBusinesDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDJJLBusinesDisabled] boolValue];
	self.IMInfo = [aDecoder decodeObjectForKey:kDJJLBusinesIMInfo];
	self.IdField = [aDecoder decodeObjectForKey:kDJJLBusinesIdField];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DJJLBusines *copy = [DJJLBusines new];

	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.IMInfo = [self.IMInfo copy];
	copy.IdField = [self.IdField copy];

	return copy;
}
@end