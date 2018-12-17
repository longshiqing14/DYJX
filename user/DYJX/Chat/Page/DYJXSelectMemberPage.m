//
//  DYJXSelectMemberPage.m
//  user
//
//  Created by 岩  熊 on 2018/12/17.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXSelectMemberPage.h"
#import "HeadSearchView.h"

@interface DYJXSelectMemberPage ()
@property (nonatomic, strong)HeadSearchView *headView;
@end

@implementation DYJXSelectMemberPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择成员";
    [self.view addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
}


#pragma mark - UI
-(HeadSearchView *)headView {
    if (!_headView) {
        _headView = [[HeadSearchView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        [_headView.searchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
