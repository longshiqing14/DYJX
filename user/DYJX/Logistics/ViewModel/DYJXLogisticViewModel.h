//
//  DYJXLogisticViewModel.h
//  user
//
//  Created by 岩  熊 on 2018/11/2.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYJXLogisticViewModel : NSObject
@property (nonatomic,strong) NSMutableDictionary *requestDic;
- (NSString*)itemName:(NSIndexPath*)indexpath;
- (NSInteger)numberOfSection;
- (NSInteger)numberOfCellectionItem:(NSInteger)section;
//获取用户信息
- (void)getMyAppsSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;
@end
