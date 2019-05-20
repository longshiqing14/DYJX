//
//  DYJXAddCompanyPageViewModel.m
//  user
//
//  Created by YP on 2019/4/26.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXAddCompanyPageViewModel.h"
#import "GroupDetailModel.h"

@implementation DYJXAddCompanyPageViewModel

- (instancetype)initWithCompanyType:(DYJXAddCompanyType)companyType {
    self = [super init];
    if (self) {
        self.companyType = companyType;
    }
    return self;
}

-(NSInteger)numberOfSections {
    return self.dataArray.count;
}

-(NSInteger)numberOfRowsInSection:(NSInteger)section {
    return self.dataArray[section].count;
}

- (void)setContentsWithGroupByIdResponse:(DYJXXYGroupByIdResponse *)response {
//    {
//        "Result": {
//            "Number": 100151,
//            "NumberString": "100151",
//            "GroupName": "测试公司1",
//            "GroupNumber": "6f3a90cd-8183-407e-9959-2d3b191aa1d3",
//            "GroupType": 1,
//            "CreatorId": "6ef0bf66-cf80-4629-bb26-ade3cd244de3",
//            "OwnerId": "6ef0bf66-cf80-4629-bb26-ade3cd244de3",
//            "IsPart": false,
//            "PartType": 0,
//            "WildType": 0,
//            "IsAllMemberGroup": false,
//            "GroupHeadImg": "5c3ccdba-ed6d-4dda-a6a4-7ef84c9898d2.jpg",
//            "GroupInfo": "测试测试",
//            "NotAllowMemberInvite": false,
//            "NotAllowJoinFree": false,
//            "NotAllowSay": false,
//            "CanNotSearch": false,
//            "SilenceUserIds": [],
//            "EnterpriseInfo": {
//                "CompanyShortName": "高大上",
//                "CompanyInfo": "测试测试",
//                "CompanyEmail": "jssjj@163.com",
//                "CompanyBankName": "建行",
//                "CompanyBank": "深圳建行",
//                "CompanyBankCardNO": "616946497",
//                "CompanyWeiXin": "694694",
//                "CompanyAlipay": "349876497964",
//                "WebSite": "www.baidu.com",
//                "CompanyLinkMan": "测试人",
//                "CompanyTel": "1359845944",
//                "CompanyLinkManCellphone": "1352864664664",
//                "CompanyLinkManQQ": "38764946",
//                "CompanyLinkManWeiXin": "64867649494",
//                "SociologyCredit": "5499764",
//                "AdminSay": true,
//                "CompanyName": "测试公司1",
//                "CanNotSearch": true,
//                "HeadImgUrl": "5c3ccdba-ed6d-4dda-a6a4-7ef84c9898d2.jpg",
//                "ProvinceId": 5,
//                "CityId": 27,
//                "DistrictId": 347,
//                "PCDName": "内蒙古自治区乌海市海南区",
//                "Address": "测试地址",
//                "Images": "[{\"Name\":\"6f68119a-3c03-455d-af36-601275752761.jpg\",\"Title\":\"执照图片1\"},{\"Name\":\"687e95cc-16bb-467e-8d9a-6bcf941118db.jpg\",\"Title\":\"执照图片2\"},{\"Name\":\"54cdeb43-8a6e-4003-b899-2a1a6e99862a.png\",\"Title\":\"执照图片3\"},{\"Name\":\"d49f84a7-ce63-42ef-8d0a-296b2e388885.png\",\"Title\":\"执照图片4\"}]",
//                "Longitude": 113.93784373998643,
//                "Latitude": 22.581711500555166,
//                "GPSAddress": "GPS位置(已定位)",
//                "Id": "00000000-0000-0000-0000-000000000000"
//            },
//            "AdminUserIds": [
//                             "6ef0bf66-cf80-4629-bb26-ade3cd244de3"],
//            "MemberIds": [
//                          "6ef0bf66-cf80-4629-bb26-ade3cd244de3"],
//            "AllMemberIds": [
//                             "6ef0bf66-cf80-4629-bb26-ade3cd244de3"],
//            "ContactRemarks": [],
//            "AdminUsers": [{
//                "Number": 1058500,
//                "NumberString": "1058500",
//                "Cellphone": "13534002814",
//                "Type": 0,
//                "UserName": "N13534002814",
//                "Business": {
//                    "IMInfo": {
//                        "AdminSay": false,
//                        "CanNotSearch": false,
//                        "ProvinceId": 0,
//                        "CityId": 0,
//                        "DistrictId": 0,
//                        "Id": "00000000-0000-0000-0000-000000000000"
//                    },
//                    "Deleted": false,
//                    "Disabled": false,
//                    "CreateOn": "0001-01-01 00:00:00",
//                    "Id": "00000000-0000-0000-0000-000000000000"
//                },
//                "RongCloudToken": "mYwsWfqF0qSyZG1J1HeJrpiB9rXdWaJpjIvWu0nuzlRsR9MyjhDGiiuEF0d5oIFFDVQfHt3zzXVN9HPpzGAlIxaylYsJuNYM0qFAYETnxthuZKKvSXjXbV+GOODnKzQlVMIgw6Kji3U=",
//                "BelongEnterprise": "00000000-0000-0000-0000-000000000000",
//                "DisplayName": "1058500",
//                "DisplayTel": "13534002814",
//                "Deleted": false,
//                "Disabled": false,
//                "CreateOn": "2019-05-07 09:49:09",
//                "CreateBy": "N13534002814",
//                "Id": "6ef0bf66-cf80-4629-bb26-ade3cd244de3"
//            }],
//            "Members": [{
//                "Number": 1058500,
//                "NumberString": "1058500",
//                "Cellphone": "13534002814",
//                "Type": 0,
//                "UserName": "N13534002814",
//                "Business": {
//                    "IMInfo": {
//                        "AdminSay": false,
//                        "CanNotSearch": false,
//                        "ProvinceId": 0,
//                        "CityId": 0,
//                        "DistrictId": 0,
//                        "Id": "00000000-0000-0000-0000-000000000000"
//                    },
//                    "Deleted": false,
//                    "Disabled": false,
//                    "CreateOn": "0001-01-01 00:00:00",
//                    "Id": "00000000-0000-0000-0000-000000000000"
//                },
//                "RongCloudToken": "mYwsWfqF0qSyZG1J1HeJrpiB9rXdWaJpjIvWu0nuzlRsR9MyjhDGiiuEF0d5oIFFDVQfHt3zzXVN9HPpzGAlIxaylYsJuNYM0qFAYETnxthuZKKvSXjXbV+GOODnKzQlVMIgw6Kji3U=",
//                "BelongEnterprise": "00000000-0000-0000-0000-000000000000",
//                "DisplayName": "1058500",
//                "DisplayTel": "13534002814",
//                "Deleted": false,
//                "Disabled": false,
//                "CreateOn": "2019-05-07 09:49:09",
//                "CreateBy": "N13534002814",
//                "Id": "6ef0bf66-cf80-4629-bb26-ade3cd244de3"
//            }],
//            "Creator": {
//                "Number": 1058500,
//                "NumberString": "1058500",
//                "Cellphone": "13534002814",
//                "Type": 0,
//                "UserName": "N13534002814",
//                "Business": {
//                    "IMInfo": {
//                        "AdminSay": false,
//                        "CanNotSearch": false,
//                        "ProvinceId": 0,
//                        "CityId": 0,
//                        "DistrictId": 0,
//                        "Id": "00000000-0000-0000-0000-000000000000"
//                    },
//                    "Deleted": false,
//                    "Disabled": false,
//                    "CreateOn": "0001-01-01 00:00:00",
//                    "Id": "00000000-0000-0000-0000-000000000000"
//                },
//                "RongCloudToken": "mYwsWfqF0qSyZG1J1HeJrpiB9rXdWaJpjIvWu0nuzlRsR9MyjhDGiiuEF0d5oIFFDVQfHt3zzXVN9HPpzGAlIxaylYsJuNYM0qFAYETnxthuZKKvSXjXbV+GOODnKzQlVMIgw6Kji3U=",
//                "BelongEnterprise": "00000000-0000-0000-0000-000000000000",
//                "DisplayName": "1058500",
//                "DisplayTel": "13534002814",
//                "Deleted": false,
//                "Disabled": false,
//                "CreateOn": "2019-05-07 09:49:09",
//                "CreateBy": "N13534002814",
//                "Id": "6ef0bf66-cf80-4629-bb26-ade3cd244de3"
//            },
//            "Owner": {
//                "Number": 1058500,
//                "NumberString": "1058500",
//                "Cellphone": "13534002814",
//                "Type": 0,
//                "UserName": "N13534002814",
//                "Business": {
//                    "IMInfo": {
//                        "AdminSay": false,
//                        "CanNotSearch": false,
//                        "ProvinceId": 0,
//                        "CityId": 0,
//                        "DistrictId": 0,
//                        "Id": "00000000-0000-0000-0000-000000000000"
//                    },
//                    "Deleted": false,
//                    "Disabled": false,
//                    "CreateOn": "0001-01-01 00:00:00",
//                    "Id": "00000000-0000-0000-0000-000000000000"
//                },
//                "RongCloudToken": "mYwsWfqF0qSyZG1J1HeJrpiB9rXdWaJpjIvWu0nuzlRsR9MyjhDGiiuEF0d5oIFFDVQfHt3zzXVN9HPpzGAlIxaylYsJuNYM0qFAYETnxthuZKKvSXjXbV+GOODnKzQlVMIgw6Kji3U=",
//                "BelongEnterprise": "00000000-0000-0000-0000-000000000000",
//                "DisplayName": "1058500",
//                "DisplayTel": "13534002814",
//                "Deleted": false,
//                "Disabled": false,
//                "CreateOn": "2019-05-07 09:49:09",
//                "CreateBy": "N13534002814",
//                "Id": "6ef0bf66-cf80-4629-bb26-ade3cd244de3"
//            },
//            "Children": [],
//            "Relation": {
//                "IsFriend": false,
//                "IsContact": false,
//                "InBlacklist": false,
//                "IsMember": true,
//                "IsAdmin": true,
//                "IsOwner": true,
//                "IsParentAdmin": false,
//                "IsParentOwner": false,
//                "Managed": true
//            },
//            "Deleted": false,
//            "Disabled": false,
//            "CreateOn": "2019-05-07 11:08:31",
//            "CreateBy": "6ef0bf66-cf80-4629-bb26-ade3cd244de3",
//            "Id": "6f3a90cd-8183-407e-9959-2d3b191aa1d3"
//        },
//        "Succeed": true,
//        "MemberID": "00000000-0000-0000-0000-000000000000",
//        "UserID": "00000000-0000-0000-0000-000000000000",
//        "Message": "",
//        "Kicked": false,
//        "ClientId": "00000000-0000-0000-0000-000000000000",
//        "DebugMessages": []
//    }
    self.dataArray[0][0].spareString = response.Result.EnterpriseInfo.HeadImgUrl;
    self.dataArray[0][1].text = response.Result.EnterpriseInfo.CompanyName;
    self.dataArray[0][2].text = response.Result.EnterpriseInfo.CompanyShortName;
    self.dataArray[0][3].text = response.Result.NumberString;
    if ([self.dataArray[0][4].leftViewText isEqualToString:@"公司成员："]) {
        self.dataArray[0][4].leftViewText = [NSString stringWithFormat:@"公司成员(%ld)个：",response.Result.Members.count];
    }
    if ([self.dataArray[0][4].leftViewText isEqualToString:@"公司成员："]) {
        self.dataArray[0][4].leftViewText = [NSString stringWithFormat:@"公司成员(%ld)个：",response.Result.Members.count];
    }
    if ([self.dataArray[0][5].leftViewText isEqualToString:@"子公司成员："]) {
        self.dataArray[0][5].leftViewText = [NSString stringWithFormat:@"子公司成员(%ld)个：",response.Result.Children.count];
    }
    if (self.companyType == DYJXAddCompanyType_SubDetails) {
        self.dataArray[0][5].isSelected = response.Result.EnterpriseInfo.AdminSay;
        self.dataArray[0][6].isSelected = response.Result.EnterpriseInfo.CanNotSearch;
    }else {
        self.dataArray[0][6].isSelected = response.Result.EnterpriseInfo.AdminSay;
        self.dataArray[0][7].isSelected = response.Result.EnterpriseInfo.CanNotSearch;
    }
    
    self.dataArray[1][0].text = response.Result.EnterpriseInfo.SociologyCredit;
    self.dataArray[1][1].text = response.Result.EnterpriseInfo.PCDName;
    self.dataArray[1][2].text = response.Result.EnterpriseInfo.Address;
    self.dataArray[1][3].text = response.Result.EnterpriseInfo.GPSAddress;
    self.dataArray[1][4].text = response.Result.EnterpriseInfo.CompanyTel;

    self.dataArray[2][0].text = response.Result.EnterpriseInfo.CompanyLinkMan;
    self.dataArray[2][1].text = response.Result.EnterpriseInfo.CompanyLinkManCellphone;
    self.dataArray[2][2].text = response.Result.EnterpriseInfo.CompanyLinkManQQ;
    self.dataArray[2][3].text = response.Result.EnterpriseInfo.CompanyLinkManWeiXin;
    self.dataArray[2][4].text = response.Result.EnterpriseInfo.WebSite;
    self.dataArray[2][5].text = response.Result.EnterpriseInfo.CompanyEmail;
    self.dataArray[2][6].text = response.Result.EnterpriseInfo.CompanyInfo;
    
    self.dataArray[3][0].text = response.Result.EnterpriseInfo.CompanyWeiXin;
    self.dataArray[3][1].text = response.Result.EnterpriseInfo.CompanyAlipay;
    self.dataArray[3][2].text = response.Result.EnterpriseInfo.CompanyBankCardNO;
    self.dataArray[3][3].text = response.Result.EnterpriseInfo.CompanyBankName;
    self.dataArray[3][4].text = response.Result.EnterpriseInfo.CompanyBank;
    
    [self.dataArray[4].lastObject.spareArray addObjectsFromArray: [NSArray modelArrayWithClass:[PersonZhiZhaoModel class] json:response.Result.EnterpriseInfo.Images].copy];
}

