//
//  XYAddAddressVC.m
//  user
//
//  Created by xingyun on 2017/9/21.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYAddAddressVC.h"
#import "XYAddressViewController.h"
#import "XYPersonalInfoTVCell.h"
#import "XYSystemLocation.h"
#import "XYAddressNet.h"
#import "XYPickView.h"
#import "XYLocationModel.h"
#import "JXAddressModel.h"
//#import "JXSelectAddressViewController.h"
#import "AddressModel.h"
#import "AddressAreaModel.h"
#import "AreaView.h"

@interface XYAddAddressVC ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,XYPickViewDelegate,XYSystemLocationDelegate,AreaSelectDelegate>{
    AreaView *areaView;
    NSInteger areaIndex;
    NSMutableArray *area_dataArray1;
    NSMutableArray *area_dataArray2;
    NSString *cityCode;
    JXAddressModel *addressModel;
    NSMutableArray *selectArray;
}
/** 定位  */
@property (nonatomic, strong) XYSystemLocation * systemLocation;
/** 表 */
@property (nonatomic, strong) UITableView * tableView;
/** 第一分区数组 */
@property(strong,nonatomic) NSMutableArray *titleDataArr ;
//@property(nonatomic,strong)JXSelectAddressViewController *selectAddressViewController;
/** 底层视图 */
@property(strong,nonatomic) UIView *footView ;
/** 确认按钮 */
@property(strong,nonatomic) UIButton *confirmBtn ;
//@property(nonatomic,strong)UIButton *addBurron;

/****************************** 输入层 *******************************/
/** 收货人输入框 */
@property(strong,nonatomic) UITextField *nameTF ;
/** 手机号码 */
@property(strong,nonatomic) UITextField *mobileTF ;
/** 城市 */
@property(strong,nonatomic) UITextField *cityTF ;
/** 城市指引图标 */
@property(strong,nonatomic) UIImageView *cityIndicatorImgV ;
@property(nonatomic,strong)NSString * locationCityString;
/** 收货地址 */
//@property(strong,nonatomic) UITextField *addressTF ;
///** 收货地址指引图标 */
//@property(strong,nonatomic) UIImageView *addressIndicatorImgV ;

/** 详细收货地址 */
@property(strong,nonatomic) UITextField *detailTF ;
/** 默认收货地址 */
@property(strong,nonatomic) UISwitch *defalutAddressSwitch ;
/** 区域数组 */
@property(strong,nonatomic) NSMutableArray<JXAddressDetailModel*> *regionArr ;
/** 区id */
@property(copy,nonatomic) NSString *regionId ;
/** 城市id*/
@property(strong,nonatomic) NSString *cityId ;

@property(nonatomic,strong)XYlatModel *xylatModel;
//@property(nonatomic,strong) XYPickView *picker;
@property (nonatomic, assign) NSInteger regionIndex;
@property (nonatomic, assign) NSInteger districtIndex;
@property(nonatomic,strong)NSMutableArray *cityArray;
@end

CG_INLINE CGRect CGRectMakes(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    CGRect rect;
    float secretNum = [[UIScreen mainScreen] bounds].size.width / 375;
    rect.origin.x = x*secretNum; rect.origin.y = y*secretNum;
    rect.size.width = width*secretNum; rect.size.height = height*secretNum;
    
    return rect;
}

static NSString *const XYPersonalInfoTVCellID = @"XYPersonalInfoTVCell";

@implementation XYAddAddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    areaIndex = 0;
    selectArray=[[NSMutableArray alloc]init];
    area_dataArray1 = [[NSMutableArray alloc]init];
    _cityArray= [[NSMutableArray alloc]init];
    self.title = _dataModel == nil ? @"新增收货地址":@"修改收货地址";
    
    [self initGui];
    
    if (self.dataArr.count == 1 && self.dataModel.address.length!=0&&_dataModel==nil) {
        [self.defalutAddressSwitch setOn:YES];
        self.defalutAddressSwitch.enabled = NO;
    }
    [self getAddress];
    [self beginLocation];
}

#pragma mark - AreaSelectDelegate
- (void)selectIndex:(NSInteger)index selectID:(NSString *)areaID
{
    areaIndex = index;
    switch (areaIndex) {
        case 1:
//            [_cityArray removeAllObjects];
            break;
//        case 2:
//            [area_dataArray3 removeAllObjects];
//            break;
        default:
            break;
    }
        [self requestAllAreaName];
}
- (void)getSelectAddressInfor:(NSString *)addressInfor ProvinceModel:(AddressAreaModel *)provinceModel CityModel:(AddressAreaModel *)cityModel
{
    if (cityModel) {
        self.regionId=cityModel.sh_id;
    }else{
        self.regionId=provinceModel.sh_id;
    }
    self.cityTF.text=addressInfor;
//    areaLabel.text = addressInfor;
}



