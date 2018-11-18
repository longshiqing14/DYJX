//
//	DJJSRelation.h
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DJJSRelation : NSObject

@property (nonatomic, assign) BOOL InBlacklist;
@property (nonatomic, assign) BOOL IsAdmin;
@property (nonatomic, assign) BOOL IsContact;
@property (nonatomic, assign) BOOL IsFriend;
@property (nonatomic, assign) BOOL IsMember;
@property (nonatomic, assign) BOOL IsOwner;
@property (nonatomic, assign) BOOL IsParentAdmin;
@property (nonatomic, assign) BOOL IsParentOwner;
@property (nonatomic, assign) BOOL Managed;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end