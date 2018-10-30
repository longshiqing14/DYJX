//
//  Order settlement  Order settlement  Order settlement  Order settlement  Order settlement  JXOrderSettlementViewController.m
//  user
//  订单结算页
//  Created by liu_yakai on 2018/3/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXOrderSettlementViewController.h"
#import "JXOderGoodsCell.h"
#import "JXOderCell.h"
#import "JXOderRemarksCell.h"
#import "JXOderPromptView.h"
#import "JXOderIntegralCell.h"
#import "JXOderFootView.h"
#import "JXOderAddressView.h"
#import "JXOderSettlementModel.h"
#import "JXOderDistributionTypeView.h"
#import "JXOderGoodsHeadView.h"
#import "JXMyGoodsFootView.h"
#import "JXOrderPricelCell.h"
#import "NetWorkTool.h"
#import "JXPointsDescriptionView.h"
#import "JXPopExplainView.h"
#import "XYConfirmOrderInvoiceVC.h"
#import "JXDeliverWayVC.h"
#import "JXOderInvoiceView.h"
#import "JXOrderSettlementLineFootView.h"



#import "JXHhopAvailableViewController.h"
#import "XYPayOrderSuccessVC.h"
#import "XYOrderAllNet.h"
#import "JXOrderConfirmPaymentTypeModel.h"
#import "XYPopInputPasswordView.h"
#import "XYOrderConfirmModel.h"
#import "XYPay.h"
#import "JXAppyChinaPayModel.h"
//#import "XYOrderDetailSubClassOrderDetailVC.h"
#import "JXMyOrderDetailsViewController.h"
#import "XYConfirmOrderPayPickView.h"
#import "XYPayPasswordSettingVC.h"
#import "XYShoppingCartNet.h"
#import "XYDelieveryAddressVC.h"

static NSString *cellID=@"cellID";
static NSString *cellID1=@"cellID1";
static NSString *cellID2=@"cellID2";
static NSString *cellID3=@"cellID3";
static NSString *cellID4=@"cellID4";

@interface JXOrderSettlementViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,XYConfirmOrderPayPickViewDelegate,XYConfirmOrderInvoiceVCDelegate,XYDeliveryWayPopViewDelegate,XYPopInputPassViewDelegate,XYDelieveryAddressVCDelegate>{
    //积分
    NSString *integral;
//    多少品是否打开
    BOOL isOpenAndClose;
    NSString *orderNotes;
    NSString *iphoneNumber;
    

    XYPopInputPasswordView *popView;
    Payment_Type paymentType;
    NSString *xyPlayType;
    

}
@property(nonatomic,strong)NSString *oderIDNumber;
/** 第三方支付 失败跳转 订单详情需要传订单号 */
@property (strong, nonatomic) NSString * aliasCode;
/** 余额支付 金额 */
@property(strong,nonatomic) NSString * balancePayTotal ;
/** 第三方 支付金额 */
@property(strong,nonatomic) NSString * needPayTotal ;
@property (nonatomic,strong) JXOrderConfirmPaymentTypeModel *paymentTypeModel;


@property(nonatomic,strong)UITableView *orderSettlementTableView;
@property(nonatomic,strong)NSMutableArray *orderSettlementArray;
@property(nonatomic,strong)JXOderSettlementModel *oderSettlementModel;
@property(nonatomic,strong)JXOderOcsModel *oderOcsModel;
@property(nonatomic,strong)JXOderFootView *oderFootView;
@property(nonatomic,strong)JXPointsDescriptionView *pointsDescriptionView;
@property(nonatomic,strong)JXPopExplainView *popExplainView;
@end

@implementation JXOrderSettlementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"订单结算";
    integral=@"0";
    [self orderSettlementUI];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(receiveNotificiation:) name:@"play" object:nil];
    [center addObserver:self selector:@selector(receiveNotificiationUN:) name:@"playUN" object:nil];
    
    [center addObserver:self selector:@selector(oder_init) name:@"playWX" object:nil];
    [center addObserver:self selector:@selector(oder_init) name:@"playAlbb" object:nil];
    [center addObserver:self selector:@selector(oder_init) name:@"playUNC" object:nil];
    
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


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self oderSettlementData:integral];
}

