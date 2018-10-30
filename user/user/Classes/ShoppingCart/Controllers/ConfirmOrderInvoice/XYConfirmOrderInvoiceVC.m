//
//  XYConfirmOrderInvoiceVC.m
//  user
//
//  Created by xingyun on 2017/10/16.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYConfirmOrderInvoiceVC.h"

#import "XYConfirmOrderInvoiceOrNotVC.h" //是否 开具发票
#import "XYConfirmOrderInvoiceTypeVC.h"     //发票类型
#import "XYConfirmOrderInvoiceInfoTVC.h"    //发票 信息

#import "XYOrderFromDetailModel.h"

#import "XYShoppingCartNet.h"

@interface XYConfirmOrderInvoiceVC () <UITableViewDelegate,UITableViewDataSource,XYConfirmOrderInvoiceOrNotVCDelegate,XYConfirmOrderInvoiceTypeVCDelegate>

@property (nonatomic, strong) UITableView * tableView;

/** 是否 开具发票 */
@property (nonatomic, strong) XYConfirmOrderInvoiceOrNotVC * invoiceOrNotVC;
///** 发票 类型 */
@property (nonatomic, strong) XYConfirmOrderInvoiceTypeVC * invoiceTypeVC;
///** 发票 信息 */
@property (nonatomic, strong) XYConfirmOrderInvoiceInfoTVC * invoiceInfoTVC;


@property (nonatomic, strong) UIView * footerView;

@property (nonatomic, strong) UIButton * ensourceBT;

/** 数据 */
@property (nonatomic, strong) NSMutableArray * dataSource;

@property (nonatomic, strong) XYOrderFromDetailInvoiceInfoModel * infoModel;

@end

@implementation XYConfirmOrderInvoiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"发票信息";
    self.view.backgroundColor = XYGlobalBg;
    
    [self addViewAndLayout];
    
    [self netOrderOrderInvoiceListData];
    
}

#pragma mark - add view
/** 添加 view */
- (void)addViewAndLayout
{
    self.infoModel = [[XYOrderFromDetailInvoiceInfoModel alloc]init];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
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
        
//        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = self.footerView;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
        
    }
    return _tableView;
}


- (UIView*)footerView
{
    if (_footerView == nil) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, 75)];
        _footerView.backgroundColor = XYGlobalBg;
        
        [_footerView addSubview:self.ensourceBT];
        [self.ensourceBT mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(45);
            make.left.mas_equalTo(47);
            make.right.mas_equalTo(-47);
        }];
        
    }
    return _footerView;
}

