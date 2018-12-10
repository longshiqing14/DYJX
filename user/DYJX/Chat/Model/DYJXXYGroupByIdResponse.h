//
//	DYJXXYGroupByIdResponse.h
//
//	Create by 岩 熊 on 7/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DYJXXYResult.h"

@interface DYJXXYGroupByIdResponse : NSObject

@property (nonatomic, strong) NSString * clientId;
@property (nonatomic, strong) NSArray * debugMessages;
@property (nonatomic, assign) BOOL kicked;
@property (nonatomic, strong) NSString * memberID;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, strong) DYJXXYResult * result;
@property (nonatomic, assign) BOOL succeed;
@property (nonatomic, strong) NSString * userID;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end