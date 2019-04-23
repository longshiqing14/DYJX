//
//  DYJXAddCompanyPageController.m
//  user
//
//  Created by YP on 2019/4/22.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXAddCompanyPageController.h"
#import "DYJXAddCompanyPageCell.h"

@interface DYJXAddCompanyPageController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<LPXNewCustomerCellModel *> *> *data;
@property (nonatomic, strong) UIView *submissionView;
@property (nonatomic, strong) UIButton *submissionBtn;

@end

@implementation DYJXAddCompanyPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self data];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DYJXAddCompany.json" ofType:nil];
    if (path) {
        NSData *data = [[NSData alloc]initWithContentsOfFile:path];
        NSError *error;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:&error];
        [self.data addObjectsFromArray: [LPXNewCustomerCellModel mj_objectArrayWithKeyValuesArray:(NSArray *)jsonObject]];
    }else {
        
    }
    NSLog(@"%@",self.data);
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data[section].count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DYJXAddCompanyPageCell *cell = [tableView dequeueReusableCellWithIdentifier:self.data[indexPath.section][indexPath.row].cellIdentity forIndexPath:indexPath];
    [cell setValue:self.data[indexPath.section][indexPath.row] forKey:@"model"];
    cell.nextBtnBlock = ^(DYJXAddCompanyPageCell * _Nonnull cell) {
        
    };
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == (self.data.count - 1)) {
        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, RCDscreenWidth, __X(100))];
        lb.textColor = [UIColor blackColor];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.font = [UIFont systemFontOfSize:__X(36)];
        lb.text = @"公司名片、相片或营业执照等";
        return lb;
    }else {
        return [UIView new];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == (self.data.count - 1)) {
        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, RCDscreenWidth - __X(50), __X(260))];
        lb.textColor = [UIColor blackColor];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.font = [UIFont systemFontOfSize:__X(26)];
        lb.text = @"用户可用商号ID、手机号进行登录；商号ID由平台在永华注册时自动分配；银行账号可使用于用户收付款，请准确填写";
        lb.numberOfLines = 0;
        return lb;
    }else {
        return [[UIView alloc]init];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return __X(100);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01f;
    }else if (section != (self.data.count - 1)) {
        return __X(40);
    }else {
      return __X(180);
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == (self.data.count - 1)) {
        return __X(260);
    }
    return 0.01f;
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor grayColor];
        [_tableView registerClass:[DYJXAddCompanyPageCell class] forCellReuseIdentifier:@"DYJXAddCompanyPageCell"];
    }
    return _tableView;
}

- (NSMutableArray<NSMutableArray<LPXNewCustomerCellModel *> *> *)data {
    if (!_data) {
        _data = [[NSMutableArray alloc]init];
    }
    return _data;
}

@end
