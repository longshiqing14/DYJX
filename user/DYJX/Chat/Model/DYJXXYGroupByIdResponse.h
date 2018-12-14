//
//	DYJXXYGroupByIdResponse.h
//
//	Create by 岩 熊 on 12/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DYJXXYResult.h"

@interface DYJXXYGroupByIdResponse : NSObject

@property (nonatomic, strong) NSString * ClientId;
@property (nonatomic, strong) NSArray * DebugMessages;
@property (nonatomic, assign) BOOL Kicked;
@property (nonatomic, strong) NSString * MemberID;
@property (nonatomic, strong) NSString * Message;
@property (nonatomic, strong) DYJXXYResult * Result;
@property (nonatomic, assign) BOOL Succeed;
@property (nonatomic, strong) NSString * UserID;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end