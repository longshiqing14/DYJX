
//
//  XYPreDepositVC.m
//  user
//
//  Created by xingyun on 2017/9/13.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYPreDepositVC.h"
#import "XYPay.h"
#import "XYPlayModel.h"
#import "XYPreDepositSelectCVC.h"  //套餐 选择
#import "XYBaseModel.h"
#import "XYPreDepositVCell.h" // 支付方式 选择
#import "XYPreDepositTVCHeaderView.h" // 支付方式 头
#import "WXApi.h"
#import "XYPaymentListModel.h" //支付方式 选择model
#import "JXAppyChinaPayModel.h"
#import "XYOrderAllNet.h"  //订单  请求

#import "XYLoginAndRegisterNet.h" // 个人信息 请求

#import "XYPreDepositOrderPaySuccessVC.h" // 预付款 支付成功
#import "JXRechargeSuccessViewController.h"
@interface XYPreDepositVC () <UITableViewDelegate,UITableViewDataSource,XYPreDepositSelectCVCDelegate>
@property(nonatomic,strong)NSString *orderNumber;

/** 列表 */
@property (nonatomic, strong) UITableView * tableView;

/** 头 */
@property (nonatomic,strong) UIView * headerView;
/** 脚 */
@property (nonatomic,strong) UIView * footerView;
/** 支付按钮 */
@property (nonatomic, strong) UIButton * payBT;

///** 协议 */
//@property (nonatomic, strong) UIView * agreementView;
///** 协议 */
//@property (nonatomic, strong) UILabel * agreementLB;
///** 协议 */
//@property (nonatomic, strong) UIButton * agreementBT;

/** 选择 套餐 */
@property (nonatomic, strong) XYPreDepositSelectCVC * selectCVC;

/** 数据 */
@property (nonatomic, strong) NSMutableArray * dataSource;

/** 选择的 支付方式 */
@property (nonatomic, copy) NSString * payId;


@end

@implementation XYPreDepositVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(receiveNotificiation:) name:@"play" object:nil];
    [center addObserver:self selector:@selector(receiveNotificiationUN:) name:@"playUN" object:nil];
    self.navigationItem.title = [self.isProductList isEqualToString:@"N"] ? @"预存款充值" : @"套餐充值" ;
    
    self.view.backgroundColor = XYGlobalBg;
    
    [self addViewAndLayout];
}

- (void)receiveNotificiationUN:(NSNotification*)sender{
    WeakSelf;
    NSString *key=[sender.userInfo valueForKey:@"code"];
    if ([key isEqualToString:@"success"]) {
        if ([weakSelf.isProductList isEqualToString:@"Y"]) {
            [weakSelf pushController];
        }else{
            XYPreDepositOrderPaySuccessVC * successVC = [[XYPreDepositOrderPaySuccessVC alloc]init];
            successVC.isProductList = weakSelf.isProductList;
            NSLog(@"%@",weakSelf.orderNumber);
            successVC.orderId = weakSelf.orderNumber;
            [self.navigationController pushViewController:successVC animated:YES];
        }
    }else{
//        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"充值失败" dismissTimeInterval:1.0];
        [YDBAlertView showToast:@"充值失败" dismissDelay:1.0];
    }
}

- (void)receiveNotificiation:(NSNotification*)sender{
    __weak typeof(self)SelfWeek=self;
    XYPlaAlBBModel *plaAlBBModel=[XYPlaAlBBModel mj_objectWithKeyValues:sender.userInfo];
    NSLog(@"%@",plaAlBBModel);
    if ([plaAlBBModel.resultStatus isEqualToString:@"9000"]) {
//        [SelfWeek netOrderDirectData];
        if ([SelfWeek.isProductList isEqualToString:@"Y"]) {
            [SelfWeek pushController];
        }else{
            XYPreDepositOrderPaySuccessVC * successVC = [[XYPreDepositOrderPaySuccessVC alloc]init];
            successVC.isProductList = SelfWeek.isProductList;
            successVC.orderId = SelfWeek.orderNumber;
            [self.navigationController pushViewController:successVC animated:YES];
        }
        
//        [SelfWeek pushController];
//        XYPreDepositOrderPaySuccessVC * successVC = [[XYPreDepositOrderPaySuccessVC alloc]init];
//        successVC.isProductList = SelfWeek.isProductList;
//        successVC.orderId = SelfWeek.orderNumber;
//        [self.navigationController pushViewController:successVC animated:YES];

    }else{
//        [XYProgressHUD svHUDShowStyle:XYHUDStyleError title:@"充值失败" dismissTimeInterval:1.0];
        [YDBAlertView showToast:@"充值失败" dismissDelay:1.0];

    }
}

