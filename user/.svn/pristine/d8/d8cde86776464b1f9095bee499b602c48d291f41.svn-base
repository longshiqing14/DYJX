//
//  XYConfirmOrderInvoiceInfoTVC.m
//  user
//
//  Created by xingyun on 2017/10/17.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYConfirmOrderInvoiceInfoTVC.h"

#import "XYOrderFromDetailModel.h"

@interface XYConfirmOrderInvoiceInfoTVC () <UITextFieldDelegate>

/** cell 1 */
@property (nonatomic, strong) UILabel * celltitleLB;

/** cell 2 */
@property (nonatomic, strong) UILabel * cellRiseTitleLB;



/** cell 3 */
@property (nonatomic, strong) UILabel * cellIdNumberTitleLB;

@property (nonatomic, strong) UILabel *cellEMailTitleLB;

/** 脚  */
@property (nonatomic, strong) UIView * footerView;

@property (nonatomic, strong) UILabel * footerLB;


@end

@implementation XYConfirmOrderInvoiceInfoTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.scrollEnabled = NO;
    self.tableView.bounces = NO;
    
    self.tableView.tableFooterView = self.footerView;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
    
}

#pragma mark - 懒加载

- (UILabel*)celltitleLB
{
    if (_celltitleLB == nil) {
        _celltitleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _celltitleLB.text = @"发票抬头";
        
        _celltitleLB.textColor = XYFontTitleColor;
        _celltitleLB.textAlignment = NSTextAlignmentLeft;
        _celltitleLB.font = XYFont_15;
    }
    return _celltitleLB;
}



- (UILabel*)cellRiseTitleLB
{
    if (_cellRiseTitleLB == nil) {
        _cellRiseTitleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _cellRiseTitleLB.text = @"抬头";
        
        _cellRiseTitleLB.textColor = XYFontTitleColor;
        _cellRiseTitleLB.textAlignment = NSTextAlignmentLeft;
        _cellRiseTitleLB.font = XYFont_15;
    }
    return _cellRiseTitleLB;
}

- (UITextField*)cellRiseTF
{
    if (_cellRiseTF == nil) {
        _cellRiseTF = [[UITextField alloc]initWithFrame:CGRectZero];
        
        _cellRiseTF.textAlignment = NSTextAlignmentRight;
        _cellRiseTF.font = XYFont_15;
        
        _cellRiseTF.delegate = self;
        
        _cellRiseTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _cellRiseTF.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入发票抬头"
                                                                           attributes:@{NSFontAttributeName:XYFont_15,
                                                                                        NSForegroundColorAttributeName:XYGrayColor}];
    }
    return _cellRiseTF;
}

- (UILabel*)cellIdNumberTitleLB
{
    if (_cellIdNumberTitleLB == nil) {
        _cellIdNumberTitleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _cellIdNumberTitleLB.text = @"纳税人识别号";
        
        _cellIdNumberTitleLB.textColor = XYFontTitleColor;
        _cellIdNumberTitleLB.textAlignment = NSTextAlignmentLeft;
        _cellIdNumberTitleLB.font = XYFont_15;
        
    }
    return _cellIdNumberTitleLB;
}

- (UILabel*)cellEMailTitleLB
{
    if (_cellEMailTitleLB == nil) {
        _cellEMailTitleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _cellEMailTitleLB.text = @"收票邮箱";
        
        _cellEMailTitleLB.textColor = XYFontTitleColor;
        _cellEMailTitleLB.textAlignment = NSTextAlignmentLeft;
        _cellEMailTitleLB.font = XYFont_15;
        
    }
    return _cellEMailTitleLB;
}

- (UITextField*)cellEMailTF
{
    if (_cellEMailTF == nil) {
        _cellEMailTF = [[UITextField alloc]initWithFrame:CGRectZero];
        
        _cellEMailTF.textAlignment = NSTextAlignmentRight;
        _cellEMailTF.font = XYFont_15;
        
        _cellEMailTF.delegate = self;
        
        _cellEMailTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _cellEMailTF.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入接收发票的电子邮箱"
                                                                               attributes:@{NSFontAttributeName:XYFont_15,
                                                                                            NSForegroundColorAttributeName:XYGrayColor}];
    }
    return _cellEMailTF;
}

- (UITextField*)cellIdNumberTF
{
    if (_cellIdNumberTF == nil) {
        _cellIdNumberTF = [[UITextField alloc]initWithFrame:CGRectZero];
        
        _cellIdNumberTF.textAlignment = NSTextAlignmentRight;
        _cellIdNumberTF.font = XYFont_15;
        
        _cellIdNumberTF.delegate = self;
        
        _cellIdNumberTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _cellIdNumberTF.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入纳税人识别号"
                                                                       attributes:@{NSFontAttributeName:XYFont_15,
                                                                                    NSForegroundColorAttributeName:XYGrayColor}];
    }
    return _cellIdNumberTF;
}