#pragma mark - requestAllAreaName
- (void)requestAllAreaName
{
    if (!areaView) {
        areaView = [[AreaView alloc]initWithFrame:CGRectMakes(0, 0, 375, self.view.frame.size.height)];
        areaView.hidden = YES;
        areaView.address_delegate = self;
        [[UIApplication sharedApplication].keyWindow addSubview:areaView];
    }
    areaView.selectCityArray=selectArray;
//    NSString *path = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%ld",areaIndex + 1] ofType:@"plist"];
//    NSMutableDictionary *plistDic=[NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    for (JXAddressDetailModel *sh_dic in addressModel.list) {
       
//        [addressAreaModel setValuesForKeysWithDictionary:sh_dic];
        switch (areaIndex) {
            case 0:{
                 AddressAreaModel *addressAreaModel = [[AddressAreaModel alloc]init];
                addressAreaModel.sh_name=sh_dic.name;
                addressAreaModel.sh_id=sh_dic.ID;
                [area_dataArray1 addObject:addressAreaModel];
            }
                
                break;
            case 1:{
                area_dataArray2 = [[NSMutableArray alloc]init];

                for (JXAddressDetailModel *model in sh_dic.children) {
                    AddressAreaModel *addressAreaModel = [[AddressAreaModel alloc]init];
                    addressAreaModel.sh_name=model.name;
                    addressAreaModel.sh_id=model.ID;
                    [area_dataArray2 addObject:addressAreaModel];
                }
                [_cityArray addObject:area_dataArray2];
            }
                
                break;
//            case 2:
//                [area_dataArray3 addObject:addressAreaModel];
//                break;
            default:
                break;
        }
    }
    switch (areaIndex) {
        case 0:
        {
            [areaView showAreaView];
            [areaView setProvinceArray:area_dataArray1];
        }
            break;
        case 1:
            if (_cityArray.count>0) {
                [areaView setCityArray:_cityArray];
            }
            
            break;
        case 2:
            //            [areaView setRegionsArray:[NSMutableArray new]];
            break;
        default:
            break;
    }
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    if (!areaView) {
//        [self requestAllAreaName];
//    }
//    else
//        [areaView showAreaView];
//
//
//}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (_dataModel != nil) {
        for (int i = 0; i < self.regionArr.count ; i ++) {
            JXAddressDetailModel *model = self.regionArr[i];
            if (model.children.count <= 0) {
                if ([self.dataModel.districtName isEqualToString:model.name]) {
                    self.regionIndex = i;
                    [selectArray addObject:[NSNumber numberWithInt:i]];
                    return;
                }
                
            }else{
                
                for (int k = 0; k < model.children.count ; k ++ ) {
                    JXAddressDetailModel *detailModel = model.children[k];
                    NSLog(@"%@",self.dataModel.regionIdtName);
                    if ([self.dataModel.regionIdtName isEqualToString:detailModel.name]) {
                        self.districtIndex = k;
                        self.regionIndex = i;
                        self.cityTF.text = [NSString stringWithFormat:@"%@%@",model.name,detailModel.name];
                        [selectArray addObject:[NSNumber numberWithInt:i]];
                        [selectArray addObject:[NSNumber numberWithInt:k]];
                        NSLog(@"%@",selectArray);
                        return;
                    }
                }
            }
            
        }
    }
}

- (XYSystemLocation*)systemLocation
{
    if (_systemLocation == nil) {
        _systemLocation = [[XYSystemLocation alloc]init];
        _systemLocation.delegate = self;
    }
    return _systemLocation;
}

//- (XYPickView *)picker{
//    if (!_picker) {
//        _picker = [[XYPickView alloc]init];
//         _picker = [[XYPickView alloc] initPickviewWithArray:self.regionArr key:@"name" idkey:@"id" regionIndex:self.regionIndex disstrictIndex:self.districtIndex]  ;
//        _picker.delegate = self;
//    }
//    return _picker;
//}
/** 开始定位 */
- (void)beginLocation
{
    WeakSelf;
    [self.systemLocation beginUpdatingLocation];
   
    self.systemLocation.LocationLaLn = ^(XYlatModel *latModel) {
        _xylatModel = latModel;
    };
    [self.systemLocation configLocationManager];
    self.systemLocation.Location = ^(XYLocationModel *locationModel) {
        weakSelf.locationCityString = locationModel.district;
        [weakSelf getSelectID];
    };
}

