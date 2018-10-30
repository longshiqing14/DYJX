//
//  XYOrderDetailSubClassOrderDetailVC.m
//  user
//
//  Created by xingyun on 2017/9/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailSubClassOrderDetailVC.h"


#import "XYOrderDetailSubClassOrderDetailHeaderVC.h" //  头视图

#import "XYOrderDetailGoodsListTVC.h"  // 商品 列表
#import "XYOrderDetailSubClassOrderDetailPayVC.h" // 支付信息
#import "XYOrderDetailPayRecsVC.h"
#import "XYOrderDetailSubClassOrderDetailAddressVC.h" // 收货地址 信息
#import "XYOrderDetailInvoiceInfoTVC.h"  //发票信息
#import "XYOrderDetailTelephoneVC.h"    //商家电话

#import "XYTableViewFooterIntervalView.h"  //utableview footerview

#import "XYOrderDetailOrderBottonVC.h"


#import "XYOrderAllNet.h" 

#import "XYOrderDetailModel.h" // 详情 model
#import "XYPlayModel.h"
#import "XYPayOrderSuccessVC.h"
#import "JXElectronicInvoiceDetailPage.h"

#define cellHeat 30;

@interface XYOrderDetailSubClassOrderDetailVC () <UITableViewDelegate,UITableViewDataSource,XYOrderDetailOrderBottonVCDelegate>


@property (nonatomic, strong) UITableView* tableView;
@property(nonatomic,strong)NSString *typePlay;
/** 头 */
@property (nonatomic, strong) UIView * headerView;
//是否显示需支付
@property(nonatomic,strong)NSString * playTypeStr;

@property (nonatomic, strong) XYOrderDetailSubClassOrderDetailHeaderVC * detailheaderVC;
/** 商品列表 */
@property (nonatomic, strong) XYOrderDetailGoodsListTVC * goodsListTVC;
/** 详情 支付信息 */
@property (nonatomic, strong) XYOrderDetailSubClassOrderDetailPayVC * detailPayVC;
/** 详情 支付列表 */
@property (nonatomic, strong) XYOrderDetailPayRecsVC * detailPayRecsVC;
/** 详情 收货地址信息 */
@property (nonatomic, strong) XYOrderDetailSubClassOrderDetailAddressVC * detailAddressVC;
/** 详情 发票信息 */
@property (nonatomic, strong) XYOrderDetailInvoiceInfoTVC * invoiceInfoTVC;
/** 详情 商家电话信息 */
@property (nonatomic, strong) XYOrderDetailTelephoneVC * telephoneVC;

@property (nonatomic, strong) XYOrderDetailOrderBottonVC * bottomVC;

/** 详情 数据 */
@property (nonatomic, strong) XYOrderDetailModel * detailModel;

//支付方式
@property (nonatomic, strong) XYOrderDetailAndPaymentModel *paymentModel;
@end

@implementation XYOrderDetailSubClassOrderDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"订单详情";
    self.view.backgroundColor = XYGlobalBg;
    
    
    
    
    [self addViewAndLayout];
    
    [self netOrderDetailData];
    
    
    if (self.isOrderConfirmPush) {
        //得到当前视图控制器中的所有控制器
        NSArray *array = [self.navigationController.viewControllers copy];
        NSMutableArray *arrayTemp = [NSMutableArray arrayWithCapacity:0];
        [arrayTemp addObject:array.firstObject];
        [arrayTemp addObject:array.lastObject];
        [self.navigationController setViewControllers:[arrayTemp copy] animated:YES];
    }
    
    
}





- (void)addViewAndLayout
{
    WeakSelf;
    [self.view addSubview:self.tableView];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(weakSelf.mas_bottomLayoutGuide).offset(-50);
    }];
    
    [self.view addSubview:self.bottomVC.view];
    [self.bottomVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(weakSelf.mas_bottomLayoutGuide);
        make.height.mas_equalTo(50);
    }];
}


#pragma mark - 懒加载

- (UITableView*)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.backgroundColor = XYGlobalBg;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = [UIView new];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
        
    }
    return _tableView;
}

- (UIView*)headerView
{
    if (_headerView == nil) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, sub_order_Detail_Header)];
        _headerView.backgroundColor = XYGlobalBg;
        
        [_headerView addSubview:self.detailheaderVC.view];
        [self.detailheaderVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(sub_order_Detail_Header);
        }];
    }
    return _headerView;
}