-(void)pushController{
    UIStoryboard *board=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //这个字符串是你要跳转面板的名字
    JXRechargeSuccessViewController *main =[board instantiateViewControllerWithIdentifier:@"JXRechargeSuccessID"];
    NSLog(@"%@",self.orderNumber);
    main.oderID=self.orderNumber;
    NSLog(@"%@",self.isProductList);
    main.isActivity=self.isProductList;
    [self.navigationController pushViewController:main animated:YES];
}

- (void)addViewAndLayout
{
//    [self updateDataSource];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    
    
    [self updateFooterView];
}

#pragma  mark - 懒加载

- (UITableView*)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, XYScreenH)];
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = XYGlobalBg;
        
        _tableView.delegate =self;
        _tableView.dataSource = self;
        
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = self.footerView;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
        
    }
    return _tableView;
}

- (UIView*)headerView
{
    if (_headerView == nil) {
        _headerView = [[UIView alloc]init];
        _headerView.frame = CGRectMake(0, 0, XYScreenW, 15);
        _headerView.backgroundColor = [UIColor clearColor];
        
    }
    return _headerView;
}


- (UIView*)footerView
{
    if (_footerView == nil) {
        _footerView = [[UIView alloc]init];
        _footerView.frame = CGRectMake(0.5, 0, XYScreenW, 100);
        _footerView.backgroundColor = [UIColor clearColor];

    }
    return _footerView;
}

