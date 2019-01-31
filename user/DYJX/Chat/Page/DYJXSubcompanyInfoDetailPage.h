//
//  DYJXSubcompanyInfoDetailPage.h
//  user
//
//  Created by 岩  熊 on 2018/12/10.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseViewController.h"

@interface DYJXSubcompanyInfoDetailPage : BaseViewController
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, copy)NSString *userIconImageURL;
@property (nonatomic, assign)BOOL isAdmin;
@property (nonatomic, copy) NSString *groupNumber;
@property (nonatomic, copy) NSString *targetId;
@end
