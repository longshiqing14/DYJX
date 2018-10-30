//
//  JXElectronicInvoiceDetailPage.m
//  user
//
//  Created by 岩  熊 on 2018/3/1.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXElectronicInvoiceDetailPage.h"
#import "JXElectronicInvoiceCell.h"
#import "JXElectronicInvoiceHeaderCell.h"
#import "JXElectronicInvoiceCheckCell.h"
#import "JXElectronicInvoicePage.h"
@interface JXElectronicInvoiceDetailPage ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *InvoiceDetailTableView;
@property (nonatomic, strong)NSArray <NSArray*> *dataArray;
@end

@implementation JXElectronicInvoiceDetailPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F4F4F4"];
    self.title = @"发票明细";
    [self.InvoiceDetailTableView registerClass:[JXElectronicInvoiceCell class] forCellReuseIdentifier:@"InvoiceCell"];
    [self.InvoiceDetailTableView registerClass:[JXElectronicInvoiceHeaderCell class] forCellReuseIdentifier:@"InvoiceHeaderCell"];
    [self.InvoiceDetailTableView registerClass:[JXElectronicInvoiceCheckCell class] forCellReuseIdentifier:@"InvoiceCheckCell"];
    self.InvoiceDetailTableView.tableFooterView = [UIView new];
    [self initSubViews];
}

