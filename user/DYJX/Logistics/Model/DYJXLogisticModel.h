//
//  DYJXLogisticModel.h
//  user
//
//  Created by 岩  熊 on 2018/11/2.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DYJXLogisticDetailModel;
@interface DYJXLogisticModel : NSObject
@property(nonatomic, strong) NSMutableArray<DYJXLogisticDetailModel*> *resultArray;
@end

@interface DYJXLogisticDetailModel : NSObject
@property(nonatomic, copy)NSString *Name;

@end
