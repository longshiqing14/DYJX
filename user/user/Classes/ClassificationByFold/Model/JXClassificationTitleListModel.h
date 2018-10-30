//
//  JXClassificationTitleListModel.h
//  user
//
//  Created by 岩  熊 on 2017/12/21.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JXClassificationSecondTitleListModel;
@class JXClassificationSecondTitleItemModel;

@interface JXClassificationTitleListModel : NSObject

@property (nonatomic, copy) NSString* RETURN_CODE;
@property (nonatomic, copy) NSString* RETURN_DESC;
@property (nonatomic, copy) NSString* RETURN_STAMP;
@property (nonatomic, copy) NSArray<JXClassificationSecondTitleListModel*>* RETURN_DATA;

@end


@interface JXClassificationSecondTitleListModel : NSObject
@property (nonatomic, copy) NSString* level;
@property (nonatomic, copy) NSString* isPerMerchant;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* isBlankLink;
@property (nonatomic, copy) NSString* parentId;
@property (nonatomic, copy) NSString* isShow;
@property (nonatomic, copy) NSString* createTime;
@property (nonatomic, copy) NSString* merchantId;
@property (nonatomic, copy) NSString* pos;
@property (nonatomic, copy) NSArray<JXClassificationSecondTitleItemModel*>* children;
@property (nonatomic, copy) NSString* name;
//id -> ID
@property (nonatomic, copy) NSString* ID;
@property (nonatomic, copy) NSString* columntype;

@end

@interface JXClassificationSecondTitleItemModel : NSObject
@property (nonatomic, copy) NSString* level;
@property (nonatomic, copy) NSString* isPerMerchant;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* isBlankLink;
@property (nonatomic, copy) NSString* parentId;
@property (nonatomic, copy) NSString* isShow;
@property (nonatomic, copy) NSString* createTime;
@property (nonatomic, copy) NSString* merchantId;
@property (nonatomic, copy) NSString* pos;
@property (nonatomic, strong) NSArray<JXClassificationSecondTitleItemModel*>* children;
@property (nonatomic, copy) NSString* name;
//id -> ID
@property (nonatomic, copy) NSString* ID;
@property (nonatomic, copy) NSString* columntype;

@end