/** 定位的 地址 */
- (void)locationDidEndUpdatingCoordinate:(CLLocationCoordinate2D)coordinate
{
    _xylatModel=[[XYlatModel alloc]init];
    _xylatModel.lon=coordinate.longitude;
    _xylatModel.lat=coordinate.latitude;
    
}
/** 定位的城市 */
- (void)locationDidEndUpdatingCity:(XYLocationModel *)locationModel
{
    
    self.locationCityString = locationModel.district;
    [self getSelectID];
}

-(void)getSelectID{
    for (JXAddressDetailModel *model in self.regionArr) {
//        NSLog(@"%@",dic);
        if ([self.locationCityString isEqualToString:model.name]) {
            cityCode=model.ID;
        }
    }
}

/** 定位失败 */
- (void)locationDidEndUpdatingError
{

}



-(void)setDataModel:(XYAddressListModel *)dataModel 
{
    _dataModel = dataModel;
    [selectArray addObject:_dataModel];
    self.mobileTF.text = dataModel.mobile;
    self.detailTF.text = dataModel.originAddress;
    self.cityTF.text =[NSString stringWithFormat:@"%@%@",dataModel.districtName,dataModel.regionIdtName] ;
    self.regionId = dataModel.districtId;
    self.nameTF.text = dataModel.userName;
    if ([dataModel.isDefault boolValue]) {
        [self.defalutAddressSwitch setOn:YES animated:NO];
    }else
    {
        [self.defalutAddressSwitch setOn:NO animated:NO];
    }

}

