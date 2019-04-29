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
@property (nonatomic, copy) NSString *provinceName;
@property (nonatomic, copy) NSString *cityName;
@property (nonatomic, copy) NSString *districtName;
@end
//ProvinceName

@implementation DYJXCompanyAddressController

-(instancetype)initWithAddressModel:(id)addressModel addressType:(DYJXCompanyAddressType)addressType provinceName:(nonnull NSString *)provinceName cityName:(nonnull NSString *)cityName{
    self = [super init];
    if (self) {
        self.addressModel = addressModel;
        self.addressType = addressType;
        self.provinceName = provinceName;
        self.cityName = cityName;
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
    if (!weakSelf.districtName) {
        [YDBAlertView showToast:@"请选择一项才能提交！" dismissDelay:1.0];
    }
    [self.navigationController.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:NSClassFromString(@"DYJXAddCompanyPageController")]) {
            [weakSelf.navigationController popToViewController:obj animated:YES];
            NSDictionary *userInfo = @{@"provinceName" : weakSelf.provinceName,
                                       @"cityName" : weakSelf.cityName,
                                       @"districtName" : ((weakSelf.districtName != nil) ? weakSelf.districtName : @"")
                                       };
            [[NSNotificationCenter defaultCenter] postNotificationName:kDYJXAPI_CompanyAddress_Notification object:nil userInfo:userInfo];
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
    }else if (self.addressType == DYJXCompanyAddressType_City){
        path = kDYJXAPI_user_GetDistricts;
    }else {
        self.districtName = model.DistrictName;
    }
    if (path) {
        [self getProvincesWithPathURL:path provinceID:model.ProvinceID success:^(DYJXAddressModel *addressModel) {
            DYJXCompanyAddressType addressType;
            NSString *provinceName;
            NSString *cityName;
            if (self.addressType == DYJXCompanyAddressType_Province) {
                addressType = DYJXCompanyAddressType_City;
                provinceName = model.ProvinceName;
            }else {
                addressType = DYJXCompanyAddressType_District;
                provinceName = weakSelf.provinceName;
                cityName = model.CityName;
            }
            DYJXCompanyAddressController *companyAddressVC = [[DYJXCompanyAddressController alloc]initWithAddressModel:addressModel addressType:(addressType) provinceName:provinceName cityName:cityName];
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
            sectionHeaderLb.text = self.provinceName;
        }else {
            sectionHeaderLb.text = self.cityName;
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

@end
