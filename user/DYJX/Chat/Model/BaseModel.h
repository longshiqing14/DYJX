//
//  BaseModel.h
//  user
//
//  Created by longshiqing on 2018/11/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

@property (nonatomic, copy)NSString *cellId;
@property (nonatomic, assign)CGFloat height;
@property (nonatomic, strong)UITableViewCell *cell;

-(instancetype)initWithId:(NSString *)cellId height:(CGFloat)height cell:(UITableViewCell *)cell;

@end

