//
//  XYOrderConfirmOrderVC.m
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderConfirmOrderVC.h"
#import "XYPay.h"
#import "XYBaseModel.h"
#import "XYOrderPaymentAddressHeaderVC.h" // 地址
#import "XYOrderDetailGoodsListTVC.h"  // 商品
#import "XYOrderPaymentRemarkSectionFooterVC.h"  //价格
#import "XYOrderConfirmInvoiceSubTVC.h" // 发票
#import "XYOrderConfirmCouponVC.h"  //优惠劵
#import "XYOrderConfirmPriceTVC.h"  // 价格信息
//#import "XYOrderDetailBalanceVC.h"  // 余额
#import "XYOrderConfirmOrderBottomVC.h" // 确认订单 底部
#import "XYTableViewFooterIntervalView.h"  // tableview footerview
#import "XYPlayModel.h"
#import "XYOrderAllNet.h"  // 订单 请求
#import "XYOrderConfirmModel.h"
#import "XYOrderFromDetailModel.h" // 订单详情
//#import "XYOrderDetailGoodsListModel.h" // 商品列表
//#import "XYOrderDetailSubClassOrderDetailVC.h" // 订单详情
#import "JXMyOrderDetailsViewController.h"
#import "XYAddressListModel.h"
#import "XYIntegralViewController.h"
#import "XYConfirmOrderInvoiceVC.h"

#import "XYPopInputPasswordView.h"  //输入 支付密码

#import "XYPayOrderSuccessVC.h" // 支付成功 页面

#import "XYConfirmOrderPayPickView.h" // 支付选择

#import "XYPayPasswordSettingVC.h" //设置密码
#import "WXApiObject.h"
#import "WXApi.h"
#import "JXAppyChinaPayModel.h"
//#import "JXShopCouponViewController.h"
#import "JXHhopAvailableViewController.h"
#import "JXOrderConfirmPaymentTypeModel.h"
#import "JXPopExplainView.h"
//积分说明
#import "JXPointsDescriptionView.h"

@interface XYOrderConfirmOrderVC () <UITableViewDelegate, UITableViewDataSource,XYOrderPaymentAddressHeaderVCDelegate,XYOrderConfirmOrderBottomVCDelegate,XYOrderConfirmInvoiceSubTVCDelegate,XYOrderDetailGoodsListTVCDelegate,XYConfirmOrderInvoiceVCDelegate,XYPopInputPassViewDelegate,XYConfirmOrderPayPickViewDelegate>
{
    XYPopInputPasswordView *popView;
    NSString *xyPlayType;
    Payment_Type paymentType;
    NSString *one;
}
@property (nonatomic, strong) UITableView * tableView;
//发票弹出窗
@property(nonatomic,strong)JXPopExplainView *popExplainView;
//积分
@property(nonatomic,strong)XYIntegralViewController *integralViewController;
/** 头 */
@property (nonatomic, strong) UIView * headerView;

/** 订单 地址 */
@property (nonatomic, strong) XYOrderPaymentAddressHeaderVC * addressHeaderVC;
/** 商品列表 */
@property (nonatomic, strong) XYOrderDetailGoodsListTVC * goodsListTVC;
/** 价格详情  2017-11-29 仅留备注 价格信息屏蔽 */
@property (nonatomic, strong) XYOrderPaymentRemarkSectionFooterVC * paymentRemarkVC;
/** 发票信息 */
@property (nonatomic, strong) XYOrderConfirmInvoiceSubTVC * invoiceSubVC;
/** 优惠劵信息 */
@property (nonatomic, strong) XYOrderConfirmCouponVC * couponVC;
/** 价格信息 */
@property (nonatomic, strong) XYOrderConfirmPriceTVC * priceTVC;
/* 余额 */
//@property (nonatomic, strong) XYOrderDetailBalanceVC * balanceVC;

/** 确认订单 底部 */
@property (nonatomic, strong) XYOrderConfirmOrderBottomVC * orderBottomVC;

/** 确认订单 model */
@property (nonatomic, strong) XYOrderFromDetailModel * orderModel;
/** 确认订单 ocs model */
@property (nonatomic, strong) XYOrderFromDetailocsModel * orderOcsModel;

/** 地址模型 */
@property(strong,nonatomic) XYAddressListModel *addressModel ;
@property(strong,nonatomic)NSString *hideeadFoot;

/** 余额支付 金额 */
@property(strong,nonatomic) NSString * balancePayTotal ;
/** 第三方 支付金额 */
@property(strong,nonatomic) NSString * needPayTotal ;
/** 第三方支付 失败跳转 订单详情需要传订单号 */
@property (strong, nonatomic) NSString * aliasCode;
@property(nonatomic,strong)NSString *oderIDNumber;
@property (nonatomic,strong) JXOrderConfirmPaymentTypeModel *paymentTypeModel;
//积分说明
@property(nonatomic,strong)JXPointsDescriptionView *pointsDescriptionView;
//是否打开积分
@property(nonatomic,strong)NSString *notUse;
@end

@implementation XYOrderConfirmOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    one=@"1";
    self.notUse=@"0";
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(receiveNotificiation:) name:@"play" object:nil];
    [center addObserver:self selector:@selector(receiveNotificiationUN:) name:@"playUN" object:nil];
    
    [center addObserver:self selector:@selector(oder_init) name:@"playWX" object:nil];
    [center addObserver:self selector:@selector(oder_init) name:@"playAlbb" object:nil];
    [center addObserver:self selector:@selector(oder_init) name:@"playUNC" object:nil];
    self.navigationItem.title = @"订单结算";
    self.view.backgroundColor = XYGlobalBg;
    
    [self addViewAndLayout];
    /**
     * 订单结算的时候要判断两个值
     * self.orderModel.deliveryAddress 判断是否为空 这个是收货地址
     * self.orderOcsModel.selectedDeliveryRuleId 配送方式id，判断是否为空   
     * 如果上面两个参数有一个为空就要做提示
     */
    
   
}

-(JXPopExplainView *)popExplainView{
    WeakSelf;
    if (!_popExplainView) {
        _popExplainView=[[[NSBundle mainBundle]loadNibNamed:@"JXPopExplainView" owner:self options:nil]lastObject];
        _popExplainView.Diss = ^{
            [weakSelf.view dismissPOP];
        };
    }
    return _popExplainView;
}



