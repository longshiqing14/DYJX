//
//  GropuDetailViewModel.m
//  user
//
//  Created by longshiqing on 2018/11/19.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "GropuDetailViewModel.h"
#import "GroupDetailModel.h"
#import "OwnerImageCell.h"
#import "SampleButtonTableViewCell.h"

@interface GropuDetailViewModel()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)XJInfoDetailPage *currentPage;
@property (nonatomic, strong)NSMutableArray <GroupDetailModel *> *dataArray;
@property (nonatomic, strong)GroupDetailModel *baseModel;

@end

@implementation GropuDetailViewModel

-(void)attachPage:(id)page {
    self.currentPage = (XJInfoDetailPage *)page;
    self.currentPage.tableView.delegate = self;
    self.currentPage.tableView.dataSource = self;
    self.currentPage.tableView.separatorStyle = UITableViewCellSelectionStyleNone;

    [self registerCell];

    [self initData];
}

-(void)initData {
    [self.dataArray removeAllObjects];

    GroupDetailModel *node = [self.baseModel porityModel];
    [self.dataArray addObject:node];

    // 按钮
    GroupDetailModel *node1 = [self.baseModel sampleModel];
    [self.dataArray addObject:node1];

    [self.currentPage.tableView reloadData];
}

-(void)registerCell {
    [self.currentPage.tableView registerClass:[OwnerImageCell class] forCellReuseIdentifier:kGroupDetailModelPorityCellId];
    [self.currentPage.tableView registerClass:[SampleButtonTableViewCell class] forCellReuseIdentifier:kGroupDetailModelSampleCellId];
}

-(void)setType:(XJGroupType *)type {
    _type = type;
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupDetailModel *model = self.dataArray[indexPath.row];
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellId];
    if (!cell) {
        cell = (BaseTableViewCell *)model.cell;
    }
//    [cell setModel:model];
    cell.callBack = ^(id data, NSInteger type) {
        [self callBack:data type:type];
    };
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupDetailModel *model = self.dataArray[indexPath.row];
    return model.height;
}

#pragma mark - Action
-(void)callBack:(id)data type:(NSInteger)type {
    switch (type) {
        case 1: // sample 点击
            NSLog(@"click");
            break;
        default:
            break;
    }
}

#pragma mark - data
-(GroupDetailModel *)baseModel {
    if (!_baseModel) {
        _baseModel = [[GroupDetailModel alloc] init];
    }
    return _baseModel;
}
-(NSMutableArray<GroupDetailModel *> *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
@end

