//
//  XYOrderDetailInvoiceInfoTVC.m
//  user
//
//  Created by xingyun on 2017/10/25.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailInvoiceInfoTVC.h"

#import "XYOrderDetailInvoiceInfoTVCell.h"

#import "XYOrderDetailModel.h"
#import "XYOrderDetailTitleModel.h"

@interface XYOrderDetailInvoiceInfoTVC ()

@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation XYOrderDetailInvoiceInfoTVC

const CGFloat goodDetail_invoice_cell_height = 35.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = XYWhiteColor;
    self.tableView.scrollEnabled = NO;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//- (void)updateInvoiceInfoModel:(XYOrderDetailInvoiceInfoModel*)invoiceinfoModel 

- (void)setInvoiceinfoModel:(XYOrderDetailInvoiceInfoModel *)invoiceinfoModel
{
    _invoiceinfoModel = invoiceinfoModel;
    
    if (self.dataSource.count != 0) {
        [self.dataSource removeAllObjects];
    }
    
    NSMutableArray * array = [NSMutableArray array];
    
    NSString * typeName = _invoiceinfoModel.invoiceTitleTypeName == nil ? @"" : _invoiceinfoModel.invoiceTitleTypeName;
    NSString * invoiceCertificate = _invoiceinfoModel.invoiceCertificate == nil ? @"" : _invoiceinfoModel.invoiceCertificate;
    
    if ([_invoiceinfoModel.needInvoiceKey isEqualToString:@"yes"]) {
        if ([_invoiceinfoModel.invoiceTitleType isEqualToString:@"0"]) {
            [array addObject:@{@"title":@"发票",@"sub":@"明细"}];
//            [array addObject:@{@"title":[NSString stringWithFormat:@"抬头：%@",_invoiceinfoModel.invoiceTitle],@"sub":typeName}];
        }else if ([_invoiceinfoModel.invoiceTitleType isEqualToString:@"1"]){
            [array addObject:@{@"title":@"发票",@"sub":@"明细"}];
//            [array addObject:@{@"title":[NSString stringWithFormat:@"抬头：%@",_invoiceinfoModel.invoiceTitle],@"sub":typeName}];
//            [array addObject:@{@"title":@"纳税人识别号：",@"sub":invoiceCertificate}];
        }
    }else{
        [array addObject:@{@"title":@"发票",@"sub":@"不开发票"}];
    }
    

    
    for (NSDictionary * dict in array) {
        XYOrderDetailTitleModel * model = [[XYOrderDetailTitleModel alloc]init];
        
        model.sub = dict[@"sub"];
        model.title = dict[@"title"];
        
        [self.dataSource addObject:model];
    }
    
    
    [self.tableView reloadData];
    
}

- (NSMutableArray*)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return goodDetail_invoice_cell_height;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYOrderDetailInvoiceInfoTVCell * cell = [XYOrderDetailInvoiceInfoTVCell cellWithTableView:tableView];
    
    XYOrderDetailTitleModel * model = self.dataSource[indexPath.row];
    cell.titleLB.text = model.title;
    cell.subLB.text = model.sub;
    if ([self.invoiceinfoModel.needInvoiceKey isEqualToString:@"no"]) {
        cell.arrowImage.hidden = YES;
    }else{
        cell.arrowImage.hidden = NO;
    }
    
    return cell;
}




@end