-(JXPointsDescriptionView *)pointsDescriptionView{
    WeakSelf;
    if (!_pointsDescriptionView) {
        _pointsDescriptionView=[[[NSBundle mainBundle]loadNibNamed:@"JXPointsDescriptionView" owner:self options:nil]lastObject];
        [_pointsDescriptionView init_Points];
        _pointsDescriptionView.Clock = ^{
            [weakSelf.view dismissPOP];
        };
    }
    return _pointsDescriptionView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.tableView.mj_header beginRefreshing];
     [self netOrderFromData:self.notUse];
}


- (void)receiveNotificiation:(NSNotification*)sender{
    WeakSelf;
    XYPlaAlBBModel *plaAlBBModel=[XYPlaAlBBModel mj_objectWithKeyValues:sender.userInfo];
    NSLog(@"%@",plaAlBBModel);
    if ([plaAlBBModel.resultStatus isEqualToString:@"9000"]) {
        [weakSelf pushcontroller];
    }else{
//        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:plaAlBBModel.memo dismissTimeInterval:1.0];
        if (self.aliasCode != nil) {
//            XYOrderDetailSubClassOrderDetailVC * orderDetailVC = [[XYOrderDetailSubClassOrderDetailVC alloc]init];
//            orderDetailVC.order_ID = self.aliasCode;
//            orderDetailVC.isOrderConfirmPush = YES;
//            [weakSelf.navigationController pushViewController:orderDetailVC animated:YES];
            JXMyOrderDetailsViewController * myOrderDetailsViewController = [[JXMyOrderDetailsViewController alloc]init];
            myOrderDetailsViewController.orderID = self.aliasCode;
//            myOrderDetailsViewController.isOrderConfirmPush = YES;
            [weakSelf.navigationController.navigationController pushViewController:myOrderDetailsViewController animated:YES];
        }else{
            [self.navigationController popViewControllerAnimated:YES];
            [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"请前往订单详情页查看订单状态" dismissTimeInterval:1.0];
        }
    }
}



- (void)receiveNotificiationUN:(NSNotification*)sender{
    WeakSelf;
    NSString *key=[sender.userInfo valueForKey:@"code"];
    if ([key isEqualToString:@"success"]) {
        [weakSelf pushcontroller];
    }else{
//        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"支付失败" dismissTimeInterval:1.0];
//        XYOrderDetailSubClassOrderDetailVC * orderDetailVC = [[XYOrderDetailSubClassOrderDetailVC alloc]init];
//        orderDetailVC.order_ID = self.aliasCode;
//        orderDetailVC.isOrderConfirmPush = YES;
//        [weakSelf.navigationController pushViewController:orderDetailVC animated:YES];
        JXMyOrderDetailsViewController * myOrderDetailsViewController = [[JXMyOrderDetailsViewController alloc]init];
        myOrderDetailsViewController.orderID = self.aliasCode;
        [self.navigationController pushViewController:myOrderDetailsViewController animated:YES];
    }
//    XYPlaAlBBModel *plaAlBBModel=[XYPlaAlBBModel mj_objectWithKeyValues:sender.userInfo];
//    NSLog(@"%@",plaAlBBModel);
//    if ([plaAlBBModel.resultStatus isEqualToString:@"9000"]) {
//        [weakSelf pushcontroller];
//    }else{
//        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:plaAlBBModel.memo dismissTimeInterval:1.0];
//        if (self.aliasCode != nil) {
//            XYOrderDetailSubClassOrderDetailVC * orderDetailVC = [[XYOrderDetailSubClassOrderDetailVC alloc]init];
//            orderDetailVC.order_ID = self.aliasCode;
//            orderDetailVC.isOrderConfirmPush = YES;
//            [weakSelf.navigationController pushViewController:orderDetailVC animated:YES];
//        }else{
//            [self.navigationController popViewControllerAnimated:YES];
//            [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"请前往订单详情页查看订单状态" dismissTimeInterval:1.0];
//        }
//    }
}



#pragma mark - add view
/** 添加 view */
- (void)addViewAndLayout
{
        WeakSelf;
    [self.view addSubview:self.tableView];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(weakSelf.mas_bottomLayoutGuide).offset(-50);
    }];
    
    [self.view addSubview:self.orderBottomVC.view];

    [self.orderBottomVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
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
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(upOrderFromData)];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = [UIView new];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
        
    }
    return _tableView;
}

-(void)upOrderFromData{
    [self netOrderFromData:self.notUse ];
}

- (UIView*)headerView
{
    if (_headerView == nil) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, 199)];
        _headerView.backgroundColor = XYWhiteColor;
        
        [_headerView addSubview:self.addressHeaderVC.view];
        [self.addressHeaderVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(payment_address_height);
        }];
        
    }
    return _headerView;
}

- (XYOrderPaymentAddressHeaderVC*)addressHeaderVC
{
    if (_addressHeaderVC == nil) {
        _addressHeaderVC = [[XYOrderPaymentAddressHeaderVC alloc]init];
        _addressHeaderVC.delegate = self;
//        _addressHeaderVC.cartId = self.cartId;
//        _addressHeaderVC.view.backgroundColor = XYWhiteColor;
        _addressHeaderVC.view.backgroundColor = XYWhiteColor;
        [self addChildViewController:_addressHeaderVC];
    }
    return _addressHeaderVC;
}

- (XYOrderDetailGoodsListTVC*)goodsListTVC
{
    if (_goodsListTVC == nil) {
        _goodsListTVC = [[XYOrderDetailGoodsListTVC alloc]init];
        _goodsListTVC.tableView.frame = CGRectZero;
        
        _goodsListTVC.type = XYOrderDetailListType_confirm;
        _goodsListTVC.delegate = self;
        [self addChildViewController:_goodsListTVC];
    }
    return _goodsListTVC;
}

- (XYOrderPaymentRemarkSectionFooterVC*)paymentRemarkVC
{
    if (_paymentRemarkVC == nil) {
        _paymentRemarkVC = [[XYOrderPaymentRemarkSectionFooterVC alloc]init];
        _paymentRemarkVC.view.frame = CGRectZero;
        
        [self addChildViewController:_paymentRemarkVC];
    }
    return _paymentRemarkVC;
}

- (XYOrderConfirmInvoiceSubTVC*)invoiceSubVC
{
    if (_invoiceSubVC == nil) {
        WeakSelf;
        _invoiceSubVC = [[XYOrderConfirmInvoiceSubTVC alloc]init];
        _invoiceSubVC.tableView.frame = CGRectZero;
        _invoiceSubVC.delegate = self;
        _invoiceSubVC.ClockSub = ^{
           [weakSelf.popExplainView bombBoxPOP];
        };
        [self addChildViewController:_invoiceSubVC];
    }
    return _invoiceSubVC;
}

