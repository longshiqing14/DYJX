//
//  XJInfoDetailPage.m
//  user
//
//  Created by longshiqing on 2018/11/17.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "XJInfoDetailPage.h"

@interface XJInfoDetailPage ()

@property (nonatomic, strong)GropuDetailViewModel *viewModel;

@end

@implementation XJInfoDetailPage

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tableView];
    [self.viewModel attachPage:self];
}

-(void)setType:(XJGroupType *)type {
//    if (_type != type) {
        _type = type;
        self.viewModel.type = type;
    NSArray *titles = @[@"本人账户管理",@"公司账户管理",@"信息查看"];
    self.navigationItem.title = titles[(int)type];
//    }
}

#pragma mark - UI
-(GropuDetailViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[GropuDetailViewModel alloc] init];
    }
    return _viewModel;
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStylePlain];
        _tableView.delaysContentTouches = NO;
    }
    return _tableView;
}
@end