- (UIButton*)payBT
{
    if (_payBT == nil) {
        _payBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _payBT.frame = CGRectZero;
        
        _payBT.backgroundColor = XYMainColor;
        
        [_payBT setTitle:@"确定" forState:UIControlStateNormal];
        [_payBT.titleLabel setFont:XYFont_16];
        
        _payBT.layer.cornerRadius = 5;
        _payBT.layer.masksToBounds = YES;
        
        [_payBT addTarget:self action:@selector(payButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _payBT;
}


- (XYPreDepositSelectCVC*)selectCVC
{
    if (_selectCVC == nil) {
        _selectCVC = [[XYPreDepositSelectCVC alloc]init];
        _selectCVC.collectionView.frame = CGRectZero;
        _selectCVC.delegate = self;
        _selectCVC.isProductList = self.isProductList;
        
        [self addChildViewController:_selectCVC];
        WeakSelf;
        _selectCVC.GetDataSource = ^(NSArray *playDataSource) {
            [weakSelf updateDataSource:playDataSource];
        };
    }
    return _selectCVC;
}

//- (UIView*)agreementView
//{
//    if (_agreementView == nil) {
//        _agreementView = [[UIView alloc]initWithFrame:CGRectZero];
//        _agreementView.backgroundColor = [UIColor clearColor];
//    }
//    return _agreementView;
//}
//
//- (UILabel*)agreementLB
//{
//    if (_agreementLB == nil) {
//        
//        _agreementLB = [[UILabel alloc]initWithFrame:CGRectZero];
//        
//        _agreementLB.font = XYFont_13;
//        _agreementLB.textColor = XYFontTitleColor;
//        _agreementLB.textAlignment = NSTextAlignmentCenter;
//        
//        _agreementLB.text = @"点击充值，即表示您已同意";
//    }
//    return _agreementLB;
//}
//
//- (UIButton*)agreementBT
//{
//    if (_agreementBT == nil) {
//        
//        _agreementBT = [UIButton buttonWithType:UIButtonTypeCustom];
//        
//        [_agreementBT setTitle:@"《充值活动协议》" forState:UIControlStateNormal];
//        [_agreementBT setTitleColor:XYMainColor forState:UIControlStateNormal];
//        [_agreementBT.titleLabel setFont:XYFont_13];
//        
////        _agreementBT.titleEdgeInsets = UIEdgeInsetsMake(0, 0, -5, 0);
//        
//        [_agreementBT addTarget:self action:@selector(agreementButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//        
//    }
//    return _agreementBT;
//}


- (NSMutableArray*)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)updateDataSource:(NSArray *)dataArray
{
    if (self.dataSource.count != 0) {
        [self.dataSource removeAllObjects];
    }
    
    
    NSMutableArray * array = [NSMutableArray array];
    for (NSString *playType in dataArray) {
        if ([playType isEqualToString:JX_PAYMENT_TYPE_WEIXIN]) {
            if ([WXApi isWXAppInstalled] ) {
                [array addObject:@{@"image":@"payment_icon_wx",@"title":@"微信支付",@"type":JX_PAYMENT_TYPE_WEIXIN}];
            }
        }else if ([playType isEqualToString:JX_PAYMENT_TYPE_ALI]){
             [array addObject:@{@"image":@"payment_icon_zfb",@"title":@"支付宝支付",@"type":JX_PAYMENT_TYPE_ALI}];
        }else if ([playType isEqualToString:JX_PAYMENT_TYPE_UNION]){
            [array addObject:@{@"image":@"ic_unionpay",@"title":@"银联支付",@"type":JX_PAYMENT_TYPE_UNION}];
        }
        
    }
    

//    [array addObject:@{@"image":@"payment_icon_zfb",@"title":@"支付宝支付",@"type":XY_PAY_TYPE_AIL}];

    for (NSDictionary * dict in array) {
        XYPaymentListModel * model = [[XYPaymentListModel alloc]init];
        
        model.image = dict[@"image"];
        model.title = dict[@"title"];
        model.type = dict[@"type"];
        
       
        
        [self.dataSource addObject:model];
    }
    if (self.payId == nil) {
        if (array.count>0) {
            self.payId = [array[0] objectForKey:@"type"];
        }
        
    }
    
}

- (void)updateFooterView
{
    
    [self.footerView addSubview:self.payBT];
    [self.payBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.left.mas_equalTo(43);
        make.right.mas_equalTo(-43);
        make.height.mas_equalTo(40);
    }];
    
    
//    NSString * agreementStr = @"点击充值，即表示您已同意《充值活动协议》";
//    CGSize size = [XYStringHandle sizeWithString:agreementStr font:XYFont_13 viewWidth:1000];
//    
//    [self.footerView addSubview:self.agreementView];
//    [self.agreementView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(_footerView.mas_centerX);
//        make.bottom.mas_equalTo(0);
//        make.width.mas_equalTo(size.width + 5);
//        make.height.mas_equalTo(size.height);
//    }];
//    
//    [self.agreementView addSubview:self.agreementLB];
//    [self.agreementLB mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(0);
//        make.bottom.mas_equalTo(0);
//        make.height.mas_equalTo(size.height);
//    }];
//    
//    [self.agreementView addSubview:self.agreementBT];
//    [self.agreementBT mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(0);
//        make.right.mas_equalTo(0);
//        make.height.mas_equalTo(size.height);
//    }];
    
    
    
}

#pragma mark - button click

- (void)agreementButtonClick:(UIButton*)sender
{
    XYLog(@"  充值活动协议  ");    
}




#pragma mark - UITableViewDelegate UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return self.dataSource.count;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [self.selectCVC updateDepositSelectCVCHeight] ;

    }else if (indexPath.section == 1){
        return 45 ;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 40;
    }
    return 0;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
        cell.contentView.backgroundColor = XYGlobalBg;
        
        [cell.contentView addSubview:self.selectCVC.collectionView];
        [self.selectCVC.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(0);
        }];
        
        return cell;
    }else if (indexPath.section == 1){
        
        XYPreDepositVCell * cell = [XYPreDepositVCell cellWithTableView:tableView];
        
        XYPaymentListModel * model = self.dataSource[indexPath.row];
        
        cell.titleLB.text = model.title;
        cell.iconImageView.image = [UIImage imageNamed:model.image];
        if ([self.payId isEqualToString: model.type]) {
            cell.selectImageView.hidden = NO;
        }else
        {
            cell.selectImageView.hidden = YES;
        }
        
        
        return cell;
    }
    
 
    return nil;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        XYPreDepositTVCHeaderView * headerView = [XYPreDepositTVCHeaderView headerWithTableView:tableView];
        headerView.titleLB.text = @"选择支付方式";
        return headerView;
    }
    return nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
//        XYPreDepositVCell * cell = (XYPreDepositVCell *)[tableView cellForRowAtIndexPath:indexPath];
//        cell.selectImageView.hidden = NO;
        
        XYPaymentListModel * model = self.dataSource[indexPath.row];
        self.payId = model.type;
        [tableView reloadData];
    }

    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        XYPreDepositVCell * cell = (XYPreDepositVCell *)[tableView cellForRowAtIndexPath:indexPath];
        cell.selectImageView.hidden = YES;
    }
    
}


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

#pragma mark - XYPreDepositSelectCVCDelegate

- (void)updateTableViewReloadData
{
    [self.tableView reloadData];
}




#pragma mark - button click

