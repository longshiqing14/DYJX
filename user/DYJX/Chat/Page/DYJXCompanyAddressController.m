//
//  DYJXCompanyAddressController.m
//  user
//
//  Created by YP on 2019/4/29.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXCompanyAddressController.h"
#import "DYJXAddressModel.h"

@interface DYJXCompanyAddressController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) DYJXCompanyAddressType addressType;
@property (nonatomic, strong) id addressModel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSString *cityName;
@property (nonatomic, assign) NSInteger districtId;
@property (nonatomic, copy) NSMutableDictionary *addressParameters;

@end
//ProvinceName

@implementation DYJXCompanyAddressController

-(instancetype)initWithAddressModel:(id)addressModel addressType:(DYJXCompanyAddressType)addressType addressParameters:(nonnull NSDictionary *)addressParameters{
    self = [super init];
    if (self) {
        self.addressModel = addressModel;
        self.addressType = addressType;
        [self.addressParameters addEntriesFromDictionary: addressParameters];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigation];
    [self tableView];
}

- (void)setNavigation {
    self.navigationItem.title = @"地址设置";
    if (self.addressType == DYJXCompanyAddressType_District) {
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:(UIBarButtonItemStylePlain) target:self action:@selector(rightItemClick:)];
        self.navigationItem.rightBarButtonItem = rightItem;
    }
}

- (void)rightItemClick:(id)item {
    WeakSelf
    if (!weakSelf.cityName) {
        [YDBAlertView showToast:@"请选择一项才能提交！" dismissDelay:1.0];
    }
    [self.navigationController.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:NSClassFromString(@"DYJXAddCompanyPageController")] ||
            [obj isKindOfClass:NSClassFromString(@"DYJXUserInfoDetailPage")]) {
            [weakSelf.navigationController popToViewController:obj animated:YES];
            [weakSelf.addressParameters setObject:((weakSelf.cityName != nil) ? weakSelf.cityName : @"") forKey:@"DistrictName"];
            [weakSelf.addressParameters setObject:@(weakSelf.districtId) forKey:@"DistrictId"];
            [[NSNotificationCenter defaultCenter] postNotificationName:kDYJXAPI_CompanyAddress_Notification object:nil userInfo:weakSelf.addressParameters];
            *stop = YES;
        }
    }];
}

//（子）公司所属省/市/区/县
- (void)getProvincesWithPathURL:(NSString *)pathURL provinceID:(NSString *)provinceID success:(void (^)(DYJXAddressModel * addressModel))success failed:(void (^)(NSString * errorMsg))fail {
    
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    [reqDict setObject:userModel.UserID forKey:@"UserID"];
    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
    [reqDict setObject:userModel.UserID forKey:@"CertificateId"];
    if ([pathURL isEqualToString:kDYJXAPI_user_GetCitys]) {
        [reqDict setObject:provinceID forKey:@"provinceID"];
    }else if ([pathURL isEqualToString:kDYJXAPI_user_GetDistricts]) {
        [reqDict setObject:provinceID forKey:@"CityID"];
    }
    
    [reqDict setObject:userModel.MemberID forKey:@"MemberID"];
    [XYNetWorking XYPOST:pathURL params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        !success ?: success([DYJXAddressModel parse:responseObject]);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        !fail ?: fail(@"连接异常");
    }];
}



#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((DYJXAddressModel *)self.addressModel).Provinces.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    DYJXProvinceAddressModel *model = ((DYJXAddressModel *)self.addressModel).Provinces[indexPath.row];
    if (self.addressType == DYJXCompanyAddressType_Province) {
        cell.textLabel.text = model.ProvinceName;
    }else if (self.addressType == DYJXCompanyAddressType_City) {
        cell.textLabel.text = model.CityName;
    }else {
        cell.textLabel.text = model.DistrictName;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WeakSelf
    DYJXProvinceAddressModel *model = ((DYJXAddressModel *)self.addressModel).Provinces[indexPath.row];
    NSString *path;
    if (self.addressType == DYJXCompanyAddressType_Province) {
        path = kDYJXAPI_user_GetCitys;
        self.cityName = model.ProvinceName;
        self.districtId = [model.ProvinceID integerValue];
    }else if (self.addressType == DYJXCompanyAddressType_City){
        path = kDYJXAPI_user_GetDistricts;
        self.cityName = model.CityName;
        self.districtId = [model.CityID integerValue];
    }else {
        self.cityName = model.DistrictName;
        self.districtId = [model.DistrictID integerValue];
    }
    if (path) {
        [self getProvincesWithPathURL:path provinceID:[@(self.districtId) stringValue] success:^(DYJXAddressModel *addressModel) {
            DYJXCompanyAddressType addressType;
            if (self.addressType == DYJXCompanyAddressType_Province) {
                addressType = DYJXCompanyAddressType_City;
                [weakSelf.addressParameters setObject:self.cityName forKey:@"ProvinceName"];
                [weakSelf.addressParameters setObject:@(self.districtId) forKey:@"ProvinceID"];
            }else {
                addressType = DYJXCompanyAddressType_District;
                [weakSelf.addressParameters setObject:self.cityName forKey:@"CityName"];
                [weakSelf.addressParameters setObject:@(self.districtId) forKey:@"CityID"];
            }
            DYJXCompanyAddressController *companyAddressVC = [[DYJXCompanyAddressController alloc]initWithAddressModel:addressModel addressType:(addressType) addressParameters:weakSelf.addressParameters.copy];
            [weakSelf.navigationController pushViewController:companyAddressVC animated:YES];
        } failed:^(NSString *errorMsg) {
            
        }];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.addressType != DYJXCompanyAddressType_Province) {
        UIView *sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, __X(100))];
        sectionHeaderView.backgroundColor = [UIColor blueColor];
        UILabel *sectionHeaderLb = [[UILabel alloc]init];
        [sectionHeaderView addSubview:sectionHeaderLb];
        [sectionHeaderLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(__X(30)));
            make.centerY.equalTo(@0);
            make.right.lessThanOrEqualTo(@(-__X(30)));
        }];
        sectionHeaderLb.textColor = [UIColor whiteColor];
        sectionHeaderLb.font = [UIFont systemFontOfSize:__X(32)];
        sectionHeaderLb.textAlignment = NSTextAlignmentLeft;
        if (self.addressType == DYJXCompanyAddressType_City) {
            sectionHeaderLb.text = self.addressParameters[@"ProvinceName"];
        }else {
            sectionHeaderLb.text = self.addressParameters[@"CityName"];
        }
        return sectionHeaderView;
    }
    return [UIView new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.addressType != DYJXCompanyAddressType_Province) {
        return __X(100);
    }
    return 0.01f;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}

-(NSMutableDictionary *)addressParameters {
    if (!_addressParameters) {
        _addressParameters = [[NSMutableDictionary alloc]init];
    }
    return _addressParameters;
}

@end