- (NSDictionary *)getUpDataParameters {
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setObject:[self getDataParameters] forKey:@"Data"];
    [parameters setObject:userModel.UserID forKey:@"CertificateId"];
    [parameters setObject:userModel.ClientId forKey:@"ClientId"];
    [parameters setObject:@"iOS" forKey:@"Device"];
    [parameters setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [parameters setObject:userModel.MemberID forKey:@"MemberID"];
    [parameters setObject:userModel.UserID forKey:@"UserID"];
    
//    {
//        "Data": {
//            "AdminUserIds": ["6ef0bf66-cf80-4629-bb26-ade3cd244de3"],
//            "EnterpriseInfo": {
//                "CompanyAlipay": "349876497964",
//                "CompanyBank": "深圳建行",
//                "CompanyBankCardNO": "616946497",
//                "CompanyBankName": "建行",
//                "CompanyEmail": "jssjj@163.com",
//                "CompanyInfo": "测试测试",
//                "CompanyLinkMan": "测试人",
//                "CompanyLinkManCellphone": "1352864664664",
//                "CompanyLinkManQQ": "38764946",
//                "CompanyLinkManWeiXin": "64867649494",
//                "CompanyShortName": "高大上",
//                "CompanyTel": "1359845944",
//                "CompanyWeiXin": "694694",
//                "SociologyCredit": "5499764",
//                "WebSite": "www.baidu.com",
//                "Address": "测试地址",
//                "AdminSay": true,
//                "CanNotSearch": true,
//                "CityId": 27,
//                "CompanyName": "测试公司1",
//                "DistrictId": 347,
//                "GPSAddress": "GPS位置(已定位)",
//                "HeadImgUrl": "5c3ccdba-ed6d-4dda-a6a4-7ef84c9898d2.jpg",
//                "Images": "[{\"Name\":\"6f68119a-3c03-455d-af36-601275752761.jpg\",\"Title\":\"执照图片1\"},{\"Name\":\"687e95cc-16bb-467e-8d9a-6bcf941118db.jpg\",\"Title\":\"执照图片2\"},{\"Name\":\"54cdeb43-8a6e-4003-b899-2a1a6e99862a.png\",\"Title\":\"执照图片3\"},{\"Name\":\"d49f84a7-ce63-42ef-8d0a-296b2e388885.png\",\"Title\":\"执照图片4\"}]",
//                "Latitude": 22.581711500555166,
//                "Longitude": 113.93784373998643,
//                "PCDName": "内蒙古自治区乌海市海南区",
//                "ProvinceId": 5
//            },
//            "GroupHeadImg": "5c3ccdba-ed6d-4dda-a6a4-7ef84c9898d2.jpg",
//            "GroupInfo": "测试测试",
//            "GroupName": "测试公司1",
//            "GroupNumber": "6487549",
//            "GroupType": 1,
//            "MemberIds": ["6ef0bf66-cf80-4629-bb26-ade3cd244de3"],
//            "SilenceUserIds": [],
//            "showChild": false,
//            "header": "",
//            "isHeader": false
//        },
//        "CertificateId": "6ef0bf66-cf80-4629-bb26-ade3cd244de3",
//        "ClientId": "64c2e728-672c-4ab3-aeb3-8b430dd9ef03",
//        "Device": "Android",
//        "DeviceToken": "mYwsWfqF0qSyZG1J1HeJrpiB9rXdWaJpjIvWu0nuzlRsR9MyjhDGiiuEF0d5oIFFDVQfHt3zzXVN9HPpzGAlIxaylYsJuNYM0qFAYETnxthuZKKvSXjXbV+GOODnKzQlVMIgw6Kji3U=",
//        "MemberID": "00000000-0000-0000-0000-000000000000",
//        "UserID": "6ef0bf66-cf80-4629-bb26-ade3cd244de3"
//    }
    return parameters.copy;
}

