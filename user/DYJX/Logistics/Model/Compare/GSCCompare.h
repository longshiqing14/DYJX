//
//	GSCCompare.h
//
//	Create by longshiqing on 29/1/2019
//	Copyright © 2019. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "GSCCListCompareItem.h"

@interface GSCCompare : NSObject

@property (nonatomic, strong) NSString * ClientId;
@property (nonatomic, assign) BOOL Kicked;
@property (nonatomic, strong) NSArray * ListCompareItem;
@property (nonatomic, strong) NSString * MemberID;
@property (nonatomic, strong) NSObject * Message;
@property (nonatomic, strong) NSObject * Result;
@property (nonatomic, assign) BOOL Succeed;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end