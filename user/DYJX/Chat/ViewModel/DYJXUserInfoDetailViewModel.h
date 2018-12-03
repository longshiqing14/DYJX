//
//  DYJXUserInfoDetailViewModel.h
//  user
//
//  Created by 岩  熊 on 2018/11/30.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYJXUserInfoDetailViewModel : NSObject
@property(nonatomic, strong) NSMutableArray<NSArray<NSString*>*> *dataArray;
- (NSInteger)numberOfSection;
- (NSString *)content:(NSIndexPath *)indexPath;
- (NSInteger)numberOfCell:(NSInteger)indexPath;
@end
