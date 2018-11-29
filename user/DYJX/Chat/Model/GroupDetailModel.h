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
static NSString *kGroupDetailModelTitleAndContentCell = @"kGroupDetailModelTitleAndContentCell";
static NSString *kGroupDetailModelSpaceCell = @"kGroupDetailModelSpaceCell";
static NSString *kGroupDetailModelBusinessLicenceCell = @"kGroupDetailModelBusinessLicenceCell";

static NSString *kGroupDetailModelImageUploadCell = @"kGroupDetailModelImageUploadCell";
static NSString *kGroupDetailModelTipsCell = @"kGroupDetailModelTipsCell";

@interface GroupDetailModel : BaseModel
-(GroupDetailModel *)porityModel;
-(GroupDetailModel *)sampleModel;
-(GroupDetailModel *)titleAndContentModelWithIconName:(NSString*)iconName placeHolder:(NSString*)placeHolder;
-(GroupDetailModel *)spaceModel;
-(GroupDetailModel *)businessLicenceModel;
- (GroupDetailModel *)ImageUploadModel;
- (GroupDetailModel *)TipsModel;
@end