- (XYOrderDetailSubClassOrderDetailHeaderVC*)detailheaderVC
{
    if (_detailheaderVC == nil) {
        _detailheaderVC = [[XYOrderDetailSubClassOrderDetailHeaderVC alloc]init];
        _detailheaderVC.view.frame = CGRectZero;
    }
    return _detailheaderVC;
}

- (XYOrderDetailGoodsListTVC*)goodsListTVC
{
    if (_goodsListTVC == nil) {
        _goodsListTVC = [[XYOrderDetailGoodsListTVC alloc]init];
        _goodsListTVC.tableView.frame = CGRectZero;
        
        _goodsListTVC.type = XYOrderDetailListType_detail;
        
        [self addChildViewController:_goodsListTVC];
    }
    return _goodsListTVC;
}

- (XYOrderDetailSubClassOrderDetailPayVC*)detailPayVC
{
    if (_detailPayVC == nil) {
        _detailPayVC = [[XYOrderDetailSubClassOrderDetailPayVC alloc]init];
        _detailPayVC.tableView.frame = CGRectZero;
        
        [self addChildViewController:_detailPayVC];
    }
    
    return _detailPayVC;
}

- (XYOrderDetailPayRecsVC*)detailPayRecsVC
{
    if (_detailPayRecsVC == nil) {
        _detailPayRecsVC = [[XYOrderDetailPayRecsVC alloc]init];
        _detailPayRecsVC.tableView.frame = CGRectZero;
        
        [self addChildViewController:_detailPayRecsVC];
    }
    
    return _detailPayRecsVC;
}

- (XYOrderDetailSubClassOrderDetailAddressVC*)detailAddressVC
{
    if (_detailAddressVC == nil) {
        _detailAddressVC = [[XYOrderDetailSubClassOrderDetailAddressVC alloc]init];
        _detailAddressVC.tableView.frame = CGRectZero;
        
        [self addChildViewController:_detailAddressVC];
    }
    return _detailAddressVC;
}

- (XYOrderDetailInvoiceInfoTVC*)invoiceInfoTVC
{
    if (_invoiceInfoTVC == nil) {
        _invoiceInfoTVC = [[XYOrderDetailInvoiceInfoTVC alloc]init];
        _invoiceInfoTVC.tableView.frame = CGRectZero;
        _invoiceInfoTVC.tableView.userInteractionEnabled = NO;
        [self addChildViewController:_invoiceInfoTVC];
    }
    return _invoiceInfoTVC;
}

- (XYOrderDetailTelephoneVC*)telephoneVC
{
    if (_telephoneVC == nil) {
        _telephoneVC = [[XYOrderDetailTelephoneVC alloc]init];
        _telephoneVC.view.frame = CGRectZero;
        
        [self addChildViewController:_telephoneVC];
    }
    return _telephoneVC;
}

- (XYOrderDetailOrderBottonVC*)bottomVC
{
    if (_bottomVC == nil) {
        _bottomVC = [[XYOrderDetailOrderBottonVC alloc]init];
        
        _bottomVC.view.frame = CGRectZero;
        
        _bottomVC.delegate = self;
        
        [self addChildViewController:_bottomVC];
        
    }
    return _bottomVC;
}

