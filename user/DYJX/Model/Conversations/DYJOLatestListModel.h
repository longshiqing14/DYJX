//
//	DYJOLatestListModel.h
//
//	Create by longshiqing on 27/11/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DYJOResult.h"

@interface DYJOLatestListModel : NSObject

@property (nonatomic, strong) NSString * ClientId;
@property (nonatomic, strong) NSArray * DebugMessages;
@property (nonatomic, assign) BOOL Kicked;
@property (nonatomic, strong) NSString * MemberID;
@property (nonatomic, strong) NSString * Message;
@property (nonatomic, strong) NSArray <DYJOResult *> * Result;
@property (nonatomic, assign) BOOL Succeed;
@property (nonatomic, strong) NSString * UserID;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
