//
//	DYJOResult.h
//
//	Create by longshiqing on 27/11/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DYJOLastMg.h"

@interface DYJOResult : NSObject

@property (nonatomic, copy) NSString * CreateBy;
@property (nonatomic, copy) NSString * CreateOn;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, copy) NSString * FromHeadImg;
@property (nonatomic, copy) NSString * FromId;
@property (nonatomic, copy) NSString * FromName;
@property (nonatomic, copy) NSString * Id;
@property (nonatomic, strong) NSDictionary * LastMsg;
@property (nonatomic, copy) NSString * TargetHeadImg;
@property (nonatomic, copy) NSString * TargetId;
@property (nonatomic, copy) NSString * TargetName;
@property (nonatomic, assign) NSInteger Type;
@property (nonatomic, copy) NSString * UpdateBy;
@property (nonatomic, copy) NSString * UpdateOn;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