- (XYOrderConfirmCouponVC*)couponVC
{
    if (_couponVC == nil) {
        WeakSelf;
        _couponVC = [[XYOrderConfirmCouponVC alloc]init];
        _couponVC.view.frame = CGRectZero;
        _couponVC.Clock = ^{
            NSLog(@"优惠券");
            [weakSelf pushShopController];
        };
        [self addChildViewController:_couponVC];
    }
    return _couponVC;
}

-(XYIntegralViewController *)integralViewController{
    WeakSelf;
    if (!_integralViewController) {
        _integralViewController=[[XYIntegralViewController alloc]init];
        _integralViewController.view.frame = CGRectZero;
        _integralViewController.OpenAndClose = ^(BOOL isOpen) {
            NSLog(@"积分关闭或打开");
            if (isOpen) {
                weakSelf.notUse=@"1";
                [weakSelf netOrderFromData:weakSelf.notUse];
            }else{
                weakSelf.notUse=@"0";
                [weakSelf netOrderFromData:weakSelf.notUse];
            }
            
        };
        _integralViewController.popIntegralContentClock = ^(BOOL isPop) {
             NSLog(@"是否显示积分详情");
            [weakSelf.pointsDescriptionView bombBoxPOP];
        };
    }
    [self addChildViewController:_integralViewController];
    return _integralViewController;
}


- (XYOrderConfirmPriceTVC*)priceTVC
{
    if (_priceTVC == nil) {
        _priceTVC = [[XYOrderConfirmPriceTVC alloc]init];
        _priceTVC.tableView.frame = CGRectZero;
//        [self addChildViewController:_priceTVC];
    }
    return _priceTVC;
}

//- (XYOrderDetailBalanceVC*)balanceVC
//{
//    if (_balanceVC == nil) {
//        _balanceVC = [[XYOrderDetailBalanceVC alloc]init];
//        _balanceVC.view.frame = CGRectZero;
//
//        [self addChildViewController:_balanceVC];
//    }
//    return _balanceVC;
//}



- (XYOrderConfirmOrderBottomVC*)orderBottomVC
{
    if (_orderBottomVC == nil) {
        _orderBottomVC = [[XYOrderConfirmOrderBottomVC alloc]init];
        _orderBottomVC.view.frame = CGRectZero;
        _orderBottomVC.delegate = self;
        [self addChildViewController:_orderBottomVC];
    }
    return _orderBottomVC;
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
        
        if (self.orderOcsModel.buyItems.count == 0) {
            return 44;
        }else{
            
            NSInteger count = 0;
            if (self.goodsListTVC.isOpenList) {
                count = self.orderOcsModel.buyItems.count;
            }else{
                count = self.orderOcsModel.buyItems.count > 3 ? 3 : self.orderOcsModel.buyItems.count;
            }
            
            CGFloat height = 49;
            if (self.orderOcsModel.buyItems.count > 3) {
                if ([self.hideeadFoot isEqualToString:@"0"]) {
                    height += 5;
                }else
                height += 49;
            }
            
            return goodList_cell_height * count + height;
        }
//       return self.goodsListTVC.tableView.contentSize.height;
        
    }else if (indexPath.section == 1){
        return payment_remark_height;
    }else if (indexPath.section == 2){
        
        return self.invoiceSubVC.tableView.contentSize.height;
    }else if (indexPath.section == 3){
        NSLog(@"%@",self.orderOcsModel.totalCanUseCardSize);
        if (self.orderOcsModel.totalCanUseCardSize != nil && [self.orderOcsModel.totalCanUseCardSize integerValue] != 0) {
            return orderConfirm_coupon_height;
        }else{
            return 0;
        }
        
    }else if (indexPath.section == 4){
//        是否显示积分行
            return orderConfirm_Integral_height;
        
        
    }else if (indexPath.section == 5){
        NSLog(@"%@",_orderOcsModel.totalOrderDiscount);
        NSLog(@"%@",_orderOcsModel.totalUsedCardAmount);
        NSLog(@"%@",_orderOcsModel.integral.integralPrice);
//        没有优惠券和优惠总额
        if ((_orderOcsModel.totalOrderDiscount==nil||[_orderOcsModel.totalOrderDiscount isEqualToString:@""]||[_orderOcsModel.totalOrderDiscount isEqualToString:@"0.00"])&&(_orderOcsModel.totalUsedCardAmount==nil||[_orderOcsModel.totalUsedCardAmount isEqualToString:@""]||[_orderOcsModel.totalUsedCardAmount isEqualToString:@"0.00"])&&(_orderOcsModel.integral.integralPrice==nil||[_orderOcsModel.integral.integralPrice isEqualToString:@""]||[_orderOcsModel.integral.integralPrice isEqualToString:@"0.00"])) {
            return orderConfirm_price_cell_height * 2;
        }else if((_orderOcsModel.totalOrderDiscount!=nil||![_orderOcsModel.totalOrderDiscount isEqualToString:@""]||![_orderOcsModel.totalOrderDiscount isEqualToString:@"0.00"])&&(_orderOcsModel.totalUsedCardAmount==nil||[_orderOcsModel.totalUsedCardAmount isEqualToString:@""]||[_orderOcsModel.totalUsedCardAmount isEqualToString:@"0.00"])&&(_orderOcsModel.integral.integralPrice==nil||[_orderOcsModel.integral.integralPrice isEqualToString:@""]||[_orderOcsModel.integral.integralPrice isEqualToString:@"0.00"])){
            return orderConfirm_price_cell_height * 3;
        }else if ((_orderOcsModel.totalOrderDiscount==nil||[_orderOcsModel.totalOrderDiscount isEqualToString:@""]||[_orderOcsModel.totalOrderDiscount isEqualToString:@"0.00"])&&(_orderOcsModel.totalUsedCardAmount!=nil||![_orderOcsModel.totalUsedCardAmount isEqualToString:@""]||![_orderOcsModel.totalUsedCardAmount isEqualToString:@"0.00"])&&(_orderOcsModel.integral.integralPrice==nil||[_orderOcsModel.integral.integralPrice isEqualToString:@""]||[_orderOcsModel.integral.integralPrice isEqualToString:@"0.00"])){
            return orderConfirm_price_cell_height * 3;
        }else if ((_orderOcsModel.totalOrderDiscount==nil||[_orderOcsModel.totalOrderDiscount isEqualToString:@""]||[_orderOcsModel.totalOrderDiscount isEqualToString:@"0.00"])&&(_orderOcsModel.totalUsedCardAmount==nil||[_orderOcsModel.totalUsedCardAmount isEqualToString:@""]||[_orderOcsModel.totalUsedCardAmount isEqualToString:@"0.00"])&&(_orderOcsModel.integral.integralPrice!=nil||![_orderOcsModel.integral.integralPrice isEqualToString:@""]||![_orderOcsModel.integral.integralPrice isEqualToString:@"0.00"])){
            if ([self.notUse isEqualToString:@"0"]) {
                return orderConfirm_price_cell_height * 2;
            }else
            return orderConfirm_price_cell_height * 3;
        }else if((_orderOcsModel.totalOrderDiscount!=nil||![_orderOcsModel.totalOrderDiscount isEqualToString:@""]||![_orderOcsModel.totalOrderDiscount isEqualToString:@"0.00"])&&(_orderOcsModel.totalUsedCardAmount==nil||[_orderOcsModel.totalUsedCardAmount isEqualToString:@""]||[_orderOcsModel.totalUsedCardAmount isEqualToString:@"0.00"])&&(_orderOcsModel.integral.integralPrice==nil||[_orderOcsModel.integral.integralPrice isEqualToString:@""]||[_orderOcsModel.integral.integralPrice isEqualToString:@"0.00"])) {
            return orderConfirm_price_cell_height * 4;
        }else if((_orderOcsModel.totalOrderDiscount!=nil||![_orderOcsModel.totalOrderDiscount isEqualToString:@""]||![_orderOcsModel.totalOrderDiscount isEqualToString:@"0.00"])&&(_orderOcsModel.totalUsedCardAmount!=nil||![_orderOcsModel.totalUsedCardAmount isEqualToString:@""]||![_orderOcsModel.totalUsedCardAmount isEqualToString:@"0.00"])&&(_orderOcsModel.integral.integralPrice==nil||[_orderOcsModel.integral.integralPrice isEqualToString:@""]||[_orderOcsModel.integral.integralPrice isEqualToString:@"0.00"])){
            return orderConfirm_price_cell_height * 4;
        }else if ((_orderOcsModel.totalOrderDiscount==nil||[_orderOcsModel.totalOrderDiscount isEqualToString:@""]||[_orderOcsModel.totalOrderDiscount isEqualToString:@"0.00"])&&(_orderOcsModel.totalUsedCardAmount!=nil||![_orderOcsModel.totalUsedCardAmount isEqualToString:@""]||![_orderOcsModel.totalUsedCardAmount isEqualToString:@"0.00"])&&(_orderOcsModel.integral.integralPrice!=nil||![_orderOcsModel.integral.integralPrice isEqualToString:@""]||![_orderOcsModel.integral.integralPrice isEqualToString:@"0.00"])){
            return orderConfirm_price_cell_height * 4;
        }else{
            if ([self.notUse isEqualToString:@"0"]) {
                return orderConfirm_price_cell_height * 4;
            }else if([self.notUse isEqualToString:@"1"]){
                return orderConfirm_price_cell_height * 5;
            }
            return orderConfirm_price_cell_height *5;
        }
        
        
//        if (self.orderOcsModel.totalUsedCardAmount != nil&&self.orderOcsModel.totalOrderDiscount!=nil) {
//            return orderConfirm_price_cell_height * 4;
//        }else if ((self.orderOcsModel.totalOrderDiscount!=nil&&self.orderOcsModel.totalUsedCardAmount== nil)||(self.orderOcsModel.totalOrderDiscount==nil&&self.orderOcsModel.totalUsedCardAmount!= nil)||(self.orderOcsModel.totalOrderDiscount isEqualToString:<#(nonnull NSString *)#>&&self.orderOcsModel.totalUsedCardAmount!= nil)){
//            return orderConfirm_price_cell_height * 3;
//        } else{
//            return orderConfirm_price_cell_height * 2;
//        }
        
        
        
    }
    return 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