#pragma mark - tableview

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
//        return self.goodsListTVC.tableView.contentSize.height;
        if (self.detailModel.items.count == 0) {
            return 0;
        }else{
            return goodList_cell_height * self.detailModel.items.count ;
        }
    }else if (indexPath.section == 1){
        //        没有优惠券和优惠总额
        NSLog(@"%f",[_detailModel.totalOrderDiscount floatValue]);
        NSLog(@"%f",[_detailModel.totalUsedCardAmount floatValue]);
        NSLog(@"%f",[_detailModel.integralDiscount floatValue]);
        if ((!_detailModel)||(([_detailModel.totalOrderDiscount floatValue]<=0)&&([_detailModel.totalUsedCardAmount floatValue]<=0)&&([_detailModel.integralDiscount floatValue]<=0))) {
            return 30*2+40;
        } else if ((_detailModel.totalOrderDiscount!=nil||![_detailModel.totalOrderDiscount isEqualToString:@""]||![_detailModel.totalOrderDiscount isEqualToString:@"0.00"])&&(_detailModel.totalUsedCardAmount==nil||[_detailModel.totalUsedCardAmount isEqualToString:@""]||[_detailModel.totalUsedCardAmount isEqualToString:@"0.00"])&&(_detailModel.integralDiscount==nil||[_detailModel.integralDiscount isEqualToString:@""]||[_detailModel.integralDiscount isEqualToString:@"0"])) {
            return 30*3+40;
        }else if ((_detailModel.totalOrderDiscount==nil||[_detailModel.totalOrderDiscount isEqualToString:@""]||[_detailModel.totalOrderDiscount isEqualToString:@"0.00"])&&(_detailModel.totalUsedCardAmount!=nil||![_detailModel.totalUsedCardAmount isEqualToString:@""]||![_detailModel.totalUsedCardAmount isEqualToString:@"0.00"])&&(_detailModel.integralDiscount==nil||[_detailModel.integralDiscount isEqualToString:@""]||[_detailModel.integralDiscount isEqualToString:@"0"])) {
            return 30*3+40;
        }else if ((_detailModel.totalOrderDiscount==nil||[_detailModel.totalOrderDiscount isEqualToString:@""]||[_detailModel.totalOrderDiscount isEqualToString:@"0.00"])&&(_detailModel.totalUsedCardAmount==nil||[_detailModel.totalUsedCardAmount isEqualToString:@""]||[_detailModel.totalUsedCardAmount isEqualToString:@"0.00"])&&(_detailModel.integralDiscount!=nil||![_detailModel.integralDiscount isEqualToString:@""]||![_detailModel.integralDiscount isEqualToString:@"0"])) {
            return 30*3+40;
        }else if ((_detailModel.totalOrderDiscount!=nil||![_detailModel.totalOrderDiscount isEqualToString:@""]||![_detailModel.totalOrderDiscount isEqualToString:@"0.00"])&&(_detailModel.totalUsedCardAmount!=nil||![_detailModel.totalUsedCardAmount isEqualToString:@""]||![_detailModel.totalUsedCardAmount isEqualToString:@"0.00"])&&(_detailModel.integralDiscount==nil||[_detailModel.integralDiscount isEqualToString:@""]||[_detailModel.integralDiscount isEqualToString:@"0"])) {
            return 30*4+40;
        }else if ((_detailModel.totalOrderDiscount!=nil||![_detailModel.totalOrderDiscount isEqualToString:@""]||![_detailModel.totalOrderDiscount isEqualToString:@"0.00"])&&(_detailModel.totalUsedCardAmount==nil||[_detailModel.totalUsedCardAmount isEqualToString:@""]||[_detailModel.totalUsedCardAmount isEqualToString:@"0.00"])&&(_detailModel.integralDiscount!=nil||![_detailModel.integralDiscount isEqualToString:@""]||![_detailModel.integralDiscount isEqualToString:@"0"])) {
            return 30*4+40;
        }else if ((_detailModel.totalOrderDiscount==nil||[_detailModel.totalOrderDiscount isEqualToString:@""]||[_detailModel.totalOrderDiscount isEqualToString:@"0.00"])&&(_detailModel.totalUsedCardAmount!=nil||![_detailModel.totalUsedCardAmount isEqualToString:@""]||![_detailModel.totalUsedCardAmount isEqualToString:@"0.00"])&&(_detailModel.integralDiscount!=nil||![_detailModel.integralDiscount isEqualToString:@""]||![_detailModel.integralDiscount isEqualToString:@"0"])) {
            return 30*4+40;
        }else{
            return 30*5+40;
        }
        
        
        
        
        
        
        
//        return self.detailPayVC.tableView.contentSize.height;
    }else if (indexPath.section == 2){
//        if ([self.detailModel.processStateInfo.state isEqualToString:@"p100"]) {
//        NSLog(@"%@",self.detailModel.totalOrderNeedPayPrice);
        NSLog(@"%@",self.detailModel.processStateInfo.state);
        if ([self.detailModel.processStateInfo.state isEqualToString:@"p100"]) {
            if([_playTypeStr isEqualToString:@"payi_5"]){
                return self.detailPayRecsVC.tableView.contentSize.height;
            }else{
                return 0;
            }
//            for (XYOrderDetailPayRecsModel *mode in self.detailModel.payRecs) {
//                NSLog(@"%@",mode.payRecs_id);
//                if ([mode.payRecs_id isEqualToString:@"payi_5"]) {
//                    return self.detailPayRecsVC.tableView.contentSize.height;
//                }
//            }
//            return 0;
        }
         return 0;
    }else if (indexPath.section == 3){
        NSLog(@"%@",self.detailModel.processStateInfo.state);
         if ([self.detailModel.processStateInfo.state isEqualToString:@"p100"]) {
             if ([self.detailModel.deliveryRuleName isEqualToString:@"自提"]) {
                 return self.detailAddressVC.tableView.contentSize.height+40;
             }
             return self.detailAddressVC.tableView.contentSize.height;
         }else if([self.detailModel.processStateInfo.state isEqualToString:@"p101"]){
             if ([self.detailModel.deliveryRuleName isEqualToString:@"自提"]) {
                 return self.detailAddressVC.tableView.contentSize.height+40;
             }
             return self.detailAddressVC.tableView.contentSize.height-20;
         }else if([self.detailModel.processStateInfo.state isEqualToString:@"p112"]){
             NSString *version = [UIDevice currentDevice].systemVersion;
             
             if([version rangeOfString:@"10"].location !=NSNotFound||[version rangeOfString:@"9"].location !=NSNotFound)//_roaldSearchText
             {
                 return self.detailAddressVC.tableView.contentSize.height;
             }
             else
             {
                 if ([self.detailModel.deliveryRuleName isEqualToString:@"自提"]) {
                     return self.detailAddressVC.tableView.contentSize.height+20;
                 }
                return self.detailAddressVC.tableView.contentSize.height-20;
             }
             
         }else{
             return self.detailAddressVC.tableView.contentSize.height;
         }
        
    }else if (indexPath.section == 4){
        NSLog(@"++++++++++++++%f",self.invoiceInfoTVC.tableView.contentSize.height);
        return self.invoiceInfoTVC.tableView.contentSize.height;
        
    }else if (indexPath.section == 5){
        return order_Detail_telephone_height;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==2) {
        if ([self.detailModel.processStateInfo.state isEqualToString:@"p100"]) {
            if([_playTypeStr isEqualToString:@"payi_5"]){
                return 15;
            }else{
                return 0;
            }
        }else{
            return 0;
        }
    }
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        
        [cell.contentView addSubview:self.goodsListTVC.tableView];
        [self.goodsListTVC.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
        
    }else if (indexPath.section == 1){
        [cell.contentView addSubview:self.detailPayVC.tableView];
        [self.detailPayVC.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
        
    }else if (indexPath.section == 2){
        
        [cell.contentView addSubview:self.detailPayRecsVC.tableView];
        [self.detailPayRecsVC.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
    }else if (indexPath.section == 3){
        
        [cell.contentView addSubview:self.detailAddressVC.tableView];
        [self.detailAddressVC.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
    }else if (indexPath.section == 4){
        [cell.contentView addSubview:self.invoiceInfoTVC.tableView];
        [self.invoiceInfoTVC.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
    }else if (indexPath.section == 5){
        [cell.contentView addSubview:self.telephoneVC.view];
        [self.telephoneVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
    }
    
    return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    XYTableViewFooterIntervalView * footerView = [XYTableViewFooterIntervalView headerWithTableView:tableView];
    
    return footerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 4){
        if ([self.detailModel.invoiceInfo.needInvoiceKey isEqualToString:@"no"]) {
            return;
        }
        JXElectronicInvoiceDetailPage *ViewController=[[JXElectronicInvoiceDetailPage alloc]init];
        ViewController.invoiceInfo = self.detailModel.invoiceInfo;
        ViewController.orderId = self.detailModel.aliasCode;
        ViewController.processStateInfoState = self.detailModel.processStateInfo.state;
        [self.navigationController pushViewController:ViewController animated:YES];
    }
}

#pragma mark - XYOrderDetailOrderBottonVCDelegate

- (void)orderDetailBottomCancelButton
{
    [self netOrderDetailData];
}


#pragma mark - data

- (void)updateTableViewData
{
//    商品列表
    if (self.detailModel.items.count != 0) {
        self.goodsListTVC.dataSource = self.detailModel.items;
    }
//    货物状态 代发货等
    self.detailheaderVC.stateInfoModel = self.detailModel.processStateInfo;
    
//    支付总额配送费
    [self.detailPayVC updataOrderPayViewDataTotalProductPrice:self.detailModel.totalProductPrice
                                                deliveryPrice:self.detailModel.deliveryPrice
                                       totalOrderNeedPayPrice:self.detailModel.totalOrderNeedPayPrice
                                          totalUsedCardAmount:self.detailModel.totalCardPayPrice OderState:self.detailModel.processStateInfo.state TotalOrderDiscount:self.detailModel.totalOrderDiscount IntegralI:self.detailModel.integralDiscount];
    
    
    if ([self.detailModel.processStateInfo.state isEqualToString:@"p100"]) {
//        NSMutableArray *array=[[NSMutableArray alloc]init];
//        NSLog(@"%@",self.detailModel.payRecs[0]);
//        NSLog(@"%@",self.detailModel.payRecs[1]);
        for (int i=0; i<self.detailModel.payRecs.count; i++) {
            XYOrderDetailPayRecsModel *mode=self.detailModel.payRecs[i];
            NSLog(@"%@",mode.price);
            NSLog(@"%@",mode.payRecs_id);
            if ([mode.payRecs_id isEqualToString:@"payi_5"]) {
                XYOrderDetailPayRecsModel *recsModel=[[XYOrderDetailPayRecsModel alloc]init];
                recsModel.name=mode.name;
                _playTypeStr=mode.payRecs_id;
                NSLog(@"%@",mode.price);
                NSLog(@"%@",mode.payRecs_id);
            recsModel.price=mode.price;
                [self.detailModel.payRecs removeObjectAtIndex:i];
                [self.detailModel.payRecs insertObject:recsModel atIndex:i];
//            [array addObject:recsModel];
            }
        }
    
        
        
//        for (XYOrderDetailPayRecsModel *mode in self.detailModel.payRecs) {
//
//            NSLog(@"%@",mode.payRecs_id);
//            if ([mode.payRecs_id isEqualToString:@"payi_5"]) {
//                XYOrderDetailPayRecsModel *recsModel=[[XYOrderDetailPayRecsModel alloc]init];
//                recsModel.name=@"剩余应付";
//                _playTypeStr=mode.payRecs_id; recsModel.price=self.detailModel.totalOrderNeedPayPrice;
//                [self.detailModel.payRecs addObject:recsModel];
//            }
//        }
        if (!self.detailModel.payRecs) {
            self.detailModel.payRecs=[[NSMutableArray alloc]init];
        }
        
        self.detailPayRecsVC.payRecs = self.detailModel.payRecs;
    }
    
    
    
    
    
    
    
//    if ([self.detailModel.processStateInfo.state isEqualToString:@"p100"]) {
//        XYOrderDetailPayRecsModel *recsModel=[[XYOrderDetailPayRecsModel alloc]init];
//        recsModel.name=@"还需支付";
////        recsModel.price=self.detailModel.totalOrderNeedPayPrice;
//        if (!self.detailModel.payRecs) {
//            self.detailModel.payRecs=[[NSMutableArray alloc]init];
//        }
//        [self.detailModel.payRecs addObject:recsModel];
//        self.detailPayRecsVC.payRecs = self.detailModel.payRecs;
//    }
    
    
//    下单地址编号】
    [self.detailAddressVC setDetailModel:self.detailModel OderType:self.detailModel.processStateInfo.state ]; 
//    发票信息
    self.invoiceInfoTVC.invoiceinfoModel = self.detailModel.invoiceInfo;
//    商家电话
    self.telephoneVC.sellerInfoModel = self.detailModel.sellerInfo;
//    底部按钮
    self.bottomVC.detailModel = self.detailModel;
    self.bottomVC.paymentModel = self.paymentModel;
    
    [self.tableView reloadData];
    
}



#pragma mark -  net data

/** 获取订单 详情 */
- (void)netOrderDetailData
{
    
    WeakSelf;
    [XYOrderAllNet netOrderDetailWithOrderid:self.order_ID Block:^(NSDictionary *blockDictionary, NSError *error) {
       
        if (error == nil) {
            
            NSDictionary * Dict = [XYCommon removeNull:blockDictionary];
            self.paymentModel = [XYOrderDetailAndPaymentModel mj_objectWithKeyValues:Dict];
            
            NSDictionary * orderDict = [blockDictionary objectForKey:@"order"];
            
            NSDictionary * noNullDict = [XYCommon removeNull:orderDict];
            
            weakSelf.detailModel = [XYOrderDetailModel mj_objectWithKeyValues:noNullDict];
            
            [weakSelf updateTableViewData];
            
//            XYLog(@" order detail %@ ",blockDictionary);
        }
        
    }];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
