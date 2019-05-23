//
//  DYJXAddGroupMemberViewModel.m
//  user
//
//  Created by YP on 2019/5/19.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXAddGroupMemberViewModel.h"

@implementation DYJXAddGroupMemberViewModel

-(NSArray<DJJXMembers *> *)getSelectEnterprises {
//    NSMutableArray<DYJXAddGroupSubMemberModel *> *selectDataArray = [[NSMutableArray alloc]init];
//    [self.selectResultArray enumerateObjectsUsingBlock:^(DYJXAddGroupMemberModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [selectDataArray addObjectsFromArray:obj.groupSubMembers];
//    }];
//    [selectDataArray addObjectsFromArray:self.selectSearchResultArray];
    NSMutableArray<DJJXMembers *> *selectDataArray = [[NSMutableArray alloc]init];
    [self.selectResultArray enumerateObjectsUsingBlock:^(NSMutableArray<DJJXMembers *> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [selectDataArray addObjectsFromArray:obj];
    }];
    [selectDataArray addObjectsFromArray:self.selectSearchResultArray];
    return selectDataArray;
}

-(NSInteger)numberOfSections {
    if (self.isSearchUser) {
        return 1;
    }else {
        return self.dataArray.count;
    }
}

-(NSInteger)numberOfRowsInSection:(NSInteger)section {
    if (self.isSearchUser) {
        return self.searchDataArray.count;
    }else {
        if (self.dataArray[section].isOpen) {
            return self.dataArray[section].groupSubMembers.count;
        }else {
            return 0;
        }
    }
}