//    if (self.orderOcsModel.totalCanUseCardSize != nil && [self.orderOcsModel.totalCanUseCardSize integerValue] == 0) {
//        return 0;
//    }

    if (section==3) {
        if (self.orderOcsModel.totalCanUseCardSize != nil && [self.orderOcsModel.totalCanUseCardSize integerValue] != 0) {
            return 15;
        }else{
            return 0;
        }
    }
    return 15;
    
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 15;
    }else
    {
        
        return 0;
    }
    
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
        
        [cell.contentView addSubview:self.paymentRemarkVC.view];
        [self.paymentRemarkVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
    }else if (indexPath.section == 2){
        
        [cell.contentView addSubview:self.invoiceSubVC.tableView];
        [self.invoiceSubVC.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
        
    }else if (indexPath.section == 3){

        [cell.contentView addSubview:self.couponVC.view];
        [self.couponVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
           make.top.left.right.bottom.mas_equalTo(0);
        }];
    }else if (indexPath.section==4){
        [cell.contentView addSubview:self.integralViewController.view];
        [self.integralViewController.view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
    }
    else if (indexPath.section == 5){
        
        [cell.contentView addSubview:self.priceTVC.tableView];
        [self.priceTVC.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
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

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}


/** 设置分割线从顶端开始 */
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)viewWillLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - XYOrderPaymentAddressHeaderVCDelegate

-(void)needReloadData
{
    [self netOrderFromData:self.notUse];
}

-(void)needFatherViewChangeHeaderFrame
{
    [self netOrderFromData:self.notUse];
}

#pragma mark - XYOrderConfirmInvoiceSubTVCDelegate
/** 发票选择开始 */
- (void)orderConfirmInvoiceSelectStar
{
    if (self.orderModel == nil) {
        return;
    }
    
    XYConfirmOrderInvoiceVC * invoiceVC = [[XYConfirmOrderInvoiceVC alloc]init];
    invoiceVC.needInvoiceKey = self.orderModel.invoiceInfo.needInvoiceKey;
    invoiceVC.invoice_id = self.orderModel.invoiceInfo.invoice_id;
    invoiceVC.delegate = self;
    [self.navigationController pushViewController:invoiceVC animated:YES];
}

#pragma mark - XYOrderDetailGoodsListTVCDelegate
/** 商品列表底部  更多按钮点击事件 */
- (void)orderConfirmGoodsListSelectFooter
{
    self.hideeadFoot=@"0";
    [self.tableView reloadData];
}

#pragma mark - XYConfirmOrderInvoiceVCDelegate
- (void)updateInvoiceSuccess
{
    [self netOrderFromData:self.notUse];
}

#pragma mark - XYOrderConfirmOrderBottomVCDelegate

- (void)orderConfirmOrderBottomButtonClick
{
    
    if (self.orderModel.deliveryAddress.address == nil) {
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"请设置地址" dismissTimeInterval:1.0];
        return;
    }
    if ([self.orderOcsModel.selectedDeliveryRuleName isEqualToString:@"到店自提"]) {
        if (self.orderOcsModel.deliveryPointInfo.delivery_id.length<=0||[self.orderOcsModel.deliveryPointInfo.delivery_id isEqualToString:@""]) {
            [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"请选择自提点" dismissTimeInterval:1.0];
            return;
        }
    }
    
    WeakSelf;
    [XYOrderAllNet netOrderUserPaywdCheckBlock:^(NSDictionary *blockDictionary, NSError *error) {
        self.paymentTypeModel = [JXOrderConfirmPaymentTypeModel modelWithJSON:blockDictionary];
        
        
        if (error == nil) {
            if ([self.paymentTypeModel.have isKindOfClass:[NSString class]]) {
                if ([self.paymentTypeModel.have isEqualToString:@"1"]) {
                    [weakSelf showPayView];
                }else{
                    [weakSelf showSettingPassWord];
                }
            }else if ([self.paymentTypeModel.have isKindOfClass:[NSNumber class]]){
                if ([self.paymentTypeModel.have intValue] == 1) {
                    [weakSelf showPayView];
                }else{
                    [weakSelf showSettingPassWord];
                }
            }
        }
    }];
    
}



