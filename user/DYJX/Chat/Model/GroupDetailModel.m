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
#import "TitleAndContentCell.h"
#import "SpaceCell.h"
#import "BusinessLicenceCell.h"
#import "ImageUploadCell.h"
#import "TipsCell.h"

@implementation GroupDetailModel

-(instancetype)initWithId:(NSString *)cellId height:(CGFloat)height iconName:(NSString*)iconName placeHolder:(NSString*)placeHolder cell:(UITableViewCell *)cell {
    if (self = [super initWithId:cellId height:height iconName:iconName placeHolder:(NSString*)placeHolder cell:cell]) {
        self.cellId = cellId;
        self.height = height;
        self.cell = cell;
        self.iconName = iconName;
        self.placeHolder = placeHolder;
    }
    return self;
}


-(GroupDetailModel *)porityModel {
    OwnerImageCell *cell = [[OwnerImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kGroupDetailModelPorityCellId];
    return [[GroupDetailModel alloc] initWithId:kGroupDetailModelPorityCellId height:150 iconName:nil placeHolder:nil cell:(UITableViewCell *)cell];
}

-(GroupDetailModel *)sampleModel {
    SampleButtonTableViewCell *cell = [[SampleButtonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kGroupDetailModelSampleCellId];
    return [[GroupDetailModel alloc] initWithId:kGroupDetailModelSampleCellId height:40 iconName:nil placeHolder:nil cell:(UITableViewCell *)cell];
}

- (GroupDetailModel *)titleAndContentModelWithIconName:(NSString*)iconName placeHolder:(NSString*)placeHolder {
    TitleAndContentCell *cell = [[TitleAndContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kGroupDetailModelTitleAndContentCell];
    return [[GroupDetailModel alloc] initWithId:kGroupDetailModelTitleAndContentCell height:40 iconName:iconName placeHolder:placeHolder cell:(UITableViewCell *)cell];
}

- (GroupDetailModel *)spaceModel{
    SpaceCell *cell = [[SpaceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kGroupDetailModelSpaceCell];
    return [[GroupDetailModel alloc] initWithId:kGroupDetailModelSpaceCell height:20 iconName:nil placeHolder:nil cell:(UITableViewCell *)cell];
}

- (GroupDetailModel *)businessLicenceModel{
    BusinessLicenceCell *cell = [[BusinessLicenceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kGroupDetailModelBusinessLicenceCell];
    return [[GroupDetailModel alloc] initWithId:kGroupDetailModelBusinessLicenceCell height:60 iconName:nil placeHolder:nil cell:(UITableViewCell *)cell];
}

- (GroupDetailModel *)ImageUploadModel{
    ImageUploadCell *cell = [[ImageUploadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kGroupDetailModelImageUploadCell];
    return [[GroupDetailModel alloc] initWithId:kGroupDetailModelImageUploadCell height:160 iconName:nil placeHolder:nil cell:(UITableViewCell *)cell];
}


- (GroupDetailModel *)TipsModel{
    TipsCell *cell = [[TipsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kGroupDetailModelTipsCell];
    return [[GroupDetailModel alloc] initWithId:kGroupDetailModelTipsCell height:100 iconName:nil placeHolder:nil cell:(UITableViewCell *)cell];
}

@end
