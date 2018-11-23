//
//  DYLastestChatViewController.m
//  user
//
//  Created by longshiqing on 2018/11/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYLastestChatViewController.h"
#import "HeadSearchView.h"

@interface DYLastestChatViewController ()

@property (nonatomic, strong)HeadSearchView *headView;

@end

@implementation DYLastestChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"最近会话";

    self.conversationListTableView.tableHeaderView = self.headView;
    
   
}

#pragma mark - Action
-(void)searchClick {
    
}

#pragma mark - UI
-(HeadSearchView *)headView {
    if (!_headView) {
        _headView = [[HeadSearchView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        [_headView.searchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}

@end
