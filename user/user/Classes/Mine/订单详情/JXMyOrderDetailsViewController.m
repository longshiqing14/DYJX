//
//  MyOrderDetailsViewController.m
//  user
//
//  Created by liu_yakai on 2018/2/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyOrderDetailsViewController.h"
#import "JXMyOrderDetailsCell.h"
#import "JXMyDetailsGoodsCell.h"
#import "JXMyOderDetailsFootView.h"
#import "JXMyOderDetailsHeadView.h"
#import "JXMyOrderDetailsModel.h"
#import "JXMyGoodsFootView.h"
#import "JXMyOderClockFootView.h"
#import "NetWorkTool.h"
#import "JXMyOderDetailsAddressCell.h"
#import "JXMyOderDetailsDistributionHeatView.h"
#import "JXMyOderDetailsAddressCell.h"
#import "JXMyOderDeailsStateCell.h"
#import "JXElectronicInvoiceDetailPage.h"
#import "XYOrderDetailSubClassOrderStatusVC.h"
#import "JXConfirmSuccessViewController.h"
#import "XYOrderDetailPayPickView.h"
#import "XYPay.h"
#import "JXAppyChinaPayModel.h"
#import "XYPayOrderSuccessVC.h"
#import "JXRefundCashPage.h"
#import "JXMyAfterSaleDetailModel.h"
#import "JXMyAfterSaleDetailViewController.h"
#import "JXMyOderDeailsStateLineView.h"

@interface JXMyOrderDetailsViewController ()<UITableViewDelegate,UITableViewDataSource,XYOrderDetailPayPickViewDelegate>{
    JXMyOrderDetailsModel *myOrderDetailsModel;
    BOOL isOpenAndClose;
}
@property(nonatomic,strong)UITableView *myOrderDetailsTableView;
@property(nonatomic,strong)NSMutableArray *detailsArray;
@property(nonatomic,strong)JXMyOderClockFootView *myOderClockFootView;
@end

static NSString *cellID=@"cellID";
static NSString *cellID1=@"cellID1";
static NSString *cellID2=@"cellID2";
static NSString *cellID3=@"cellID3";

@implementation JXMyOrderDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"订单详情";
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(receiveNotificiationUN:) name:@"playUN" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotificiation:) name:@"play" object:nil];
    [self myOrderDetailsUI];
    
}

- (void)receiveNotificiationUN:(NSNotification*)sender{
    WeakSelf;
    NSString *key=[sender.userInfo valueForKey:@"code"];
    if ([key isEqualToString:@"success"]) {
        [weakSelf pushController:@"银联支付"];
    }else{
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"支付失败" dismissTimeInterval:1.0];
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

- (void)receiveNotificiation:(NSNotification*)sender{
    WeakSelf;
    XYPlaAlBBModel *plaAlBBModel=[XYPlaAlBBModel mj_objectWithKeyValues:sender.userInfo];
    NSLog(@"%@",plaAlBBModel);
    if ([plaAlBBModel.resultStatus isEqualToString:@"9000"]) {
        [weakSelf pushController:@"支付宝支付"];
    }else{
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"支付失败" dismissTimeInterval:1.0];
        
    }
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self networkData];
}

-(void)black_controller{
    if (self.isOrderSettlement) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else{
        [super black_controller];
    }
}

-(NSMutableArray *)detailsArray{
    if (!_detailsArray) {
        _detailsArray=[[NSMutableArray alloc]init];
    }
    return _detailsArray;
}


-(void)myOrderDetailsLayerOut{
    if ([JX_PAYMENT_ODERSTATE_CANCELED isEqualToString:myOrderDetailsModel.order.processStateInfo.state]) {
        [self.view addSubview:self.myOrderDetailsTableView];
        [self.myOrderDetailsTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            if (@available(iOS 11.0, *)) {
                make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.mas_equalTo(self.view);
            }
        }];
    }else{
        [self.view addSubview: self.myOderClockFootView];
        [self.myOderClockFootView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(60);
            if (@available(iOS 11.0, *)) {
                make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.mas_equalTo(self.view);
            }
        }];
        [self.view addSubview:self.myOrderDetailsTableView];
        [self.myOrderDetailsTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.bottom.mas_equalTo(_myOderClockFootView.mas_top);
        }];
    }
    
}