-(JXOderFootView *)oderFootView{
    if(!_oderFootView){
        WeakSelf;
        _oderFootView=[[[NSBundle mainBundle]loadNibNamed:@"JXOderFootView" owner:self options:nil] lastObject];
        _oderFootView.ClockSubmit = ^{
            
            [weakSelf orderConfirmOrderBottomButtonClick];
        };
    }
    return _oderFootView;
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

-(NSMutableArray *)orderSettlementArray{
    if (!_orderSettlementArray) {
        _orderSettlementArray=[[NSMutableArray alloc]init];
    }
    return _orderSettlementArray;
}

-(void)oderSettlementData:(NSString *)integralShow{
    NSMutableDictionary * urlDict = [NSMutableDictionary dictionary];
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    NSString *isAutoUseCard=[user objectForKey:@"Available"];
    if (isAutoUseCard) {
        [urlDict setObject:@"0" forKey:@"isAutoUseCard"];
    }else{
        [urlDict setObject:@"1" forKey:@"isAutoUseCard"];
    }
    [urlDict setObject:integralShow forKey:@"integralShow"];
    WeakSelf;
    [self network:urlDict relativePath:kJXAPI_user_orderForm ShowAndDismiss:YES success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        _oderSettlementModel=[JXOderSettlementModel modelWithJSON:responseObject];
        if (_oderSettlementModel.ocs.count>0) {
            _oderOcsModel=_oderSettlementModel.ocs[0];

        }
        [weakSelf orderSettlementData];
        [weakSelf.orderSettlementTableView.mj_header endRefreshing];

        [weakSelf.orderSettlementTableView reloadData];
        NSLog(@"%@",_oderSettlementModel);
    } failure:^{
        
    } UnusualFailure:^{
        
    }];
}

