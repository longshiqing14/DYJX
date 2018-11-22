//
//  DJCompanyChatPage.m
//  user
//
//  Created by longshiqing on 2018/11/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DJCompanyChatPage.h"
#import "ConpanyHeadView.h"

@interface DJCompanyChatPage ()

@property (nonatomic, strong)ConpanyHeadView *headView;

@end

@implementation DJCompanyChatPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"我创建或参与的公司";
    
    self.conversationListTableView.tableHeaderView = self.headView;
}

#pragma mark - Action
-(void)searchClick {

}

#pragma mark - UI
-(ConpanyHeadView *)headView {
    if (!_headView) {
        _headView = [[ConpanyHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        [_headView.searchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}
@end
