//
//	DYJXSendMsgReq.m
//
//	Create by longshiqing on 21/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DYJXSendMsgReq.h"

NSString *const kDYJXSendMsgReqCertificateId = @"CertificateId";
NSString *const kDYJXSendMsgReqClientId = @"ClientId";
NSString *const kDYJXSendMsgReqData = @"Data";
NSString *const kDYJXSendMsgReqDevice = @"Device";
NSString *const kDYJXSendMsgReqDeviceToken = @"DeviceToken";

@interface DYJXSendMsgReq ()
@end
@implementation DYJXSendMsgReq




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDYJXSendMsgReqCertificateId] isKindOfClass:[NSNull class]]){
		self.CertificateId = dictionary[kDYJXSendMsgReqCertificateId];
	}	
	if(![dictionary[kDYJXSendMsgReqClientId] isKindOfClass:[NSNull class]]){
		self.ClientId = dictionary[kDYJXSendMsgReqClientId];
	}	
	if(![dictionary[kDYJXSendMsgReqData] isKindOfClass:[NSNull class]]){
		self.Data = [[DYJXData alloc] initWithDictionary:dictionary[kDYJXSendMsgReqData]];
	}

	if(![dictionary[kDYJXSendMsgReqDevice] isKindOfClass:[NSNull class]]){
		self.Device = dictionary[kDYJXSendMsgReqDevice];
	}	
	if(![dictionary[kDYJXSendMsgReqDeviceToken] isKindOfClass:[NSNull class]]){
		self.DeviceToken = dictionary[kDYJXSendMsgReqDeviceToken];
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
		dictionary[kDYJXSendMsgReqCertificateId] = self.CertificateId;
	}
	if(self.ClientId != nil){
		dictionary[kDYJXSendMsgReqClientId] = self.ClientId;
	}
	if(self.Data != nil){
		dictionary[kDYJXSendMsgReqData] = [self.Data toDictionary];
	}
	if(self.Device != nil){
		dictionary[kDYJXSendMsgReqDevice] = self.Device;
	}
	if(self.DeviceToken != nil){
		dictionary[kDYJXSendMsgReqDeviceToken] = self.DeviceToken;
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
		[aCoder encodeObject:self.CertificateId forKey:kDYJXSendMsgReqCertificateId];
	}
	if(self.ClientId != nil){
		[aCoder encodeObject:self.ClientId forKey:kDYJXSendMsgReqClientId];
	}
	if(self.Data != nil){
		[aCoder encodeObject:self.Data forKey:kDYJXSendMsgReqData];
	}
	if(self.Device != nil){
		[aCoder encodeObject:self.Device forKey:kDYJXSendMsgReqDevice];
	}
	if(self.DeviceToken != nil){
		[aCoder encodeObject:self.DeviceToken forKey:kDYJXSendMsgReqDeviceToken];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.CertificateId = [aDecoder decodeObjectForKey:kDYJXSendMsgReqCertificateId];
	self.ClientId = [aDecoder decodeObjectForKey:kDYJXSendMsgReqClientId];
	self.Data = [aDecoder decodeObjectForKey:kDYJXSendMsgReqData];
	self.Device = [aDecoder decodeObjectForKey:kDYJXSendMsgReqDevice];
	self.DeviceToken = [aDecoder decodeObjectForKey:kDYJXSendMsgReqDeviceToken];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DYJXSendMsgReq *copy = [DYJXSendMsgReq new];

	copy.CertificateId = [self.CertificateId copy];
	copy.ClientId = [self.ClientId copy];
	copy.Data = [self.Data copy];
	copy.Device = [self.Device copy];
	copy.DeviceToken = [self.DeviceToken copy];

	return copy;
}
@end