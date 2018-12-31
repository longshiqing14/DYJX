//
//	DIIBusines.m
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DIIBusines.h"

NSString *const kDIIBusinesCreateOn = @"CreateOn";
NSString *const kDIIBusinesDeleted = @"Deleted";
NSString *const kDIIBusinesDisabled = @"Disabled";
NSString *const kDIIBusinesIMInfo = @"IMInfo";
NSString *const kDIIBusinesId = @"Id";

@interface DIIBusines ()
@end
@implementation DIIBusines




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDIIBusinesCreateOn] isKindOfClass:[NSNull class]]){
		self.CreateOn = dictionary[kDIIBusinesCreateOn];
	}	
	if(![dictionary[kDIIBusinesDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = [dictionary[kDIIBusinesDeleted] boolValue];
	}

	if(![dictionary[kDIIBusinesDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = [dictionary[kDIIBusinesDisabled] boolValue];
	}

	if(![dictionary[kDIIBusinesIMInfo] isKindOfClass:[NSNull class]]){
		self.IMInfo = [[DIIIMInfo alloc] initWithDictionary:dictionary[kDIIBusinesIMInfo]];
	}

	if(![dictionary[kDIIBusinesId] isKindOfClass:[NSNull class]]){
		self.Id = dictionary[kDIIBusinesId];
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
		dictionary[kDIIBusinesCreateOn] = self.CreateOn;
	}
	dictionary[kDIIBusinesDeleted] = @(self.Deleted);
	dictionary[kDIIBusinesDisabled] = @(self.Disabled);
	if(self.IMInfo != nil){
		dictionary[kDIIBusinesIMInfo] = [self.IMInfo toDictionary];
	}
	if(self.Id != nil){
		dictionary[kDIIBusinesId] = self.Id;
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
		[aCoder encodeObject:self.CreateOn forKey:kDIIBusinesCreateOn];
	}
	[aCoder encodeObject:@(self.Deleted) forKey:kDIIBusinesDeleted];	[aCoder encodeObject:@(self.Disabled) forKey:kDIIBusinesDisabled];	if(self.IMInfo != nil){
		[aCoder encodeObject:self.IMInfo forKey:kDIIBusinesIMInfo];
	}
	if(self.Id != nil){
		[aCoder encodeObject:self.Id forKey:kDIIBusinesId];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.CreateOn = [aDecoder decodeObjectForKey:kDIIBusinesCreateOn];
	self.Deleted = [[aDecoder decodeObjectForKey:kDIIBusinesDeleted] boolValue];
	self.Disabled = [[aDecoder decodeObjectForKey:kDIIBusinesDisabled] boolValue];
	self.IMInfo = [aDecoder decodeObjectForKey:kDIIBusinesIMInfo];
	self.Id = [aDecoder decodeObjectForKey:kDIIBusinesId];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DIIBusines *copy = [DIIBusines new];

	copy.CreateOn = [self.CreateOn copy];
	copy.Deleted = self.Deleted;
	copy.Disabled = self.Disabled;
	copy.IMInfo = [self.IMInfo copy];
	copy.Id = [self.Id copy];

	return copy;
}
@end
