//
//  GroupDetailModel.h
//  user
//
//  Created by longshiqing on 2018/11/19.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

static NSString *kGroupDetailModelPorityCellId = @"kGroupDetailModelPorityCellId";
static NSString *kGroupDetailModelSampleCellId = @"kGroupDetailModelSampleCellId";

@interface GroupDetailModel : BaseModel

-(GroupDetailModel *)porityModel;
-(GroupDetailModel *)sampleModel;

@end