-(void)importOrDeleteWithIndexPath:(NSIndexPath *)indexPath isSection:(BOOL)isSection isDelete:(BOOL)isDelete {
//    if (self.isSearchUser) {
//        if (isDelete) {
//            DYJXAddGroupSubMemberModel *subMdeol = self.searchDataArray[indexPath.row];
//            if ([self.selectSearchResultArray containsObject:subMdeol]) {
//                [self.selectSearchResultArray removeObject:subMdeol];
//            }
//        }else {
//            DYJXAddGroupSubMemberModel *subMdeol = self.searchDataArray[indexPath.row];
//            if (![self.selectSearchResultArray containsObject:subMdeol]) {
//                [self.selectSearchResultArray addObject:subMdeol];
//            }
//        }
//    }else {
//        if (isDelete) {
//            // 删除
//            if (isSection) {
//                // 全部删除
//                DYJXAddGroupMemberModel *model = self.dataArray[indexPath.section];
//                if ([self.selectResultArray containsObject:model]) {
//                    [self.selectResultArray removeObject:model];
//                }
//            }else {
//                DYJXAddGroupMemberModel *model = self.dataArray[indexPath.section];
//                DYJXAddGroupSubMemberModel *subMdeol = self.dataArray[indexPath.section].groupSubMembers[indexPath.row];
//                if ([self.selectResultArray containsObject:model]) {
//                    NSInteger index = [self.selectResultArray indexOfObject:model];
//                    if ([model.groupSubMembers containsObject:subMdeol]) {
//                        [self.selectResultArray[index].groupSubMembers removeObject:subMdeol];
//                    }
//                }
//            }
//        }else {
//            // 导入
//            if (isSection) {
//                // 全部导入
//                DYJXAddGroupMemberModel *model = self.dataArray[indexPath.section];
//                if (![self.selectResultArray containsObject:model]) {
//                    [self.selectResultArray addObject:model];
//                }else {
//                    [self.selectResultArray removeObject:model];
//                    [self.selectResultArray addObject:model];
//                }
//            }else {
//                DYJXAddGroupMemberModel *model = self.dataArray[indexPath.section];
//                DYJXAddGroupSubMemberModel *subMdeol = self.dataArray[indexPath.section].groupSubMembers[indexPath.row];
//                if (![self.selectResultArray containsObject:model]) {
//                    [model.groupSubMembers removeAllObjects];
//                    [self.selectResultArray addObject:model];
//                }
//                NSInteger index = [self.selectResultArray indexOfObject:model];
//                if (![self.selectResultArray[index].groupSubMembers containsObject:subMdeol]) {
//                    [self.selectResultArray[index].groupSubMembers addObject:subMdeol];
//                }
//            }
//        }
//    }
    WeakSelf
    if (self.isSearchUser) {
        if (isDelete) {
            DJJXMembers *subMdeol = self.selectSearchDataArray[indexPath.row];
            if ([self.selectSearchResultArray containsObject:subMdeol]) {
                [self.selectSearchResultArray removeObject:subMdeol];
            }
            if ([self.MemberIds containsObject:subMdeol.Id]) {
                [self.MemberIds removeObject:subMdeol.Id];
            }
        }else {
            DJJXMembers *subMdeol = self.selectSearchDataArray[indexPath.row];
            if (![self.selectSearchResultArray containsObject:subMdeol]) {
                [self.selectSearchResultArray addObject:subMdeol];
            }
            if (![self.MemberIds containsObject:subMdeol.Id]) {
                [self.MemberIds addObject:subMdeol.Id];
            }
        }
    }else {
        if (isDelete) {
            // 删除
            if (isSection) {
                // 全部删除
                NSMutableArray<DJJXMembers *> *model = self.selectDataArray[indexPath.section];
                [model enumerateObjectsUsingBlock:^(DJJXMembers * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([weakSelf.MemberIds containsObject:obj.Id]) {
                        [self.MemberIds removeObject:obj.Id];
                    }
                }];
                if ([self.selectResultArray containsObject:model]) {
                    [self.selectResultArray removeObject:model];
                }
            }else {
                NSMutableArray *model = self.selectDataArray[indexPath.section];
                DJJXMembers *subMdeol = self.selectDataArray[indexPath.section][indexPath.row];
                if ([self.selectResultArray containsObject:model]) {
                    NSInteger index = [self.selectResultArray indexOfObject:model];
                    if ([model containsObject:subMdeol]) {
                        [self.selectResultArray[index] removeObject:subMdeol];
                    }
                }
                if ([self.MemberIds containsObject:subMdeol.Id]) {
                    [self.MemberIds removeObject:subMdeol.Id];
                }
            }
        }else {
            // 导入
            if (isSection) {
                // 全部导入
                NSMutableArray<DJJXMembers *> *model = self.selectDataArray[indexPath.section];
                [model enumerateObjectsUsingBlock:^(DJJXMembers * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if (![weakSelf.MemberIds containsObject:obj.Id]) {
                        [self.MemberIds addObject:obj.Id];
                    }
                }];
                if (![self.selectResultArray containsObject:model]) {
                    [self.selectResultArray addObject:model];
                }else {
                    [self.selectResultArray removeObject:model];
                    [self.selectResultArray addObject:model];
                }
            }else {
                NSMutableArray *model = self.selectDataArray[indexPath.section];
                DJJXMembers *subMdeol = self.selectDataArray[indexPath.section][indexPath.row];
                if (![self.selectResultArray containsObject:model]) {
                    [model removeAllObjects];
                    [self.selectResultArray addObject:model];
                }
                NSInteger index = [self.selectResultArray indexOfObject:model];
                if (![self.selectResultArray[index] containsObject:subMdeol]) {
                    [self.selectResultArray[index] addObject:subMdeol];
                }
                if (![self.MemberIds containsObject:subMdeol.Id]) {
                    [self.MemberIds addObject:subMdeol.Id];
                }
            }
        }
    }
}