- (UIButton*)ensourceBT
{
    if (_ensourceBT == nil) {
        _ensourceBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _ensourceBT.frame = CGRectZero;
        
        _ensourceBT.backgroundColor = XYMainColor;
        
        [_ensourceBT setTitle:@"确定" forState:UIControlStateNormal];
        [_ensourceBT.titleLabel setFont:XYFont_16];
        
        _ensourceBT.layer.cornerRadius = 5;
        _ensourceBT.layer.masksToBounds = YES;
        
        [_ensourceBT addTarget:self action:@selector(ensourceButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _ensourceBT;
}



- (XYConfirmOrderInvoiceOrNotVC*)invoiceOrNotVC
{
    if (_invoiceOrNotVC == nil) {
        _invoiceOrNotVC = [[XYConfirmOrderInvoiceOrNotVC alloc]init];
        _invoiceOrNotVC.view.frame = CGRectZero;
        _invoiceOrNotVC.delegate = self;
        
        [self addChildViewController:_invoiceOrNotVC];
        
    }
    return _invoiceOrNotVC;
}

- (XYConfirmOrderInvoiceTypeVC*)invoiceTypeVC
{
    if (_invoiceTypeVC == nil) {
        _invoiceTypeVC = [[XYConfirmOrderInvoiceTypeVC alloc]init];
        _invoiceTypeVC.view.frame = CGRectZero;
        _invoiceTypeVC.delegate = self;
        [self addChildViewController:_invoiceTypeVC];
        
    }
    return _invoiceTypeVC;
}

- (XYConfirmOrderInvoiceInfoTVC*)invoiceInfoTVC
{
    if (_invoiceInfoTVC == nil) {
        _invoiceInfoTVC = [[XYConfirmOrderInvoiceInfoTVC alloc]init];
        
        _invoiceInfoTVC.tableView.frame = CGRectZero;
        
        [self addChildViewController:_invoiceInfoTVC];
        
    }
    return _invoiceInfoTVC;
}


#pragma mark - button click

- (void)ensourceButtonClick:(UIButton*)sender
{
    
    [self.view endEditing:YES];
    
    if ([self.needInvoiceKey isEqualToString:@"yes"]) {
        
        
        if ([self.invoiceInfoTVC.cellRiseTF.text isEqualToString:@""]) {
            [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"请输入发票抬头" dismissTimeInterval:1.0];
            return;
        }
        
        if ([self.infoModel.invoiceTypeKey isEqualToString:@"com"]) {
            
            if ([self.invoiceInfoTVC.cellEMailTF.text isEqualToString:@""]) {
                [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"请输入电子邮箱" dismissTimeInterval:1.0];
                
                return;
            }
            
        }else if ([self.infoModel.invoiceTypeKey isEqualToString:@"vat"]){
            
            
            if ([self.invoiceInfoTVC.cellIdNumberTF.text isEqualToString:@""]) {
                [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"请输入纳税人识别号" dismissTimeInterval:1.0];

                return;
            }
            
            if ([self.invoiceInfoTVC.cellEMailTF.text isEqualToString:@""]) {
                [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"请输入电子邮箱" dismissTimeInterval:1.0];
                
                return;
            }

            
            
        }else{
            return;
        }
        

        
        
    }else{
        self.needInvoiceKey = @"no";
    }
    
    
    WeakSelf;
    [XYShoppingCartNet netOrderUpdateInvoiceWithInvoiceId:self.invoice_id
                                           needInvoiceKey:self.needInvoiceKey
                                           invoiceTypeKey:self.infoModel.invoiceTypeKey
                                          invoiceUserName:self.invoiceInfoTVC.cellRiseTF.text
                                             invoiceTitle:self.invoiceInfoTVC.cellRiseTF.text
                                       invoiceCertificate:self.invoiceInfoTVC.cellIdNumberTF.text
                                           invoiceMail:self.invoiceInfoTVC.cellEMailTF.text
                                                    block:^(NSDictionary *blockDictionary, NSError *error) {
        
                                                        if (error == nil) {
                                                            [weakSelf.navigationController popViewControllerAnimated:YES];
                                                            
                                                            if (weakSelf.delegate != nil && [weakSelf.delegate respondsToSelector:@selector(updateInvoiceSuccess)]) {
                                                                [weakSelf.delegate updateInvoiceSuccess];
                                                            }
                                                            
                                                            
                                                        }
                                                        
                                                    }];
    
    
    
}




#pragma mark - tableview

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (![self.needInvoiceKey isEqualToString:@"yes"]) {
        return 1;
    }

    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 86;
    }else if (indexPath.row == 1){
        
        return 86 + 14;
        
    }else if (indexPath.row == 2){

        if (self.invoiceInfoTVC.tableView.contentSize.height != 0) {
            return self.invoiceInfoTVC.tableView.contentSize.height + 14;
        }
        
    }
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = XYGlobalBg;
    
    
    if (indexPath.row == 0) {
        
        [cell.contentView addSubview:self.invoiceOrNotVC.view];
        [self.invoiceOrNotVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
    }else if (indexPath.row == 1){
        
        [cell.contentView addSubview:self.invoiceTypeVC.view];
        [self.invoiceTypeVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(14);
            make.left.right.bottom.mas_equalTo(0);
        }];
        
    }else if (indexPath.row == 2){

        [cell.contentView addSubview:self.invoiceInfoTVC.tableView];
        [self.invoiceInfoTVC.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(14);
            make.left.right.bottom.mas_equalTo(0);
        }];
        
    }
    
    return cell;
}

