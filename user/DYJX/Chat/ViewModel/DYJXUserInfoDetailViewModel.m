//
//  DYJXUserInfoDetailViewModel.m
//  user
//
//  Created by 岩  熊 on 2018/11/30.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXUserInfoDetailViewModel.h"

@implementation DYJXUserInfoDetailViewModel
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
    self.dataArray = [@[@[@"个人头像和二维码",@"请输入商号",@"电话号码"],@[@"请输入用户名",@"请输入个性签名",@"请输入真实姓名",@"请选择所属省市区",@"请填写街道门牌地址信息",@"请设置GPS定位",@"请输入QQ号",@"请输入微信号",@"请输入支付宝账号"],@[@"请输入个人银行开户行",@"请输入个人银行账号",@"请输入个人银行账户名称"],@[@"添加您的名片或营业执照照片"]] mutableCopy];
}

- (NSMutableArray<NSArray<NSString*>*>*)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
@end
