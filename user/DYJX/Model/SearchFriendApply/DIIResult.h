//
//	DIIResult.h
//
//	Create by longshiqing on 30/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DIIMemberFrom.h"
#import "DIIMemberTo.h"

@interface DIIResult : NSObject

@property (nonatomic, strong) NSString * ApplyContent;
@property (nonatomic, assign) NSInteger ApplyType;
@property (nonatomic, strong) NSString * CreateBy;
@property (nonatomic, strong) NSString * CreateOn;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, strong) NSString * FromBelongEnterprise;
@property (nonatomic, strong) NSString * GroupID;
@property (nonatomic, strong) NSString * Id;
@property (nonatomic, assign) BOOL IsAgree;
@property (nonatomic, assign) BOOL IsProcess;
@property (nonatomic, strong) DIIMemberFrom * MemberFrom;
@property (nonatomic, strong) NSString * MemberIDFrom;
@property (nonatomic, strong) NSString * MemberIDTo;
@property (nonatomic, strong) DIIMemberTo * MemberTo;
@property (nonatomic, strong) NSString * ToBelongEnterprise;
@property (nonatomic, strong) NSString * UpdateBy;
@property (nonatomic, strong) NSString * UpdateOn;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
