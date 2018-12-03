//
//	DYJOLastMg.h
//
//	Create by longshiqing on 27/11/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DYJOLastMg : NSObject

@property (nonatomic, strong) NSString * Body;
@property (nonatomic, strong) NSString * ConversationId;
@property (nonatomic, strong) NSString * CreateBy;
@property (nonatomic, strong) NSString * CreateOn;
@property (nonatomic, assign) BOOL Deleted;
@property (nonatomic, assign) BOOL Disabled;
@property (nonatomic, strong) NSString * FromCertifyId;
@property (nonatomic, strong) NSString * FromId;
@property (nonatomic, strong) NSString * IdField;
@property (nonatomic, strong) NSString * ImKey;
@property (nonatomic, assign) NSInteger MessageType;
@property (nonatomic, strong) NSString * RowData;
@property (nonatomic, assign) NSInteger SendType;
@property (nonatomic, strong) NSString * Target;
@property (nonatomic, strong) NSString * TargetId;
@property (nonatomic, assign) NSInteger TargetType;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end