- (NSDictionary *)getDataParameters {
    NSMutableDictionary *parameters = @{}.mutableCopy;
    if (self.companyType == DYJXAddCompanyType_Details) {
        self.result.EnterpriseInfo = [DYJXXYEnterpriseInfo modelWithDictionary:[self getEnterpriseInfoParameters]];
       [parameters addEntriesFromDictionary: [self.result mj_keyValues]];
        if ([[parameters allKeys] containsObject:@"Children"]) {
            [parameters removeObjectForKey:@"Children"];
        }
    }else {
        [parameters setObject:((self.result.AdminUserIds != nil) ? self.result.AdminUserIds.copy : @[self.requestDic[@"CertificateId"]].copy) forKey:@"AdminUserIds"];
        [parameters setObject:[self getEnterpriseInfoParameters] forKey:@"EnterpriseInfo"];
        [parameters setObject:@"" forKey:@"GroupInfo"];
        
        [parameters setObject:self.result.GroupName? self.result.GroupName : @"" forKey:@"GroupName"];
        [parameters setObject:self.result.GroupNumber? self.result.GroupNumber : @"" forKey:@"GroupNumber"];
        [parameters setObject:@(self.result.GroupType ? self.result.GroupType : 1) forKey:@"GroupType"];
        [parameters setObject:self.result.MemberIds ? @[self.result.MemberIds.firstObject] : @"" forKey:@"MemberIds"];
        [parameters setObject:self.result.SilenceUserIds ? self.result.SilenceUserIds : @[] forKey:@"SilenceUserIds"];
        [parameters setObject:@(false) forKey:@"showChild"];
        [parameters setObject:self.dataArray.firstObject.firstObject.spareString ?: @"" forKey:@"header"];
        [parameters setObject:@(false) forKey:@"isHeader"];
        if (self.companyType == DYJXAddCompanyType_Sub ||
            self.companyType == DYJXAddCompanyType_SubDetails) {
            [parameters setObject:@(self.result.IsPart) forKey:@"IsPart"];
            [parameters setObject:self.result.GroupNumber ?: @"" forKey:@"ParentEnterpriseId"];
            [parameters setObject:@(self.result.PartType) forKey:@"PartType"];
        }
    }
    
    return parameters.copy;
}

