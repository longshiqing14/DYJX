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
    [self initNavigator];
    self.conversationListTableView.tableHeaderView = self.headView;
}

- (void)initNavigator{
    UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [iconImage setImageWithURL:[NSURL URLWithString:[XYUserDefaults readAppDlegateOfCurrentUserIconURL]] placeholder:[UIImage imageNamed:@"btn_group"]];
    self.navigationItem.rightBarButtonItem.width = 25;
    
    UIView *rightCustomView = [[UIView alloc] initWithFrame: iconImage.frame];
    //    [rightCustomView addGestureRecognizer:self.tapGestureRecognizer];
    [rightCustomView addSubview: iconImage];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightCustomView];
}
#pragma mark - Action
-(void)searchClick {

}
-(void)addClick {

}

#pragma mark - UI
-(ConpanyHeadView *)headView {
    if (!_headView) {
        _headView = [[ConpanyHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        [_headView.searchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
        [_headView.addButton addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}
@end