-(void)setDataArr:(NSArray *)dataArr
{
    _dataArr = dataArr;
    if (dataArr.count == 0 ) {
        [self.defalutAddressSwitch setOn:YES];
        self.defalutAddressSwitch.enabled = NO;
    }else
    {
        [self.defalutAddressSwitch setOn:NO];
        self.defalutAddressSwitch.enabled = YES;
    }
    
    
    
    
}
-(void)initGui{


    self.tableView.tableFooterView = self.footView;
    [self.footView addSubview:self.confirmBtn];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    self.footView.frame = CGRectMake(0, 0, XYScreenW, 100);
    self.confirmBtn.frame = CGRectMake(47, 35, XYScreenW -47*2, 44);
}
#pragma Mark - lazy
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.backgroundColor = XYGlobalBg;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[XYPersonalInfoTVCell class] forCellReuseIdentifier:XYPersonalInfoTVCellID];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(UIButton *)confirmBtn
{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmBtn setTitle:@"保存" forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = XYFont_14;
        [_confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_confirmBtn setBackgroundColor:BALANCEColor];
        _confirmBtn.layer.cornerRadius = 5;
        _confirmBtn.layer.masksToBounds = YES;
        [_confirmBtn addTarget:self action:@selector(confirmBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _confirmBtn;
}

-(UIView *)footView{
    
    if (!_footView) {
        _footView = [[UIView alloc] init];
    }
    return _footView;
}

-(UITextField *)nameTF
{
    if (!_nameTF) {
        _nameTF = [[UITextField alloc] init];
        _nameTF.textAlignment = NSTextAlignmentLeft;
        _nameTF.font = XYFont_14;
        _nameTF.textColor = XYFontTitleColor;
        _nameTF.placeholder = @"请输入联系人姓名";
        _nameTF.delegate = self;
        _nameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        
    }
    return _nameTF;
}
-(UITextField *)mobileTF
{
    if (!_mobileTF) {
        _mobileTF = [[UITextField alloc] init];
//        _mobileTF.textAlignment = NSTextAlignmentRight;
        _mobileTF.font = XYFont_14;
        _mobileTF.textColor = XYFontTitleColor;
        _mobileTF.keyboardType = UIKeyboardTypeNumberPad;
        _mobileTF.placeholder = @"请输入联系号码";
        _mobileTF.delegate = self;
        _mobileTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        
    }
    return _mobileTF;
}

-(UITextField *)cityTF
{
    if (!_cityTF) {
        _cityTF = [[UITextField alloc] init];
//        _cityTF.textAlignment = NSTextAlignmentRight;
        _cityTF.font = XYFont_14;
        _cityTF.textColor = XYFontTitleColor;
        _cityTF.enabled = NO;
        _cityTF.placeholder = @"请选择地区";
        
    }
    return _cityTF;
}
//-(UITextField *)addressTF
//{
//    if (!_addressTF) {
//        _addressTF = [[UITextField alloc] init];
//        _addressTF.textAlignment = NSTextAlignmentRight;
//        _addressTF.font = XYFont_14;
//        _addressTF.textColor = XYFontTitleColor;
//        _addressTF.enabled = NO;
//        _addressTF.placeholder = @"请选择您的住宅小区、单位或学校";
//        
//    }
//    return _addressTF;
//}
-(UITextField *)detailTF
{
    if (!_detailTF) {
        _detailTF = [[UITextField alloc] init];
//        _detailTF.textAlignment = NSTextAlignmentRight;
        _detailTF.font = XYFont_14;
        _detailTF.textColor = XYFontTitleColor;
        _detailTF.enabled = YES;
        _detailTF.placeholder = @"请输入详情楼号门牌号等详细信息";
        _detailTF.delegate = self;
        
    }
    return _detailTF;
}

//-(UIButton *)addBurron{
//    if (!_addBurron) {
//        _addBurron=[UIButton buttonWithType:(UIButtonTypeCustom)];
//        [_addBurron setImage:[UIImage imageNamed:@"ic_locate_select"] forState:(UIControlStateNormal)];
//
//        [_addBurron addTarget:self action:@selector(addressClock:) forControlEvents:(UIControlEventTouchUpInside)];
//
//    }
//    return _addBurron;
//}

-(void)addressClock:(id)sender{
    NSLog(@"选择地址");
    if ([cityCode isEqualToString:@""]||cityCode==nil) {
        [YDBAlertView showToast:@"当前地址不在配送范围内" dismissDelay:1.0];
        return;
    }
    XYAddressViewController *xYAddressViewController=[[XYAddressViewController alloc]initWithNibName:@"XYAddressViewController" bundle:nil ];
    xYAddressViewController.xylatModel=self.xylatModel;
    xYAddressViewController.dissViewController = ^(UIViewController *viewMv) {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    };
    xYAddressViewController.dissSelectAddress = ^(XYLocationModel *locationModel) {
        if (![cityCode isEqualToString:@""]||cityCode!=nil) {
            self.cityTF.text=self.locationCityString;
            self.detailTF.text=locationModel.address;
        }
    };
    //设置模式展示风格
    [xYAddressViewController setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    //必要配置
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    self.providesPresentationContextTransitionStyle = YES;
    self.definesPresentationContext = YES;
//        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:xYAddressViewController];
    xYAddressViewController.xylatModel=_xylatModel;
    [self.navigationController presentViewController:xYAddressViewController animated:YES completion:nil];
//    self.definesPresentationContext=YES;
//    xYAddressViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
//    [self presentViewController:nav animated:YES completion:^{
////         xYAddressViewController.view.superview.backgroundColor = [UIColor clearColor];
//    }];
    
}

-(UISwitch *)defalutAddressSwitch
{
    if (!_defalutAddressSwitch) {
        _defalutAddressSwitch = [[UISwitch alloc] init];
        [_defalutAddressSwitch setTintColor:XYRGBColor(82, 213, 105)];
        [_defalutAddressSwitch addTarget:self action:@selector(defalutAddressSwitchHandler:) forControlEvents:UIControlEventValueChanged];
        [_defalutAddressSwitch setOn:YES];
    }
    return _defalutAddressSwitch;

}

-(UIImageView *)cityIndicatorImgV
{
    if (!_cityIndicatorImgV) {
        _cityIndicatorImgV = [[UIImageView alloc] init];
        _cityIndicatorImgV.image = [UIImage imageNamed:@"order_icon_more"];
    }
    return _cityIndicatorImgV;

}

-(NSMutableArray<JXAddressDetailModel*> *)regionArr
{
    if (!_regionArr) {
        _regionArr = [NSMutableArray array];
    }
    return _regionArr;

}

//-(UIImageView *)addressIndicatorImgV
//{
//    if (!_addressIndicatorImgV) {
//        _addressIndicatorImgV = [[UIImageView alloc] init];
//        _addressIndicatorImgV.image = [UIImage imageNamed:@"order_icon_more"];
//        
//    }
//    return _addressIndicatorImgV;
//}


#pragma mark - 按钮点击事件处理层
//保存按钮
-(void)confirmBtnHandler:(id)sender{

    if (self.nameTF.text.length == 0) {
        [YDBAlertView showToast:@"收货人姓名不能为空" dismissDelay:1.0];
        return;
    }
    
    if (self.mobileTF.text.length != 11) {
        [YDBAlertView showToast:@"请输入正确的手机格式" dismissDelay:1.0];
        return;
    }
    
    if (self.cityTF.text.length == 0) {
        [YDBAlertView showToast:@"请选择地区" dismissDelay:1.0];
        
        return;
    }
    if (self.detailTF.text.length == 0) {
        [YDBAlertView showToast:@"请填写详细地址" dismissDelay:1.0];
        return;
    }
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"address"] = self.detailTF.text;
    param[@"mobile"] = self.mobileTF.text;
    param[@"regionId"] = self.regionId;
    param[@"userName"] = self.nameTF.text;
    BOOL isdefault = false;
    if (self.defalutAddressSwitch.isOn) {
        isdefault = true;
    }else
    {
        isdefault = false;
    }
    if (_dataModel!=nil) {
        param[@"addressId"] = _dataModel.addressId;
    }
    
    param[@"isDefault"] = [NSNumber numberWithBool:isdefault];
    
    WeakSelf;
    [XYAddressNet netAddAddress:param resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
        
        if (error == nil) {
            if (weakSelf.refresh) {
                weakSelf.refresh();
            }
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.navigationController popViewControllerAnimated:YES];
            });
        }
        
    }];
}


