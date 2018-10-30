//
//  XYConfirmOrderPayPickView.m
//  user
//
//  Created by xingyun on 2017/10/23.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYConfirmOrderPayPickView.h"

#import "XYPreDepositVCell.h"
#import "XYPaymentListModel.h"
#import "WXApi.h"
@interface XYConfirmOrderPayPickView () <UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, copy) NSMutableArray * dataSource;

@property (nonatomic,assign)NSInteger pickeviewHeight;


@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) UIView * headerView;
@property (nonatomic, strong) UIView * footerView;

/** 余额支付 */
@property (nonatomic, strong) UILabel * titleLB;
/** 余额支付金额 */
@property (nonatomic, strong) UILabel * totalLB;
/** 是否使用 余额支付 */
@property (nonatomic, strong) UISwitch * paySwitch;
/** 还需支付 */
@property (nonatomic, strong) UILabel * needPayLB;


@property (nonatomic, strong) NSString * totalPayString;
/** 还需支付 */
@property (nonatomic, strong) NSString * needTotal;

/** 是否使用余额 */
@property (nonatomic, assign) BOOL isBalanceUsed;
/** 选择的 支付方式 */
@property (nonatomic, strong) NSString * selectPayType;

@property (nonatomic, strong) NSArray *payMentArray;

@property (nonatomic, assign) BOOL isHaveBalancePay;
@end

@implementation XYConfirmOrderPayPickView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self updateDataSource];
        
        self.selectPayType = @"";
        
        [self commonInit];

        
    }
    return self;
}

- (instancetype)initWithPayTotal:(NSString*)totalPayString balanceString:(NSString*)balanceString paymentTypes:(NSArray*)paymentTypes
{
    self = [super init];
    if (self) {
        self.payMentArray = paymentTypes;
        [self updateDataSource];
        
        
        self.selectPayType = @"";
        if ([balanceString floatValue] != 0) {
            self.paySwitch.on = YES;
            
            if ([balanceString floatValue] >= [totalPayString floatValue]) {
                
                self.totalPayString = totalPayString;
                self.totalLB.text = totalPayString;
                self.needPayLB.text = @"";
            }else{
                
                CGFloat needpay = [totalPayString floatValue] - [balanceString floatValue];
                self.totalPayString = balanceString;
                self.totalLB.text = balanceString;
                self.needTotal = [NSString stringWithFormat:@"%g",needpay];
                self.needPayLB.text = [NSString stringWithFormat:@"还需支付：%g",needpay];
            }
            
            
        }else{
            self.totalLB.text = @"0";
            self.needTotal = totalPayString;
            self.needPayLB.text = [NSString stringWithFormat:@"还需支付：%@",totalPayString];
            self.totalPayString = @"0";
            self.needTotal = totalPayString;
            self.paySwitch.on = NO;
            self.paySwitch.enabled = NO;
        }
        
        [self commonInit];
    }
    return self;
}

-(void)commonInit{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    
    _tableView.tableHeaderView = self.headerView;
    _tableView.tableFooterView = self.footerView;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
    
    
    self.frame = [UIScreen mainScreen].bounds;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.75];
    
    [self addSubview:self.tableView];
    
    CGFloat tableH = 400;
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_offset(tableH);
    }];
    [self layoutIfNeeded];
    

}



#pragma mark - 懒加载

- (UIView*)headerView
{
    if (_headerView == nil) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, 45)];
        _headerView.backgroundColor = XYWhiteColor;
        
        UIButton * returnBT = [UIButton buttonWithType:UIButtonTypeCustom];
        returnBT.frame = CGRectZero;
        [returnBT setImage:[UIImage imageNamed:@"nav_btn_black_goback"] forState:UIControlStateNormal];
        [returnBT addTarget:self action:@selector(returnButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_headerView addSubview:returnBT];
        
        [returnBT mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(40);
        }];
        
        
        UILabel * titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        titleLB.text = @"选择支付方式";
        titleLB.textColor = XYFontTitleColor;
        titleLB.textAlignment = NSTextAlignmentCenter;
        titleLB.font = XYFont_15;
        [_headerView addSubview:titleLB];
        
        [titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_headerView.mas_centerX);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(200);
        }];
        
        UIView * lineview = [[UIView alloc]initWithFrame:CGRectZero];
        lineview.backgroundColor = XYLineColor;
        [_headerView addSubview:lineview];
        
        [lineview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
        
    }
    return _headerView;
}



- (UIView*)footerView
{
    if (_footerView == nil) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, 45 + 28)];
        _footerView.backgroundColor = XYWhiteColor;
        
        UIView * lineview = [[UIView alloc]initWithFrame:CGRectZero];
        lineview.backgroundColor = XYLineColor;
        [_footerView addSubview:lineview];
        
        [lineview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
        
        UIButton * ensourceBT = [UIButton buttonWithType:UIButtonTypeCustom];
        ensourceBT.frame = CGRectMake(47, 27, XYScreenW-2*47, 45);
        ensourceBT.backgroundColor = XYMainColor;
        [ensourceBT setTitle:@"确定" forState:UIControlStateNormal];
        [ensourceBT.titleLabel setFont:XYFont_16];
        ensourceBT.layer.cornerRadius = 5;
        ensourceBT.layer.masksToBounds = YES;
        [ensourceBT addTarget:self action:@selector(ensourceButtonClick)  forControlEvents:UIControlEventTouchUpInside];
        
        [_footerView addSubview:ensourceBT];
        
        
    }
    return _footerView;
}


