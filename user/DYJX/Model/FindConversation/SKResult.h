//
//	SKResult.h
//
//	Create by longshiqing on 31/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "SKLastMg.h"
#import "SKLatestMsgs.h"

@interface SKResult : NSObject

@property (nonatomic, strong) NSString * CreateBy;
@property (nonatomic, strong) NSString * CreateOn;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, strong) NSString * FromHeadImg;
@property (nonatomic, strong) NSString * FromId;
@property (nonatomic, strong) NSString * FromName;
@property (nonatomic, strong) NSString * IdField;
@property (nonatomic, strong) SKLastMg * LastMsg;
@property (nonatomic, strong) NSArray * LatestMsgs;
@property (nonatomic, strong) NSString * TargetHeadImg;
@property (nonatomic, strong) NSString * TargetId;
@property (nonatomic, strong) NSString * TargetName;
@property (nonatomic, assign) NSInteger Type;
@property (nonatomic, strong) NSString * UpdateBy;
@property (nonatomic, strong) NSString * UpdateOn;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end