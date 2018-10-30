//
//  JXCityListViewController.h
//  user
//
//  Created by liu_yakai on 2017/12/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "BaseViewController.h"
#import "JXCityListModel.h"

@interface JXCityListViewController : BaseViewController
@property(nonatomic,copy)void (^ SelectCity)(JXCommunityListModel *model);
@property(nonatomic,strong)JXCityListModel *cityListModel;
//@property(nonatomic,strong)NSArray *dataArray;
@end