- (UIView*)footerView
{
    if (_footerView == nil) {
        _footerView = [[UIView alloc]init];
        

        UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, 0.5)];
        lineView.backgroundColor = XYLineColor;
        [_footerView addSubview:lineView];
        
        
        NSString * footString;
        CGSize size;
        
        footString = @"温馨提示：\n 1.开票金额不含运费、优惠金额；\n 2.默认为电子发票，如商家无法提供电子发票，则提供纸质发票；\n 3.电子发票将在订单确认收货后，发送到收票邮箱。";
        
        self.footerLB.text = footString;
        size = [XYStringHandle sizeWithString:footString font:XYFont_13 viewWidth:XYScreenW-20];
        
        _footerView.frame = CGRectMake(0, 0, XYScreenW, size.height+20);
        
        _footerView.backgroundColor = XYWhiteColor;
        
        [_footerView addSubview:self.footerLB];
        [self.footerLB mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(XY_Left_Margin);
            make.right.mas_equalTo(XY_Right_Margin);
            make.centerY.mas_equalTo(-2);
        }];
        
    }
    return _footerView;
}


- (UILabel*)footerLB
{
    if (_footerLB == nil) {
        _footerLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _footerLB.textColor = XYGrayColor;
        _footerLB.textAlignment = NSTextAlignmentLeft;
        _footerLB.font = XYFont_13;
        _footerLB.numberOfLines = 0;
    }
    return _footerLB;
}


- (void)setInfoModel:(XYOrderFromDetailInvoiceInfoModel *)infoModel
{
    _infoModel = infoModel;
    
    NSString * footString;
    CGSize size;
    
    if ([self.infoModel.invoiceTypeKey isEqualToString:@"com"]) {
        footString = @"温馨提示：\n 1.开票金额不含运费、优惠金额；\n 2.默认为电子发票，如商家无法提供电子发票，则提供纸质发票；\n 3.电子发票将在订单确认收货后，发送到收票邮箱。";
    }else{
        footString = @"温馨提示：\n 1.开票金额不含运费、优惠金额；\n 2.默认为电子发票，如商家无法提供电子发票，则提供纸质发票；\n 3.电子发票将在订单确认收货后，发送到收票邮箱。";
    }
    
    self.footerLB.text = footString;
    size = [XYStringHandle sizeWithString:footString font:XYFont_13 viewWidth:XYScreenW-20];
    
    _footerView.frame = CGRectMake(0, 1, XYScreenW, size.height+20);
    
    
    [self.tableView reloadData];
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([self.infoModel.invoiceTypeKey isEqualToString:@"com"]) {
        return 3;
    }
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class]) forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = XYWhiteColor;
    
    if (indexPath.row == 0) {
        
        
        [cell.contentView addSubview:self.celltitleLB];
        [self.celltitleLB mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(XY_Left_Margin);
            make.right.mas_equalTo(XY_Right_Margin);
        }];
        
        
    }else if (indexPath.row == 1){
      
        if ([self.infoModel.invoiceTypeKey isEqualToString:@"com"]) {
            self.cellRiseTF.text = self.infoModel.invoiceUserName;
        }else{
            self.cellRiseTF.text = self.infoModel.invoiceTitle;
        }
    
        [cell.contentView addSubview:self.cellRiseTitleLB];
        [self.cellRiseTitleLB mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(XY_Left_Margin);
            make.width.mas_equalTo(100);
        }];
        
        [cell.contentView addSubview:self.cellRiseTF];
        [self.cellRiseTF mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(XY_Right_Margin);
            make.left.mas_equalTo(_cellRiseTitleLB.mas_right).offset(0);
        }];
        
        
    }else if (indexPath.row == 2){
        [cell.contentView removeAllSubviews];
      if (![self.infoModel.invoiceTypeKey isEqualToString:@"com"]) {
        self.cellIdNumberTF.text = self.infoModel.invoiceCertificate;
        
        [cell.contentView addSubview:self.cellIdNumberTitleLB];
        [self.cellIdNumberTitleLB mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(XY_Left_Margin);
            make.width.mas_equalTo(100);
        }];
        
        [cell.contentView addSubview:self.cellIdNumberTF];
        [self.cellIdNumberTF mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(XY_Right_Margin);
            make.left.mas_equalTo(_cellRiseTitleLB.mas_right).offset(0);
        }];
      }else{
          self.cellEMailTF.text = self.infoModel.invoiceMail;

          [cell.contentView addSubview:self.cellEMailTitleLB];
          [self.cellEMailTitleLB mas_updateConstraints:^(MASConstraintMaker *make) {
              make.top.bottom.mas_equalTo(0);
              make.left.mas_equalTo(XY_Left_Margin);
              make.width.mas_equalTo(100);
          }];
          
          [cell.contentView addSubview:self.cellEMailTF];
          [self.cellEMailTF mas_updateConstraints:^(MASConstraintMaker *make) {
              make.top.bottom.mas_equalTo(0);
              make.right.mas_equalTo(XY_Right_Margin);
              make.left.mas_equalTo(_cellRiseTitleLB.mas_right).offset(0);
          }];
      }
    
    }else if (indexPath.row == 3){
        
        [cell.contentView addSubview:self.cellEMailTitleLB];
        [self.cellEMailTitleLB mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(XY_Left_Margin);
            make.width.mas_equalTo(100);
        }];
        
        [cell.contentView addSubview:self.cellEMailTF];
        self.cellEMailTF.text = self.infoModel.invoiceMail;
        [self.cellEMailTF mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(XY_Right_Margin);
            make.left.mas_equalTo(_cellRiseTitleLB.mas_right).offset(0);
        }];
    }
    
    return cell;
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

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.cellRiseTF) {
        if ([self.infoModel.invoiceTypeKey isEqualToString:@"com"]) {
            //企业
        self.infoModel.invoiceUserName = textField.text;
        }else{
        self.infoModel.invoiceTitle = textField.text;
        }
    }else{
        
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
