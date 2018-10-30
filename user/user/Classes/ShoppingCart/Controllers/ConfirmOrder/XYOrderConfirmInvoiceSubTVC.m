//
//  XYOrderConfirmInvoiceSubTVC.m
//  user
//
//  Created by xingyun on 2017/10/14.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderConfirmInvoiceSubTVC.h"

#import "XYOrderConfirmInvoiceSubTVCell.h"
#import "XYOrderFromDetailModel.h"


@interface XYOrderConfirmInvoiceSubTVC ()

@property (nonatomic, strong) UIView * footerView;

@property (nonatomic, strong) UILabel * riseLB;

@property (nonatomic, strong) UILabel * idCodeLB;



@end

@implementation XYOrderConfirmInvoiceSubTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = self.footerView;
    self.tableView.backgroundColor = XYWhiteColor;
    
    self.tableView.scrollEnabled = NO;
    
}

- (void)setInvoiceInfoModel:(XYOrderFromDetailInvoiceInfoModel *)invoiceInfoModel
{
    _invoiceInfoModel = invoiceInfoModel;
    
    CGFloat height = 1;
    
    if ([_invoiceInfoModel.needInvoiceKey isEqualToString:@"yes"]) {
        
        if ([_invoiceInfoModel.invoiceTypeKey isEqualToString:@"com"]) {
            
            height = 30;
            
            self.riseLB.text = [NSString stringWithFormat:@"发票抬头：%@",_invoiceInfoModel.invoiceUserName];
            self.idCodeLB.text = @"";
            
        }else if ([_invoiceInfoModel.invoiceTypeKey isEqualToString:@"vat"]){
            
            height = 60;
            
            self.riseLB.text = [NSString stringWithFormat:@"发票抬头：%@",_invoiceInfoModel.invoiceTitle];
            self.idCodeLB.text = [NSString stringWithFormat:@"纳税人识别码：%@",_invoiceInfoModel.invoiceCertificate];
        }
        
    }else{
        self.riseLB.text = @"";
        self.idCodeLB.text = @"";
    }
    
    self.footerView.frame = CGRectMake(0, 0, XYScreenW, height);
    
    [self.tableView reloadData];
    
}


#pragma mark - 懒加载

- (UIView*)footerView
{
    if (_footerView == nil) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, 1)];
        _footerView.backgroundColor = XYWhiteColor;
        
        UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, 0.5)];
        lineView.backgroundColor = XYLineColor;
        [_footerView addSubview:lineView];
        
        [_footerView addSubview:self.riseLB];
        [self.riseLB mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.left.mas_equalTo(XY_Left_Margin);
            make.right.mas_equalTo(XY_Right_Margin);
        }];
        
        
        [_footerView addSubview:self.idCodeLB];
        [self.idCodeLB mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_riseLB.mas_bottom).offset(10);
            make.left.mas_equalTo(XY_Left_Margin);
            make.right.mas_equalTo(XY_Right_Margin);
        }];
        
    }
    return _footerView;
}

- (UILabel*)riseLB
{
    if (_riseLB == nil) {
        _riseLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _riseLB.textColor     = XYFontTitleColor;
        _riseLB.font          = XYFont_14;
        _riseLB.textAlignment = NSTextAlignmentLeft;
    }
    return _riseLB;
}

- (UILabel*)idCodeLB
{
    if (_idCodeLB == nil) {
        _idCodeLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _idCodeLB.textColor     = XYFontTitleColor;
        _idCodeLB.font          = XYFont_14;
        _idCodeLB.textAlignment = NSTextAlignmentLeft;
    }
    return _idCodeLB;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYOrderConfirmInvoiceSubTVCell * cell = [XYOrderConfirmInvoiceSubTVCell cellWithTableView:tableView];
    
    WeakSelf;
    cell.titleLB.text = @"发票信息";
    cell.PopClock = ^{
        if (weakSelf.ClockSub) {
            weakSelf.ClockSub();
        }
    };
    
    if (![_invoiceInfoModel.needInvoiceKey isEqualToString:@"yes"]) {
        cell.subLB.text = @"不开发票";
    }else{
        cell.subLB.text = _invoiceInfoModel.invoiceTitleType;
    }
    if ([_invoiceInfoModel.displayInvoiceKey isEqualToString:@"0"]||!_invoiceInfoModel.displayInvoiceKey) {
//        不开发票不能点
        cell.subLB.text = @"";
        cell.iconImageView.hidden=YES;
    }else{
        cell.iconImageView.hidden=NO;
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![_invoiceInfoModel.displayInvoiceKey isEqualToString:@"0"]&&_invoiceInfoModel.displayInvoiceKey) {
        //        不开发票不能点
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(orderConfirmInvoiceSelectStar)]) {
            [self.delegate orderConfirmInvoiceSelectStar];
        }
    }
    

}



@end