- (NSMutableDictionary *)getEnterpriseInfoParameters {
    NSMutableDictionary *parameters = @{}.mutableCopy;
    [parameters setObject:self.dataArray[0][0].spareString ?: @"" forKey:@"GroupHeadImg"];
    [parameters setObject:self.dataArray[0][0].spareString ?: @"" forKey:@"HeadImgUrl"];
    [parameters setObject:self.dataArray[0][1].text ?: @"" forKey:@"CompanyName"];
    [parameters setObject:self.dataArray[0][2].text ?: @""  forKey:@"CompanyShortName"];
    [parameters setObject:self.dataArray[0][3].text ?: @"" forKey:@"NumberString"];
    
    [parameters setObject:@(self.dataArray[0][5].isSelected) forKey:@"AdminSay"];
    [parameters setObject:@(self.dataArray[0].lastObject.isSelected) forKey:@"CanNotSearch"];
    
    [parameters setObject:self.dataArray[1][0].text ?: @"" forKey:@"SociologyCredit"];
    [parameters setObject:self.dataArray[1][1].text ?: @"" forKey:@"PCDName"];
    [parameters setObject:self.dataArray[1][2].text ?: @"" forKey:@"Address"];
    [parameters setObject:self.dataArray[1][3].text ?: @"" forKey:@"GPSAddress"];
    [parameters setObject:self.dataArray[1].lastObject.text ?: @"" forKey:@"CompanyTel"];
    
    [parameters setObject:self.dataArray[2][0].text ?: @"" forKey:@"CompanyLinkMan"];
    [parameters setObject:self.dataArray[2][1].text ?: @"" forKey:@"CompanyLinkManCellphone"];
    [parameters setObject:self.dataArray[2][2].text ?: @"" forKey:@"CompanyLinkManQQ"];
    [parameters setObject:self.dataArray[2][3].text ?: @"" forKey:@"CompanyLinkManWeiXin"];
    [parameters setObject:self.dataArray[2][4].text ?: @"" forKey:@"WebSite"];
    [parameters setObject:self.dataArray[2][5].text ?: @"" forKey:@"CompanyEmail"];
    [parameters setObject:self.dataArray[2][6].text ?: @"" forKey:@"CompanyInfo"];
    
    [parameters setObject:self.dataArray[3][0].text ?: @"" forKey:@"CompanyWeiXin"];
    [parameters setObject:self.dataArray[3][1].text ?: @"" forKey:@"CompanyAlipay"];
    [parameters setObject:self.dataArray[3][2].text ?: @"" forKey:@"CompanyBankCardNO"];
    [parameters setObject:self.dataArray[3][3].text ?: @"" forKey:@"CompanyBankName"];
    [parameters setObject:self.dataArray[3][4].text ?: @"" forKey:@"CompanyBank"];
    
    if (![YWDTools isNil:self.Latitude]) {
        [parameters setObject:@([self.Latitude floatValue]) forKey:@"Latitude"];
    }
    if (![YWDTools isNil:self.Longitude]) {
        [parameters setObject:@([self.Longitude floatValue]) forKey:@"CityId"];
    }
    if (![YWDTools isNil:self.CityId]) {
        [parameters setObject:@([self.CityId integerValue]) forKey:@"CityId"];
    }
    if (![YWDTools isNil:self.DistrictId]) {
        [parameters setObject:@([self.DistrictId integerValue]) forKey:@"DistrictId"];
    }
    if (![YWDTools isNil:self.ProvinceId]) {
        [parameters setObject:@([self.ProvinceId integerValue]) forKey:@"ProvinceId"];
    }
    
    [parameters setObject:[PersonZhiZhaoModel  mj_keyValuesArrayWithObjectArray:(self.dataArray.lastObject.lastObject.spareArray ?: @[])] forKey:@"Images"];
    return parameters.copy;
}