-(void)getSearchUserWithKeyword:(NSString *)Keyword Success:(void (^)())success failed:(void (^)(NSString * _Nonnull))fail {
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *requestDic = [[NSMutableDictionary alloc]init];
    if ([YWDTools isNil:Keyword]) {
        [requestDic setObject:@"" forKey:@"Keyword"];
    }else {
        [requestDic setObject:Keyword forKey:@"Keyword"];
    }
    [requestDic setObject:@(1) forKey:@"PageIndex"];
    [requestDic setObject:@(50) forKey:@"PageSize"];
    [requestDic setObject:userModel.UserID forKey:@"UserID"];
    [requestDic setObject:userModel.UserID forKey:@"CertificateId"];
    [requestDic setObject:@"iOS" forKey:@"Device"];
    [requestDic setObject:userModel.ClientId forKey:@"ClientId"];
    [requestDic setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [requestDic setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"MemberID"];
    WeakSelf
    [XYNetWorking XYPOST:kDYJXAPI_addGroup_SearchUser params:requestDic success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                NSLog(@"%@",responseObject);
                [weakSelf.searchResultArray addObjectsFromArray:[NSArray modelArrayWithClass:[DJJXMembers class] json:responseObject[@"Result"]]];
                [weakSelf setSearchDataArrayWithResponse:weakSelf.searchResultArray];
                [weakSelf selectSearchDataArrayWithSearchDataArray:weakSelf.searchResultArray];
                !success ?: success(responseObject);
            }else {
                [YDBAlertView showToast:[responseObject objectForKey:@"Message"] dismissDelay:1.0];
            }
        }else {
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

-(void)getMyEnterprisesWithSuccess:(void (^)(id _Nonnull))success failed:(void (^)(NSString * _Nonnull))fail {
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    [reqDict setObject:userModel.UserID forKey:@"UserID"];
    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
    [reqDict setObject:userModel.ObjResult forKey:@"DeviceToken"];
    
    [reqDict setObject:userModel.UserID forKey:@"CertificateId"];
    [reqDict setObject:userModel.MemberID forKey:@"MemberID"];
    WeakSelf
    [XYNetWorking XYPOST:kDYJXAPI_user_MyEnterprises params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                NSLog(@"%@",responseObject);
                [weakSelf.resultArray addObjectsFromArray:[NSArray modelArrayWithClass:[DYJXXYResult class] json:responseObject[@"Result"]]];
                [weakSelf setSelectDataArrayWithDataArray:weakSelf.resultArray];
                [weakSelf setDataArrayWithResponse:weakSelf.resultArray];
                !success ?: success(responseObject);
            }else {
                [YDBAlertView showToast:[responseObject objectForKey:@"Message"] dismissDelay:1.0];
            }
        }else {
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

-(BOOL)isAdmin:(DYJXXYResult *)model {
    for (int i = 0; i < model.AdminUserIds.count; i++) {
        NSString *userId = model.AdminUserIds[i];
        if ([userId isEqualToString:[UserManager shared].login.UserID]) {
            return YES;
        }
    }
    return NO;
}

- (void)setSelectDataArrayWithDataArray:(NSArray<DYJXXYResult *> *)dataArray {
    WeakSelf
    [dataArray enumerateObjectsUsingBlock:^(DYJXXYResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableArray *members = [[NSMutableArray alloc]init];
        [members addObjectsFromArray:[NSArray modelArrayWithClass:[DJJXMembers class] json:obj.Members]];
        [weakSelf.selectDataArray addObject:members];
        [obj.Children enumerateObjectsUsingBlock:^(DYJXXYResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSMutableArray *members = [[NSMutableArray alloc]init];
            [members addObjectsFromArray:[NSArray modelArrayWithClass:[DJJXMembers class] json:obj.Members]];
            [weakSelf.selectDataArray addObject:members];
        }];
    }];
}

- (void)selectSearchDataArrayWithSearchDataArray:(NSArray<DJJXMembers *> *)searchDataArray {
    [self.selectSearchDataArray addObjectsFromArray:searchDataArray.mutableCopy];
}

- (void)setDataArrayWithResponse:(NSArray<DYJXXYResult *> *)response {
    WeakSelf
    [response enumerateObjectsUsingBlock:^(DYJXXYResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [weakSelf.dataArray addObject:[weakSelf addGroupMemberWithResult:obj]];
        [obj.Children enumerateObjectsUsingBlock:^(DYJXXYResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [weakSelf.dataArray addObject:[weakSelf addGroupMemberWithResult:obj]];
        }];
    }];
}

- (DYJXAddGroupMemberModel *)addGroupMemberWithResult:(DYJXXYResult *)result {
    WeakSelf
    DYJXAddGroupMemberModel *model = [[DYJXAddGroupMemberModel alloc]init];
    model.arrowImgName = @"ic_prolist_red_down";
    model.righImageName = @"register_checkbox";
    model.righSelectionImage = @"register_checkbox_active";
    model.companyName = result.GroupName;
    model.isSelection = NO;
    model.isOpen = NO;
    model.GroupNumber = result.GroupNumber;
    NSMutableArray<DJJXMembers *> *members = [[NSMutableArray alloc]init];
    [result.Members enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DJJXMembers *member = [DJJXMembers modelWithJSON:obj];
        if (![member.Id isEqualToString:[XYUserDefaults readUserDefaultsLoginedInfoModel].UserID]) {
//            if ([weakSelf.MemberIds containsObject:member.Id] && self.selectResultArray.count == 0) {
//                [members addObject:member];
//            }
            [model.groupSubMembers addObject:[weakSelf addGroupSubMemberWithChildren:member]];
        }
    }];
//    [self.selectResultArray addObject:members];
    return model;
}

- (DYJXAddGroupSubMemberModel *)addGroupSubMemberWithChildren:(DJJXMembers *)member {
    DYJXAddGroupSubMemberModel *model = [[DYJXAddGroupSubMemberModel alloc]init];
    model.leftViewImgName = @"register_checkbox";
    model.leftViewselectionImgName = @"register_checkbox_active";
    model.iconName = member.Business.IMInfo.HeadImgUrl;
    model.groupName = member.DisplayName;
    model.isSelection = [self.MemberIds containsObject:member.Id] ? YES : NO;
    model.GroupNumber = member.Id;
    return model;
}

- (void)setSearchDataArrayWithResponse:(NSArray<DJJXMembers *> *)response {
    WeakSelf
    [response enumerateObjectsUsingBlock:^(DJJXMembers * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if ([weakSelf.MemberIds containsObject:obj.Id]) {
//            [weakSelf.selectSearchResultArray addObject:obj];
//        }
        [weakSelf.searchDataArray addObject:[weakSelf searchGroupSubMemberWithChildren:obj]];
    }];
}

- (DYJXAddGroupSubMemberModel *)searchGroupSubMemberWithChildren:(DJJXMembers *)result {
    DYJXAddGroupSubMemberModel *model = [[DYJXAddGroupSubMemberModel alloc]init];
    model.leftViewImgName = @"register_checkbox";
    model.leftViewselectionImgName = @"register_checkbox_active";
    model.iconName = @"";
    model.groupName = result.NumberString;
    model.isSelection = [self.MemberIds containsObject:result.Id] ? YES : NO;
    return model;
}


-(NSMutableArray<DYJXAddGroupMemberModel *> *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

-(NSMutableArray<DYJXXYResult *> *)resultArray {
    if (!_resultArray) {
        _resultArray = [[NSMutableArray alloc]init];
    }
    return _resultArray;
}

-(NSMutableDictionary *)requestDic {
    if (!_requestDic) {
        _requestDic = [[NSMutableDictionary alloc]init];
    }
    return _requestDic;
}

-(NSMutableArray<DYJXAddGroupSubMemberModel *> *)searchDataArray {
    if (!_searchDataArray) {
        _searchDataArray = [[NSMutableArray alloc]init];
    }
    return _searchDataArray;
}

-(NSMutableArray<DJJXMembers *> *)searchResultArray {
    if (!_searchResultArray) {
        _searchResultArray = [[NSMutableArray alloc]init];
    }
    return _searchResultArray;
}

//- (NSMutableArray<DYJXAddGroupMemberModel *> *)selectResultArray {
//    if (!_selectResultArray) {
//        _selectResultArray = [[NSMutableArray alloc]init];
//    }
//    return _selectResultArray;
//}
//
//-(NSMutableArray<DYJXAddGroupSubMemberModel *> *)selectSearchResultArray {
//    if (!_selectSearchResultArray) {
//        _selectSearchResultArray = [[NSMutableArray alloc]init];
//    }
//    return _selectSearchResultArray;
//}

- (NSMutableArray<NSMutableArray<DJJXMembers *> *> *)selectResultArray {
    if (!_selectResultArray) {
        _selectResultArray = [[NSMutableArray alloc]init];
    }
    return _selectResultArray;
}

- (NSMutableArray<DJJXMembers *> *)selectSearchResultArray {
    if (!_selectSearchResultArray) {
        _selectSearchResultArray = [[NSMutableArray alloc]init];
    }
    return _selectSearchResultArray;
}

- (NSMutableArray<NSMutableArray<DJJXMembers *> *> *)selectDataArray{
    if (!_selectDataArray) {
        _selectDataArray = [[NSMutableArray alloc]init];
    }
    return _selectDataArray;
}

- (NSMutableArray<DJJXMembers *> *)selectSearchDataArray {
    if (!_selectSearchDataArray) {
        _selectSearchDataArray = [[NSMutableArray alloc]init];
    }
    return _selectSearchDataArray;
}

-(NSMutableArray<NSString *> *)MemberIds {
    if (!_MemberIds) {
        _MemberIds = [[NSMutableArray alloc]init];
    }
    return _MemberIds;
}

@end
