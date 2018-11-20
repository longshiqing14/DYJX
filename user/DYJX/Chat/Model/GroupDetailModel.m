//
//  GroupDetailModel.m
//  user
//
//  Created by longshiqing on 2018/11/19.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "GroupDetailModel.h"
#import "OwnerImageCell.h"
#import "SampleButtonTableViewCell.h"

@implementation GroupDetailModel

-(instancetype)initWithId:(NSString *)cellId height:(CGFloat)height cell:(UITableViewCell *)cell {
    if (self = [super initWithId:cellId height:height cell:cell]) {
        self.cellId = cellId;
        self.height = height;
        self.cell = cell;
    }
    return self;
}


-(GroupDetailModel *)porityModel {
    OwnerImageCell *cell = [[OwnerImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kGroupDetailModelPorityCellId];
    return [[GroupDetailModel alloc] initWithId:kGroupDetailModelPorityCellId height:150 cell:(UITableViewCell *)cell];
}

-(GroupDetailModel *)sampleModel {
    SampleButtonTableViewCell *cell = [[SampleButtonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kGroupDetailModelSampleCellId];
    return [[GroupDetailModel alloc] initWithId:kGroupDetailModelSampleCellId height:40 cell:(UITableViewCell *)cell];
}

@end