-(void)orderSettlementData{
    [self.orderSettlementArray removeAllObjects];
    [self.orderSettlementArray addObject:@[]];
    [self.orderSettlementArray addObject:@[]];
//    自提
    NSMutableArray *distributionType=[[NSMutableArray alloc]init];
    [distributionType addObject:@{@"title":@"自提地址：",@"value":[NetWorkTool stringManipulation:_oderOcsModel.deliveryPointInfo.address]}];
    [distributionType addObject:@{@"title":@"联系电话：",@"value":[NetWorkTool stringManipulation:_oderOcsModel.deliveryPointInfo.mobile]}];
    [self.orderSettlementArray addObject:distributionType];
//    商品
     [self.orderSettlementArray addObject:_oderOcsModel.buyItems];
//订单备注
    [self.orderSettlementArray addObject:@[@{@"title":@"订单留言",@"value":@"请输入您的订单留言（30字内）"},@{@"title":@"推荐人手机号码",@"value":@"请输入推荐人手机号码"}]];
    NSMutableArray *invoiceArray=[[NSMutableArray alloc]init];
    if ([_oderSettlementModel.invoiceInfo.needInvoiceKey isEqualToString:@"yes"]) {
        if ([_oderSettlementModel.invoiceInfo.invoiceTypeKey isEqualToString:@"vat"]) {
            [invoiceArray addObject:@{@"title":@"抬头：",@"value":[NetWorkTool stringfilter:_oderSettlementModel.invoiceInfo.invoiceTitle]}];
            [invoiceArray addObject:@{@"title":@"纳税识别号：",@"value":[NetWorkTool stringfilter:_oderSettlementModel.invoiceInfo.invoiceCertificate]}];
        }else if([_oderSettlementModel.invoiceInfo.invoiceTypeKey isEqualToString:@"com"]){
            [invoiceArray addObject:@{@"title":@"抬头：",@"value":[NetWorkTool stringfilter:_oderSettlementModel.invoiceInfo.invoiceUserName]}];
        }
    }
    
    
    [self.orderSettlementArray addObject:invoiceArray];

//    totalUsedCardSize>0已经选择多少张优惠券totalUsedCardSize用自字段显示选择了多少张优惠券
//    totalUsedCardSize<=0有多少优惠券可用totalCanUseCardSize用此字段显示有多少张可用
//    优惠券是否隐藏totalCanUseCardSize是否不等0  0为隐藏其他为显示
//    totalUsedCardAmount优惠券钱数
    NSLog(@"%@",_oderOcsModel.totalCanUseCardSize);
    NSMutableArray *discountArray=[[NSMutableArray alloc]init];
    [discountArray addObject:@{@"title":@"优惠券",@"value":[NetWorkTool stringManipulation:_oderOcsModel.totalCanUseCardSize],@"sub":_oderOcsModel.totalUsedCardSize,@"subvalue":_oderOcsModel.totalUsedCardAmount}];
    
//    integralDisplay==1 是否打开控件
//    可用多少积分 抵扣多少钱
//    相反则为共有多少积分当前不可用
//    integralBalance总积分
//    integralShow 积分按钮是否打开 integralShow==1打开
//    integralPrice积分抵扣多少钱
 
    [discountArray addObject:@{@"title":@"积分",@"value":[NetWorkTool stringManipulation:_oderOcsModel.integral.integralShow],@"sub":_oderOcsModel.integral.integralBalance,@"subvalue":[NetWorkTool stringManipulation:_oderOcsModel.integral.integralPrice],@"subvalue1":_oderOcsModel.integral.integralDisplay}];
    [self.orderSettlementArray addObject:discountArray];
    NSMutableArray *calculationArray =[[NSMutableArray alloc]init];
    
    [calculationArray addObject:@{@"title":@"商品总额",@"value":[NSString stringWithFormat:@"￥%@",_oderOcsModel.totalOrderProductPrice]}];
    if (![[NetWorkTool stringManipulation:_oderOcsModel.totalOrderDiscount] isEqualToString:@""]) {
        _oderOcsModel.totalOrderDiscount=[NSString stringWithFormat:@"-￥%@",_oderOcsModel.totalOrderDiscount];
    }
    [calculationArray addObject:@{@"title":@"优惠金额",@"value":[NetWorkTool stringManipulation:_oderOcsModel.totalOrderDiscount]}];
    if (![[NetWorkTool stringManipulation:_oderOcsModel.totalUsedCardAmount] isEqualToString:@""]) {
        _oderOcsModel.totalUsedCardAmount=[NSString stringWithFormat:@"-￥%@",_oderOcsModel.totalUsedCardAmount];
    }
    [calculationArray addObject:@{@"title":@"优惠券",@"value":[NetWorkTool stringManipulation:_oderOcsModel.totalUsedCardAmount]}];
//    处理积分关闭
    if ([integral isEqualToString:@"1"]) {
        if (![[NetWorkTool stringManipulation:_oderOcsModel.integral.integralPrice] isEqualToString:@""]) {
            _oderOcsModel.integral.integralPrice=[NSString stringWithFormat:@"-￥%@",_oderOcsModel.integral.integralPrice];
        }
        [calculationArray addObject:@{@"title":@"积分抵扣",@"value":[NetWorkTool stringManipulation:_oderOcsModel.integral.integralPrice]}];
    }else{
        [calculationArray addObject:@{@"title":@"积分抵扣",@"value":@""}];
    }
    
    [calculationArray addObject:@{@"title":@"配送费",@"value":[NSString stringWithFormat:@"+￥%@",_oderOcsModel.totalDeliveryFee]}];
    self.pointsDescriptionView.pointsArray=_oderOcsModel.integral.integralDesc;
    [self.popExplainView setPop:_oderSettlementModel.invoiceInfo.invoiceDesc];
    [self.orderSettlementArray addObject:calculationArray];
    [self orderLayer];
    [self.oderFootView foot_init:_oderOcsModel.totalPayPrice];
}

