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
#import "TitleAndContentCell.h"
#import "SpaceCell.h"
#import "ImageUploadCell.h"
#import "BusinessLicenceCell.h"
#import "TipsCell.h"

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
    self.currentPage.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self registerCell];

    [self initData];
}

-(void)initData {
    [self.dataArray removeAllObjects];

    GroupDetailModel *node = [self.baseModel porityModel];
    [self.dataArray addObject:node];
    
    // 按钮
//    GroupDetailModel *node1 = [self.baseModel sampleModel];
//    [self.dataArray addObject:node1];
    
    
    GroupDetailModel *node2 = [self.baseModel titleAndContentModelWithIconName:@"phone" placeHolder:nil ];
    [self.dataArray addObject:node2];
    
    GroupDetailModel *node3 = [self.baseModel titleAndContentModelWithIconName:@"phone" placeHolder:@"电话号码" ];
    [self.dataArray addObject:node3];
    
    
    GroupDetailModel *node7 = [self.baseModel spaceModel];
    [self.dataArray addObject:node7];
    
    GroupDetailModel *node4 = [self.baseModel titleAndContentModelWithIconName:@"person_orange" placeHolder:@"请输入用户名" ];
    [self.dataArray addObject:node4];
    
    GroupDetailModel *node5 = [self.baseModel titleAndContentModelWithIconName:@"sign" placeHolder:@"请输入个性签名"];
    [self.dataArray addObject:node5];
    
    GroupDetailModel *node6 = [self.baseModel titleAndContentModelWithIconName:@"id" placeHolder:@"请输入真实姓名"];
    [self.dataArray addObject:node6];

    
    GroupDetailModel *node8 = [self.baseModel titleAndContentModelWithIconName:@"location_blue" placeHolder:@"请选择所属省市区"];
    [self.dataArray addObject:node8];
    
    GroupDetailModel *node9 = [self.baseModel titleAndContentModelWithIconName:@"location_blue" placeHolder:@"请填写街道门牌地址信息"];
    [self.dataArray addObject:node9];
    
    GroupDetailModel *node10 = [self.baseModel titleAndContentModelWithIconName:@"location_blue" placeHolder:@"请设置GPS定位"];
    [self.dataArray addObject:node10];
    
    GroupDetailModel *node11 = [self.baseModel titleAndContentModelWithIconName:@"share_qq" placeHolder:@"请输入QQ号"];
    [self.dataArray addObject:node11];
    
    GroupDetailModel *node12 = [self.baseModel titleAndContentModelWithIconName:@"share_weixin" placeHolder:@"请输入微信号"];
    [self.dataArray addObject:node12];
    
    GroupDetailModel *node13 = [self.baseModel titleAndContentModelWithIconName:@"alipay" placeHolder:@"请输入支付宝账号"];
    [self.dataArray addObject:node13];
    
    GroupDetailModel *node17 = [self.baseModel spaceModel];
    [self.dataArray addObject:node17];
    
    GroupDetailModel *node14 = [self.baseModel titleAndContentModelWithIconName:@"unionpay" placeHolder:@"请输入个人银行开户行"];
    [self.dataArray addObject:node14];
    
    GroupDetailModel *node15 = [self.baseModel titleAndContentModelWithIconName:@"unionpay" placeHolder:@"请输入个人银行账号"];
    [self.dataArray addObject:node15];
    
    GroupDetailModel *node16 = [self.baseModel titleAndContentModelWithIconName:@"unionpay" placeHolder:@"请输入个人银行账户名称"];
    [self.dataArray addObject:node16];
    
    GroupDetailModel *node18 = [self.baseModel businessLicenceModel];
    [self.dataArray addObject:node18];
    
    GroupDetailModel *node19 = [self.baseModel ImageUploadModel];
    [self.dataArray addObject:node19];
    
    GroupDetailModel *node20 = [self.baseModel TipsModel];
    [self.dataArray addObject:node20];
    

    [self.currentPage.tableView reloadData];
}

-(void)registerCell {
    [self.currentPage.tableView registerClass:[OwnerImageCell class] forCellReuseIdentifier:kGroupDetailModelPorityCellId];
    [self.currentPage.tableView registerClass:[SampleButtonTableViewCell class] forCellReuseIdentifier:kGroupDetailModelSampleCellId];
    [self.currentPage.tableView registerClass:[TitleAndContentCell class] forCellReuseIdentifier:kGroupDetailModelTitleAndContentCell];
    [self.currentPage.tableView registerClass:[BusinessLicenceCell class] forCellReuseIdentifier:kGroupDetailModelBusinessLicenceCell];
    [self.currentPage.tableView registerClass:[ImageUploadCell class] forCellReuseIdentifier:kGroupDetailModelImageUploadCell];
    [self.currentPage.tableView registerClass:[TipsCell class] forCellReuseIdentifier:kGroupDetailModelTipsCell];
}

-(void)setType:(XJGroupType )type {
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
    [cell setModel:model];
//    cell.callBack = ^(id data, NSInteger type) {
//        [self callBack:data type:type];
//    };
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

