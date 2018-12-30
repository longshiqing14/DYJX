//
//	DYSearchContactRequest.m
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYSearchContactRequest.h"

NSString *const kDYSearchContactRequestCertificateId = @"CertificateId";
NSString *const kDYSearchContactRequestClientId = @"ClientId";
NSString *const kDYSearchContactRequestContactType = @"ContactType";
NSString *const kDYSearchContactRequestData = @"Data";
NSString *const kDYSearchContactRequestDeleted = @"Deleted";
NSString *const kDYSearchContactRequestDevice = @"Device";
NSString *const kDYSearchContactRequestDeviceToken = @"DeviceToken";
NSString *const kDYSearchContactRequestDisabled = @"Disabled";
NSString *const kDYSearchContactRequestEndDateTime = @"EndDateTime";
NSString *const kDYSearchContactRequestFrom = @"From";
NSString *const kDYSearchContactRequestIdField = @"Id";
NSString *const kDYSearchContactRequestKeyword = @"Keyword";
NSString *const kDYSearchContactRequestMemberID = @"MemberID";
NSString *const kDYSearchContactRequestPageIndex = @"PageIndex";
NSString *const kDYSearchContactRequestPageSize = @"PageSize";
NSString *const kDYSearchContactRequestStartDateTime = @"StartDateTime";
NSString *const kDYSearchContactRequestUserID = @"UserID";
NSString *const kDYSearchContactRequestUserType = @"UserType";