-(void)orderSettlementUI{
    WeakSelf;
    [self.orderSettlementTableView registerNib:[UINib nibWithNibName:@"JXOderGoodsCell" bundle:nil] forCellReuseIdentifier:cellID];
    [self.orderSettlementTableView registerNib:[UINib nibWithNibName:@"JXOderRemarksCell" bundle:nil] forCellReuseIdentifier:cellID1];
    [self.orderSettlementTableView registerNib:[UINib nibWithNibName:@"JXOderCell" bundle:nil] forCellReuseIdentifier:cellID2];
    [self.orderSettlementTableView registerNib:[UINib nibWithNibName:@"JXOderIntegralCell" bundle:nil] forCellReuseIdentifier:cellID3];
    [self.orderSettlementTableView registerNib:[UINib nibWithNibName:@"JXOrderPricelCell" bundle:nil] forCellReuseIdentifier:cellID4];
    self.orderSettlementTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf oderSettlementData:integral];
    }];
    
   
    
    [self.view addSubview:self.orderSettlementTableView];
    
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

-(void)orderLayer{
     [self.view addSubview:self.oderFootView];
    [self.oderFootView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(49);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
    }];
    [self.orderSettlementTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(_oderFootView.mas_top);
    }];
}

-(UITableView *)orderSettlementTableView{
    if (!_orderSettlementTableView) {
        _orderSettlementTableView=[[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        _orderSettlementTableView.separatorStyle =NO;
        _orderSettlementTableView.backgroundColor =XYRGBAColor(244, 244, 244, 1);
        _orderSettlementTableView.backgroundView =nil;
        _orderSettlementTableView.tableFooterView=[[UIView alloc]init];
        _orderSettlementTableView.tableHeaderView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        _orderSettlementTableView.delegate=self;
        _orderSettlementTableView.dataSource=self;
    }
    return _orderSettlementTableView;
}

// 返回多少组,没实现该方法,默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.orderSettlementArray.count;
}

// 返回第section组中有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==3&&!isOpenAndClose) {
        NSInteger count=[self.orderSettlementArray[section] count];
        return count>3?3:count;
    }
    return [self.orderSettlementArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WeakSelf;
   if (indexPath.section==3){
       JXOderBuyItemsModel *oderBuyItemsModel=self.orderSettlementArray[indexPath.section][indexPath.row];
//        商品cell
        JXOderGoodsCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
       [cell cell_init:oderBuyItemsModel];
        return cell;
    }else if (indexPath.section==4){
//        订单备注
        JXOderRemarksCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID1 forIndexPath:indexPath];
        [cell cell_init:self.orderSettlementArray[indexPath.section][indexPath.row] IndexPath:indexPath];
        cell.cellOrderNotesTextField.tag=1000+indexPath.row;
        cell.cellOrderNotesTextField.delegate=self;
        return cell;
    }else if (indexPath.section==6){
        if (indexPath.row==0) {
//            发票cell和优惠券cell
            JXOderCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID2 forIndexPath:indexPath];
//            cell.ClockPop = ^{
//                NSLog(@"发票弹框");
//                [weakSelf.popExplainView bombBoxPOP];
//            };
            NSDictionary *dic=self.orderSettlementArray[indexPath.section][indexPath.row];
//            if (indexPath.row==0) {
////                发票
//                [cell cell_init:dic Index:indexPath.row];
//            }else{
//                优惠券
                [cell cell_init:dic Index:indexPath.row];
//            }
            return cell;
        }else{
            JXOderIntegralCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID3 forIndexPath:indexPath];
            cell.ClockPop = ^{
                NSLog(@"积分天窗");
                [weakSelf.pointsDescriptionView bombBoxPOP];
            };
            cell.ClockSwitch = ^(BOOL openAndClose) {
                NSLog(@"积分是否打开或关闭");
                NSLog(@"ifReadOnly value: %@" ,openAndClose?@"YES":@"NO");
                if (openAndClose) {
                    integral=@"1";
                    [weakSelf oderSettlementData:integral];
                }else{
                    integral=@"0";
                    [weakSelf oderSettlementData:integral];
                }
            };