-(JXMyOderClockFootView *)myOderClockFootView{
    WeakSelf;
    if (!_myOderClockFootView) {
        _myOderClockFootView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyOderClockFootView" owner:self options:nil]lastObject];
            _myOderClockFootView.GulesButtonClock = ^(NSString *State) {
    //            红色按钮
                NSLog(@"%@",State);
                NSLog(@"红色按钮");
                [weakSelf clockRead:State];
            };
            _myOderClockFootView.BlackButtonClock = ^(NSString *State) {
    //            黑色按钮
                NSLog(@"%@",State);
                NSLog(@"黑色按钮");
                [weakSelf clockBlack:State];
            };
            _myOderClockFootView.ReturnButtonClock = ^{
                [weakSelf refund];
            };
    }
    [_myOderClockFootView myOder_init:myOrderDetailsModel.order.processStateInfo IsOrderRefund:myOrderDetailsModel.order.isOrderRefund];
    return _myOderClockFootView;
}

-(void)myOrderDetailsUI{
    [self.myOrderDetailsTableView registerNib:[UINib nibWithNibName:@"JXMyDetailsGoodsCell" bundle:nil] forCellReuseIdentifier:cellID];
    [self.myOrderDetailsTableView registerNib:[UINib nibWithNibName:@"JXMyOrderDetailsCell" bundle:nil] forCellReuseIdentifier:cellID1];
    [self.myOrderDetailsTableView registerNib:[UINib nibWithNibName:@"JXMyOderDetailsAddressCell" bundle:nil] forCellReuseIdentifier:cellID2];
    
    [self.myOrderDetailsTableView registerNib:[UINib nibWithNibName:@"JXMyOderDeailsStateCell" bundle:nil] forCellReuseIdentifier:cellID3];
    self.myOrderDetailsTableView.delegate=self;
    self.myOrderDetailsTableView.dataSource=self;
    // 下拉刷新
    WeakSelf;
    self.myOrderDetailsTableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf networkData];
        // 结束刷新
        //            [weakSelf.tableView.mj_header endRefreshing];
    }];
}

