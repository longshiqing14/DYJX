//
//	XYDYJXBusines.m
//
//	Create by 岩 熊 on 18/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "XYDYJXBusines.h"

NSString *const kXYDYJXBusinesCreateOn = @"CreateOn";
NSString *const kXYDYJXBusinesDeleted = @"Deleted";
NSString *const kXYDYJXBusinesDisabled = @"Disabled";
NSString *const kXYDYJXBusinesIMInfo = @"IMInfo";
NSString *const kXYDYJXBusinesIdField = @"Id";

@interface XYDYJXBusines ()
@end
@implementation XYDYJXBusines




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kXYDYJXBusinesCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kXYDYJXBusinesCreateOn];
	}	
	if(![dictionary[kXYDYJXBusinesDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kXYDYJXBusinesDeleted] boolValue];
	}

	if(![dictionary[kXYDYJXBusinesDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kXYDYJXBusinesDisabled] boolValue];
	}

	if(![dictionary[kXYDYJXBusinesIMInfo] isKindOfClass:[NSNull class]]){
		self.IMInfo = [[XYDYJXIMInfo alloc] initWithDictionary:dictionary[kXYDYJXBusinesIMInfo]];
	}

	if(![dictionary[kXYDYJXBusinesIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kXYDYJXBusinesIdField];
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
		dictionary[kXYDYJXBusinesCreateOn] = self.CreateOn;
	}
	dictionary[kXYDYJXBusinesDeleted] = @(self.Deleted);
	dictionary[kXYDYJXBusinesDisabled] = @(self.Disabled);
	if(self.IMInfo != nil){
		dictionary[kXYDYJXBusinesIMInfo] = [self.IMInfo toDictionary];
	}
	if(self.IdField != nil){
		dictionary[kXYDYJXBusinesIdField] = self.IdField;
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
		[aCoder encodeObject:self.CreateOn forKey:kXYDYJXBusinesCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kXYDYJXBusinesDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kXYDYJXBusinesDisabled];	if(self.IMInfo != nil){
		[aCoder encodeObject:self.IMInfo forKey:kXYDYJXBusinesIMInfo];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kXYDYJXBusinesIdField];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.CreateOn = [aDecoder decodeObjectForKey:kXYDYJXBusinesCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kXYDYJXBusinesDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kXYDYJXBusinesDisabled] boolValue];
	self.IMInfo = [aDecoder decodeObjectForKey:kXYDYJXBusinesIMInfo];
	self.IdField = [aDecoder decodeObjectForKey:kXYDYJXBusinesIdField];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	XYDYJXBusines *copy = [XYDYJXBusines new];

	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.IMInfo = [self.IMInfo copy];
	copy.IdField = [self.IdField copy];

	return copy;
}
@end