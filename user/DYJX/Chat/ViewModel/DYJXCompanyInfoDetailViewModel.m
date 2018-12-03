//
//  DYJXCompanyInfoDetailViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/12/3.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXCompanyInfoDetailViewModel.h"

@implementation DYJXCompanyInfoDetailViewModel
- (instancetype)init{
    if (self = [super init]) {
        [self initData];
    }
    return self;
}

- (NSInteger)numberOfSection{
    return self.dataArray.count;
}

- (NSInteger)numberOfCell:(NSInteger)section{
    return self.dataArray[section].count;
}

- (NSString *)content:(NSIndexPath *)indexPath{
    return self.dataArray[indexPath.section][indexPath.row];
}

- (void)initData{
    self.dataArray = [@[@[@"个人头像和二维码：",@"公司名称：",@"公司简称：",@"公司商号：",@"公司成员：",@"子公司：",@"非管理员不能发言",@"不能通过搜索或扫描找到本商号"],@[@"公司统一社会信用代码：",@"公司地址：",@"公司所属街道门牌号：",@"公司GPS位置：",@"公司座机："],@[@"公司联系人：",@"公司联系人手机：",@"公司联系人QQ：",@"公司联系人微信：",@"公司网站：",@"公司邮箱：",@"公司介绍："],@[@"公司微信：",@"公司支付宝：",@"公司银行账号：",@"公司银行账号名称：",@"公司银行账号开户行："],@[@"添加您的名片或营业执照照片"]] mutableCopy];
}

- (NSMutableArray<NSArray<NSString*>*>*)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
@end