-(UITableView *)myOrderDetailsTableView{
    if (!_myOrderDetailsTableView) {
        _myOrderDetailsTableView=[[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        _myOrderDetailsTableView.separatorStyle =NO;
        _myOrderDetailsTableView.backgroundColor = XYRGBAColor(244, 244, 244, 1);
        
 _myOrderDetailsTableView.tableFooterView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        _myOrderDetailsTableView.tableHeaderView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
    }
    return _myOrderDetailsTableView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic= self.detailsArray[indexPath.section][indexPath.row];
    if (indexPath.section==0) {
//        退货退款申请进度高度
        if ([[dic valueForKey:@"value"] isEqualToString:@""]) {
            return 0;
        }
        return 44;
    }else
        if (indexPath.section==1) {
//        收件人view高度
        return 59;
    }else if (indexPath.section==2){
//        商品高度
        return 110;
    }else if (indexPath.section==8){
//        发票高度
        return 44;
    }else if (indexPath.section==7){
        if ([[dic valueForKey:@"title"] isEqualToString:@"留言："]) {
//                在自适应高度的基础上加
                return [self setIntroductionText:[dic valueForKey:@"value"]];
        }
        return 45;
    }else if (indexPath.section==4){
//        代付款出现其他隐藏
        if ([myOrderDetailsModel.order.processStateInfo.state isEqualToString:JX_PAYMENT_ODERSTATE_PENDINGPAYMENT]) {
            return 30;
        }else
        return 0;
    } else{
        NSLog(@"%ld   %ld",(long)indexPath.section,(long)indexPath.row);
        if ([[dic valueForKey:@"value"] isEqualToString:@""]) {
            return 0;
        }
        return 30;
    }
    return 0;
}

//赋值 and 自动换行,计算出cell的高度
-(CGFloat)setIntroductionText:(NSString*)textStr{
//    去除空字符串的情况出现高度
    if ([textStr isEqualToString:@""]) {
        return 0;
    }
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:textStr];
    
    CGRect infoRect =   [attrStr boundingRectWithSize:CGSizeMake(XYScreenW-100, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    
    return  infoRect.size.height+30;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.detailsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==2&&!isOpenAndClose) {
        NSInteger count=[self.detailsArray[section] count];
        return count>3?3:count;
    }

    return [self.detailsArray[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSArray *array= self.detailsArray[indexPath.section];
    if (indexPath.section==0||indexPath.section==8) {
        JXMyOderDeailsStateCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID3 forIndexPath:indexPath];
        [cell initCell:array[indexPath.row]];
        return cell;
    }else if (indexPath.section==1) {
        JXMyOderDetailsAddressCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID2 forIndexPath:indexPath];
        [cell cell_init:array[indexPath.row]];
        return cell;
    }else if (indexPath.section==2) {
        JXMyDetailsGoodsCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        [cell initCell:array[indexPath.row]];
        return cell;
    }else{
        JXMyOrderDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID1 forIndexPath:indexPath];
            [cell initCell:array[indexPath.row] OderState:myOrderDetailsModel.order.processStateInfo.state IndexPath:indexPath];
        
        
        return cell;
    }
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 60;
    }else if (section==6){
        return 43;
    }else if(section==0||section==1||section==2||section==4||section==8||section==5){
        if (section==1) {
            if ([[NetWorkTool stringManipulation:myOrderDetailsModel.order.applyStatus] isEqualToString:@""]) {
                return CGFLOAT_MIN;
            }else{
                return 10;
            }
        }else if (section==2){
            return 10;
        }else if (section==5){
            if ([myOrderDetailsModel.order.processStateInfo.state isEqualToString:JX_PAYMENT_ODERSTATE_PENDINGPAYMENT]) {
                return 25;
            }
            return CGFLOAT_MIN;
        }
        return 25;
    }else if (section==7){
//        if ([myOrderDetailsModel.order.deliveryRuleName isEqualToString:@"送货上门"]) {
//            return 10;
//        }
        return 15;
    }
    return CGFLOAT_MIN;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
//        订单类型view 代付款发货
        JXMyOderDetailsHeadView *myOderDetailsHeadView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyOderDetailsHeadView" owner:self options:nil]lastObject];
        [myOderDetailsHeadView headInit:myOrderDetailsModel.order.processStateInfo];
        return myOderDetailsHeadView;
    } else if(section==6){
//        配送方式
        JXMyOderDetailsDistributionHeatView *myOderDetailsPayHeatView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyOderDetailsDistributionHeatView" owner:self options:nil]lastObject];
        [myOderDetailsPayHeatView distribution_init:myOrderDetailsModel.order.deliveryRuleName];
        return myOderDetailsPayHeatView;
    }else {
        if (section==1) {
            if ([[NetWorkTool stringManipulation:myOrderDetailsModel.order.applyStatus] isEqualToString:@""]) {
                return [UIView new];
            }
        }else if (section==5){
            if ([myOrderDetailsModel.order.processStateInfo.state isEqualToString:JX_PAYMENT_ODERSTATE_PENDINGPAYMENT]) {
                return [self lineHeatView];
            }else{
                return [UIView new];
            }
        }else if (section==7){
            return [self writeLineView];
        }
        
        return [self lineHeatView];
    }
}

-(UIView *)writeLineView{
    UIView *lineView=[[UIView alloc]init];
    lineView.backgroundColor=[UIColor whiteColor];
    return lineView;
}


-(JXMyOderDeailsStateLineView *)lineHeatView{
    JXMyOderDeailsStateLineView *myOderDeailsStateLineView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyOderDeailsStateLineView" owner:self options:nil]lastObject];
    return myOderDeailsStateLineView;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==2&&!isOpenAndClose) {
        NSArray *array= self.detailsArray[section];
        return array.count>3?44:CGFLOAT_MIN;
    }else if (section==3){
//        需付view
        return 45;
    }