- (void)initSubViews{
    [self.view addSubview:self.InvoiceDetailTableView];
    [self.InvoiceDetailTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(self.view);
        make.top.mas_equalTo(10);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WeakSelf;
    if (indexPath.section == 0) {
        JXElectronicInvoiceHeaderCell *InvoiceHeaderCell = [tableView dequeueReusableCellWithIdentifier:@"InvoiceHeaderCell" forIndexPath:indexPath];
        InvoiceHeaderCell.titleLabel.text = self.dataArray[indexPath.section][indexPath.item];
//        if ([self.invoiceInfo.invoiceStatus isEqualToString:@"1"]) {
//            InvoiceHeaderCell.contentLb.text = @"开票完成";
//            InvoiceHeaderCell.contentLb.textColor = [UIColor colorWithHexString:@"#64CD64"];
//        }else if ([self.invoiceInfo.invoiceStatus isEqualToString:@"0"]) {
//            InvoiceHeaderCell.contentLb.text = @"正在开票";
//            InvoiceHeaderCell.contentLb.textColor = [UIColor colorWithHexString:@"#EC3B2C"];
//        }else{
//            InvoiceHeaderCell.contentLb.text = @"";
//        }
        
        return InvoiceHeaderCell;
    }else if(indexPath.section == 1){
        JXElectronicInvoiceCell *InvoiceCell = [tableView dequeueReusableCellWithIdentifier:@"InvoiceCell" forIndexPath:indexPath];
        InvoiceCell.titleLabel.text = self.dataArray[indexPath.section][indexPath.item];
        
//        if (indexPath.item == self.dataArray[indexPath.section].count - 1) {
//            InvoiceCell.line.hidden = NO;
//        }else{
            InvoiceCell.line.hidden = YES;
//        }
        
        if ([self.invoiceInfo.invoiceTitleType isEqualToString:@"0"]) {
        //个人
        if (indexPath.item == 0) {
            InvoiceCell.contentLb.text = self.invoiceInfo.invoiceTitle;
        }else if (indexPath.item == 1){
           InvoiceCell.contentLb.text = self.invoiceInfo.invoiceTitleTypeName;
        }else if (indexPath.item == 2){
            InvoiceCell.contentLb.text = self.invoiceInfo.invoiceContent;
        }else if (indexPath.item == 3){
            InvoiceCell.contentLb.text = [NSString stringWithFormat:@"￥%@",self.invoiceInfo.invoicePrice];
        }else if (indexPath.item == 4){
            InvoiceCell.contentLb.text = self.invoiceInfo.invoiceMail;
        }
            
        }else{
         //企业
            if (indexPath.item == 0) {
                InvoiceCell.contentLb.text = self.invoiceInfo.invoiceTitle;
            }else if (indexPath.item == 1){
                InvoiceCell.contentLb.text = self.invoiceInfo.invoiceCertificate;
            }else if (indexPath.item == 2){
                InvoiceCell.contentLb.text = self.invoiceInfo.invoiceTitleTypeName;
            }else if (indexPath.item == 3){
                InvoiceCell.contentLb.text = self.invoiceInfo.invoiceContent;
            }else if (indexPath.item == 4){
                InvoiceCell.contentLb.text = [NSString stringWithFormat:@"￥%@",self.invoiceInfo.invoicePrice];
            }else if (indexPath.item == 5){
                InvoiceCell.contentLb.text = self.invoiceInfo.invoiceMail;
            }
        }
        
        return InvoiceCell;
    }else{
        JXElectronicInvoiceCheckCell *InvoiceCheckCell = [tableView dequeueReusableCellWithIdentifier:@"InvoiceCheckCell" forIndexPath:indexPath];
        [InvoiceCheckCell.confirmBNT setTitle:self.dataArray[indexPath.section][indexPath.item] forState:(UIControlStateNormal)];
        InvoiceCheckCell.confirmBlock = ^{
            if ([YWDTools isNil:weakSelf.invoiceInfo.invoiceURL]) {
                [YDBAlertView showToast:@"发票还未生成"];
                return ;
            }
            JXElectronicInvoicePage *ViewController=[[JXElectronicInvoicePage alloc]init];
            ViewController.webURLstr = weakSelf.invoiceInfo.invoiceURL;
            ViewController.invoiceE_mail = weakSelf.invoiceInfo.invoiceMail;
            ViewController.orderId = weakSelf.orderId;
            [self.navigationController pushViewController:ViewController animated:YES];
        };
        return InvoiceCheckCell;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 45;
    }else if (indexPath.section == 1) {
        return 25;
    }else if(indexPath.section == 2) {
        return 55;
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return 10;
    }else{
        return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor colorWithHexString:@"FFFFFF"];
    return view;
}

- (UITableView *)InvoiceDetailTableView{
    if (!_InvoiceDetailTableView) {
        _InvoiceDetailTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _InvoiceDetailTableView.delegate = self;
        _InvoiceDetailTableView.dataSource = self;
        _InvoiceDetailTableView.backgroundColor = [UIColor colorWithHexString:@"#F4F4F4"];
    }
    return _InvoiceDetailTableView;
}

- (NSArray<NSArray *> *)dataArray{
    if (!_dataArray) {
        if ([self.invoiceInfo.invoiceTitleType isEqualToString:@"1"]&&[self.processStateInfoState isEqualToString:@"p112"]) {
                   _dataArray = @[@[@"电子普通发票"],@[@"发票抬头:",@"纳税人识别号:",@"抬头类型:",@"发票内容:",@"发票金额:",@"收票邮箱:"],@[@"查看发票"]];
        }else if([self.invoiceInfo.invoiceTitleType isEqualToString:@"0"]&&[self.processStateInfoState isEqualToString:@"p112"]){
                    _dataArray = @[@[@"电子普通发票"],@[@"发票抬头:",@"抬头类型:",@"发票内容:",@"发票金额:",@"收票邮箱:"],@[@"查看发票"]];
        }else if([self.invoiceInfo.invoiceTitleType isEqualToString:@"1"]&&![self.processStateInfoState isEqualToString:@"p112"]){
            _dataArray = @[@[@"电子普通发票"],@[@"发票抬头:",@"纳税人识别号:",@"抬头类型:",@"发票内容:",@"发票金额:",@"收票邮箱:"]];
        }else if([self.invoiceInfo.invoiceTitleType isEqualToString:@"0"]&&![self.processStateInfoState isEqualToString:@"p112"]){
            _dataArray = @[@[@"电子普通发票"],@[@"发票抬头:",@"抬头类型:",@"发票内容:",@"发票金额:",@"收票邮箱:"]];
        }
       

    }
    return _dataArray;
}

- (JXMyInvoiceInfoModel *)invoiceInfo{
    if (!_invoiceInfo) {
        _invoiceInfo = [[JXMyInvoiceInfoModel alloc]init];
    }
    return _invoiceInfo;
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