#pragma mark ---LMPopInputPassViewDelegate
-(void)buttonClickedAtIndex:(NSUInteger)index withText:(NSString *)text
{
    //    NSLog(@"buttonIndex = %li password=%@",(long)index,text);
    if(index==1){
        if(text.length==0){
            XYLog(@"密码长度不正确");
        }else if(text.length<6){
            XYLog(@"密码长度不正确");
        }else{
            [self playSmall:text Money:self.balancePayTotal];
            
        }
    }
}

-(void)playSmall:(NSString *)psw Money:(NSString *)money{
    WeakSelf;
    [XYOrderAllNet netOrderSubmitWithDepositPay:money  depositPayPwd:psw memo:self.paymentRemarkVC.remarkTF.text Block:^(NSDictionary *blockDictionary, NSError *error) {
        
        if (error == nil) {
            XYOrderConfirmModel *xyOrderModel=[XYOrderConfirmModel mj_objectWithKeyValues:blockDictionary];
            if ([psw isEqualToString:@""]) {
                if ([xyPlayType isEqualToString:JX_PAYMENT_TYPE_WEIXIN]) {
                    paymentType=PAYMENT_TYPE_WEIXIN;
                }else if([xyPlayType isEqualToString:JX_PAYMENT_TYPE_ALI]){
                    paymentType=PAYMENT_TYPE_ALI;
                }else if([xyPlayType isEqualToString:JX_PAYMENT_TYPE_UNION]){
                    paymentType=PAYMENT_TYPE_UNION;
                }
//                paymentType=PAYMENT_TYPE_UN;
            }else{
                if ([xyPlayType isEqualToString:JX_PAYMENT_TYPE_WEIXIN]) {
                    paymentType=PAYMENT_TYPE_WEIXIN_AND_BLANCE;
                }else if([xyPlayType isEqualToString:JX_PAYMENT_TYPE_ALI]){
                    paymentType=PAYMENT_TYPE_ALI_AND_BLANCE;
                }else if([xyPlayType isEqualToString:JX_PAYMENT_TYPE_UNION]){
                    paymentType=PAYMENT_TYPE_UNION_AND_BLANCE;
                }else{
                    paymentType=PAYMENT_TYPE_BLANCE;
                }
            }
            [weakSelf playTypeAndwx_zfb:xyOrderModel.orderIds];
            
        }
        
    }];
}

-(void)playTypeAndwx_zfb:(NSString *)orderIds{
    if ([xyPlayType isEqualToString:JX_PAYMENT_TYPE_WEIXIN]) {
        NSLog(@"weixin");
//        if (paymentType==PAYMENT_TYPE_UN) {
//            paymentType=PAYMENT_TYPE_WEIXIN_AND_BLANCE;
//        }else{
//            paymentType=PAYMENT_TYPE_WEIXIN;
//        }
        
        [self encryptedOrder:orderIds PlayType:JX_PAYMENT_TYPE_WEIXIN];
        
    }else if ([xyPlayType isEqualToString:JX_PAYMENT_TYPE_ALI]){
//        if (paymentType==PAYMENT_TYPE_UN) {
//            paymentType=PAYMENT_TYPE_ALI_AND_BLANCE;
//        }else{
//            paymentType=PAYMENT_TYPE_ALI;
//        }
        [self encryptedOrder:orderIds PlayType:JX_PAYMENT_TYPE_ALI]; NSLog(@"zhifubao");
    }else if ([xyPlayType isEqualToString:JX_PAYMENT_TYPE_UNION]){
//        if (paymentType==PAYMENT_TYPE_UN) {
//            paymentType=PAYMENT_TYPE_UNION_AND_BLANCE;
//        }else{
//            paymentType=PAYMENT_TYPE_UNION;
//        }
        [self UNIONplay:orderIds PlayType:JX_PAYMENT_TYPE_UNION];
    }else{
//        paymentType=PAYMENT_TYPE_BLANCE;
        [self pushcontroller];
    }
}