//    else if (section==8){
////        配送状态 确认收货等状态按钮view
//        if ([JX_PAYMENT_ODERSTATE_CANCELED isEqualToString:myOrderDetailsModel.order.processStateInfo.state]) {
//            return CGFLOAT_MIN;
//        }
//        return 60;
//    }
    return CGFLOAT_MIN;
   
}
//
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    WeakSelf;
    if (section==2&&!isOpenAndClose) {
        NSArray *array= self.detailsArray[section];
        if (array.count>3) {
            
            JXMyGoodsFootView *myGoodsFootView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyGoodsFootView" owner:self options:nil]lastObject];
            myGoodsFootView.Clock = ^(BOOL isOpen) {
                isOpenAndClose=isOpen;
                [weakSelf refreshSection:section];
            };
            return myGoodsFootView;
        }
        
    }else if (section==3){
        JXMyOderDetailsFootView *myOderDetailsFootView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyOderDetailsFootView" owner:self options:nil]lastObject];
        [myOderDetailsFootView footMoneyInit:myOrderDetailsModel.order.totalOrderNeedPayPrice MyProcessStateInfoModel:myOrderDetailsModel.order.processStateInfo];
        return myOderDetailsFootView;
    }
//    else if (section==8){
//        JXMyOderClockFootView *myOderClockFootView=[[[NSBundle mainBundle]loadNibNamed:@"JXMyOderClockFootView" owner:self options:nil]lastObject];
//        [myOderClockFootView myOder_init:myOrderDetailsModel.order.processStateInfo IsOrderRefund:myOrderDetailsModel.order.isOrderRefund];
//        myOderClockFootView.GulesButtonClock = ^(NSString *State) {
////            红色按钮
//            NSLog(@"%@",State);
//            NSLog(@"红色按钮");
//            [weakSelf clockRead:State];
//        };
//        myOderClockFootView.BlackButtonClock = ^(NSString *State) {
////            黑色按钮
//            NSLog(@"%@",State);
//            NSLog(@"黑色按钮");
//            [weakSelf clockBlack:State];
//        };
//        myOderClockFootView.ReturnButtonClock = ^{
//            [weakSelf refund];
//        };
//        return myOderClockFootView;
//    }
    return [UIView new];
}



-(void)refreshSection:(NSInteger)section{
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:section];
    [self.myOrderDetailsTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

// cell选中时调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld   %ld",(long)indexPath.section,(long)indexPath.row);
    NSDictionary *dict= self.detailsArray[indexPath.section][indexPath.row];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            [self pushMyAfterSaleDetail];
            
        }
    }else if (indexPath.section==8) {
        if (indexPath.row==0) {
            
            if ([[dict valueForKey:@"value"] isEqualToString:@"no"]) {
                return;
            }
            [self psuhElectronicInvoice];
        }
    }
}

-(void)pushMyAfterSaleDetail{
    JXMyAfterSaleDetailViewController *myAfterSaleDetailViewController=[[JXMyAfterSaleDetailViewController alloc]init];
    myAfterSaleDetailViewController.isRefundCashPage=YES; myAfterSaleDetailViewController.orderRefundID=myOrderDetailsModel.order.renudId;
    [self.navigationController pushViewController:myAfterSaleDetailViewController animated:YES];
}

-(void)psuhElectronicInvoice{
    JXElectronicInvoiceDetailPage *ViewController=[[JXElectronicInvoiceDetailPage alloc]init];
    ViewController.invoiceInfo = myOrderDetailsModel.order.invoiceInfo;
//    ViewController.orderId = self.detailModel.aliasCode;
    ViewController.processStateInfoState = myOrderDetailsModel.order.processStateInfo.state;
    [self.navigationController pushViewController:ViewController animated:YES];
}

//-(UIView *)lineHeadView{
//    UIView *headView=[[UIView alloc]init];
//    headView.backgroundColor=XYRGBAColor(244, 244, 244, 1);
//    return headView;
//}

-(void)networkData{
    WeakSelf;
    [self network:@{@"orderId":self.orderID} relativePath:kJXAPI_user_orderDetail ShowAndDismiss:YES success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        myOrderDetailsModel=[JXMyOrderDetailsModel modelWithJSON:responseObject];
        [weakSelf updata:myOrderDetailsModel];
        
    } failure:^{
        
    } UnusualFailure:^{
        
    }];
}

