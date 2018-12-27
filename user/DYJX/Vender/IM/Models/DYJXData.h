//
//	DYJXData.h
//
//	Create by longshiqing on 21/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DYJXData : NSObject

@property (nonatomic, copy) NSString * Body;
@property (nonatomic, copy) NSString * ConversationId;
@property (nonatomic, copy) NSString * CreateBy;
@property (nonatomic, assign) long long CreateOn;
@property (nonatomic, copy) NSString * DeleteBy;
@property (nonatomic, assign) long long DeleteOn;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, copy) NSString * FromCertifyId;
@property (nonatomic, copy) NSString * FromId;
@property (nonatomic, copy) NSString * IdField;
@property (nonatomic, assign) NSInteger MessageType;
@property (nonatomic, assign) NSInteger SendType;
@property (nonatomic, copy) NSString * Target;
@property (nonatomic, copy) NSString * TargetId;
@property (nonatomic, assign) NSInteger TargetType;
@property (nonatomic, copy) NSString * UpdateBy;
@property (nonatomic, assign) long long UpdateOn;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
