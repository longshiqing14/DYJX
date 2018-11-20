//
//  XJInfoDetailPage.h
//  user
//
//  Created by longshiqing on 2018/11/17.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseViewController.h"
#import "GropuDetailViewModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface XJInfoDetailPage : BaseViewController

@property (nonatomic, assign)XJGroupType *type;
@property (nonatomic, strong)UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
