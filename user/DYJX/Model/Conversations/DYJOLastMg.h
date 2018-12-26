//
//	DYJOLastMg.h
//
//	Create by longshiqing on 27/11/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DYJOLastMg : NSObject

@property (nonatomic, copy) NSString * Body;
@property (nonatomic, copy) NSString * ConversationId;
@property (nonatomic, copy) NSString * CreateBy;
@property (nonatomic, copy) NSString * CreateOn;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, copy) NSString * FromCertifyId;
@property (nonatomic, copy) NSString * FromId;
@property (nonatomic, copy) NSString * IdField;
@property (nonatomic, copy) NSString * ImKey;
@property (nonatomic, assign) NSInteger MessageType;
@property (nonatomic, copy) NSString * RowData;
@property (nonatomic, assign) NSInteger SendType;
@property (nonatomic, copy) NSString * Target;
@property (nonatomic, copy) NSString * TargetId;
@property (nonatomic, assign) NSInteger TargetType;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