- (NSMutableArray*)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (NSArray *)payMentArray{
    if (_payMentArray == nil) {
        _payMentArray = [NSMutableArray array];
    }
    return _payMentArray;
}

- (void)updateDataSource
{
    if (self.dataSource.count != 0) {
        [self.dataSource removeAllObjects];
    }
    
    NSMutableArray * array = [NSMutableArray array];
    
    for (NSString* payment in self.payMentArray) {
        if ([payment isEqualToString:JX_PAYMENT_TYPE_WEIXIN]) {
            if ([WXApi isWXAppInstalled] ) {
                [array addObject:@{@"image":@"payment_icon_wx",@"title":@"微信支付",@"type":JX_PAYMENT_TYPE_WEIXIN}];
            }
        }else if ([payment isEqualToString:JX_PAYMENT_TYPE_ALI]){
            [array addObject:@{@"image":@"payment_icon_zfb",@"title":@"支付宝支付",@"type":JX_PAYMENT_TYPE_ALI}];
        }else if ([payment isEqualToString:JX_PAYMENT_TYPE_UNION]){
           [array addObject:@{@"image":@"ic_unionpay",@"title":@"银联支付",@"type":JX_PAYMENT_TYPE_UNION}];
        }else if ([payment isEqualToString:JX_PAYMENT_TYPE_BLANCE]){
            self.isHaveBalancePay = YES;
        }
    }
    
    
    
    
    
    for (NSDictionary * dict in array) {
        XYPaymentListModel * model = [[XYPaymentListModel alloc]init];
        
        model.image = dict[@"image"];
        model.title = dict[@"title"];
        model.type = dict[@"type"];
        
        [self.dataSource addObject:model];
    }
    
    
}

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLB.text = @"余额支付:";
        _titleLB.textColor = XYFontTitleColor;
        _titleLB.textAlignment = NSTextAlignmentLeft;
        _titleLB.font = XYFont_15;
    }
    return _titleLB;
}

- (UILabel*)totalLB
{
    if (_totalLB == nil) {
        _totalLB = [[UILabel alloc]initWithFrame:CGRectZero];

        _totalLB.textColor = XYMainColor;
        _totalLB.textAlignment = NSTextAlignmentLeft;
        _totalLB.font = XYFont_15;
    }
    return _totalLB;
}

- (UISwitch*)paySwitch
{
    if (_paySwitch == nil) {
        _paySwitch = [[UISwitch alloc]initWithFrame:CGRectZero];
        
        _paySwitch.onTintColor = XYMainColor;
        
        [_paySwitch addTarget:self action:@selector(paySwitchValueChanged:) forControlEvents:UIControlEventValueChanged];

    }
    return _paySwitch;
}


- (UILabel*)needPayLB
{
    if (_needPayLB == nil) {
        _needPayLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _needPayLB.textColor = XYMainColor;
        _needPayLB.textAlignment = NSTextAlignmentRight;
        _needPayLB.font = XYFont_15;
    }
    return _needPayLB;
}




#pragma mark - button click
/** 返回 */
- (void)returnButtonClick
{
    [self hide];
}
/** 确定 */
- (void)ensourceButtonClick
{
    if (self.paySwitch.isOn && [self.needTotal integerValue] == 0) {
        
        
        
    }else if (self.paySwitch.isOn && [self.needTotal integerValue] != 0) {
        
        if ([self.selectPayType isEqualToString:@""]) {
            [YDBAlertView showToast:@"请选择第三方支付" dismissDelay:1.0];
            return;
        }
        
    }else if (!self.paySwitch.isOn) {
        if ([self.selectPayType isEqualToString:@""]) {
            [YDBAlertView showToast:@"请选择第三方支付" dismissDelay:1.0];
            
            return;
        }
        
    }else{
        
        
        
    }
    
    [self hide];
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(pickPayType:balanceTotal:payType:needTotal:)]) {
        if (self.isHaveBalancePay) {
            [self.delegate pickPayType:self.paySwitch.isOn balanceTotal:self.totalPayString payType:self.selectPayType needTotal:self.needTotal];
        }else{
            [self.delegate pickPayType:NO balanceTotal:self.totalPayString payType:self.selectPayType needTotal:self.needTotal];
        }
        
    }
    
    
}