// 上传执业照片
- (void)uploadFileWithImages:(NSArray<UIImage *> *)images success:(void(^)(NSString  *responseObject))success failed:(void(^)(NSString *errorMsg))fail {
    NSMutableArray *imagePaths = [[NSMutableArray alloc]init];
    WeakSelf
    [images enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self uploadFile:obj Success:^(id  _Nullable responseObject) {
            [imagePaths addObject:responseObject[@"SavedFileName"]];
            if (idx == images.count - 1) {
                weakSelf.dataArray.lastObject.lastObject.spareString = [imagePaths.copy mj_JSONString];
                !success ?: success([imagePaths.copy mj_JSONString]);
            }
        } failed:^(NSString * _Nonnull errorMsg) {
            !fail ?: fail(errorMsg);
            *stop = YES;
        }];
    }];
}

//获取公司信息
- (void)getGroupInfoWithGroupId:(NSString*)groupId Success:(void(^)(DYJXXYGroupByIdResponse*))success failed:(void(^)(NSString *errorMsg))fail{
    WeakSelf;
    [SVProgressHUD show];
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    [reqDict setObject:groupId forKey:@"Data"];
    [reqDict setObject:userModel.UserID forKey:@"UserID"];
    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
    [reqDict setObject:userModel.ObjResult forKey:@"DeviceToken"];
//    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
//    [reqDict setObject:groupId forKey:@"Data"];
//    [reqDict setObject:userModel.UserID forKey:@"UserID"];
//    [reqDict setObject:@"iOS" forKey:@"Device"];
//    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
//    [reqDict setObject:userModel.ObjResult forKey:@"DeviceToken"];
//        [reqDict setObject:userModel.CertificateId forKey:@"CertificateId"];
//    [reqDict setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"MemberID"];
    
    [XYNetWorking XYPOST:kDYJXAPI_user_GetGroupById params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                DYJXXYGroupByIdResponse *groupByIdModel = [DYJXXYGroupByIdResponse modelWithJSON:responseObject];
                //TODO: 数据请求成功数据重组到数组中
                weakSelf.response = groupByIdModel;
                weakSelf.result = groupByIdModel.Result;
                [weakSelf setContentsWithGroupByIdResponse:groupByIdModel];
                success(groupByIdModel);
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:@"Message"] dismissDelay:1.0];
            }
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