-(void)defalutAddressSwitchHandler:(UISwitch *)sender{
    

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 44.f;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }else
    {
        return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYPersonalInfoTVCell *cell = [tableView dequeueReusableCellWithIdentifier:XYPersonalInfoTVCellID forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            cell.titleLab.text = @"收货人";
            
            [cell.contentView addSubview:self.nameTF];
            [self.nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_offset(XY_Right_Margin);
                make.top.bottom.mas_offset(0);
                make.left.mas_equalTo(cell.titleLab.mas_right);
            }];
            
        }else if (indexPath.row == 1)
        {
            cell.titleLab.text = @"手机号码";
            [cell.contentView addSubview:self.mobileTF];
            [self.mobileTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_offset(XY_Right_Margin);
                make.top.bottom.mas_offset(0);
                make.left.mas_equalTo(cell.titleLab.mas_right);
            }];
            
            
        }else if (indexPath.row == 2)
        {
            cell.titleLab.text = @"所在地区";
            
            [cell.contentView addSubview:self.cityTF];
//            [cell.contentView addSubview:self.cityIndicatorImgV];
//            [self.cityIndicatorImgV mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.right.mas_equalTo(-10);
//                make.centerY.mas_equalTo(cell.contentView.mas_centerY);
//                make.width.mas_equalTo(8);
//                make.height.mas_equalTo(15);
//            }];
            [self.cityTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-40);
                make.top.bottom.mas_offset(0);
                make.left.mas_equalTo(cell.titleLab.mas_right);
            }];
//            [cell.contentView addSubview:self.addBurron];
//            [self.addBurron mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.right.bottom.top.mas_equalTo(0);
//                make.left.mas_equalTo(self.cityTF.mas_right);
//            }];
            
            
        }
//            else if (indexPath.row == 3)
//        {
//            cell.titleLab.text = @"收货地址";
//            
//            [cell.contentView addSubview:self.addressTF];
//            [cell.contentView addSubview:self.addressIndicatorImgV];
//            [self.addressIndicatorImgV mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.right.mas_equalTo(-10);
//                make.centerY.mas_equalTo(cell.contentView.mas_centerY);
//                make.width.mas_equalTo(8);
//                make.height.mas_equalTo(15);
//            }];
//            [self.addressTF mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.right.mas_equalTo(_addressIndicatorImgV.mas_left).offset(-10);
//                make.top.bottom.mas_offset(0);
//                make.left.mas_equalTo(cell.titleLab.mas_right);
//            }];
//            
//        }
        else if (indexPath.row == 3)
        {
            cell.titleLab.text = @"详细地址";
            
            [cell.contentView addSubview:self.detailTF];
            [self.detailTF
             mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_offset(XY_Right_Margin-30);
                make.top.bottom.mas_offset(0);
                make.left.mas_equalTo(cell.titleLab.mas_right);
            }];
            
            
        }
        
    }else
    {
        cell.titleLab.text = @"默认地址";
        [cell.contentView addSubview:self.defalutAddressSwitch];
        [self.defalutAddressSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(XY_Right_Margin);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
        }];
    }
   
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 2) {
//            [self showPicker];
//            [self.baseSelectAddressViewController.view bombBoxPOP:5];
            [self pushController];
            
        }
    }

}