- (void)paySwitchValueChanged:(UISwitch *) sender
{
    if (sender.isOn && [self.needTotal integerValue] == 0) {
        self.selectPayType = @"";
        self.totalLB.text=[NSString stringWithFormat:@"%@",self.totalPayString];

        [self.tableView reloadData];
    }else{
        
        if (!sender.isOn) {
            NSLog(@"关闭");
            self.totalLB.text = @"0";
            self.needPayLB.text=[NSString stringWithFormat:@"还需支付：%.2f",[self.totalPayString floatValue]+[self.needTotal floatValue]];
            self.totalPayString = self.totalPayString;
//            self.needPayLB.text = self.needTotal;
            [self selectPlayType];
        }else{
            NSLog(@"打开");
            
            self.needPayLB.text = [NSString stringWithFormat:@"还需支付：%@",self.needTotal];
            self.totalLB.text=[NSString stringWithFormat:@"%@",self.totalPayString];
            self.totalPayString = self.totalPayString;
//            self.needPayLB.text = self.needTotal;
            [self selectPlayType];
        }
        [self.tableView reloadData];
    }
    
    
}

-(void)selectPlayType{
    if (self.selectPayType == nil||[self.selectPayType isEqualToString:@""]) {
        if (self.dataSource.count>0) {
            XYPaymentListModel * model =self.dataSource[0];
            self.selectPayType =model.type;
        }
        
    }
}

#pragma mark - animate

- (void)show {
        
    [self animateSelfView:_tableView show:YES completion:nil];
}

- (void)hide {
    
    [self animateSelfView:_tableView show:NO completion:nil];
}

- (void)animateSelfView:(UIView*)view show:(BOOL)show completion:(void(^)())completion {
    
    if (show) {

        CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"position"];
        basic.fromValue = [NSValue valueWithCGPoint:CGPointMake(view.center.x, XYScreenH)];
        basic.toValue = [NSValue valueWithCGPoint:CGPointMake(view.center.x, view.center.y)];
        basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];;
        basic.duration = 0.2;
        [view.layer addAnimation:basic forKey:[NSString stringWithFormat:@"%@",view]];
        
    } else {
        
        CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"position"];
        basic.fromValue = [NSValue valueWithCGPoint:CGPointMake(view.center.x, view.center.y)];
        basic.toValue = [NSValue valueWithCGPoint:CGPointMake(view.center.x,XYScreenH)];
        basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        basic.autoreverses = NO;
        basic.duration = 0.2;
        [view.layer addAnimation:basic forKey:[NSString stringWithFormat:@"hide%@",view]];
            
        [self removeFromSuperview];
            
    }
    
    !completion ? : completion();
}


#pragma mark - tableview

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    

    
    if (section == 0) {
        
        if ([self.payMentArray containsObject:JX_PAYMENT_TYPE_BLANCE]) {
            
                if ((self.paySwitch.isOn && [self.needTotal integerValue] != 0)||(!self.paySwitch.isOn && [self.totalLB.text isEqualToString:@"0"])) {
                    return 2;
                }else{
                    return 1;
                }
            }else{
                return 0;
            }
        
    }else if (section == 1){
        return self.dataSource.count;
    }
    return 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentView.backgroundColor = XYWhiteColor;
        
        if (indexPath.row == 0) {
            
            
            [cell.contentView addSubview:self.titleLB];
            [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.mas_equalTo(0);
                make.left.mas_equalTo(XY_Left_Margin);
                make.width.mas_equalTo(80);
            }];
            
            [cell.contentView addSubview:self.totalLB];
            [self.totalLB mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.mas_equalTo(0);
                make.left.mas_equalTo(_titleLB.mas_right);
            }];
            
            [cell.contentView addSubview:self.paySwitch];
            [self.paySwitch mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(cell.contentView.mas_centerY);
                make.right.mas_equalTo(XY_Right_Margin);
            }];
            
        }else if (indexPath.row == 1){
            
            [cell.contentView addSubview:self.needPayLB];
            [self.needPayLB mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.mas_equalTo(0);
                make.right.mas_equalTo(XY_Right_Margin);
            }];
            
            
        }
        
        
        
        
        return cell;
    }else if (indexPath.section == 1){
        XYPreDepositVCell * cell = [XYPreDepositVCell cellWithTableView:tableView];
        
        XYPaymentListModel * model = self.dataSource[indexPath.row];
        cell.iconImageView.image = [UIImage imageNamed:model.image];
        cell.titleLB.text = model.title;
        if ([self.selectPayType isEqualToString:@""]) {
            cell.selectImageView.hidden = YES;
        }else if ([self.selectPayType isEqualToString:model.type]){
            cell.selectImageView.hidden = NO;
        }else{
            cell.selectImageView.hidden = YES;
        }
        
        return cell;
    }
    
    return nil;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        
        
    }else if (indexPath.section == 1){
        
        if (self.paySwitch.isOn && [self.needTotal integerValue] != 0) {
            XYPaymentListModel * model = self.dataSource[indexPath.row];
            self.selectPayType = model.type;
            [self.tableView reloadData];
        }else if (!self.paySwitch.isOn){
            XYPaymentListModel * model = self.dataSource[indexPath.row];
            self.selectPayType = model.type;
            [self.tableView reloadData];
            
        }else if(!self.isHaveBalancePay){
            XYPaymentListModel * model = self.dataSource[indexPath.row];
            self.selectPayType = model.type;
            [self.tableView reloadData];
        }
        

        
    }
    
}




@end