#pragma mark - XYConfirmOrderInvoiceOrNotVCDelegate
- (void)InvoiceOrNotViewInvoiceButtonClick
{
    if ([self.needInvoiceKey isEqualToString:@"yes"]) {
        return;
    }
    self.needInvoiceKey = @"yes";
    [self updateTableViewData];
}

- (void)InvoiceOrNotViewNotButtonClick
{
    if ([self.needInvoiceKey isEqualToString:@"no"]) {
        return;
    }
    self.needInvoiceKey = @"no";
    [self updateTableViewData];
}

#pragma mark - XYConfirmOrderInvoiceTypeVCDelegate

/** 个人发票 点击事件 */
- (void)InvoiceTypeViewPersonalButtonClick
{
    if ([self.infoModel.invoiceTypeKey isEqualToString:@"com"]) {
        return;
    }
    self.infoModel.invoiceTypeKey = @"com";
    [self updateTableViewData];
}
/** 企业发票 点击事件 */
- (void)InvoiceTypeViewEnterpriseButtonClick
{
    if ([self.infoModel.invoiceTypeKey isEqualToString:@"vat"]) {
        return;
    }
    self.infoModel.invoiceTypeKey = @"vat";
    [self updateTableViewData];
}


#pragma mark - data

- (void)updateTableViewData
{
    
    if ([self.needInvoiceKey isEqualToString:@"yes"]) {
        self.invoiceOrNotVC.invoiceBT.selected = YES;
        self.invoiceOrNotVC.notBT.selected = NO;
        
        
        if ([self.infoModel.invoiceTypeKey isEqualToString:@"com"]) {
            self.invoiceTypeVC.personalInvoiceBT.selected = YES;
            self.invoiceTypeVC.enterpriseInvoiceBT.selected = NO;
        }else if ([self.infoModel.invoiceTypeKey isEqualToString:@"vat"]){
            self.invoiceTypeVC.personalInvoiceBT.selected = NO;
            self.invoiceTypeVC.enterpriseInvoiceBT.selected = YES;
        }else{
            self.infoModel.invoiceTypeKey = @"com";
            self.invoiceTypeVC.personalInvoiceBT.selected = YES;
            self.invoiceTypeVC.enterpriseInvoiceBT.selected = NO;
        }
        
        self.invoiceInfoTVC.infoModel = self.infoModel;
        
        
    }else if([self.needInvoiceKey isEqualToString:@"no"]){
        self.invoiceOrNotVC.invoiceBT.selected = NO;
        self.invoiceOrNotVC.notBT.selected = YES;
    }else{
        self.infoModel.needInvoiceKey = @"no";
        
        self.invoiceOrNotVC.invoiceBT.selected = NO;
        self.invoiceOrNotVC.notBT.selected = YES;
        
        self.invoiceInfoTVC.infoModel = self.infoModel;
    }
    
    
    [self.tableView reloadData];
    
}




#pragma mark - data net

- (void)netOrderOrderInvoiceListData
{
    WeakSelf;
    [XYShoppingCartNet netOrderInvoiceListWithBlock:^(NSDictionary *blockDictionary, NSError *error) {
       
        if (error == nil) {
            
            if (blockDictionary.count == 0) {
                return ;
            }
            
            NSArray * dpFromResponse = [blockDictionary objectForKey:@"invoiceList"];
            
            if (dpFromResponse.count == 0) {
                [weakSelf updateTableViewData];
                return;
            }
            
            NSDictionary * cartsDict = dpFromResponse.firstObject;
//            NSDictionary * noNullDict = [XYCommon removeNull:cartsDict];
            weakSelf.infoModel = [XYOrderFromDetailInvoiceInfoModel mj_objectWithKeyValues:cartsDict];
                
            [weakSelf updateTableViewData];
            
        }
        
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