//删除公司
- (void)deleteGroupWithGroupId:(NSString*)groupId Success:(void(^)(DYJXXYGroupByIdResponse*))success failed:(void(^)(NSString *errorMsg))fail{
    WeakSelf;
    [SVProgressHUD show];
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    [reqDict setObject:groupId forKey:@"Data"];
    [reqDict setObject:userModel.UserID forKey:@"UserID"];
    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
    [reqDict setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [reqDict setObject:userModel.UserID forKey:@"CertificateId"];
    [reqDict setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"MemberID"];
    
    [XYNetWorking XYPOST:kDYJXAPI_user_DeleteGroup params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                [YDBAlertView showToast:@"删除公司成功！" dismissDelay:1.0];
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:@"Message"] dismissDelay:1.0];
            }
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

//退出公司
- (void)QuitGroupWithGroupId:(NSString*)groupId Success:(void(^)(DYJXXYGroupByIdResponse*))success failed:(void(^)(NSString *errorMsg))fail{
    WeakSelf;
    [SVProgressHUD show];
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    [reqDict setObject:groupId forKey:@"Data"];
    [reqDict setObject:userModel.UserID forKey:@"UserID"];
    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
    [reqDict setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [reqDict setObject:userModel.UserID forKey:@"CertificateId"];
    [reqDict setObject:@"00000000-0000-0000-0000-000000000000" forKey:@"MemberID"];
    
    [XYNetWorking XYPOST:kDYJXAPI_user_QuitGroup2 params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                [YDBAlertView showToast:@"退出公司成功！" dismissDelay:1.0];
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:@"Message"] dismissDelay:1.0];
            }
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

