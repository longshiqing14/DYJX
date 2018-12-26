//
//	DJJSGetUserModel.h
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DJJSResult.h"

@interface DJJSGetUserModel : NSObject

@property (nonatomic, copy) NSString * ClientId;
@property (nonatomic, strong) NSArray * DebugMessages;
@property (nonatomic, assign) BOOL Kicked;
@property (nonatomic, copy) NSString * MemberID;
@property (nonatomic, strong) DJJSResult * Result;
@property (nonatomic, assign) BOOL Succeed;
@property (nonatomic, copy) NSString * UserID;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
