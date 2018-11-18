//
//	DJJLMember.h
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DJJLMember : NSObject

@property (nonatomic, strong) NSString * Cellphone;
@property (nonatomic, assign) BOOL CellphoneChecked;
@property (nonatomic, assign) NSInteger City;
@property (nonatomic, assign) NSInteger District;
@property (nonatomic, assign) NSInteger FailureCount;
@property (nonatomic, strong) NSString * NickName;
@property (nonatomic, strong) NSString * ParentID;
@property (nonatomic, strong) NSString * Password;
@property (nonatomic, assign) NSInteger Province;
@property (nonatomic, assign) BOOL RegisterByAdmin;
@property (nonatomic, strong) NSString * RegisterFrom;
@property (nonatomic, assign) NSInteger RegisterFromType;
@property (nonatomic, strong) NSString * UserName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end