@interface DYSearchContactRequest ()
@end
@implementation DYSearchContactRequest




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYSearchContactRequestCertificateId] isKindOfClass:[NSNull class]]){
		self.CertificateId = dictionary[kDYSearchContactRequestCertificateId];
	}	
	if(![dictionary[kDYSearchContactRequestClientId] isKindOfClass:[NSNull class]]){
		self.ClientId = dictionary[kDYSearchContactRequestClientId];
	}	
	if(![dictionary[kDYSearchContactRequestContactType] isKindOfClass:[NSNull class]]){
		self.ContactType = dictionary[kDYSearchContactRequestContactType];
	}	
	if(![dictionary[kDYSearchContactRequestData] isKindOfClass:[NSNull class]]){
		self.Data = dictionary[kDYSearchContactRequestData];
	}	
	if(![dictionary[kDYSearchContactRequestDeleted] isKindOfClass:[NSNull class]]){
		self.Deleted = dictionary[kDYSearchContactRequestDeleted];
	}	
	if(![dictionary[kDYSearchContactRequestDevice] isKindOfClass:[NSNull class]]){
		self.Device = dictionary[kDYSearchContactRequestDevice];
	}	
	if(![dictionary[kDYSearchContactRequestDeviceToken] isKindOfClass:[NSNull class]]){
		self.DeviceToken = dictionary[kDYSearchContactRequestDeviceToken];
	}	
	if(![dictionary[kDYSearchContactRequestDisabled] isKindOfClass:[NSNull class]]){
		self.Disabled = dictionary[kDYSearchContactRequestDisabled];
	}	
	if(![dictionary[kDYSearchContactRequestEndDateTime] isKindOfClass:[NSNull class]]){
		self.EndDateTime = [dictionary[kDYSearchContactRequestEndDateTime] integerValue];
	}

	if(![dictionary[kDYSearchContactRequestFrom] isKindOfClass:[NSNull class]]){
		self.From = dictionary[kDYSearchContactRequestFrom];
	}	
	if(![dictionary[kDYSearchContactRequestIdField] isKindOfClass:[NSNull class]]){
		self.IdField = dictionary[kDYSearchContactRequestIdField];
	}	
	if(![dictionary[kDYSearchContactRequestKeyword] isKindOfClass:[NSNull class]]){
		self.Keyword = dictionary[kDYSearchContactRequestKeyword];
	}	
	if(![dictionary[kDYSearchContactRequestMemberID] isKindOfClass:[NSNull class]]){
		self.MemberID = dictionary[kDYSearchContactRequestMemberID];
	}	
	if(![dictionary[kDYSearchContactRequestPageIndex] isKindOfClass:[NSNull class]]){
		self.PageIndex = dictionary[kDYSearchContactRequestPageIndex];
	}	
	if(![dictionary[kDYSearchContactRequestPageSize] isKindOfClass:[NSNull class]]){
		self.PageSize = dictionary[kDYSearchContactRequestPageSize];
	}	
	if(![dictionary[kDYSearchContactRequestStartDateTime] isKindOfClass:[NSNull class]]){
		self.StartDateTime = [dictionary[kDYSearchContactRequestStartDateTime] integerValue];
	}

	if(![dictionary[kDYSearchContactRequestUserID] isKindOfClass:[NSNull class]]){
		self.UserID = dictionary[kDYSearchContactRequestUserID];
	}	
	if(![dictionary[kDYSearchContactRequestUserType] isKindOfClass:[NSNull class]]){
		self.UserType = dictionary[kDYSearchContactRequestUserType];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.CertificateId != nil){
		dictionary[kDYSearchContactRequestCertificateId] = self.CertificateId;
	}
	if(self.ClientId != nil){
		dictionary[kDYSearchContactRequestClientId] = self.ClientId;
	}
	if(self.ContactType != nil){
		dictionary[kDYSearchContactRequestContactType] = self.ContactType;
	}
	if(self.Data != nil){
		dictionary[kDYSearchContactRequestData] = self.Data;
	}
	if(self.Deleted != nil){
		dictionary[kDYSearchContactRequestDeleted] = self.Deleted;
	}
	if(self.Device != nil){
		dictionary[kDYSearchContactRequestDevice] = self.Device;
	}
	if(self.DeviceToken != nil){
		dictionary[kDYSearchContactRequestDeviceToken] = self.DeviceToken;
	}
	if(self.Disabled != nil){
		dictionary[kDYSearchContactRequestDisabled] = self.Disabled;
	}
	dictionary[kDYSearchContactRequestEndDateTime] = @(self.EndDateTime);
	if(self.From != nil){
		dictionary[kDYSearchContactRequestFrom] = self.From;
	}
	if(self.IdField != nil){
		dictionary[kDYSearchContactRequestIdField] = self.IdField;
	}
	if(self.Keyword != nil){
		dictionary[kDYSearchContactRequestKeyword] = self.Keyword;
	}
	if(self.MemberID != nil){
		dictionary[kDYSearchContactRequestMemberID] = self.MemberID;
	}
	if(self.PageIndex != nil){
		dictionary[kDYSearchContactRequestPageIndex] = self.PageIndex;
	}
	if(self.PageSize != nil){
		dictionary[kDYSearchContactRequestPageSize] = self.PageSize;
	}
	dictionary[kDYSearchContactRequestStartDateTime] = @(self.StartDateTime);
	if(self.UserID != nil){
		dictionary[kDYSearchContactRequestUserID] = self.UserID;
	}
	if(self.UserType != nil){
		dictionary[kDYSearchContactRequestUserType] = self.UserType;
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
	if(self.CertificateId != nil){
		[aCoder encodeObject:self.CertificateId forKey:kDYSearchContactRequestCertificateId];
	}
	if(self.ClientId != nil){
		[aCoder encodeObject:self.ClientId forKey:kDYSearchContactRequestClientId];
	}
	if(self.ContactType != nil){
		[aCoder encodeObject:self.ContactType forKey:kDYSearchContactRequestContactType];
	}
	if(self.Data != nil){
		[aCoder encodeObject:self.Data forKey:kDYSearchContactRequestData];
	}
	if(self.Deleted != nil){
		[aCoder encodeObject:self.Deleted forKey:kDYSearchContactRequestDeleted];
	}
	if(self.Device != nil){
		[aCoder encodeObject:self.Device forKey:kDYSearchContactRequestDevice];
	}
	if(self.DeviceToken != nil){
		[aCoder encodeObject:self.DeviceToken forKey:kDYSearchContactRequestDeviceToken];
	}
	if(self.Disabled != nil){
		[aCoder encodeObject:self.Disabled forKey:kDYSearchContactRequestDisabled];
	}
	[aCoder encodeObject:@(self.EndDateTime) forKey:kDYSearchContactRequestEndDateTime];	if(self.From != nil){
		[aCoder encodeObject:self.From forKey:kDYSearchContactRequestFrom];
	}
	if(self.IdField != nil){
		[aCoder encodeObject:self.IdField forKey:kDYSearchContactRequestIdField];
	}
	if(self.Keyword != nil){
		[aCoder encodeObject:self.Keyword forKey:kDYSearchContactRequestKeyword];
	}
	if(self.MemberID != nil){
		[aCoder encodeObject:self.MemberID forKey:kDYSearchContactRequestMemberID];
	}
	if(self.PageIndex != nil){
		[aCoder encodeObject:self.PageIndex forKey:kDYSearchContactRequestPageIndex];
	}
	if(self.PageSize != nil){
		[aCoder encodeObject:self.PageSize forKey:kDYSearchContactRequestPageSize];
	}
	[aCoder encodeObject:@(self.StartDateTime) forKey:kDYSearchContactRequestStartDateTime];	if(self.UserID != nil){
		[aCoder encodeObject:self.UserID forKey:kDYSearchContactRequestUserID];
	}
	if(self.UserType != nil){
		[aCoder encodeObject:self.UserType forKey:kDYSearchContactRequestUserType];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.CertificateId = [aDecoder decodeObjectForKey:kDYSearchContactRequestCertificateId];
	self.ClientId = [aDecoder decodeObjectForKey:kDYSearchContactRequestClientId];
	self.ContactType = [aDecoder decodeObjectForKey:kDYSearchContactRequestContactType];
	self.Data = [aDecoder decodeObjectForKey:kDYSearchContactRequestData];
	self.Deleted = [aDecoder decodeObjectForKey:kDYSearchContactRequestDeleted];
	self.Device = [aDecoder decodeObjectForKey:kDYSearchContactRequestDevice];
	self.DeviceToken = [aDecoder decodeObjectForKey:kDYSearchContactRequestDeviceToken];
	self.Disabled = [aDecoder decodeObjectForKey:kDYSearchContactRequestDisabled];
	self.EndDateTime = [[aDecoder decodeObjectForKey:kDYSearchContactRequestEndDateTime] integerValue];
	self.From = [aDecoder decodeObjectForKey:kDYSearchContactRequestFrom];
	self.IdField = [aDecoder decodeObjectForKey:kDYSearchContactRequestIdField];
	self.Keyword = [aDecoder decodeObjectForKey:kDYSearchContactRequestKeyword];
	self.MemberID = [aDecoder decodeObjectForKey:kDYSearchContactRequestMemberID];
	self.PageIndex = [aDecoder decodeObjectForKey:kDYSearchContactRequestPageIndex];
	self.PageSize = [aDecoder decodeObjectForKey:kDYSearchContactRequestPageSize];
	self.StartDateTime = [[aDecoder decodeObjectForKey:kDYSearchContactRequestStartDateTime] integerValue];
	self.UserID = [aDecoder decodeObjectForKey:kDYSearchContactRequestUserID];
	self.UserType = [aDecoder decodeObjectForKey:kDYSearchContactRequestUserType];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYSearchContactRequest *copy = [DYSearchContactRequest new];

	copy.CertificateId = [self.CertificateId copy];
	copy.ClientId = [self.ClientId copy];
	copy.ContactType = [self.ContactType copy];
	copy.Data = [self.Data copy];
	copy.Deleted = [self.Deleted copy];
	copy.Device = [self.Device copy];
	copy.DeviceToken = [self.DeviceToken copy];
	copy.Disabled = [self.Disabled copy];
	copy.EndDateTime = self.EndDateTime;
	copy.From = [self.From copy];
	copy.IdField = [self.IdField copy];
	copy.Keyword = [self.Keyword copy];
	copy.MemberID = [self.MemberID copy];
	copy.PageIndex = [self.PageIndex copy];
	copy.PageSize = [self.PageSize copy];
	copy.StartDateTime = self.StartDateTime;
	copy.UserID = [self.UserID copy];
	copy.UserType = [self.UserType copy];

	return copy;
}
@end