//            积分
            NSDictionary *dic=self.orderSettlementArray[indexPath.section][indexPath.row];
            [cell cell_init:dic];
            return cell;
        }
    }else{
            //        配送方式的联系人cell 配送费 商品总额 优惠金额 优惠券 积分抵扣
            JXOrderPricelCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID4 forIndexPath:indexPath];
        NSLog(@"%@",self.orderSettlementArray[indexPath.section][indexPath.row]);
        NSDictionary *dic=self.orderSettlementArray[indexPath.section][indexPath.row];
        [cell cell_init:dic IndexPath:indexPath];
            return cell;
        
    }
    
}

// 在设置每行cell的高度，header的高度，footer的高度
// 设置某行cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section==2) {
////        自提地址和自提电话的高度
//        NSDictionary *dic=self.orderSettlementArray[indexPath.section][indexPath.row];
//        if ([[dic valueForKey:@"value"] isEqualToString:@""]) {
//            return 0;
//        }
//        return 30;
//    }else
        if (indexPath.section==3) {
//        商品高度
        return 120;
    }else if (indexPath.section==4||indexPath.section==6) {
//        优惠券是否显示
        if (indexPath.section==6&&indexPath.row==0&&[_oderOcsModel.totalCanUseCardSize intValue]<=0) {
            return 0;
        }else if (indexPath.section==4){
            
            return 54;
        }
        return 44;
    }else if (indexPath.section==0||indexPath.section==1){
        return 0;
    }else{
        NSLog(@"%ld    %ld",(long)indexPath.section,(long)indexPath.row);
        NSLog(@"%@",self.orderSettlementArray[indexPath.section]);
        NSDictionary *dic=self.orderSettlementArray[indexPath.section][indexPath.row];
        if ([[dic valueForKey:@"value"] isEqualToString:@""]) {
            return 0;
        }
        return 30;

    }
}
// 设置header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    提示永远会出现
    if (section==0) {
//        判断是否为送货上门
        if ([_oderOcsModel.selectedDeliveryRuleName isEqualToString:@"送货上门"]) {
//            判断是否有提示信息
            if (_oderOcsModel.deliveryRuleTips.length>0) {
                return 30;
            }
        }else{
//            没选择地址的时候没有提示信息
            if ([_oderOcsModel.selectedDeliveryRuleName isEqualToString:@""]) {
                return CGFLOAT_MIN;
            }
//            到店自提永远显示提示信息
            return 30;
        }
//
    }else if (section==1){
//        选择了地址
        return 70;
    }else if (section==2||section==3){
//        配送方式
//        没有地址就没有任何配送方式则不显示
        if (section==2&&[_oderOcsModel.selectedDeliveryRuleName isEqualToString:@""]) {
            return CGFLOAT_MIN;
        }
        //商品清单
        return 44;
    }else if (section==4){
        return 10;
    }else if (section==5){
        return 44;
    }
    return CGFLOAT_MIN;
}

