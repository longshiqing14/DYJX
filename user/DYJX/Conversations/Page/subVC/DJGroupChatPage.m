//
//  DJGroupChatPage.m
//  user
//
//  Created by longshiqing on 2018/11/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DJGroupChatPage.h"
#import "GroupHeadView.h"

@interface DJGroupChatPage ()

@property (nonatomic, strong)GroupHeadView *headView;

@end

@implementation DJGroupChatPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"群组";

    self.conversationListTableView.tableHeaderView = self.headView;
}

#pragma mark - Action
-(void)searchClick {

}
-(void)addClick {

}
-(void)btnClick:(UIButton *)sender {
    [self.headView.innerButton setSelected:NO];
    [self.headView.outsideButton setSelected:NO];
    [sender setSelected:YES];
    if (sender.tag == 1) {

    }
    else {

    }
}

#pragma mark - UI
-(GroupHeadView *)headView {
    if (!_headView) {
        _headView = [[GroupHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 120)];
        [_headView.searchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
        [_headView.addButton addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
        [_headView.innerButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headView.outsideButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}
@end
