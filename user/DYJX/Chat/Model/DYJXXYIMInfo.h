//
//	DYJXXYIMInfo.h
//
//	Create by 岩 熊 on 7/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DYJXXYIMInfo : NSObject

@property (nonatomic, assign) BOOL adminSay;
@property (nonatomic, assign) BOOL canNotSearch;
@property (nonatomic, strong) NSString * headImgUrl;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * images;
@property (nonatomic, strong) NSString * personBank;
@property (nonatomic, strong) NSString * personBankCardNo;
@property (nonatomic, strong) NSString * nickName;
@property (nonatomic, strong) NSString * personRemark;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