- (void)payButtonClick:(UIButton*)sender
{
//    跳过支付代码
//    if ([self.isProductList isEqualToString:@"Y"]) {
//        UIStoryboard *board=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        //这个字符串是你要跳转面板的名字
//        JXRechargeSuccessViewController *main =[board instantiateViewControllerWithIdentifier:@"JXRechargeSuccessID"];
//        main.isActivity=self.isProductList;
//        [self.navigationController pushViewController:main animated:YES];
//        NSLog(@"productId%@   payId%@",self.selectCVC.productId,self.payId);
//    }else{
//        XYPreDepositOrderPaySuccessVC * successVC = [[XYPreDepositOrderPaySuccessVC alloc]init];
//        successVC.isProductList = self.isProductList;
////        successVC.orderId = oderID;
//        [self.navigationController pushViewController:successVC animated:YES];
//    }
    
    
    if (self.selectCVC.productId == nil) {
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"请选择套装" dismissTimeInterval:1.0];
        return;
    }

    if (self.payId == nil) {
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"请选择支付方式" dismissTimeInterval:1.0];
        return;
    }
    
        [self play:self.selectCVC.productId PlayType:self.payId];
    
    
//    [self netOrderDirectData];

}



-(void)UNIONplay:(NSString *)oderID PlayType:(NSString *)playType{
    //    @{@"orderIds":oderID,@"payi":playType}
    self.orderNumber=oderID;
    [XYPay requestParameter:@{@"orderIds":oderID,@"payId":playType} relativePath:kJXAPI_user_ChinaPay success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        JXAppyChinaPayModel *appyChinaPayModel=[JXAppyChinaPayModel modelWithJSON:responseObject];
        if ([appyChinaPayModel.RETURN_CODE isEqualToString:ERROR_NUM_STRING]) {
            [XYPay unionPay:appyChinaPayModel.RETURN_DATA.paySign ViewController:self];
        }else{
            [YDBAlertView showToast:appyChinaPayModel.RETURN_DESC dismissDelay:1.0];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
         [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}


#pragma mark - data net

/** 创建订单 */
- (void)netOrderDirectData
{
    WeakSelf;
    [XYOrderAllNet netOrderDirectWithAmount:@"1"
                                      payId:self.payId
                                  productId:self.selectCVC.productId
                                      skuId:@""
                                      Block:^(NSDictionary *blockDictionary, NSError *error) {
                                          if (error == nil) {
                                              
                                              NSString * orderIds = [blockDictionary objectForKey:@"orderIds"];
                                              NSString * totalNeedPayPrice;
                                              if ([[blockDictionary objectForKey:@"totalNeedPayPrice"] isKindOfClass:[NSString class]]) {
                                                  totalNeedPayPrice = [blockDictionary objectForKey:@"totalNeedPayPrice"];
                                              }
                                              
                                              
                                              [weakSelf netOrderPayDataWithOrderID:orderIds totalNeedPayPrice:totalNeedPayPrice];
                                          }
                                          
                                      }];
}

/** 订单 支付 */
- (void)netOrderPayDataWithOrderID:(NSString*)orderid totalNeedPayPrice:(NSString*)totalNeedPayPrice
{
    self.orderNumber=orderid;
    WeakSelf;
    [XYOrderAllNet netOrderXPPAYWithOrderId:orderid
                                      payId:self.payId
                                      Block:^(NSDictionary *blockDictionary, NSError *error) {
                                          
                                          if (error == nil) {
                                              
//                                              [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:@"支付成功" dismissTimeInterval:1.0];
//                                              [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                                              [XYLoginAndRegisterNet netGetUserInfoListBlock:^(NSDictionary *blockDictionary, NSError *error) {
                                                  
                                              }];
                                              
                                              
//                                              XYPreDepositOrderPaySuccessVC * successVC = [[XYPreDepositOrderPaySuccessVC alloc]init];
//                                              successVC.isProductList = weakSelf.isProductList;
//                                              successVC.orderId = orderid;
//                                              successVC.totalPayPrice = totalNeedPayPrice;
//                                              [weakSelf.navigationController pushViewController:successVC animated:YES];
                                              [weakSelf pushController];
                                          }
                                          
        
    }];
}

-(void)getOrderDirect{
    
    
}

-(void)play:(NSString *)playId PlayType:(NSString *)playType{
    __weak typeof(self)SelfWeek=self;
    if (playId!=nil&&![playId isEqualToString:@""]) {
        [XYPay requestParameter:@{@"amount":@"1",@"productId":playId,@"payId":playType,@"skuId":@""} relativePath:@"order.direct" success:^(id responseObject) {
            XYBaseModel*xyBaseModel = [XYBaseModel mj_objectWithKeyValues:responseObject];
            if ([xyBaseModel.RETURN_CODE isEqualToString:@"S0A00000"]) {
                XYPlayModel *xyPlayModel=[XYPlayModel mj_objectWithKeyValues:xyBaseModel.RETURN_DATA];
                if ([playType isEqualToString:JX_PAYMENT_TYPE_UNION]) {
                    [SelfWeek UNIONplay:xyPlayModel.orderIds PlayType:playType];
                }else{
                [SelfWeek encryptedOrder:xyPlayModel.orderIds PlayType:playType];
                }
            }else{
                [YDBAlertView showToast:xyBaseModel.RETURN_DESC dismissDelay:1.0];
            }
            
        } failure:^(NSError *error) {
            NSLog(@"%@",error);
        }];
    }
    
}

-(void)encryptedOrder:(NSString *)oder PlayType:(NSString *)playType{
    __weak typeof(self)SelfWeek=self;
    if (oder!=nil&&![oder isEqualToString:@""]) {
    
        
        
        [XYPay requestParameter:@{@"payId":playType,@"orderIds":oder} relativePath:@"pay.handler" success:^(id responseObject) {
            NSLog(@"%@",responseObject);
            XYBaseModel *xyBaseModel=[XYBaseModel mj_objectWithKeyValues:responseObject];
            SelfWeek.orderNumber=oder;
            if ([xyBaseModel.RETURN_CODE isEqualToString:@"S0A00000"]) {
                
                //            支付宝
                if ([playType isEqualToString:@"payi_132"]) {
                    XYPlayInfoModel *xyPlayInfoModel=[XYPlayInfoModel mj_objectWithKeyValues:xyBaseModel.RETURN_DATA];
                    [SelfWeek playAlipay:xyPlayInfoModel.androidPayInfo OderID:oder];
                }else{
                    //                微信
                    XYWXPayModel *xyWXPayModel=[XYWXPayModel mj_objectWithKeyValues:xyBaseModel.RETURN_DATA];
                    [SelfWeek wxpay:xyWXPayModel.paySign OderID:oder];
                }
            }else{
                [YDBAlertView showToast:xyBaseModel.RETURN_DESC dismissDelay:1.0];
                
            }
            
        } failure:^(NSError *error) {
            NSLog(@"%@",error);
        }];
    }
}


-(void)wxpay:(XYWXPaySignModel *)wXPaySignModel  OderID:(NSString *)oderID{
    __weak typeof(self)SelfWeek=self;
    [XYPay wxpay:wXPaySignModel];
    WeakSelf;
    [XYPay shareXYPay].Failure = ^(BaseResp *baseResp) {
        NSLog(@"%@",baseResp);
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"充值失败" dismissTimeInterval:1.0];
        
    } ;
    [XYPay shareXYPay].Success = ^(PayResp *payResp) {
        NSLog(@"%@",payResp);
//        [weakSelf netOrderDirectData];
        if ([SelfWeek.isProductList isEqualToString:@"Y"]) {
            [SelfWeek pushController];
        }else{
            XYPreDepositOrderPaySuccessVC * successVC = [[XYPreDepositOrderPaySuccessVC alloc]init];
            successVC.isProductList = weakSelf.isProductList;
            successVC.orderId = oderID;
            [self.navigationController pushViewController:successVC animated:YES];
        }
//        [weakSelf pushController];

//        successVC.totalPayPrice = totalNeedPayPrice;
        
    } ;
}


-(void)playAlipay:(NSString *)alipay OderID:(NSString *)oderID{
    WeakSelf;
    [XYPay alipay:alipay success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        XYPlaAlBBModel *plaAlBBModel=[XYPlaAlBBModel mj_objectWithKeyValues:responseObject];
        NSLog(@"%@",plaAlBBModel);
        if ([plaAlBBModel.resultStatus isEqualToString:@"9000"]) {
//             [weakSelf netOrderDirectData];
            if ([weakSelf.isProductList isEqualToString:@"Y"]) {
                [weakSelf pushController];
            }else{
                XYPreDepositOrderPaySuccessVC * successVC = [[XYPreDepositOrderPaySuccessVC alloc]init];
                successVC.isProductList = weakSelf.isProductList;
                successVC.orderId = oderID;
                [self.navigationController pushViewController:successVC animated:YES];
            }
//            successVC.totalPayPrice = totalNeedPayPrice;
//            [weakSelf pushController];
            
        }else{
//            [XYProgressHUD svHUDShowStyle:XYHUDStyleError title:@"充值失败" dismissTimeInterval:1.0];
            [YDBAlertView showToast:@"充值失败" dismissDelay:1.0];

        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
