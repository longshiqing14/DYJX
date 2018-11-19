//
//	DJJLLoginResponse.h
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DJJLUAUser.h"

@interface DJJLLoginResponse : NSObject

@property (nonatomic, copy) NSString * ClientId;
@property (nonatomic, strong) NSArray * DebugMessages;
@property (nonatomic, assign) BOOL Kicked;
@property (nonatomic, copy) NSString * ObjResult;
@property (nonatomic, assign) BOOL Succeed;
@property (nonatomic, strong) DJJLUAUser * UAUser;
@property (nonatomic, copy) NSString * UserID;

#pragma mark - addbySelf
@property (nonatomic, copy)NSString *MemberID;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