// 设置第section分组的header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    WeakSelf;
    if (section==0) {
        JXOderPromptView *oderPromptView=[[[NSBundle mainBundle]loadNibNamed:@"JXOderPromptView" owner:self options:nil]lastObject];
        [oderPromptView oderPrpmpInit:_oderOcsModel];
        return oderPromptView;
    }else if (section==1){
        if (_oderSettlementModel.deliveryAddress) {
            JXOderAddressView *oderAddressView=[[[NSBundle mainBundle]loadNibNamed:@"JXOderAddressView" owner:self options:nil]lastObject];
            [oderAddressView oderAddress:_oderSettlementModel.deliveryAddress];
            oderAddressView.SelectAddressClock = ^{
                NSLog(@"选择地址");
                [weakSelf addressController];
            };
            return oderAddressView;
        }
    }else if (section==2){
        JXOderDistributionTypeView *oderDistributionTypeView=[[[NSBundle mainBundle]loadNibNamed:@"JXOderDistributionTypeView" owner:self options:nil]lastObject];
        [oderDistributionTypeView oderDistributionInit:_oderOcsModel.selectedDeliveryRuleName];
        if (self.oderOcsModel.availableDeliveryRuleResults.count<2) {
            oderDistributionTypeView.iamgeView.hidden=YES;
        }else{
            oderDistributionTypeView.iamgeView.hidden=NO;
        }
        oderDistributionTypeView.SelectClock = ^{
            NSLog(@"自提还是送货上门");
            [weakSelf pushDeliverWayVC];
        };
        return oderDistributionTypeView;
    }else if (section==3){
        JXOderGoodsHeadView *oderGoodsHeadView=[[[NSBundle mainBundle]loadNibNamed:@"JXOderGoodsHeadView" owner:self options:nil]lastObject];
        return oderGoodsHeadView;
    }else if (section==4){
        return [self lineHeadView];
    }else if (section==5){
        JXOderInvoiceView *oderInvoiceView=[[[NSBundle mainBundle]loadNibNamed:@"JXOderInvoiceView" owner:self options:nil]lastObject];
        [oderInvoiceView invoice_init:_oderSettlementModel.invoiceInfo];
        oderInvoiceView.ClockPop = ^{
            NSLog(@"发票弹框");
            [weakSelf.popExplainView bombBoxPOP];
        };
        oderInvoiceView.Clock = ^{
              [weakSelf pushInvoiceController];
        };
        return oderInvoiceView;
    }
    return [UIView new];
    
}

-(void)addressController{
    XYDelieveryAddressVC *addressVC = [[XYDelieveryAddressVC alloc] init];
    addressVC.delegate = self;
    addressVC.type = @"1";
    [self.navigationController pushViewController:addressVC animated:YES];
}

-(void)selectAddressWith:(XYAddressListModel *)model{
    
}

// 设置footer高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==3&&!isOpenAndClose) {
        NSArray *array= self.orderSettlementArray[section];
        return array.count>3?44:CGFLOAT_MIN;
    }else if(section==3||section==6||section==4){
        if (section==3||section==4) {
            return CGFLOAT_MIN;
        }
        return 10;
    }else if (section==2||section==7||section==5){
        if (section==2) {
            if ([[NetWorkTool stringManipulation:_oderOcsModel.deliveryPointInfo.address] isEqualToString:@""]) {
                return 10;
            }
        }else if (section==5){
            if ([_oderSettlementModel.invoiceInfo.needInvoiceKey isEqualToString:@"no"]){
                return CGFLOAT_MIN;
            }else{
                return 15;
            }
        }
        return 25;
    }
    return CGFLOAT_MIN;
}
// 设置第section分组的footer
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==3&&!isOpenAndClose) {
        NSArray *array= self.orderSettlementArray[section];
        if (array.count>3) {
            WeakSelf;
            JXMyGoodsFootView *myGoodsFootView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyGoodsFootView" owner:self options:nil]lastObject];
            myGoodsFootView.Clock = ^(BOOL isOpen) {
                isOpenAndClose=isOpen;
                [weakSelf refreshSection:section];
            };
            return myGoodsFootView;
        }
        
    }else if (section==2||section==7||section==5){
        if (section==2) {
            if ([[NetWorkTool stringManipulation:_oderOcsModel.deliveryPointInfo.address] isEqualToString:@""]) {
                return [self lineHeadView];
            }
        }else if (section==5){
            if ([_oderSettlementModel.invoiceInfo.needInvoiceKey isEqualToString:@"no"]){
                return [UIView new];
            }
        }
        return  [self settlementLineFootView];

    }else if(section==3){
        return [self lineHeadView];
    }
    return [UIView new];
}

