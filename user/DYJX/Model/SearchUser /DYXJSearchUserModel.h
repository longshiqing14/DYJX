//
//	DYXJSearchUserModel.h
//
//	Create by longshiqing on 26/4/2019
//	Copyright © 2019. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DYXJResult.h"

@interface DYXJSearchUserModel : NSObject

@property (nonatomic, strong) NSString * ClientId;
@property (nonatomic, strong) NSArray * DebugMessages;
@property (nonatomic, assign) BOOL HasNextPage;
@property (nonatomic, assign) BOOL HasPreviousPage;
@property (nonatomic, assign) BOOL Kicked;
@property (nonatomic, strong) NSString * MemberID;
@property (nonatomic, assign) NSInteger PageIndex;
@property (nonatomic, assign) NSInteger PageSize;
@property (nonatomic, strong) NSArray * Result;
@property (nonatomic, assign) NSInteger Skip;
@property (nonatomic, assign) BOOL Succeed;
@property (nonatomic, assign) NSInteger Take;
@property (nonatomic, assign) NSInteger TotalCount;
@property (nonatomic, assign) NSInteger TotalPages;
@property (nonatomic, strong) NSString * UserID;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end