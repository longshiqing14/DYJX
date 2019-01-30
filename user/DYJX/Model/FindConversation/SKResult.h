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

@property (nonatomic, copy) NSString * CreateBy;
@property (nonatomic, copy) NSString * CreateOn;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, copy) NSString * FromHeadImg;
@property (nonatomic, copy) NSString * FromId;
@property (nonatomic, copy) NSString * FromName;
@property (nonatomic, copy) NSString * IdField;
@property (nonatomic, strong) SKLastMg * LastMsg;
@property (nonatomic, strong) NSArray * LatestMsgs;
@property (nonatomic, copy) NSString * TargetHeadImg;
@property (nonatomic, copy) NSString * TargetId;
@property (nonatomic, copy) NSString * TargetName;
@property (nonatomic, assign) NSInteger Type;
@property (nonatomic, copy) NSString * UpdateBy;
@property (nonatomic, copy) NSString * UpdateOn;
@property (nonatomic, copy) NSString * Id;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