-(void)updata:(JXMyOrderDetailsModel *)model{
    [self.detailsArray removeAllObjects];
    [self.detailsArray addObject:@[@{@"title":@"退货/退款申请进度",@"value":[NetWorkTool stringManipulation:model.order.applyStatus],@"sub":model.order.isOrderRefund}]];
    [self.detailsArray addObject:@[@{@"title":@"ic_locate_normal",@"value":myOrderDetailsModel.order.buyerInfo}]];
//    订单商品
    [self.detailsArray addObject:model.order.items];
//    商品总额
    NSMutableArray *commodityDiscountArray=[[NSMutableArray alloc]init];
    
    [commodityDiscountArray addObject:@{@"title":@"商品总额",@"value":[NSString stringWithFormat:@"¥%@",model.order.totalProductPrice]}];
    if (![[NetWorkTool stringManipulation:model.order.totalCardPayPrice] isEqualToString:@""]) {
        model.order.totalCardPayPrice=[NSString stringWithFormat:@"-¥%@",model.order.totalCardPayPrice];
    }
    [commodityDiscountArray addObject:@{@"title":@"优惠劵",@"value":[NetWorkTool stringManipulation:model.order.totalCardPayPrice]}];
    if (![[NetWorkTool stringManipulation:model.order.totalOrderDiscount] isEqualToString:@""]) {
        model.order.totalOrderDiscount=[NSString stringWithFormat:@"-¥%@",model.order.totalOrderDiscount];
    }
    [commodityDiscountArray addObject:@{@"title":@"优惠金额",@"value":[NetWorkTool stringManipulation:model.order.totalOrderDiscount]}];
    if (![[NetWorkTool stringManipulation: model.order.integralDiscount] isEqualToString:@""]) {
        model.order.integralDiscount=[NSString stringWithFormat:@"-¥%@",model.order.integralDiscount];
    }
[commodityDiscountArray addObject:@{@"title":@"积分抵扣",@"value":[NetWorkTool stringManipulation:model.order.integralDiscount]}];

    [commodityDiscountArray addObject:@{@"title":@"配送费",@"value":[NSString stringWithFormat:@"+¥%@",model.order.deliveryPrice]}];
    [self.detailsArray addObject:commodityDiscountArray];
//    支付方式
    NSMutableArray *payRecsArray=[[NSMutableArray alloc]init];
    for (int i=0; i<model.order.payRecs.count; i++) {
        JXMyPayRecsModel *myPayRecsModel=model.order.payRecs[i];
        if ([myPayRecsModel.paymentTypeID isEqualToString:@"0"]||[myPayRecsModel.paymentTypeID isEqualToString:JX_PAYMENT_TYPE_BLANCE]) {
            [payRecsArray addObject:myPayRecsModel];
        }
    }
    [self.detailsArray addObject:payRecsArray];
//    下单时间、订单编号
    NSMutableArray *orderInformationArray=[[NSMutableArray alloc]init];
    [orderInformationArray addObject:@{@"title":@"下单时间：",@"value":model.order.formatCreateTime}];
    [orderInformationArray addObject:@{@"title":@"订单编号：",@"value":model.order.aliasCode}];
    [self.detailsArray addObject:orderInformationArray];
//    送货上门到店自提
    NSMutableArray *deliveryPointInfoArray=[[NSMutableArray alloc]init];
    [deliveryPointInfoArray addObject:@{@"title":@"自提地址：",@"value":[NetWorkTool stringfilter:model.order.deliveryPointInfo.address]}];
    [deliveryPointInfoArray addObject:@{@"title":@"联系电话：",@"value":[NetWorkTool stringfilter:model.order.deliveryPointInfo.mobile]}];
    [self.detailsArray addObject:deliveryPointInfoArray];
//    [orderInformationArray addObject:@{@"配送方式:":model.order.deliveryRuleName}];
    NSMutableArray *remarksArray=[[NSMutableArray alloc]init];
    [remarksArray addObject:@{@"title":@"支付方式：",@"value":[NetWorkTool stringfilter:model.order.paymentName]}];
    [remarksArray addObject:@{@"title":@"留言：",@"value":model.order.orderNotes}];
    [self.detailsArray addObject:remarksArray];
//    发票信息
        [self.detailsArray addObject:@[@{@"title":@"发票",@"value":model.order.invoiceInfo.needInvoiceKey}]];
//    }
    [self myOrderDetailsLayerOut];
    [self.myOrderDetailsTableView.mj_header  endRefreshing];
    [self.myOrderDetailsTableView reloadData];
}