-(void)pushController{
//    [self.selectAddressViewController setModalPresentationStyle:UIModalPresentationOverCurrentContext];
//    self.modalPresentationStyle = UIModalPresentationCurrentContext;
//    self.providesPresentationContextTransitionStyle = YES;
//    self.definesPresentationContext = YES;
//    UIViewController *viewController=self.selectAddressViewController;
//    [self.navigationController presentViewController:viewController animated:YES completion:nil];
    if (!areaView) {
        [self requestAllAreaName];
    }
    else
        [areaView showAreaView];
}


//-(JXSelectAddressViewController *)selectAddressViewController{
//    if (!_selectAddressViewController) {
//        WeakSelf; _selectAddressViewController=[[JXSelectAddressViewController alloc]initWithNibName:@"JXSelectAddressViewController" bundle:nil];
//        _selectAddressViewController.SelectAddressViewControllerClock = ^{
//            [weakSelf dismissViewControllerAnimated:YES completion:^{
//
//            }];
//        };
////        _baseSelectAddressViewController.view.frame=CGRectMake(0, 200, 400, 500);
//    }
//    return _selectAddressViewController;
//}


///显示区域选择

-(void)showPicker{

    if (self.regionArr.count != 0) {
//        [self.baseSelectAddressViewController.view bombBoxPOP];
        [self pushController];
//        [self.picker show];
    }
//    else
//    {
//        
//                XYPickView *picker = [[XYPickView alloc] initPickviewWithArray:self.regionArr key:@"name" idkey:@"id"];
//                picker.delegate = self;
//                [picker show];
//            }
    
    
    
}

-(void)getAddress{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"regionId"] = [XYUserDefaults readAppDlegateOfUser_cityOfcityid];
    WeakSelf;
    [XYAddressNet netGetCityZone:param resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
        
        if (error == nil) {
//            NSArray *arr = [blockDictionary objectForKey:@"list"];
//            for (NSDictionary *dic in arr) {
//                [weakSelf.regionArr addObject:dic];
//            }
//             [self getSelectID];
            addressModel= [JXAddressModel modelWithJSON:blockDictionary];
            weakSelf.regionArr = [addressModel.list mutableCopy];
//            [self requestAllAreaName];
//            [weakSelf.selectAddressViewController setSelectArray:[NSMutableArray arrayWithArray:model.list] SelectAddress:[NSMutableArray new]];
            [self getSelectID];
        }
       
    }];
            
}
        


-(void)toobarDonBtnHaveClick:(XYPickView *)pickView resultString:(NSString *)resultString resultIDString:(NSString *)resultIDString isHaveStreetArea:(BOOL )isHaveStreetArea
{
    self.cityTF.text = resultString;
    self.regionId = resultIDString;
     cityCode = resultIDString;
//    XYPersonalInfoTVCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:1]];
//    UIButton *button = [cell viewWithTag:10001];
//    if (isHaveStreetArea) {
//        self.addBurron.hidden = YES;
//    }else{
//        self.addBurron.hidden = NO;
//    }
    
//    for (NSDictionary *dic in self.regionArr) {
//        if ([[dic objectForKey:@"name"] isEqualToString:resultString]) {
//            self.regionId = [dic objectForKey:@"id"];
//            break;
//        }
//    }
    

}

#pragma mark - 输入框代理

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if ([string isEqualToString:@""]) {
        return YES;
    }
    
    if (textField == self.nameTF) {
        
        NSInteger num = textField.text.length +string.length;
        if (num>50) {
            [YDBAlertView showToast:@"姓名不能超过50个字符" dismissDelay:1.0];
            return NO;
        }
    }
    if (textField == self.detailTF) {
        NSInteger num = textField.text.length +string.length;
        if (num>50) {
            [YDBAlertView showToast:@"详细地址不能超过100个字符" dismissDelay:1.0];
            return NO;
        }
    }
    
    
    
    NSUInteger newLength = textField.text.length - range.length + string.length;
    if (textField == self.mobileTF) {
        if (newLength > 11) {
            return NO;
        }
    }
    
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{

}






@end