-(JXOrderSettlementLineFootView *)settlementLineFootView{
    JXOrderSettlementLineFootView *orderSettlementLineFootView=[[[NSBundle mainBundle]loadNibNamed:@"JXOrderSettlementLineFootView" owner:self options:nil]lastObject];
    return orderSettlementLineFootView;
}

-(UIView *)lineHeadView{
    UIView *headView=[[UIView alloc]init];
    headView.backgroundColor=XYRGBAColor(244, 244, 244, 1);
    return headView;
}

-(void)refreshSection:(NSInteger)section{
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:section];
    [self.orderSettlementTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"%ld",(long)textField.tag);
    if (textField.tag==1000) {
        orderNotes=textField.text;
    }else{
        iphoneNumber=textField.text;
    }
    
}




// cell选中时调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld   %ld",(long)indexPath.section,(long)indexPath.row);
    if (indexPath.section==6) {
        if (indexPath.row==0) {
           
            [self pushShopController];
    }
    }
}

-(void)pushDeliverWayVC{
    if (self.oderOcsModel.availableDeliveryRuleResults.count<2) {
        return;
    }
    JXDeliverWayVC *deliverWayVC=[[JXDeliverWayVC alloc]init];
    deliverWayVC.delegate=self; deliverWayVC.selectWayText=_oderOcsModel.selectedDeliveryRuleName;
    deliverWayVC.model.name = self.oderOcsModel.deliveryPointInfo.name;
    deliverWayVC.model.address = self.oderOcsModel.deliveryPointInfo.address;
    deliverWayVC.model.phone = self.oderOcsModel.deliveryPointInfo.mobile;
    deliverWayVC.model.shopId = self.oderOcsModel.deliveryPointInfo.sinceID;
    [self.navigationController pushViewController:deliverWayVC animated:YES];
}

//跳转发票页面
-(void)pushInvoiceController{
    XYConfirmOrderInvoiceVC * invoiceVC = [[XYConfirmOrderInvoiceVC alloc]init];
    invoiceVC.needInvoiceKey = self.oderSettlementModel.invoiceInfo.needInvoiceKey;
    invoiceVC.invoice_id = self.oderSettlementModel.invoiceInfo.invoiceInfoID;
    invoiceVC.delegate = self;
    [self.navigationController pushViewController:invoiceVC animated:YES];
}

#pragma mark - XYConfirmOrderInvoiceVCDelegate
- (void)updateInvoiceSuccess
{
    [self oderSettlementData:integral];
}

-(void)pushcontroller{
    XYPayOrderSuccessVC * paySuccessVC = [[XYPayOrderSuccessVC alloc]init];
    paySuccessVC.paymentAmountString = _oderOcsModel.totalPayPrice;
    paySuccessVC.paymentType=[self paymentPlayType:paymentType];
    [self.navigationController pushViewController:paySuccessVC animated:YES];
}

#pragma mark- 选择送货地址回调