-(void)UNIONplay:(NSString *)oderID PlayType:(NSString *)playType{
//    @{@"orderIds":oderID,@"payi":playType}
    self.aliasCode = oderID;
    [[NSUserDefaults standardUserDefaults]setObject:@"7" forKey:@"wx"];
    [XYPay requestParameter:@{@"orderIds":oderID,@"payId":playType} relativePath:kJXAPI_user_ChinaPay success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        JXAppyChinaPayModel *appyChinaPayModel=[JXAppyChinaPayModel modelWithJSON:responseObject];
        if ([appyChinaPayModel.RETURN_CODE isEqualToString:ERROR_NUM_STRING]) {
            [[NSUserDefaults standardUserDefaults]setObject:@"8" forKey:@"wx"];
            [XYPay unionPay:appyChinaPayModel.RETURN_DATA.androidPayInfo ViewController:self];
        }else{
            [[NSUserDefaults standardUserDefaults]setObject:@"9" forKey:@"wx"];
            [YDBAlertView showToast:appyChinaPayModel.RETURN_DESC dismissDelay:1.0];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

-(void)pushcontroller{
    XYPayOrderSuccessVC * paySuccessVC = [[XYPayOrderSuccessVC alloc]init];
    paySuccessVC.paymentAmountString = self.orderOcsModel.totalPayPrice;
    paySuccessVC.paymentType=[self paymentPlayType:paymentType];
    [self.navigationController pushViewController:paySuccessVC animated:YES];
}


-(NSString *)paymentPlayType:(Payment_Type) paymentType{
    switch (paymentType) {
        case PAYMENT_TYPE_WEIXIN:
            return @"微信支付";
        case PAYMENT_TYPE_ALI:
            return @"支付宝支付";
        case PAYMENT_TYPE_BLANCE:
            return @"余额支付";
        case PAYMENT_TYPE_UNION:
            return @"银联支付";
            
        case PAYMENT_TYPE_UNION_AND_BLANCE:
            return @"银联 + 余额支付";
            
        case PAYMENT_TYPE_WEIXIN_AND_BLANCE:
            return @"微信 + 余额支付";
        case PAYMENT_TYPE_ALI_AND_BLANCE:
            return @"支付宝 + 余额支付";
            
        default:
            break;
    }
    return nil;
}

#pragma mark - XYConfirmOrderPayPickViewDelegate

- (void)pickPayType:(BOOL)isBalancePay balanceTotal:(NSString *)balanceTotal payType:(NSString *)payType needTotal:(NSString *)needTotal
{
    
    self.balancePayTotal = balanceTotal;
    self.needPayTotal = needTotal;
    xyPlayType=payType;
    if (isBalancePay) {
        
        popView = [[XYPopInputPasswordView alloc]init];
        popView.frame = CGRectMake(0, XYScreenH-280, XYScreenW, 150);
        popView.delegate = self;
        [popView pop];
//        if ([xyPlayType isEqualToString:XY_PAY_TYPE_WEIXIN]) {
//            NSLog(@"weixin");
//        }else if ([payType isEqualToString:XY_PAY_TYPE_AIL]){
//            NSLog(@"zhifubao");
//        }
        
    }else{
        
            [self playSmall:@"" Money:@"0"];
        
        
//        [self partyPayment:balanceTotal];
        NSLog(@"--");
        
    }
    
}



//-(void)partyPayment:(NSString *)money{
//    if (money!=nil&&![money isEqualToString: @""]) {
//        [XYPay requestParameter:@{@"depositPay":@0} relativePath:@"order.submit" success:^(id responseObject) {
//            NSLog(@"%@",responseObject);
//            XYBaseModel *xyBaseModel=[XYBaseModel mj_objectWithKeyValues:responseObject];
//            if([xyBaseModel.RETURN_CODE isEqualToString:@"S0A00000"]){
//
//
//            }
//        } failure:^(NSError *error) {
//            NSLog(@"%@",error.userInfo);
//        }];
//    }
//
//}


-(void)encryptedOrder:(NSString *)oder PlayType:(NSString *)playType{
    WeakSelf;
    _oderIDNumber=oder;
    if (oder!=nil&&![oder isEqualToString:@""]) {
        [XYPay requestParameter:@{@"payId":playType,@"orderIds":oder} relativePath:@"pay.handler" success:^(id responseObject) {
            NSLog(@"%@",responseObject);
            XYBaseModel *xyBaseModel=[XYBaseModel mj_objectWithKeyValues:responseObject];
            if ([xyBaseModel.RETURN_CODE isEqualToString:ERROR_NUM_STRING]) {
               
                //支付宝
                if ([playType isEqualToString:XY_PAY_TYPE_AIL]) {
                     XYPlayInfoModel *xyPlayInfoModel=[XYPlayInfoModel mj_objectWithKeyValues:xyBaseModel.RETURN_DATA];
                    [weakSelf playAlipay:xyPlayInfoModel.androidPayInfo aliasCode:oder];
                }else if([playType isEqualToString:JX_PAYMENT_TYPE_WEIXIN]){
                //微信
                     XYWXPayModel *xyWXPayModel=[XYWXPayModel mj_objectWithKeyValues:xyBaseModel.RETURN_DATA];
                    [weakSelf wxpay:xyWXPayModel.paySign OderID:oder];
                }else if([playType isEqualToString:JX_PAYMENT_TYPE_UNION]){
                //银联
                    XYWXPayModel *xyWXPayModel=[XYWXPayModel mj_objectWithKeyValues:xyBaseModel.RETURN_DATA];
                    [weakSelf unionpay:xyWXPayModel.paySign OderID:oder];
                }
            }else{
                 [YDBAlertView showToast:xyBaseModel.RETURN_DESC dismissDelay:1.0];
            }
            
        } failure:^(NSError *error) {
            NSLog(@"%@",error);
        }];
    }
}

-(void)wxpay:(XYWXPaySignModel *)wXPaySignModel OderID:(NSString *)oderId{
    self.aliasCode = oderId;
    [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"wx"];
    [XYPay wxpay:wXPaySignModel];
    WeakSelf;
    [XYPay shareXYPay].Failure = ^(BaseResp *baseResp) {
        NSLog(@"%@",baseResp);
         [[NSUserDefaults standardUserDefaults]setObject:@"2" forKey:@"wx"];
//        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"支付失败" dismissTimeInterval:1.0];
        [weakSelf oder_init];
        
    } ;
    [XYPay shareXYPay].Success = ^(PayResp *payResp) {
        NSLog(@"%@",payResp);
        [[NSUserDefaults standardUserDefaults]setObject:@"3" forKey:@"wx"];
        [weakSelf pushcontroller];
        
    } ;
}
-(void)oder_init{
//    XYOrderDetailSubClassOrderDetailVC * orderDetailVC = [[XYOrderDetailSubClassOrderDetailVC alloc]init];
//    orderDetailVC.order_ID = self.aliasCode;
//    orderDetailVC.isOrderConfirmPush = YES;
//    [self.navigationController pushViewController:orderDetailVC animated:YES];
    JXMyOrderDetailsViewController * myOrderDetailsViewController = [[JXMyOrderDetailsViewController alloc]init];
    myOrderDetailsViewController.orderID = self.aliasCode;
    [self.navigationController pushViewController:myOrderDetailsViewController animated:YES];
}

-(void)playAlipay:(NSString *)alipay aliasCode:(NSString*)aliasCode{
    
    self.aliasCode = aliasCode;
    WeakSelf;
    [[NSUserDefaults standardUserDefaults]setObject:@"4" forKey:@"wx"];
    [XYPay alipay:alipay success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        XYPlaAlBBModel *plaAlBBModel=[XYPlaAlBBModel mj_objectWithKeyValues:responseObject];
        NSLog(@"%@",plaAlBBModel);
        if ([plaAlBBModel.resultStatus isEqualToString:@"9000"]) {
            [[NSUserDefaults standardUserDefaults]setObject:@"5" forKey:@"wx"];
            [weakSelf pushcontroller];
            
        }else{
            [[NSUserDefaults standardUserDefaults]setObject:@"6" forKey:@"wx"];
//            [weakSelf.navigationController popViewControllerAnimated:YES];
//            [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:plaAlBBModel.memo dismissTimeInterval:1.0];

//            XYOrderDetailSubClassOrderDetailVC * orderDetailVC = [[XYOrderDetailSubClassOrderDetailVC alloc]init];
//            orderDetailVC.order_ID = aliasCode;
//            orderDetailVC.isOrderConfirmPush = YES;
//            [weakSelf.navigationController pushViewController:orderDetailVC animated:YES];
            JXMyOrderDetailsViewController * myOrderDetailsViewController = [[JXMyOrderDetailsViewController alloc]init];
            myOrderDetailsViewController.orderID = aliasCode;
            [self.navigationController pushViewController:myOrderDetailsViewController animated:YES];
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

-(void)unionpay:(NSString *)alipay OderID:(NSString*)aliasCode{
    
    self.aliasCode = aliasCode;
    WeakSelf;
    [[NSUserDefaults standardUserDefaults]setObject:@"4" forKey:@"wx"];
    [XYPay alipay:alipay success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        XYPlaAlBBModel *plaAlBBModel=[XYPlaAlBBModel mj_objectWithKeyValues:responseObject];
        NSLog(@"%@",plaAlBBModel);
        if ([plaAlBBModel.resultStatus isEqualToString:@"9000"]) {
            [[NSUserDefaults standardUserDefaults]setObject:@"5" forKey:@"wx"];
            [weakSelf pushcontroller];
            
        }else{
            [[NSUserDefaults standardUserDefaults]setObject:@"6" forKey:@"wx"];
            //            [weakSelf.navigationController popViewControllerAnimated:YES];
//            [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:plaAlBBModel.memo dismissTimeInterval:1.0];
            
//            XYOrderDetailSubClassOrderDetailVC * orderDetailVC = [[XYOrderDetailSubClassOrderDetailVC alloc]init];
//            orderDetailVC.order_ID = aliasCode;
//            orderDetailVC.isOrderConfirmPush = YES;
//            [weakSelf.navigationController pushViewController:orderDetailVC animated:YES];
            JXMyOrderDetailsViewController * myOrderDetailsViewController = [[JXMyOrderDetailsViewController alloc]init];
            myOrderDetailsViewController.orderID = aliasCode;
            [self.navigationController pushViewController:myOrderDetailsViewController animated:YES];
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}


#pragma mark - pay view
- (void)showPayView
{
    XYConfirmOrderPayPickView * payPickView = [[XYConfirmOrderPayPickView alloc]initWithPayTotal:self.orderOcsModel.totalPayPrice balanceString:self.orderModel.depositBalance paymentTypes:self.paymentTypeModel.paymentArr];
    payPickView.delegate = self;
    [payPickView show];
}

#pragma mark - pay password
- (void)showSettingPassWord
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"" message:@"未设置支付密码，请设置支付密码" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    WeakSelf;
    [alert addAction:[UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        XYPayPasswordSettingVC * settingVC = [[XYPayPasswordSettingVC alloc]init];
        [weakSelf.navigationController pushViewController:settingVC animated:YES];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - update data
/** 更新 列表数据 */
- (void)updateTableViewData
{
   
    [self changeHeaderHeight];
    
    if (self.orderOcsModel.buyItems.count != 0) {
        self.goodsListTVC.dataSource = self.orderOcsModel.buyItems;
    }
    
//    self.paymentRemarkVC.accountString = self.orderOcsModel.totalOrderProductPrice;
    //2017-11-29 屏蔽 位置调整
//    [self.paymentRemarkVC remarkSectionUpdateAccountString:self.orderOcsModel.totalOrderProductPrice deliverMoneyString:self.orderOcsModel.totalDeliveryFee];
//    总价提交订单
    self.orderBottomVC.totalString = self.orderOcsModel.totalPayPrice;
//    self.orderBottomVC.totalDiscountLbStr=self.orderOcsModel.totalOrderDiscount;setOrderOcsModel
//    self.priceTVC.orderOcsModel = self.orderOcsModel;
    [self.priceTVC setOrderOcsModel:self.orderOcsModel isHide:self.notUse]; NSLog(@"%@",self.orderOcsModel.totalUsedCardAmount);
    if (self.orderOcsModel.totalCanUseCardSize != nil && [self.orderOcsModel.totalCanUseCardSize integerValue] == 0) {
//        self.couponVC.price.text = [NSString stringWithFormat:@"- ￥%@",self.orderOcsModel.totalUsedCardAmount];
//        self.couponVC.numberOupons.text = [NSString stringWithFormat:@"%@张可用",self.orderOcsModel.totalCanUseCardSize];
        
    }else{
        self.couponVC.price.text = [NSString stringWithFormat:@"- ￥%@",self.orderOcsModel.totalUsedCardAmount];
//        self.couponVC.numberOupons.text = [NSString stringWithFormat:@"已选择%@张",self.orderOcsModel.totalCanUseCardSize];
        
        
    }
    
    [self.couponVC hide:self.orderOcsModel.totalCanUseCardSize];
    if (self.orderOcsModel.totalUsedCardSize != nil && [self.orderOcsModel.totalUsedCardSize integerValue] >0) {
          self.couponVC.numberOupons.text = [NSString stringWithFormat:@"已选择%@张",self.orderOcsModel.totalUsedCardSize];
        self.couponVC.price.text = [NSString stringWithFormat:@"- ￥%@",self.orderOcsModel.totalUsedCardAmount];
    }else{
        
            self.couponVC.numberOupons.text = [NSString stringWithFormat:@"%@张可用",self.orderOcsModel.totalCanUseCardSize];
        
    }
//    发票
    if (![self.orderModel.invoiceInfo.displayInvoiceKey isEqualToString:@"0"]&&self.orderModel.invoiceInfo.displayInvoiceKey) {
        self.invoiceSubVC.invoiceInfoModel = self.orderModel.invoiceInfo;
    }
    
    
//    自提还是送货上门
    self.addressHeaderVC.deliveryWayArr = [self.orderOcsModel.availableDeliveryRuleResults copy];
    
    self.addressHeaderVC.cartId = self.orderOcsModel.cartId;
    self.addressHeaderVC.deliveryId = self.orderOcsModel.selectedDeliveryRuleId;//配送方式id。
//    提示
    self.addressHeaderVC.warnLab.text=[NSString stringWithFormat:@" %@",self.orderOcsModel.deliveryRuleTips];
    
//    for (XYOrderFromDetailAvailableDeliveryRuleResultsModel *model in self.orderOcsModel.availableDeliveryRuleResults) {
////        if ([self.orderOcsModel.selectedDeliveryRuleId isEqualToString:model.deliveryRule_id]) {
//////            self.addressHeaderVC.warnLab.text=[NSString stringWithFormat:@"  %@",[model.DEScription stringByReplacingOccurrencesOfString:@"\n" withString:@""]];
////        }
//    }
   
    self.addressHeaderVC.deliveryWay = self.orderOcsModel.selectedDeliveryRuleName;//配送方式
    
//        self.addressHeaderVC.isdefault = NO;
    self.addressHeaderVC.ponitInfoModel = self.orderOcsModel.deliveryPointInfo;
   
    self.addressHeaderVC.addressModel = self.orderModel.deliveryAddress;//这个是收货地址，判断收货地址id即可
//    积分
    self.integralViewController.integralModel=self.orderOcsModel.integral;
    self.pointsDescriptionView.pointsArray=self.orderOcsModel.integral.integralDesc;
//    if ([one isEqualToString:@"1"]&& self.orderModel.deliveryAddress.address != nil) {
//        one=@"2";
//        [self.addressHeaderVC selectWay:self.orderOcsModel.selectedDeliveryRuleName adressID:@""];
//    }
//    发票弹窗
    [self.popExplainView setPop:self.orderModel.invoiceInfo.invoiceDesc];
        [self.tableView reloadData];
    
 
}

#pragma mark - data net

/** 预提交 数据 */
- (void)netOrderFromData:(NSString *)show
{
    WeakSelf;
    [XYOrderAllNet netOrderFormBlock:show netBlock:^(NSDictionary *blockDictionary, NSError *error) {
        [_tableView.mj_header endRefreshing];
        if (error == nil) {
            
//            XYLog(@"  shopping cart list  %@",blockDictionary);
            NSDictionary * cartsDict = [XYCommon removeNull:blockDictionary];
            weakSelf.orderModel = [XYOrderFromDetailModel mj_objectWithKeyValues:cartsDict];
            
            
            NSArray * ocsArray = [blockDictionary objectForKey:@"ocs"];
            if (ocsArray.count == 0) {
                return ;
            }
            NSDictionary * ocsDict = ocsArray.firstObject;
            weakSelf.orderOcsModel = [XYOrderFromDetailocsModel mj_objectWithKeyValues:ocsDict];
            
            
            [weakSelf updateTableViewData];

        }
    }];
}



-(void)changeHeaderHeight{

    for (XYOrderFromDetailAvailableDeliveryRuleResultsModel *model in self.orderOcsModel.availableDeliveryRuleResults) {
        if ([model.deliveryRule_id isEqualToString:self.orderOcsModel.selectedDeliveryRuleId]) {
            if ([model.supportDP boolValue]&&![self.orderOcsModel.deliveryPointInfo.delivery_id isEqualToString:@""]) {
                self.addressHeaderVC.isdefault = YES;
            }else
            {
                self.addressHeaderVC.isdefault = NO;
            }
        }
    }
    if (self.orderOcsModel.availableDeliveryRuleResults.count == 0) {
        self.addressHeaderVC.isdefault = NO;
    }
    int heat=30;
    NSLog(@"%@",self.orderOcsModel.deliveryRuleTips);
//    if (self.orderOcsModel.deliveryRuleTips.length>0||![self.orderOcsModel.deliveryRuleTips isEqualToString:@"null"]||![self.orderOcsModel.deliveryRuleTips isEqualToString:@""]) {
//        heat=0;
//    }
    if (self.orderModel.deliveryAddress.address.length!=0&&self.orderOcsModel.deliveryRuleTips.length>0) {
        
        heat=0;
    }else if(self.orderModel.deliveryAddress.address.length==0&&self.orderOcsModel.deliveryRuleTips.length>0){
        heat=30;
    }else if (self.orderModel.deliveryAddress.address.length!=0&&self.orderOcsModel.deliveryRuleTips.length==0){
        if (self.addressHeaderVC.isdefault) {
            self.orderOcsModel.deliveryRuleTips=@" 提示:到店自提订单,需订单状态为”待收货“才能到店提货！";
            heat= 0;
        }else{
          heat=30;
        }
        
        
    }
    NSLog(@"%@",self.orderModel.deliveryAddress.address);
    if (self.orderModel.deliveryAddress.address.length!=0) {
        if (self.addressHeaderVC.isdefault) {
            if (self.orderOcsModel.deliveryRuleTips.length>1) {
                _headerView.frame = CGRectMake(0, 0, XYScreenW, 199);
                [self.addressHeaderVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(199);
                }];
            }
//            else{
//                _headerView.frame = CGRectMake(0, 0, XYScreenW, 199-30);
//                [self.addressHeaderVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
//                    make.height.mas_equalTo(199-30);
//                }];
//            }
           
        }else
        {
            _headerView.frame = CGRectMake(0, 0, XYScreenW, 139-heat);//提示去掉139 --30
            [self.addressHeaderVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(139-heat);
            }];
        }
    }else
    {
        _headerView.frame = CGRectMake(0, 0, XYScreenW, 139-heat-44);//提示去掉139 --30
        [self.addressHeaderVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(139-heat-44);
        }];
        
    }
   

    [self.tableView reloadData];
//    [_tableView beginUpdates];
//    [_tableView setTableHeaderView:_headerView];// 关键是这句话
//    [_tableView endUpdates];
   
}

-(void)pushShopController{
//    UIStoryboard *board=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    //这个字符串是你要跳转面板的名字
//    JXShopCouponViewController *main =[board instantiateViewControllerWithIdentifier:@"JXShopCouponID"];
    JXHhopAvailableViewController *main=[[JXHhopAvailableViewController alloc]initWithNibName:@"JXHhopAvailableViewController" bundle:nil];
    NSLog(@"%@",self.cartId);
    main.cartId=self.cartId;
     NSLog(@"%@",main.cartId);
    [self.navigationController pushViewController:main animated:YES];
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
