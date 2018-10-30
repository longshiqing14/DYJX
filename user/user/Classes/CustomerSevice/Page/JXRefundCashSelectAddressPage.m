//
//  JXRefundCashSelectAddressPage.m
//  user
//
//  Created by 岩  熊 on 2018/4/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXRefundCashSelectAddressPage.h"
#import "JXRefundAddressCell.h"
#import "JXRefundSelectAddressContentCellTableViewCell.h"
#import "JXRefundFooterView.h"
#import "AreaView.h"
#import "JXAddressModel.h"
#import "XYAddressNet.h"

@interface JXRefundCashSelectAddressPage ()<UITableViewDelegate,UITableViewDataSource,AreaSelectDelegate>
@property (nonatomic, strong) UITableView *refundGoodsTab;
@property(nonatomic,strong)NSMutableArray *cityArray;
@property(strong,nonatomic) NSMutableArray<JXAddressDetailModel*> *regionArr ;
@property(nonatomic,strong)NSString * locationCityString;
/** 区id */
@property(copy,nonatomic) NSString *regionId ;
@property(copy,nonatomic) NSString *cityString ;
@property (nonatomic, assign) NSInteger regionIndex;
@property (nonatomic, assign) NSInteger districtIndex;
@property (nonatomic, strong) UITextField *detailAddressTF;
@end

CG_INLINE CGRect CGRectMakes(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    CGRect rect;
    float secretNum = [[UIScreen mainScreen] bounds].size.width / 375;
    rect.origin.x = x*secretNum; rect.origin.y = y*secretNum;
    rect.size.width = width*secretNum; rect.size.height = height*secretNum;
    
    return rect;
}

@implementation JXRefundCashSelectAddressPage
{
    AreaView *areaView;
    NSInteger areaIndex;
    NSMutableArray *area_dataArray1;
    NSMutableArray *area_dataArray2;
    NSString *cityCode;
    JXAddressModel *addressModel;
    NSMutableArray *selectArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"F1F1F1"];
    self.refundGoodsTab.backgroundColor = [UIColor colorWithHexString:@"F1F1F1"];
    self.refundGoodsTab.estimatedRowHeight = 200;
    areaIndex = 0;
    selectArray=[[NSMutableArray alloc]init];
    area_dataArray1 = [[NSMutableArray alloc]init];
    _cityArray= [[NSMutableArray alloc]init];
    self.title = @"编辑取件地址";
    [self getAddress];
    [self initSubViews];
}

-(void)getAddress{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"regionId"] = [XYUserDefaults readAppDlegateOfUser_cityOfcityid];
    WeakSelf;
    [XYAddressNet netGetCityZone:param resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
        
        if (error == nil) {
            addressModel= [JXAddressModel modelWithJSON:blockDictionary];
            weakSelf.regionArr = [addressModel.list mutableCopy];
            [self getSelectID];
        }
        
    }];
    
}

-(void)getSelectID{
    for (JXAddressDetailModel *model in self.regionArr) {
        if ([self.locationCityString isEqualToString:model.name]) {
            cityCode=model.ID;
        }
    }
}

- (void)initSubViews{
    [self.view addSubview:self.refundGoodsTab];
    [self.refundGoodsTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(12);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WeakSelf;
    UITableViewCell *cell = nil;
    switch (indexPath.row) {

        case 0:
        {
            JXRefundAddressCell *addressCell = [tableView dequeueReusableCellWithIdentifier:@"RefundAddressCell" forIndexPath:indexPath];
            addressCell.titleLb.text = @"所在地区";
            if ([YWDTools isNil:self.cityString]) {
                addressCell.subLb.text = @"请选择所在地区";
                addressCell.subLb.textColor = [UIColor colorWithHexString:@"#999999"];
            }else{
                addressCell.subLb.text = self.cityString;
                addressCell.subLb.textColor = [UIColor colorWithHexString:@"#333333"];
            }
            
            cell = addressCell;
        }
            break;
        case 1:
        {
            JXRefundSelectAddressContentCellTableViewCell *selectAddressCell = [tableView dequeueReusableCellWithIdentifier:@"RefundSelectAddressCell" forIndexPath:indexPath];
            self.detailAddressTF = selectAddressCell.detailAddressTF ;
            cell = selectAddressCell;
        }
            break;
            
        default:
            break;
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    WeakSelf;
    JXRefundFooterView *footerView = [[NSBundle mainBundle] loadNibNamed:@"JXRefundFooterView" owner:self options:nil].firstObject;
    footerView.frame = CGRectMake(0, 0, kScreenWidth, 136.);
    footerView.TipsLb.hidden = YES;
    [footerView.confirmBTN setTitle:@"保存并使用" forState:(UIControlStateNormal)];
    footerView.block = ^{
        if ([YWDTools isNil:self.cityString]) {
            [YDBAlertView showToast:@"请选择地区"];
            return ;
        }
        if ([YWDTools isNil:self.detailAddressTF.text]) {
            [YDBAlertView showToast:@"请填写详细地址"];
            return ;
        }
        if (weakSelf.block) {
            weakSelf.block([NSString stringWithFormat:@"%@%@",self.cityString,self.detailAddressTF.text]);
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
    };
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 136;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self pushController];

    }

}


-(void)pushController{
    
    if (!areaView) {
        [self requestAllAreaName];
    }
    else
        [areaView showAreaView];
}

- (void)requestAllAreaName
{
    if (!areaView) {
        areaView = [[AreaView alloc]initWithFrame:CGRectMakes(0, 0, 375, self.view.frame.size.height)];
        areaView.hidden = YES;
        areaView.address_delegate = self;
        [[UIApplication sharedApplication].keyWindow addSubview:areaView];
    }
//    areaView.selectCityArray = selectArray;
    
    for (JXAddressDetailModel *sh_dic in addressModel.list) {
        
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
    self.cityString = addressInfor;
    NSIndexPath *indexPath= [NSIndexPath indexPathForRow:0 inSection:0] ;
    [self.refundGoodsTab reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
}



- (UITableView *)refundGoodsTab{
    if (!_refundGoodsTab) {
        _refundGoodsTab = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        [_refundGoodsTab registerNib:[UINib nibWithNibName:@"JXRefundAddressCell" bundle:nil] forCellReuseIdentifier:@"RefundAddressCell"];
        [_refundGoodsTab registerNib:[UINib nibWithNibName:@"JXRefundSelectAddressContentCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"RefundSelectAddressCell"];

        
        _refundGoodsTab.delegate = self;
        _refundGoodsTab.dataSource = self;
        //        _refundGoodsTab.separatorStyle = UITableViewCellSeparatorStyleNone;
        _refundGoodsTab.separatorColor = [UIColor colorWithHexString:@"E4E4E4"];
        _refundGoodsTab.layoutMargins = UIEdgeInsetsZero;
        _refundGoodsTab.separatorInset = UIEdgeInsetsZero;
        _refundGoodsTab.preservesSuperviewLayoutMargins = NO;
        _refundGoodsTab.showsVerticalScrollIndicator = NO;
    }
    return _refundGoodsTab;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