-(NSMutableArray<NSMutableArray<LPXNewCustomerCellModel *> *> *)dataArray {
    if (!_dataArray) {
        NSString *path;
        _dataArray = [[NSMutableArray alloc]init];
        if (self.companyType == DYJXAddCompanyType_Sub ||
            self.companyType == DYJXAddCompanyType_SubDetails) {
            path = [[NSBundle mainBundle] pathForResource:@"DYJXAddSubCompany.json" ofType:nil];
        }else {
            path = [[NSBundle mainBundle] pathForResource:@"DYJXAddCompany.json" ofType:nil];
        }
        if (path) {
            NSData *data = [[NSData alloc]initWithContentsOfFile:path];
            NSError *error;
            id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:&error];
            [_dataArray addObjectsFromArray: [LPXNewCustomerCellModel mj_objectArrayWithKeyValuesArray:(NSArray *)jsonObject]];
            if (self.companyType == DYJXAddCompanyType_Details ||
                self.companyType == DYJXAddCompanyType_SubDetails) {
                _dataArray.firstObject.firstObject.cellIdentity = kGroupDetailModelPorityCellId;
                if (self.companyType == DYJXAddCompanyType_Details) {
                    [_dataArray.firstObject insertObject:[self addSubCompany] atIndex:5];
                }
            }
        }else {
            NSLog(@"josn文件不存在");
        }
    }
    return _dataArray;
}

