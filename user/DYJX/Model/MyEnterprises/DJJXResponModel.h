//
//	DJJXResponModel.h
//
//	Create by longshiqing on 17/11/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DJJXResult.h"

@interface DJJXResponModel : NSObject

@property (nonatomic, copy) NSString * ClientId;
@property (nonatomic, strong) NSArray * DebugMessages;
@property (nonatomic, assign) BOOL HasNextPage;
@property (nonatomic, assign) BOOL HasPreviousPage;
@property (nonatomic, assign) BOOL Kicked;
@property (nonatomic, copy) NSString * MemberID;
@property (nonatomic, copy) NSString * Message;
@property (nonatomic, assign) NSInteger PageIndex;
@property (nonatomic, assign) NSInteger PageSize;
@property (nonatomic, strong) NSArray <DJJXResult *> * Result;
@property (nonatomic, assign) NSInteger Skip;
@property (nonatomic, assign) BOOL Succeed;
@property (nonatomic, assign) NSInteger Take;
@property (nonatomic, assign) NSInteger TotalCount;
@property (nonatomic, assign) NSInteger TotalPages;
@property (nonatomic, copy) NSString * UserID;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
