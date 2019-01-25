//
//  JXAddressModel.h
//  user
//
//  Created by 岩  熊 on 2018/1/3.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JXAddressDetailModel;
@interface JXAddressModel : NSObject

@property (nonatomic, strong) NSArray<JXAddressDetailModel*> *list;

@end

@interface JXAddressDetailModel : NSObject

@property (nonatomic, copy) NSString *name;
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, strong) NSArray<JXAddressDetailModel*> *children;
@end