-(void)clockBlack:(NSString *)oderState{
    if ([oderState isEqualToString:JX_PAYMENT_ODERSTATE_PENDINGPAYMENT]) {
//        代付款取消订单
        [self cancelButtonClick];
    }else if ([oderState isEqualToString:JX_PAYMENT_ODERSTATE_PENDINGDELIVERY]){
//        代发货申请退款
        [self refund];
    }else if ([oderState isEqualToString:JX_PAYMENT_ODERSTATE_GOODSRECEIVED]){
        //        待收货配送
        [self configurationSendState];
    }else if ([oderState isEqualToString:JX_PAYMENT_ODERSTATE_COMPLETED]){
//        已完成
//        申请退款
        [self refund];
    }
}

-(void)clockRead:(NSString *)oderState{
    if ([oderState isEqualToString:JX_PAYMENT_ODERSTATE_PENDINGPAYMENT]) {
//        立即支付
        [self payPickViewShow];
    }else if ([oderState isEqualToString:JX_PAYMENT_ODERSTATE_PENDINGDELIVERY]){
        //        代发货配送状态
        [self configurationSendState];
    }else if ([oderState isEqualToString:JX_PAYMENT_ODERSTATE_GOODSRECEIVED]){
        //        待收货收货
        [self confirmationReceipt];
    }else if ([oderState isEqualToString:JX_PAYMENT_ODERSTATE_COMPLETED]){
        //        已完成
         [self configurationSendState];
    }
}

-(void)refund{
    JXRefundCashPage *refundCashPage=[[JXRefundCashPage alloc]init];
    
    JXMyAfterSaleDetailModel *model=[[JXMyAfterSaleDetailModel alloc]init];
    model.contacts=myOrderDetailsModel.order.buyerInfo.userName;
    model.mobilePhone=myOrderDetailsModel.order.buyerInfo.mobile;
    model.addressInfo=myOrderDetailsModel.order.buyerInfo.address;
    refundCashPage.refundModel=model;
    refundCashPage.orderId = self.orderID;
    [self.navigationController pushViewController:refundCashPage animated:YES];
}



//立即支付
-(void)payPickViewShow{
    XYOrderDetailPayPickView * pickView = [[XYOrderDetailPayPickView alloc]initWithPayTotal:myOrderDetailsModel.order.totalOrderNeedPayPrice paymentTypes:myOrderDetailsModel.paymentArr];
    pickView.delegate = self;
    [pickView show];
}


#pragma mark - XYOrderDetailPayPickViewDelegate

- (void)pickPayType:(NSString*)payType needTotal:(NSString*)needTotal
{
    if (payType==nil) {
        [YDBAlertView showToast:@"请选择支付类型" dismissDelay:1.0];
    }else{
        if ([payType isEqualToString:JX_PAYMENT_TYPE_UNION]){
            [self UNIONplay:self.orderID PlayType:JX_PAYMENT_TYPE_UNION];
        }else{
            
            [self encryptedOrder:self.orderID PlayType:payType];
        }
        
    }
    
}



