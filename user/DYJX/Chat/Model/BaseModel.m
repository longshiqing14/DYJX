//
//  BaseModel.m
//  user
//
//  Created by longshiqing on 2018/11/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

-(instancetype)initWithId:(NSString *)cellId height:(CGFloat)height iconName:(NSString*)iconName placeHolder:(NSString*)placeHolder cell:(UITableViewCell *)cell {
    if (self = [super init]) {
        self.height = height;
        self.cellId = cellId;
        self.cell = cell;
        self.iconName = iconName;
        self.placeHolder = placeHolder;
    }
    return self;
}

@end