//上传图片
- (void)uploadFile:(UIImage*)image Success:(void(^)(id  _Nullable responseObject))success failed:(void(^)(NSString *errorMsg))fail{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         nil];
    manager.requestSerializer= [AFHTTPRequestSerializer serializer];
    manager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    [manager POST:[BEST_URL stringByAppendingString:kDYJXAPI_user_UploadFile] parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSData *data = UIImageJPEGRepresentation(image, 0.2);
        //上传的参数(上传图片，以文件流的格式)
        // 设置时间格式
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyyMMddHHmmss"];
        NSString *dateString = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString  stringWithFormat:@"%@.png", dateString];
        [formData appendPartWithFileData:data
                                    name:@"file"
                                fileName:fileName
                                mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"上传进度：%f",1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        !success ?: success(responseObject);
        NSLog(@"上传成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"上传失败%@",error);
    }];
}

// 提交用户数据
- (void)uploadCompanySuccess:(void (^)(DYJXXYGroupByIdResponse *))success failed:(void (^)(NSString *))fail {
    WeakSelf
    [XYNetWorking XYPOST:kDYJXAPI_user_EditGroup2 params:[self getUpDataParameters] success:^(NSURLSessionDataTask *task, id responseObject) {
        [SVProgressHUD dismiss];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                NSString *message = @"添加公司成功！";
                if (weakSelf.companyType == DYJXAddCompanyType_Sub) {
                    message = @"添加子公司成功！";
                }else if (weakSelf.companyType == DYJXAddCompanyType_Details) {
                    message = @"公司详情修改成功！";
                }else if (weakSelf.companyType == DYJXAddCompanyType_SubDetails) {
                    message = @"子公司详情修改成功！";
                }
                [YDBAlertView showToast:message dismissDelay:1.0];
                !success ?: success(responseObject);
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:@"Message"] dismissDelay:1.0];
            }
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

//（子）公司所属省市
- (void)getProvincesWithSuccess:(void (^)(DYJXAddressModel * _Nonnull))success failed:(void (^)(NSString * _Nonnull))fail {
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    if ([self.requestDic allKeys].count == 0) {
        DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
        [reqDict setObject:@"iOS" forKey:@"Device"];
        [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
        [reqDict setObject:userModel.UserID forKey:@"CertificateId"];
        [reqDict setObject:userModel.MemberID forKey:@"MemberID"];
        [reqDict setObject:userModel.UserID forKey:@"UserID"];
    }else {
        [reqDict setObject:self.requestDic[@"Device"] forKey:@"Device"];
        [reqDict setObject:self.requestDic[@"ClientId"] forKey:@"ClientId"];
        [reqDict setObject:self.requestDic[@"CertificateId"] forKey:@"CertificateId"];
        [reqDict setObject:self.requestDic[@"MemberID"] forKey:@"MemberID"];
        [reqDict setObject:self.requestDic[@"UserID"] forKey:@"UserID"];
    }
    
    
    [XYNetWorking XYPOST:kDYJXAPI_user_GetProvinces params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        !success ?: success([DYJXAddressModel parse:responseObject]);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        !fail ?: fail(@"连接异常");
    }];
}

- (NSMutableDictionary *)requestDic{
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
    }
    return _requestDic;
}

- (DYJXXYResult *)result {
    if (!_result) {
        _result = [[DYJXXYResult alloc]init];
    }
    return _result;
}

- (LPXNewCustomerCellModel *)addSubCompany {
    NSDictionary *params = @{
                             @"cellIdentity" : @"DYJXAddCompanyPageCell",
                             @"leftViewText" : @"子公司成员：",
                             @"placeholder" : @"",
                             @"isHiddenField" : @(true),
                             @"isShowSelectetView": @(true),
                             @"righImageName" : @"ic_category_close",
                             @"righSelectedImageName" : @"ic_category_close"
                             }.copy;
    return [LPXNewCustomerCellModel parse:params];
}

@end