-(void)UNIONplay:(NSString *)oderID PlayType:(NSString *)playType{
    //    @{@"orderIds":oderID,@"payi":playType}
    [XYPay requestParameter:@{@"orderIds":oderID,@"payId":playType} relativePath:kJXAPI_user_ChinaPay success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        JXAppyChinaPayModel *appyChinaPayModel=[JXAppyChinaPayModel modelWithJSON:responseObject];
        if ([appyChinaPayModel.RETURN_CODE isEqualToString:@"S0A00000"]) {
            [XYPay unionPay:appyChinaPayModel.RETURN_DATA.paySign ViewController:self];
        }else{
            [YDBAlertView showToast:appyChinaPayModel.RETURN_DESC dismissDelay:1.0];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

-(void)encryptedOrder:(NSString *)oder PlayType:(NSString *)playType{
    __weak typeof(self)SelfWeek=self;
    if (oder!=nil&&![oder isEqualToString:@""]) {
        [XYPay requestParameter:@{@"payId":playType,@"orderIds":oder} relativePath:@"pay.handler" success:^(id responseObject) {
            NSLog(@"%@",responseObject);
            XYBaseModel *xyBaseModel=[XYBaseModel mj_objectWithKeyValues:responseObject];
            if ([xyBaseModel.RETURN_CODE isEqualToString:@"S0A00000"]) {
                
                //            支付宝
                if ([playType isEqualToString:@"payi_132"]) {
                    XYPlayInfoModel *xyPlayInfoModel=[XYPlayInfoModel mj_objectWithKeyValues:xyBaseModel.RETURN_DATA];
                    [SelfWeek playAlipay:xyPlayInfoModel.androidPayInfo];
                }else{
                    //                微信
                    XYWXPayModel *xyWXPayModel=[XYWXPayModel mj_objectWithKeyValues:xyBaseModel.RETURN_DATA];
                    [SelfWeek wxpay:xyWXPayModel.paySign];
                }
            }else{
                [YDBAlertView showToast:xyBaseModel.RETURN_DESC dismissDelay:1.0];
                
            }
            
        } failure:^(NSError *error) {
            NSLog(@"%@",error);
        }];
    }
}


-(void)wxpay:(XYWXPaySignModel *)wXPaySignModel{
    [XYPay wxpay:wXPaySignModel];
    WeakSelf;
    [XYPay shareXYPay].Failure = ^(BaseResp *baseResp) {
        NSLog(@"%@",baseResp);
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"支付失败" dismissTimeInterval:1.0];
        
    } ;
    [XYPay shareXYPay].Success = ^(PayResp *payResp) {
        NSLog(@"%@",payResp);
        [weakSelf pushController:@"微信支付"];
        
    } ;
}

-(void)playAlipay:(NSString *)alipay{
    WeakSelf;
    [XYPay alipay:alipay success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        XYPlaAlBBModel *plaAlBBModel=[XYPlaAlBBModel mj_objectWithKeyValues:responseObject];
        NSLog(@"%@",plaAlBBModel);
        if ([plaAlBBModel.resultStatus isEqualToString:@"9000"]) {
            [weakSelf pushController:@"支付宝支付"];
            
        }else{
            //            [XYProgressHUD svHUDShowStyle:XYHUDStyleError title:@"充值失败" dismissTimeInterval:1.0];
            [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"支付失败" dismissTimeInterval:1.0];
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

-(void)pushController:(NSString *)playStr{
    XYPayOrderSuccessVC *xyPayOrderSuccessVC=[[XYPayOrderSuccessVC alloc]init];
    xyPayOrderSuccessVC.paymentAmountString=myOrderDetailsModel.order.totalOrderNeedPayPrice;
    xyPayOrderSuccessVC.paymentType=playStr;
    [self.navigationController pushViewController:xyPayOrderSuccessVC animated:YES];
    
}


//物流配置送状态
-(void)configurationSendState{
    XYOrderDetailSubClassOrderStatusVC * statusVC = [[XYOrderDetailSubClassOrderStatusVC alloc]init];
    statusVC.order_ID =self.orderID;
    [self.navigationController pushViewController:statusVC animated:YES];
}

//确认收货
-(void)confirmationReceipt{
    UIAlertController *aleter = [UIAlertController alertWithTitle:@"确认收货" text:@"是否已收到商品?" leftButtonTitle:@"取消" rightButtonTitle:@"确定" destructiveButtonIndex:1 handleBlock:^(NSUInteger buttonIndex) {
        if (buttonIndex == 0) {
            return ;
        }else{
            [self confirmationReceiptData];
        }
        
    }];
    aleter.clickMaskToClose = YES;
    [aleter show];
}

-(void)confirmationReceiptData{
    WeakSelf;
    [self network:@{@"orderId":self.orderID} relativePath:kJXAPI_user_ConfirmOrder ShowAndDismiss:YES success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        if ([[responseObject objectForKey:@"status"] isEqualToString:@"0"]) {
            JXConfirmSuccessViewController *confirmSuccessViewController=[[JXConfirmSuccessViewController alloc]init];
            [weakSelf.navigationController pushViewController:confirmSuccessViewController animated:YES];
        }
    } failure:^{
        
    } UnusualFailure:^{
        
    }];
}

/** 取消订单 */
- (void)cancelButtonClick
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定取消这个订单？" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    WeakSelf;
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf cancelOder];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
  
}

-(void)cancelOder{
    WeakSelf;
    [self network:@{@"cancelReason":@"1",@"orderId":self.orderID} relativePath:kJXAPI_user_userOrderCancel ShowAndDismiss:YES success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        [weakSelf networkData];
    } failure:^{
        
    } UnusualFailure:^{
        
    }];
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
