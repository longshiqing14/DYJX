//
//	DYJXXYRelation.h
//
//	Create by 岩 熊 on 7/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DYJXXYRelation : NSObject

@property (nonatomic, assign) BOOL inBlacklist;
@property (nonatomic, assign) BOOL isAdmin;
@property (nonatomic, assign) BOOL isContact;
@property (nonatomic, assign) BOOL isFriend;
@property (nonatomic, assign) BOOL isMember;
@property (nonatomic, assign) BOOL isOwner;
@property (nonatomic, assign) BOOL isParentAdmin;
@property (nonatomic, assign) BOOL isParentOwner;
@property (nonatomic, assign) BOOL managed;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end