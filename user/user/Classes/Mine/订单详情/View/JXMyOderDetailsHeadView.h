//
//  JXMyOderDetailsHeadView.h
//  user
//
//  Created by liu_yakai on 2018/2/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXMyOrderDetailsModel.h"

@interface JXMyOderDetailsHeadView : UIView
//状态图片
@property (weak, nonatomic) IBOutlet UIImageView *headStateImageView;
//状态名称
@property (weak, nonatomic) IBOutlet UILabel *headStateTitleLable;
-(void)headInit:(JXMyProcessStateInfoModel *)model;
@end