-(void)selectWay:(NSString *)way adressID:(NSString*)adressID
{
    NSString *wayId = @"";
    
    for (JXOderAvailableDeliveryRuleResults *model in self.oderOcsModel.availableDeliveryRuleResults) {
        
        
        if ([[model.name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:[way stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]]) {
            //            NSString *strUrl = [NSString stringWithFormat:@"  %@",[model.DEScription stringByReplacingOccurrencesOfString:@"\n" withString:@""]];
            //            NSLog(@"%@",strUrl);
            //            self.warnLab.text=strUrl;
            wayId = model.deliveryID;
            break;
        }
        
    }
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (self.oderSettlementModel.deliveryAddress == nil) {
        param[@"addressId"] = self.oderSettlementModel.deliveryAddress.addressID;
    }else
    {
        param[@"addressId"] = self.oderSettlementModel.deliveryAddress.addressID;
    }
    param[@"selectShopId"] = adressID;
    param[@"cartId"] = self.cartId;
    param[@"ruleId"] = wayId;
    WeakSelf;
    [XYShoppingCartNet netCartChangeDeliveryWayWithDic:param block:^(NSDictionary *blockDictionary, NSError *error) {
        
        if (error == nil) {
            [weakSelf oderSettlementData:integral];
//            weakSelf.deliverLab.text = way;
//            weakSelf.deliveryWay = way;
//
//
//            if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(needFatherViewChangeHeaderFrame)]) {
//                [weakSelf.delegate needReloadData];
//            }
        }
    }];
    
    
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


- (void)orderConfirmOrderBottomButtonClick
{
    
    if (_oderSettlementModel.deliveryAddress.address == nil) {
        [YDBAlertView showToast:@"请设置地址" dismissDelay:1.0];
        return;
    }else  if(![_oderOcsModel.selectedDeliveryRuleName isEqualToString:@"送货上门"]){
        if ([[NetWorkTool stringManipulation:_oderOcsModel.deliveryPointInfo.address] isEqualToString:@""]){
            [YDBAlertView showToast:@"请选择自提地址" dismissDelay:1.0];
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
    [XYOrderAllNet netOrderSubmitPay:money IphoneNumber:iphoneNumber depositPayPwd:psw memo:orderNotes Block:^(NSDictionary *blockDictionary, NSError *error) {
        
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
            [XYProgressHUD svHUDShowStyle:XYHUDStyleError title:appyChinaPayModel.RETURN_DESC dismissTimeInterval:1.0];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        [XYProgressHUD svHUDShowStyle:XYHUDStyleError title:@"连接异常" dismissTimeInterval:1.0];
    }];
}

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
                [XYProgressHUD svHUDShowStyle:XYHUDStyleError title:xyBaseModel.RETURN_DESC dismissTimeInterval:1.0];
                
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
    JXMyOrderDetailsViewController *myOrderDetailsViewController = [[JXMyOrderDetailsViewController alloc]init];
    myOrderDetailsViewController.orderID = self.aliasCode;
    myOrderDetailsViewController.isOrderSettlement=YES;
//    myOrderDetailsViewController.isOrderConfirmPush = YES;
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
            JXMyOrderDetailsViewController *myOrderDetailsViewController = [[JXMyOrderDetailsViewController alloc]init];
            myOrderDetailsViewController.isOrderSettlement=YES;

            myOrderDetailsViewController.orderID = aliasCode;
//            myOrderDetailsViewController.isOrderConfirmPush = YES;
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
            JXMyOrderDetailsViewController *myOrderDetailsViewController = [[JXMyOrderDetailsViewController alloc]init];
            myOrderDetailsViewController.isOrderSettlement=YES;

            myOrderDetailsViewController.orderID = aliasCode;
//            myOrderDetailsViewController.isOrderConfirmPush = YES;
            [self.navigationController pushViewController:myOrderDetailsViewController animated:YES];
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}


#pragma mark - pay view
- (void)showPayView
{
    XYConfirmOrderPayPickView * payPickView = [[XYConfirmOrderPayPickView alloc]initWithPayTotal:self.oderOcsModel.totalPayPrice balanceString:self.oderSettlementModel.depositBalance paymentTypes:self.paymentTypeModel.paymentArr];
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

-(void)pushShopController{
    //    UIStoryboard *board=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //    //这个字符串是你要跳转面板的名字
    //    JXShopCouponViewController *main =[board instantiateViewControllerWithIdentifier:@"JXShopCouponID"];
    JXHhopAvailableViewController *main=[[JXHhopAvailableViewController alloc]initWithNibName:@"JXHhopAvailableViewController" bundle:nil];
    NSLog(@"%@",self.cartId);
    main.cartId=_oderOcsModel.cartId;
    NSLog(@"%@",main.cartId);
    [self.navigationController pushViewController:main animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
